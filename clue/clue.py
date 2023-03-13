r'''
    Main module of CLUE

    This module includes the main classes and algorithms for the project CLUE (Constrained LUmpings). In this file
    we provide an implementation on the differential systems and the methods to perform the corresponding 
    constrained lumpings.

    TODO: add more documentation
'''
from __future__ import annotations

import logging, math, sympy, sys, time
from collections.abc import Iterable
from functools import cached_property, reduce, lru_cache
from io import IOBase
from itertools import product
from numpy import ndarray, mean
from numpy.random import normal, uniform
from random import random, randint
from scipy.integrate import solve_ivp
from sympy import QQ, lambdify, symbols, oo, sympify
from sympy.polys.fields import FracElement
from sympy.polys.rings import PolyElement
from typing import Callable, Any

from .linalg import SparseRowMatrix, Subspace, OrthogonalSubspace, NumericalSubspace, SparseVector, find_smallest_common_subspace
from .nual import NualNumber
from .ode_parser import read_system
from .rational_function import SparsePolynomial, RationalFunction

## Configuring logger for this module
logger = logging.getLogger(__name__)

### Generic methods to manipulate expressions
@lru_cache(maxsize=None)
def _func_for_expr(expr, varnames, domain):
    if(isinstance(expr, sympy.core.add.Add)):
        def __func(*args):
            return reduce(lambda p, q : p + q, [_func_for_expr(arg, varnames, domain)(*args) for arg in expr.args])
    elif(isinstance(expr, sympy.core.mul.Mul)):
        def __func(*args):
            return reduce(lambda p, q : p * q, [_func_for_expr(arg, varnames, domain)(*args) for arg in expr.args])
    elif(isinstance(expr, sympy.core.power.Pow)):
        def __func(*args):
            base = _func_for_expr(expr.args[0], varnames, domain)(*args)
            exp = _func_for_expr(expr.args[1], varnames, domain)(*args)
            if isinstance(exp, FracElement):
                return base**int(exp.as_expr())
            return base**int(exp)
    elif(isinstance(expr, sympy.core.numbers.Rational)):
        def __func(*args): #pylint: disable=unused-argument
            return domain.convert(expr)
    elif(isinstance(expr, sympy.core.symbol.Symbol) and str(expr) in varnames):
        __func = lambdify([symbols(v) for v in varnames], expr, modules="sympy")
    elif(isinstance(expr, sympy.core.symbol.Symbol)):
        def __func(*args): #pylint: disable=unused-argument
            return domain.convert(expr)
    else:
        raise TypeError("Incorrect expression found [%s]: %s" %(type(expr), expr))

    return __func

def _automated_differentiation(expr, varnames, domain, point):
    r'''
        Method to compute automatic differentiation of a sympy expression
    '''
    if(expr == 0):
        return NualNumber([0 for _ in range(len(varnames)+1)])
    
    if(isinstance(expr, (SparsePolynomial, RationalFunction))):
        return expr.automated_diff(**{varnames[i] : point[i] for i in range(len(varnames))})
    else:
        func = _func_for_expr(expr, tuple(varnames), domain)
        to_eval = [NualNumber([domain.convert(point[i])] + [domain.convert(1) if j == i else domain.convert(0) for j in range(len(point))]) for i in range(len(point))]
        return func(*to_eval)

### Structure for a differential system
class FODESystem:
    r'''
        Class to represent a system of Firs Order Differential Equations.

        This class allows to store intermediate steps to save time in computations.
        It will also offer functionality to choose more freely the algorithms to do the 
        computations when several are available.

        There are several ways to initialize a differential system:

        * Provide all information needed by itself: using the arguments ``equations``,
          ``observables``, ``variables``, ``ic``and ``name``. If ``equations`` is provided
          this is the method of creation chosen.
        * Provide a file to be read (using the argument ``file``). We will use the clue parser
          with the arguments given in ``kwds``.
        * Provide a dictionary with the data (using the argument ``dic``). In this case, at least 
          an entry with key ``'equations'`` must be provided.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic={}, name = None, 
                dic=None, file = None, **kwds
    ):
        # Deciding how the input is given
        if equations is None:
            if dic is None:
                if file is None:
                    raise ValueError("Not enough data provided to build a system.")
            
                read_ic = kwds.pop("read_ic", False)
                parser = kwds.pop("parser", "polynomial")
                field = kwds.pop("field", QQ)
                dic = read_system(file, read_ic, parser, field)
            
            # Now dic is not None and we can use it to read the data
            equations = dic['equations']
        if variables is None:
            if dic is None or (not 'variables' in dic):
                raise ValueError("No name for variables were given.")
            variables = dic['variables']
        observables = observables if observables != None else (dic.get('observables', None) if dic != None else None)
        ic = ic if ic != {} else (dic.get('ic', {}) if dic != None else {})
        name = name if name != None else (dic.get('name', None) if dic != None else None)
        
        # Now we have the data in the first arguments
        self._equations = list(equations)
        self._observables = observables
        self._variables = variables
        self._ic = ic
        self._name = name
        self.__matrices_subspace_class = kwds.get("matrices_subspace", Subspace)
        self.__matrices_subspace_kwds = kwds.get("matrices_subspace_kwds", {})
        self.__lumping_subspace_class = kwds.get("lumping_subspace", Subspace)
        self.__lumping_subspace_kwds = kwds.get("lumping_subspace_kwds", {})
        self.__linear_part = kwds.get("linear_part", None)

        self._lumping_matr = {}
        self.__normalize_input = False
        self._lumped_system_type = LDESystem
        self.__cache_deviations = {}

    @staticmethod
    def PerturbedFromSystem(system : FODESystem, noise : str | Callable[[Any], Any] = "normal", amplitude : float = 0.005, zeros = False):
        r'''
            Builder for a new :class:`FODESystem` by perturbing the coefficients that appear in the equations.

            This static builder creates a new :class:`FODESystem` from a pre-existing system by changing slightly
            the numerical coefficients that appear. If the flag ``zeros`` is set to ``True`` we can also 
            add noise to non-existing monomials in the system (not yet implemented).

            The adding of noise is done with a function given by ``noise``. This argument can also be a string
            with the values "normal" or "uniform". Then we create here the corresponding function to that specific 
            type of noise.

            INPUT:

            * ``system``: the original system to be perturbed.
            * ``noise``: a function `f(x) = y` where `y` is the (randomly-generated) noised value from `x`.
            * ``amplitude``: (only when ``noise`` is str) allows to adjust the scale of the noise generated from a `str`.
            * ``zeros``: if ``True`` we may also modify non-existing monomials.

            OUTPUT:

            A new :class:`FODESystem` with the perturbed system.
        '''
        #######################################################################
        ## Creating the noise function if given by str
        if isinstance(noise, str):
            if noise == "normal":
                noise = lambda v : normal(v, amplitude)
            elif noise == "uniform":
                noise = lambda v : uniform(v-amplitude/2, v+amplitude/2)
            else:
                raise ValueError(f"The noise given by '{noise}' is not valid. Only 'normal' and 'uniform' are allowed.")

        #######################################################################
        ## Defining auxiliary functions for creating the new system
        ## Polynomials
        def __perturb_SparsePolynomial(poly : SparsePolynomial, zeros : bool = False):
            n = len(poly.gens)
            if poly.degree() == oo and zeros: return SparsePolynomial.from_const(noise(0), poly.gens, poly.domain)
            elif not zeros:
                new_data = {mon : noise(val) for mon, val in poly.dataiter()}
            else:
                new_data = {}
                for mon in product(*[range(poly.degree(v)+1) for v in poly.gens]):
                    mon = tuple((i,mon[i]) for i in range(n) if mon[i] != 0) # creating the monomial structure
                    new_data[mon] = noise(poly._data.get(mon,0)) # adding the noise to the monomial

            return SparsePolynomial(poly.gens, poly.domain, new_data)
        ## Rational functions
        def __perturb_RationalFunction(func : RationalFunction, zeros : bool = False):
            numer = __perturb_SparsePolynomial(func.numer, zeros)
            denom = 0
            while denom == 0: denom = __perturb_SparsePolynomial(func.denom, zeros)

            return RationalFunction(numer, denom)
        ## Sympy expressions
        def __perturb_SympyExpr(expr, zeros : bool = False):
            ## TODO This need to be implemented
            raise NotImplementedError("Perturbation of Sympy expressions not yet implemented")
        
        #######################################################################
        ## Creating the new system
        ## Equations
        if system.type is SparsePolynomial:
            new_eqs = [__perturb_SparsePolynomial(poly, zeros) for poly in system.equations]
        elif system.type is RationalFunction:
            new_eqs = [__perturb_RationalFunction(func, zeros) for func in system.equations]
        else:
            new_eqs = [__perturb_SympyExpr(expr) for expr in system.equations]
        ## Observables
        new_obs = [__perturb_SparsePolynomial(poly, zeros) for poly in system.observables] if system.observables != None else None
        ## Initial conditions
        new_ic = {key : system.field.convert(noise(val)) for (key,val) in system.ic.items()} if system.ic != None else None
        ## Name
        new_name = f"Perturbed system{f' [{system.name}]' if system.name != None else ''}"

        return FODESystem(new_eqs, new_obs, system.variables, new_ic, new_name)

    @staticmethod
    def LinearSystem(matrix : SparseRowMatrix, observables=None, variables = None, ic={}, name = None, **kwds):
        if not isinstance(matrix, SparseRowMatrix):
            raise TypeError("The matrix must be given in SparseRowMatrix format")

        if matrix.nrows != matrix.ncols:
            raise TypeError("The given matrix is not a square matrix and can not define a differential system")
        variables = [f"x{i}" for i in range(matrix.nrows)] if variables is None else variables
        if len(variables) != matrix.nrows:
            raise ValueError("The number of variables must match the size of the matrix")

        equations = [SparsePolynomial.from_vector(matrix.column(i), variables) for i in range(len(variables))]
        system = FODESystem(equations, observables, variables, ic, name, linear_part=matrix, **kwds)
        system._lumping_matr["polynomial"] = [matrix] # the matrix for lumping is just the defining matrix
        return system

    # Getters of attributes
    @property
    def equations(self): return self._equations
    @property
    def observables(self): return self._observables
    @property
    def variables(self): return self._variables
    @property
    def ic(self): return self._ic
    @property
    def name(self): return self._name
    @property
    def matrices_subspace_class(self): return self.__matrices_subspace_class
    @property
    def matrices_subspace_kwds(self): return self.__matrices_subspace_kwds
    @property
    def lumping_subspace_class(self): return self.__lumping_subspace_class
    @property
    def lumping_subspace_kwds(self): return self.__lumping_subspace_kwds
    @lumping_subspace_class.setter
    def lumping_subspace_class(self, new_val):
        new_class, kwds = new_val
        if not issubclass(new_class, Subspace):
            raise TypeError("The subspace class must inherit from Subspace")
        self.__lumping_subspace_class = new_class
        self.__lumping_subspace_kwds = kwds
    @cached_property
    def bounds(self): 
        r'''
            Bounds of the degrees for the right hand side.

            This tuple contains bounds for the degree of the numerator and denominator
            of the rational functions (or polynomials) that are the equations of 
            the differential system (see property :func:`equations`).
        '''
        ## Normalizing data if needed
        self.normalize()

        ## Computing the bounds
        if(isinstance(self.equations[0], SparsePolynomial)):
            Dn = max([equ.degree() for equ in self.equations if equ != 0])
            Dd = 0
        elif(isinstance(self.equations[0], RationalFunction)):
            Dn = max([equ.numer.degree() for equ in self.equations if equ != 0])
            Dd = max(equ.denom.degree() for equ in self.equations)
        else: # sympy expression case
            bounds = [FODESystem.bound_degree_expr(equ, self.variables) for equ in self.equations]
            Dn = max(bound[0] for bound in bounds)
            Dd = max(bound[1] for bound in bounds)
        return (Dn, Dd)

    @cached_property
    def size(self): return len(self._equations)

    @cached_property
    def nspecies(self):
        r'''
            Counts the number of species of a system

            See property :func:`species` for further information.
        '''
        return len(self.species)

    @cached_property
    def species(self):
        r'''
            Return the names of the species of a system.

            A specie is a variable that is not constant, i.e., its equation is not 0.
        '''
        return [self.variables[i] for i in range(self.size) if self.equations[i] != 0]

    @cached_property
    def npars(self):
        r'''
            Counts the number of parameters of a system

            See property :func:`pars` for further information.
        '''
        return len(self.pars)

    @cached_property
    def pars(self):
        r'''
            Return the names of the parameter of a system.

            A parameter is a variable that is constant, i.e., its equation is 0.
        '''
        return [self.variables[i] for i in range(self.size) if self.equations[i] == 0]

    @cached_property
    def field(self):
        r'''
            Property that gives the ground field of the system.

            The ground field is a sympy structure that allows the user to manipulate any rational
            expression in all the symbols appearing in the equations that are not variables (see 
            property :func:`variables`).

            This is different that the property :func:`pars`, since those are the actual variables
            that are constant.
        '''
        # Normalizing equations if needed
        self.normalize()
        
        # computing the field
        equations = self.all_equations()
        if(issubclass(self.type, (SparsePolynomial, RationalFunction))):
            return next(equations).domain
        else:
            allvars = set()
            for eq in equations:
                allvars = allvars.union(eq.free_symbols)
            params = list(filter(lambda s: str(s) not in self.variables, allvars))
            if len(params) == 0:
                logger.debug(":field: no parameters, the ground field is QQ then")
                return QQ
            else:
                logger.debug(":field: some parameters found, extending Q as needed")
                return sympy.FractionField(QQ, [str(p) for p in params])

    @cached_property
    def type(self):
        self.normalize()
        return type(self.equations[0])

    def linear_part(self) -> SparseRowMatrix:
        r'''Build a matrix with the linear part of the equations'''
        if self.__linear_part == None:
            self.normalize()
            self.__linear_part = FODESystem.evaluate_jacobian(self.equations, self.variables, self.field, [0 for _ in range(self.size)])
        return self.__linear_part

    @lru_cache(maxsize=1)
    def is_linear_system(self):
        r'''Checker to see if a system is linear or not'''
        if not issubclass(self.type, SparsePolynomial):
            return False

        return all(equation.is_linear() for equation in self.all_equations())

    @lru_cache(maxsize=1)
    def is_weighted_system(self):
        r'''Checks if any coefficient is not 0 or 1'''
        self.normalize()
        if issubclass(self.type, SparsePolynomial):
            return any(any((not c in (0,1)) for c in equ.coefficients) for equ in self.equations)
        return True # if not sparse polynomials, then we considered weighted by default

    def all_equations(self):
        r'''
            Return a generator with all the equations of the system
        '''
        yield from self.equations

    def symb_variables(self):
        r'''
            Return a list with the variables represented as symbolic objects compatible with the type of the equations

            This method is useful when we want to create the variables from scratch and use them algebraically without
            considering their type anymore (since it will coincide with the general type decide after normalizing).

            Output:

            A tuple with the variables in the same order as in :func:`variables` represented in the class given by 
            :func:`type`.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y'], QQ)
                >>> ode = FODESystem([x**2*y**2 - x**3*y**2], variables=['x','y'])
                >>> ode.type
                <class 'clue.rational_function.SparsePolynomial'>
                >>> ode.symb_variables()
                (x, y)
                >>> all(type(var) == ode.type for var in ode.symb_variables())
                True
                >>> R = vring(['x','y','z'], QQ)
                >>> ode = FODESystem([x**2*y**-2 - z**-2*y**2], variables=['x','y','z'])
                >>> ode.type
                <class 'sympy.core.add.Add'>
                >>> ode.symb_variables()
                (x, y, z)
                >>> type(ode.symb_variables()[0])
                <class 'sympy.core.symbol.Symbol'>
        '''
        self.normalize()
        variables = self.variables
        if isinstance(self.equations[0], (SparsePolynomial, RationalFunction)):
            return tuple([SparsePolynomial.var_from_string(v, variables, self.field) for v in variables])
        else:
            return tuple([symbols(v) for v in variables])

    ## more specialized getters
    def equation(self, varname):
        r'''
            Returns the equation associated with a variable name.
        '''
        return self.equations[self.variables.index(varname)]

    def __decide_type(self):
        r'''
            Method to decide the type for the normalized equations
        '''
        target_type = 0 # 0 = SparsePolynomial; 1 = RationalFunction; 2 = Expression
        # first loop to decide target
        equations = self.all_equations(); equ = next(equations)
        while target_type < 2 and not(equ is None):
            if isinstance(equ, PolyElement):
                if equ != 0 and any(min(d for d in m) < 0 for m in equ.monoms()): 
                    # PolyElement with negative exponents --> sympy
                    logger.debug(":normalize: found PolyElement with negative exponents --> sympy")
                    target_type = 2
                # PolyElement with no negative exponents --> polynomial: do not change target_type
            elif isinstance(equ, FracElement):
                numer, denom = equ.numer, equ.denom
                if numer == 0: # fraction is zero, nothing is needed
                    pass
                elif denom == 1: # maybe a polynomial is enough
                    if numer != 0 and min(min(d for d in m) < 0 for m in numer.monoms()): # FracElement with numerator with neg. exponents
                        logger.debug(":normalize: found FracElement (den=1, num w. neg. exp.) --> RationalFunction")
                        target_type = 1
                else: # we have a proper fraction, we need a RationalFunction
                    logger.debug(":normalize: found FracElement (den!=1) --> RationalFunction")
                    target_type = 1
            elif isinstance(equ, SparsePolynomial):
                pass # the type do not change because of a SparsePolynomial
            elif isinstance(equ, RationalFunction):
                # we check the denominator to see if it is not 1
                if equ.denom != 1: # we need at least a RationalFunction
                    logger.debug(":normalize: found RationalFunction (den!=1) --> RationalFunction")
                    target_type = 1
            else: # other cases all to sympy
                logger.debug(":normalize: found something different --> sympy")
                target_type = 2
            equ = next(equations, None)
        
        return target_type

    def __transform_equation(self, equation, type):
        r'''
            Method to transform the equations of the system to the normalized setting.
        '''
        if isinstance(equation, PolyElement):
            if type == 0:
                nequation = SparsePolynomial.from_sympy(equation, self.variables)
            elif type == 1:
                nequation = RationalFunction.from_string(str(equation.as_expr()), self.variables)
            elif type == 2:
                nequation = equation.as_expr()
        elif isinstance(equation, FracElement):
            if type == 0:
                nequation = SparsePolynomial.from_sympy(equation.numer, self.variables)
            elif type == 1:
                nequation = RationalFunction.from_string(str(equation.as_expr()), self.variables)
            elif type == 2:
                nequation = equation.as_expr()
        elif isinstance(equation, SparsePolynomial):
            if type == 0:
                nequation = equation
            elif type == 1:
                nequation = RationalFunction(equation, RationalFunction.from_const(1, self.variables))
            elif type == 2:
                nequation = equation.to_sympy().as_expr()
        elif isinstance(equation, RationalFunction):
            if type == 0:
                nequation = equation.numer
            elif type == 1:
                nequation = equation
            elif type == 2:
                nequation = equation.to_sympy().as_expr()
        elif isinstance(equation, list):
            nequation = [self.__transform_equation(equ, type) for equ in equation]
        elif isinstance(equation, tuple):
            nequation = tuple([self.__transform_equation(equ, type) for equ in equation])
        else:
            if type == 0:
                raise TypeError("Reached SparsePolynomial from something weird")
            elif type == 1:
                raise TypeError("Reached RationalFunction from something weird")
            elif type == 2:
                nequation = equation
        return nequation

    def normalize(self):
        r'''
            Method that rewrites the equations of ``self`` to fit into all the methods in the class.

            This method transforms the equations of this :class:`FODESystem` by changing its type to 
            the best choice among:
            
            * :class:`~clue.rational_function.SparsePolynomial`: this is the best but most restrictive class
              for a system. It requires a polynomial input and exploits the sparseness of it to speed up 
              computations.
            * :class:`~clue.rational_function.RationalFunction`: this class is a rational function on the 
              form `numer/denom`. This is less restrictive than the polynomial input but needs that the 
              input is given in the specific form.
            * A SymPy expression: avoiding special classes as :class:`PolyElement` or :class:`FracElement`,
              we use the basic expression structure in SymPy for all the inputs that do not fit the previous
              two formats.

            **REMARK**: this method do not return anything and change the equations *in-place*.

            Examples:

            We start by showing what happen when using objects in the class :class:`~sympy.polys.rings.PolyElement`::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y'], QQ)
                >>> ode = FODESystem([x**2*y**2 - x**3*y**2], variables=['x','y'])
                >>> type(ode.equations[0]) # it is a PolyElement and it is a polynomial
                <class 'sympy.polys.rings.PolyElement'>
                >>> ode.normalize() # they change to SparsePolynomial
                >>> type(ode.equations[0])
                <class 'clue.rational_function.SparsePolynomial'>
                >>> ode.equations[0]
                x**2*y**2 - x**3*y**2
                >>> ode = FODESystem([x**2*y**-2 - x**-2*y**2], variables=['x','y'])
                >>> type(ode.equations[0]) # it is a PolyElement! even with negative exponents!
                <class 'sympy.polys.rings.PolyElement'>
                >>> ode.normalize() # they change to expressions
                >>> type(ode.equations[0])
                <class 'sympy.core.add.Add'>
                >>> ode.equations[0]
                x**2/y**2 - y**2/x**2

            We repeat the examples but now using the class :class:`~sympy.polys.fields.FracElement`::

                >>> x,y = R.to_field().gens
                >>> ode = FODESystem([x**2*y**-2 - x**-2*y**2], variables=['x','y'])
                >>> type(ode.equations[0])
                <class 'sympy.polys.fields.FracElement'>
                >>> ode.normalize() # they change to RationalFunction
                >>> type(ode.equations[0])
                <class 'clue.rational_function.RationalFunction'>

        '''
        if not self.__normalize_input:
            type = self.__decide_type()
            for i in range(self.size):
                nequ = self.__transform_equation(self.equations[i], type)
                self._equations[i] = nequ
            self.__normalize_input = True

    def eval_equation(self, equations, point):
        r'''
            Method to evaluate a equations in a particular value.
            
            This method unifies the way of evaluating the equations of a differential system.
            After normalizing the system, we only have three options for the equations:
            
            * :class:`~clue.rational_function.SparsePolynomial`
            * :class:`~clue.rational_function.RationalFunction`
            * A Sympy expression.

            The first two can be evaluated with the method ``eval``. However, SymPy expressions
            are evaluated with the method ``subs`` and a different type of input.

            This method allows to evaluate all type of equations with the same interface and input.

            Input:

            - ``equations``: either an equation or index of the equation to be evaluated, or a list of these two things.
            - ``point``: list of values (with the length given by ``self.size``) or a dictionary with the 
              variables we want to evaluate.

            Output:

            The evaluation of the ``equations`` at ``point``. If the input is only one element, we return that element. Otherwise, we 
            return a list.
        '''
        if isinstance(point, (list, tuple, ndarray)):
            if len(point) != self.size:
                raise TypeError("Not enough values to evaluate an equation (format list)")

            point = {self.variables[i] : point[i] for i in range(self.size)}
        elif isinstance(point, dict):
            if any(not (var in self.variables) for var in point):
                raise ValueError("A given variable for evaluation does not exist in the system (format dict)")

        self.normalize()
        symb_evaluations = [(symbols(k),v) for (k,v) in point.items()]
        sparse_evaluations = point

        was_list = True
        if not isinstance(equations, (list, tuple)): # we allow a list of elements to evaluate
            equations = [equations]
            was_list = False
            
        result = []

        for equation in equations:
            if isinstance(equation, int): # given an index --> considering the corresponding equation
                equation = self.equations[equation]

            if isinstance(equation, list):
                result.append(self.eval_equation(equation, point))
            elif isinstance(equation, tuple):
                result.append(tuple(self.eval_equation(equation, point)))
            elif isinstance(equation, (SparsePolynomial, RationalFunction)):
                result.append(equation.eval(**sparse_evaluations))
            elif hasattr(equation, "subs"):
                result.append(equation.subs(symb_evaluations))
            else:
                result.append(equation)
        
        if not was_list: return result[0]
        return result

    def check_consistency(self, other, map_variables, symbolic=False):
        r'''
            Method that check the consistency of the differential systems

            this method checks if ``self`` is obtained from the system ``other``
            after the change of variables provided by ``map_variables``.

            Each variable must be given as a linear :class:`~clue.rational_function.SparsePolynomial`.
        '''
        ########################################################
        # Normalizing equations if needed
        self.normalize()

        ########################################################
        # Obtaining some evaluation data
        if symbolic:
            dic_y_eval = {self.variables[i] : map_variables[i] for i in range(self.size)}
            xdot_eval = other.equations
        else:
            ## Evaluating the variables
            x_eval = [randint(1,100) for _ in other.variables]
            dic_x_eval = {other.variables[i] : x_eval[i] for i in range(other.size)}
            y_eval = [poly.eval(**dic_x_eval).ct for poly in map_variables]
            dic_y_eval = {self.variables[i] : y_eval[i] for i in range(self.size)}
            
            ## Evaluation other rhs
            xdot_eval = [other.eval_equation(i, dic_x_eval) for i in range(other.size)]

        ########################################################
        # COMPUTING LHS OF THE SYSTEM
        vec_vars = [el.linear_part_as_vec() for el in map_variables]
        lhs = [sum(vec_vars[i][j]*xdot_eval[j] for j in range(other.size)) for i in range(self.size)]
        # lhs is a list of elements of type depending on other.equations (symbolic) or number (not symbolic)
        
        ########################################################
        # COMPUTING RHS OF THE SYSTEM
        equations_to_eval = self.equations
        if symbolic: # we cast everything into sympy to do evaluation
            if isinstance(self.equations[0], SparsePolynomial):
                equations_to_eval = [el.to_sympy().as_expr() for el in equations_to_eval]
            elif isinstance(self.equations[0], RationalFunction):
                equations_to_eval = [(el.numer.to_sympy()/el.denom.to_sympy()).as_expr() for el in equations_to_eval]
            else:
                equations_to_eval = [el.as_expr() for el in equations_to_eval]

        if(isinstance(equations_to_eval[0], (SparsePolynomial, RationalFunction))):
            # this only happens if symbolic is False, so we evaluate to numbers
            rhs = [eq.eval(**dic_y_eval) for eq in equations_to_eval]
        else: # sympy case
            for k,v in list(dic_y_eval.items()):
                if isinstance(v, SparsePolynomial):
                    dic_y_eval[k] = v.to_sympy().as_expr()
                elif isinstance(v, RationalFunction):
                    dic_y_eval[k] = (v.numer.to_sympy()/v.denom.to_sympy()).as_expr()
            rhs = [eq.subs([(k, v) for k,v in dic_y_eval.items()]) for eq in equations_to_eval]

            if symbolic:
                if isinstance(other.equations[0], SparsePolynomial):
                    rhs = [SparsePolynomial.from_string(str(el), other.variables, other.field) for el in rhs]
                elif isinstance(other.equations[0], RationalFunction):
                    rhs = [RationalFunction.from_sympy(el, other.variables) for el in rhs]
                else:
                    ### TODO: make a comparison with sympy expressions instead of rational functions
                    lhs = [RationalFunction.from_sympy(el, other.variables) for el in lhs]
                    rhs = [RationalFunction.from_sympy(el, other.variables) for el in rhs]

        return lhs == rhs

    def evaluate_parameters(self, values):
        r'''
            Method that evaluate some of the parameters of the system to specific values

            Input
                - ``values``: a dictionary with the names of the parameters to evaluate as keys and the 
                  new values as the values.

            Output

            A new :class:`FODESystem` with the remaining equations of the system after evaluating the parameters
            with the given values.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y','a','b','c'], QQ)
                >>> ode = FODESystem([a*x**2*y**2 - b*x**3*y**2, -c*y*x,0,0,0], variables=['x','y','a','b','c'])
                >>> ode.pars
                ['a', 'b', 'c']
                >>> ode_eval = ode.evaluate_parameters({'a': 3, 'b': 0, 'c': -1})
                >>> ode_eval.variables
                ['x', 'y']
                >>> ode_eval.pars
                []
                >>> ode_eval.equations
                [3*x**2*y**2, x*y]

            The evaluation of the parameters can be performed partially (i.e., without providing all the parameters at once)::

                >>> ode_eval = ode.evaluate_parameters({'b' : 0})
                >>> ode_eval.pars
                ['a', 'c']
                >>> ode_eval.equations
                [a*x**2*y**2, -c*x*y, 0, 0]

            We even allow names that are not in the system::

                >>> ode_eval = ode.evaluate_parameters({'aa' : 0})
                >>> ode_eval.variables == ode.variables
                True
                >>> ode_eval.equations == ode.equations
                True

            But we will raise a :class:`ValueError` if we try to evaluate a variable that is not a parameter::

                >>> ode.species
                ['x', 'y']
                >>> ode_eval = ode.evaluate_parameters({'a' : 0, 'x' : 3})
                Traceback (most recent call last):
                ...
                ValueError: Can not evaluate the variable x [it is not a parameter]
        '''
        self.normalize()

        # checking we do not have non-parameters in the list
        for specie in self.species:
            if specie in values:
                raise ValueError(f"Can not evaluate the variable {specie} [it is not a parameter]")

        # removing unnecessary values
        values = {k : v for (k,v) in values.items() if k in self.pars}
        indices_parameters = [self.variables.index(k) for k in values]

        # computing the new equations --> we remove the equations from the evaluated parameters
        new_equations = [self.eval_equation(i, values) for i in range(self.size) if not (i in indices_parameters)]

        # computing the new observables (if any)
        new_observables = None if self.observables == None else self.eval_equation(self.observables, values)

        # computing the remaining variables
        new_variables = [self.variables[i] for i in range(self.size) if (not i in indices_parameters)]

        # removing parameters from initial conditions (if any)
        if self.ic is None: new_ic = {}
        else: new_ic = {k : v for (k,v) in self.ic.items() if (not k in values)}

        # setting the new name
        new_name = f"{self.name}_evaluated[{';'.join(f'{k}->{v}' for (k,v) in values.items())}]" if self.name != None else None

        # returning the resulting system
        return FODESystem(
            new_equations,  # the equations has less variables
            new_observables,# the observables are also evaluated
            new_variables,  # the remaining variables
            new_ic,         # the initial values do not have the evaluated parameters
            new_name       # we keep the name of the system
            )
            
    def remove_parameters_ic(self):
        r'''
            Method to compute a smaller system removing known parameters.

            This method evaluates the parameters of the systems whose initial conditions are known.
            This simplifies the system by removing variables from the list when the variables are constants
            (i.e., they are parameters with a fixed value). When this value was given as initial condition,
            we can simply remove this variable from the system.

            Output:

            A new :class:`FODESystem` where all the parameters whose initial condition is given has been evaluated.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y','a','b','c'], QQ)
                >>> ode = FODESystem([a*x**2*y**2 - b*x**3*y**2, -c*y*x,0,0,0], variables=['x','y','a','b','c'], ic={'a': 3, 'b' : 0})
                >>> ode.pars
                ['a', 'b', 'c']
                >>> ode_eval = ode.remove_parameters_ic()
                >>> ode_eval.variables
                ['x', 'y', 'c']
                >>> ode_eval.pars
                ['c']
                >>> ode_eval.equations
                [3*x**2*y**2, -c*x*y, 0]
        '''
        if self.ic is None: return self

        return self.evaluate_parameters({par : self.ic[par] for par in self.pars if par in self.ic})
    
    def scale_model(self, values):
        r'''
            Method to re-scale all variable of the model.

            This method do the substitution `x \mapsto x*c_x` for each variable where the factor `c_x` can be set differently for each variable.

            Since the scaling is only linear, the changes only show up in the right-hand side of the system. Namely, we do the previous substitution
            in each equation for all variables simultaneously and then for the equation related with `x`, we divide by `c_x`.

            The observables are also adapted with the same change.

            Input:
                - ``values``: dictionary with the names of the parameters to evaluate and their re-scaling factor. If a variable is not given it remains 
                  as it is (i.e., it has a factor of 1).

            Output: 

            A new :class:`FODESystem` with the rescaled equations.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y','a','b','c'], QQ)
                >>> ode = FODESystem([a*x**2*y**2 - b*x**3*y**2, -c*y*x,0,0,0], variables=['x','y','a','b','c'])
                >>> x,y,a,b,c = ode.symb_variables()
                >>> scaled_parameters = ode.scale_model({'a' : 3, 'b' : 4, 'c': 7})
                >>> scaled_parameters.equations
                [a*x**2*y**2/3 - b*x**3*y**2/4, -c*x*y/7, 0, 0, 0]
                >>> scaled_variables = ode.scale_model({'x' : 3, 'y' : 4})
                >>> scaled_variables.equations
                [a*x**2*y**2/48 - b*x**3*y**2/144, -c*x*y/3, 0, 0, 0]
        '''
        if isinstance(values, dict):
            sym_variables = self.symb_variables()
            changes = {self.variables[i] : sym_variables[i]/values.get(self.variables[i], 1) for i in range(len(self.variables))}
            new_equations = [self.eval_equation(i, changes)*values.get(self.variables[i], 1) for i in range(len(self.variables))]
            new_observables = self.eval_equation(self.observables, changes) if self.observables != None else None
            new_ic = {self.ic[v]*values.get(v,1) for v in self.ic} if self.ic != None else None
            new_name = f"{self.name}_scaled[{list(changes.values())}]" if self.name != None else None

            return FODESystem(
                new_equations,  # the equations with the scaled variables
                new_observables,# the observables are also scaled
                self.variables, # the variables does not change when scaling
                new_ic,         # the initial values are adapted accordingly
                new_name        # we update the name of the system with the scaling
                )
        else: # the case when all values are the same -->
            return self.scale_model({v: values for v in self.variables})

    ##############################################################################################################
    ### I/O METHODS
    def save(self, file: str, format: str ="clue"):
        r'''
            Method to save the current system into a file

            This method will store on the hard disk the current system. We allow to have
            two file formats available: "ode" or "clue". 

            * "ode" format will write an ERODE compatible file with the current system trying
              to preserve as many information as possible.
            * "clue" format will simply dump the whole object using the ``pickle`` module.

            The extension ".ode" or ".clue" will be added to the file name.

            INPUT:

            * ``file``: path where the system will be stored.
            * ``format``: format of the output system. The "ode" format is readable, "clue" is 
              in binary format. 

            OUTPUT:

            This method has no output.
        '''
        self.normalize()
        if not format in ("ode", "clue"): raise ValueError("The format only allow the ERODE format ('ode') and binary ('clue')")

        if not file.endswith(f".{format}"):
            file += f".{format}"

        with open(file, f"w{'b' if format == 'clue' else ''}") as f:
            if format == "clue":
                import pickle
                pickle.dump(self, f)
            elif format == "ode":
                self.__to_erode(f)

    def __to_erode(self, file: IOBase):
        file.write(f"begin model {self.name if self.name != None else 'FODESystem'}\n")
        # we write the parameters
        file.write(f" begin parameters\n")
        for var in self.pars:
            file.write('  ' + var + (f' = {self.ic[var]}' if var in self.ic else '') + '\n')
        file.write(" end parameters\n")
        # we write the variables
        file.write(f" begin inits\n")
        for var in self.species:
            file.write('  ' + var + (f' = {self.ic[var]}' if var in self.ic else '') + '\n')
        file.write(" end inits\n")
        # we write the equations
        file.write(" begin ODE\n")
        for var in self.species:
            file.write('  ' + f'd({var}) = ' + str(self.equation(var)) + '\n')
        file.write(" end ODE\n")
        file.write("end model\n")

    @staticmethod
    def load(file: str) -> FODESystem:
        r'''
            Static method to load a :class:`FODESystem`. It is the opposite of the method :func:`save`.
        '''
        format = "clue" if file.endswith(".clue") else "ode"

        if format == "clue":
            with open(file, f"rb") as f:
                import pickle
                return pickle.load(f)
        else:
            return FODESystem(file=file)

    ##############################################################################################################
    ## Methods for preparing to get the lumping
    ##############################################################################################################
    def construct_matrices(self, method) -> tuple[SparseRowMatrix]:
        r'''
            Method to build the matrices necessary for lumping purposes using 
            different methods.

            The argument method is a string containing:

            * "polynomial": only works when the input are :class:`clue.rational_function.SparsePolynomial`. It
              relies on splitting the jacobian matrix into their coefficients in different monomials.
            * "rational": only works when the input are :class:`clue.rational_function.RationalFunction`
              and it relies on expanding the jacobian matrices and splitting into monomials.
            * "random": only works when the input are :class:`clue.rational_function.RationalFunction`
              or lower and it relies on random evaluation of the jacobian matrix after computing this 
              matrix explicitly.
            * "auto_diff": it works for any type of input (i.e., Sympy expressions or classes in 
              the module :mod:`clue.rational_function`) and it computes random evaluations of the jacobian
              matrix using automatic differentiation.

            This method will cache the result depending on the method chosen, so different methods can be compared.

            If a method is selected that is not valid for the type of the system, the next type will be tried too.            
        '''
        # Deciding the valid method for this system
        if(method == "polynomial" and (not issubclass(self.type, SparsePolynomial))):
            logger.warning(f"Method [{method}] selected but input is not SparsePolynomial. Trying random...")
            method = "random"
        if(method == "rational" and (not issubclass(self.type, RationalFunction))):
            logger.warning(f"Method [{method}] selected but input is not RationalFunction. Trying auto_diff...")
            method = "auto_diff"
        if(method == "random" and (not issubclass(self.type, (SparsePolynomial, RationalFunction)))):
            logger.warning(f"Method [{method}] selected but input is not RationalFunction. Trying auto_diff...")
            method = "auto_diff"
        if(not method in ("polynomial", "rational", "random", "auto_diff")):
            raise NotImplementedError(f"The method selected [{method}] is not valid.")
        
        # Building the matrices with the selected algorithm
        if(not method in self._lumping_matr):
            if(method == "polynomial"):
                self._lumping_matr[method] = tuple(self._construct_matrices_from_polys())
            elif(method == "rational"):
                self._lumping_matr[method] = tuple(self._construct_matrices_from_rational_functions())
            elif(method == "random"):
                self._lumping_matr[method] = tuple(self._construct_matrices_evaluation_random())
            else: # case of "auto_diff"
                self._lumping_matr[method] = tuple(self._construct_matrices_AD_random())
        return self._lumping_matr[method]

    def _construct_matrices_from_polys(self):
        """
        Constructs matrices J_1^T, ..., J_N^T (see Step (2) of Algorithm 1 in the paper)
        Input
            - polys - the right-hand side of the system of ODEs (f_1, ..., f_n)
                    represented by SparsePolynomial
        Output
            a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
        """
        logger.debug("Starting constructing matrices (SparsePolynomial)")
        polys = self.equations
        variables = self.variables
        field = self.field

        jacobians = dict()
        for p_ind, poly in enumerate(polys):
            logger.debug("Processing polynomial number %d", p_ind)
            for monom, coef in poly.dataiter():
                for i in range(len(monom)):
                    var, exp = monom[i]
                    if exp == 1:
                        m_der = tuple(list(monom[:i]) + list(monom[(i + 1):]))
                    else:
                        m_der = tuple(list(monom[:i]) + [(var, exp - 1)] + list(monom[(i + 1):]))
                    entry = field.convert(coef) * exp
                    if m_der not in jacobians:
                        jacobians[m_der] = SparseRowMatrix(len(variables), field)
                    jacobians[m_der].increment(var, p_ind, entry)

        result = jacobians.values()
        return list(result)

    def _construct_matrices_from_rational_functions(self):
        """
        Computes Jacobian, pulls out common denominator, and constructs matrices
        J_1^T, ..., J_N^T from the remaining polynomial matrix
        Input
            - rational_functions - the right-hand side of the system of ODEs (f_1, ..., f_n)
                                represented by RationalFunction
        Output
            a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
        """
        logger.debug("Starting constructing matrices (RationalFunction)")

        rational_functions = self.equations
        variables = self.variables
        field = self.field

        # Compute Jacobian
        J = [[rf.derivative(v) for rf in rational_functions] for v in variables]

        def lcm_rec(arr, l, u):
            if u - l == 1:
                return arr[l]
            mid = (u + l) // 2
            res = SparsePolynomial.lcm([lcm_rec(arr, l, mid), lcm_rec(arr, mid, u)])
            return res

        denoms = [rf.denom for rf in rational_functions]
        d = list(filter((lambda x: x != SparsePolynomial.from_const(1,[],self.field)),denoms))
        lcm = lcm_rec(d, 0, len(d))
        lcm = lcm*lcm

        p = [lcm // (denom*denom) for denom in denoms]

        # Pull out the common denominator 
        poly_J = []
        for i in range(len(J)):
            poly_J_row = []
            for j in range(len(J[i])):
                poly_J_row.append(J[i][j].numer * p[j])
            poly_J.append(poly_J_row)

        # Work with remaining polynomial matrix as in construct_matrices_from_polys
        jacobians = dict()
        for row_ind, poly_row in enumerate(poly_J):
            for col_ind, poly in enumerate(poly_row):
                p_ind = row_ind * len(poly_row) + col_ind
                logger.debug("Processing numerator polynomial number %d", p_ind)
                for m, coef in poly.dataiter():
                    if m not in jacobians:
                        jacobians[m] = SparseRowMatrix(len(variables), field)
                    jacobians[m].increment(row_ind, col_ind, coef)

        return list(jacobians.values())

    def _construct_matrices_evaluation_random(self, prob_err=0.01):
        logger.debug("Starting constructing random matrices (RationalFunction)")

        rational_functions = self.equations
        variables = self.variables
        field = self.field

        # Compute Jacobian
        J = [[rf.derivative(v) for rf in rational_functions] for v in variables]

        # we create the matrices by evaluating the jacobian
        subspace = self.matrices_subspace_class(field, **self.matrices_subspace_kwds)
        pivot_index = subspace.absorb_new_vector(FODESystem.build_random_evaluation_matrix(J).to_vector())
        n = sum(sum(1 for el in row if el != 0) for row in J) # number of non-zero entries 
        m = 1 # number of random generated matrices
        start = time.time()
        finished = False
        while(not finished):
            while(pivot_index >= 0):
                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_matrix(J).to_vector()
                )
                if(pivot_index >= 0):
                    m += 1
                if(m % 10 == 0):
                    logger.debug(f"Generated {m} random matrices...")
            ## We had a linearly dependant matrix: we check the probability of this being complete
            logger.debug(f"Found a linearly dependant matrix after {m} attempts.")
            if(m >= n): # we grew too much, reached the maximal
                logger.debug(f"We found the maximal amount of linearly independent matrices")
                finished = True
            else: # we checked (probabilistic) if we have finished
                logger.debug(f"We compute the maximal bound for the random coefficients to have \
                    less than {prob_err} probability to get an element in the current space.")
                Dn, Dd = self.bounds
                # Value for the size of coefficients (see paper ``Exact linear reduction for rational dynamics``)
                N = int(math.ceil((Dn + 2*m*Dd)/prob_err)) + self.size*Dd

                logger.debug(f"Bound for the coefficients: {N}")

                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_matrix(J, max=N).to_vector()
                )
                if(pivot_index < 0): # we are finished
                    logger.debug("The new matrix is in the vector space: we are done")
                    finished = True
                else: # we add the matrix to the list
                    logger.debug("The new matrix is NOT in the vector space: we continue")
                
        logger.debug(f"-> I created {m} linearly independent matrices in {time.time()-start}s")
        # We return the basis obtained
        return [el.as_matrix(self.size) for el in subspace.basis()]
    
    def _construct_matrices_AD_random(self, prob_err=0.01):
        r'''
            Method to build evaluations of the jacobian of ``funcs`` by automatic differentiation.

            This method computes evaluations of the Jacobian matrix of ``funcs`` by 
            using automatic differentiation (i.e., without actually computing the symbolic 
            derivatives of the functions in ``funcs``).

            This method relies on method :func:`build_random_evaluation_jacobian` which can work
            with :class:`clue.rational_function.SparsePolynomial`, :class:`clue.rational_function.RationalFunction`
            and sympy expressions.

            The computation of the actual error bound depends on the type of input in ``funcs``.
        '''
        logger.debug("Starting constructing random matrices (AD -- RationalFunction)")
        funcs = self.equations
        varnames = self.variables
        field = self.field

        subspace = self.matrices_subspace_class(field, **self.matrices_subspace_kwds)

        # computing number of non-zero entries in the jacobian
        if(isinstance(funcs[0], (SparsePolynomial, RationalFunction))):
            n = sum(len(func.variables()) for func in funcs)
        else:
            n = sum(len([el for el in func.free_symbols if str(el) in self.variables]) for func in funcs)
        logger.debug(":_construct_AD: bound for dimension: %d" %n)
        m = 0 # number of generated matrices

        start_global = time.time()

        # We first create some sparse evaluations
        ## Computing invalid singleton evaluations
        start = time.time()
        sparse_eval_points = self._sparse_evaluation_points()
        end = time.time()
        logger.debug(f":_construct_AD: Created {len(sparse_eval_points)} sparse evaluation points in {end-start}s")
        pivot_index = None
        for point in sparse_eval_points:
            start = time.time()
            new_matr = FODESystem.evaluate_jacobian(funcs, varnames, field, point)
            pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
            logger.debug(f":_construct_AD: Densities for now {subspace.densities()}")
            if(pivot_index >= 0): # new matrix added
                logger.debug(f":_construct_AD: New matrix added with density: {new_matr.density()}")
                m += 1
            if(m % 10 == 0):
                logger.debug(f":_construct_AD: Generated {m} random matrices...")
            end = time.time()
            logger.debug(f":_construct_AD: Matrix created and checked in {end - start}")
        ## Getting some sparse evaluations
        # for i in range(len(varnames)):
        #     start = time.time()
        #     new_matr = FODESystem.build_random_evaluation_jacobian(funcs, varnames, field, index=i)
        #     if new_matr is None:
        #         logger.debug(f"None matrix for coordinate {varnames[i]}")
        #         continue
        #     pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
        #     logger.debug(f"Densities for now {subspace.densities()}")
        #     if(pivot_index >= 0):
        #         logger.debug(f"New matrix density: {new_matr.density()}")
        #         m += 1
        #     if(m % 10 == 0):
        #         logger.debug(f"Generated {m} random matrices...")
        #     end = time.time()
        #     logger.debug(f"Matrix for {self.variables[i]} in {end - start}")
        
        if(m == 0): 
            logger.debug(f":_construct_AD: No sparse evaluation was done. Creating one starting evaluation...")
            start = time.time()
            pivot_index = subspace.absorb_new_vector(
                FODESystem.build_random_evaluation_jacobian(funcs, varnames, field).to_vector()
            )
            end = time.time()
            logger.debug(f":_construct_AD: Matrix created and checked in {end - start}")
            m = 1

        finished = (m >= n)

        while(not finished):
            while(pivot_index >= 0):
                start = time.time()
                new_matr = FODESystem.build_random_evaluation_jacobian(funcs, varnames, field)
                pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
                logger.debug(f":_construct_AD: Densities for now {subspace.densities()}")
                if(pivot_index >= 0):
                    logger.debug(f":_construct_AD: New matrix density: {new_matr.density()}")
                    m += 1
                if(m % 10 == 0):
                    logger.debug(f":_construct_AD: Generated {m} random matrices...")
                end = time.time()
                logger.debug(f":_construct_AD: Matrix in {end - start}")
            ## We had a linearly dependant matrix: we check the probability of this being complete
            logger.debug(f":_construct_AD: Found a linearly dependant matrix after {m} attempts.")
            if(m >= n): # we grew too much, reached the maximal
                logger.debug(f":_construct_AD: We found the maximal amount of linearly independent matrices")
                finished = True
            else: # we checked (probabilistic) if we have finished
                logger.debug(f":_construct_AD: We compute the maximal bound for the random coefficients to have less than {prob_err} probability \
                to get an element in the current space.")
                Dn, Dd = self.bounds
                # Value for the size of coefficients (see paper ``Exact linear reduction for rational dynamics``)
                N = int(math.ceil((Dn + 2*m*Dd)/prob_err)) + self.size*Dd

                logger.debug(f":_construct_AD: Bound for the (prob.) coefficients: {N}")

                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_jacobian(funcs, varnames, field, max=N).to_vector()
                )
                if(pivot_index < 0): # we are finished
                    logger.debug(":_construct_AD: The new matrix is in the vector space: we are done")
                    finished = True
                else: # we add the matrix to the list
                    logger.debug(":_construct_AD: The new matrix is NOT in the vector space: we continue")
                
        logger.debug(f":_construct_AD: -> I created {m} linearly independent matrices in {time.time()-start_global}s")
        # We return the basis obtained
        return [el.as_matrix(self.size) for el in subspace.basis()]
    
    def _sparse_evaluation_points(self):
        base_sparse = [i*[0] + [1] + (self.size - i - 1)*[0] for i in range(self.size)]
        if(isinstance(self.equations[0], SparsePolynomial)):
            result = base_sparse
        elif(isinstance(self.equations[0], RationalFunction)):
            denoms = [el.denom for el in self.equations]
            result = []
            for point in base_sparse:
                current = [el for el in denoms if el.eval(**{self.variables[i]: point[i] for i in range(self.size)}) == 0]
                while(len(current) > 0):
                    for v in current[0].variables():
                        if(point[self.variables.index(v)] == 0):
                            point[self.variables.index(v)] = 1
                            break
                    current = [el for el in denoms if el.eval(**{self.variables[i]: point[i] for i in range(self.size)}) == 0]
                result.append(point)
        else: # sympy expression case
            result = FODESystem.sparse_evaluation_points_sympy(self.equations, self.variables, base_sparse)
        return result

    ##############################################################################################################
    ### Static and private methods for building matrices
    @staticmethod
    def evaluate_matrix(matrix, values):
        r'''
            Method to evaluate a Matrix at a particular position

            This method evaluates a list of lists (i.e., a matrix) of rational functions or polynomials
            in a particular place. This method only works if all variables are provided for the evaluation.

            This method assumes that all the information (concerning the variables) can be obtained from the 
            first element of the matrix (the element ``matrix[0][0]``).

            Input
                ``matrix`` - a list of lists with either :class:`~clue.rational_function.SparsePolynomial`
                or :class:`~clue.rational_function.RationalFunction`. In general, any class that 
                provide a method ``eval`` could work.
                ``values`` - a list of values of the same length as ``matrix[0][0].gens``, indicating the 
                evaluation point.

            Output
                a :class:`SparseRowMatrix` with the evaluation of ``matrix`` at ``values``.

            TODO: add examples and tests
        '''
        varnames = matrix[0][0].gens
        domain = matrix[0][0].domain

        if(len(values) != len(varnames)):
            raise ValueError("Evaluation this matrix requires exactly %d values (%d given)" %(len(varnames), len(values)))

        values = {varnames[i] : values[i] for i in range(len(values))}
        result = SparseRowMatrix(len(matrix), domain)
        for i in range(len(matrix)):
            for j in range(len(matrix[i])):
                if(matrix[i][j]!=0):
                    evaluation = matrix[i][j].eval(**values).get_constant()
                    if(evaluation != 0):
                        result.increment(i,j,evaluation)
        return result

    @staticmethod
    def build_random_evaluation_matrix(matrix, min=0, max=100, attempts=1000):
        r'''
            Evaluates a matrix (as a list of lists) in a random vector of integer coordinates.

            This method generates a vector of integers (depending in the amount of variables)
            and build a SparseRowMatrix with the evaluations of the entries in ``matrix`` in
            such vector.

            If any error occur during the evaluation (for example, we find a pole of a rational function)
            this method will start over until we find a valid evaluation.

            The coordinates will be generated between the values provided by ``min`` and ``max``.

            Input
                ``matrix`` - a list of lists with either :class:`~clue.rational_function.SparsePolynomial`
                or :class:`~clue.rational_function.RationalFunction`. In general, any class that 
                provide a method ``eval`` could work.
                ``min`` - the minimal integer value for the coordinates in the evaluation vector.
                ``max`` - the maximal integer value for the coordinates in the evaluation vector.

            Output
                a :class:`SparseRowMatrix` with the evaluation of ``matrix`` at a random place.
        '''
        varnames  = matrix[0][0].gens

        for _ in range(attempts):
            values = tuple([randint(min, max) for _ in range(len(varnames))])
            try:
                return FODESystem.evaluate_matrix(matrix, values)
            except KeyboardInterrupt as e:
                raise e
            except ZeroDivisionError:
                pass

        raise ValueError("After %d attempts, we did not find a valid random evaluation. Consider changing the bounds." %attempts)

    @staticmethod
    def evaluate_jacobian(funcs, varnames, domain, values):
        r'''
            Method to evaluate the jacobian of some functions at a particular position

            Input
                ``funcs`` - a list of functions formed out of the variables in ``varnames``.
                They can be :class:`clue.rational_function.SparsePolynomial`, :class:`RationalFunction`
                of Sympy expressions
                ``varnames`` - list of names of the variables involved in the function.
                ``domain`` - sympy structure for the coefficients to be taken
                ``values`` - vector of values defining the point of evaluation

            Output
                a :class:`SparseRowMatrix` with the evaluation of the Jacobian of ``funcs`` at ``values``.

            TODO: add examples and tests
        '''
        nrows = len(funcs)
        ncols = len(varnames)

        matrix = [_automated_differentiation(func, varnames, domain, values)[1:] for func in funcs] # this needs to be transposed
        result = SparseRowMatrix(len(matrix[0]), domain)
        for i in range(nrows):
            for j in range(ncols):
                if(matrix[i][j] != 0):
                    result.increment(j,i,matrix[i][j]) # indices are transposed
        return result

    @staticmethod
    def build_random_evaluation_jacobian(funcs, varnames, domain, min=0, max=20, attempts=1000, index=None):
        r'''
            Computes the evaluation of the Jacobian of some rational functions via automatic differentiation.

            This method generates a vector of integers (depending in the amount of variables)
            and build a SparseRowMatrix with the evaluations of the Jacobian of the rational functions
            given in the input at the point given by the vector.

            If any error occur during the evaluation (for example, we find a pole of a rational function)
            this method will start over until we find a valid evaluation.

            The coordinates will be generated between the values provided by ``min`` and ``max``.

            Input
                ``funcs`` - a list of functions formed out of the variables in ``varnames``.
                They can be :class:`clue.rational_function.SparsePolynomial`, :class:`RationalFunction`
                of Sympy expressions
                ``varnames`` - list of names of the variables involved in the function.
                ``domain`` - sympy structure for the coefficients to be taken
                ``min`` - the minimal integer value for the coordinates in the evaluation vector.
                ``max`` - the maximal integer value for the coordinates in the evaluation vector.

            Output
                a :class:`SparseRowMatrix` with the evaluation of ``matrix`` at a random place.
        '''
        for _ in range(attempts):
            if index is None:
                values = [randint(min, max) for v in varnames]
            else:
                values = [0] * len(varnames)
                values[index] = randint(min, max)
            try:
                return FODESystem.evaluate_jacobian(funcs, varnames, domain, values)
            except KeyboardInterrupt as e:
                raise e
            except ZeroDivisionError:
                pass
    
    @staticmethod
    def bound_degree_expr(expr: sympy.core, varnames=None):
        r'''
            Static method to compute a degree bound for a sympy expression
            
            This method computes a degree bound for the numerator and denominator of a 
            sympy rational expression without expanding it.

            Input
                - ``exp`` - a sympy expression
                - ``varnames`` - list of names for the symbols that will counted for degree. Other symbols will 
                  be ignored. If ``None`` is given, then all symbols will be taken into consideration.
            Output
                - ``(num_bound, denom_bound)`` - ``num_bound`` is the upper bound for the degree of
                the numerator and ``denom_bound`` is the upper bound for the degree of the denominator.

            Examples::

                >>> from sympy import Symbol
                >>> from clue import FODESystem
                >>> a = sympy.Symbol("a")
                >>> b = sympy.Symbol("b")
                >>> c = sympy.Symbol("c")
                >>> d = sympy.Symbol("d")
                >>> FODESystem.bound_degree_expr(a/b)
                (1, 1)
                >>> FODESystem.bound_degree_expr(a + b)
                (1, 0)
                >>> FODESystem.bound_degree_expr(a/b + c/d)
                (2, 2)
                >>> FODESystem.bound_degree_expr((a**2)/1)
                (2, 0)
                >>> FODESystem.bound_degree_expr((a**2)/b)
                (2, 1)
                >>> FODESystem.bound_degree_expr(a/(b**42))
                (1, 42)
                >>> FODESystem.bound_degree_expr((a+b)**2/1)
                (2, 0)
                >>> FODESystem.bound_degree_expr((a*b*(1+b)) / (42 - a)**2)
                (3, 2)
                >>> FODESystem.bound_degree_expr(1/(b/(a + b) + 1))
                (1, 1)
                >>> FODESystem.bound_degree_expr((1 + a**3 / b**2) / (1 + b / (a + b)))
                (4, 3)
                >>> FODESystem.bound_degree_expr((a**2 + b**2*c**2) / d**3)
                (4, 3)
        '''
        if isinstance(expr, sympy.core.mul.Mul):
            arg_bounds = [FODESystem.bound_degree_expr(arg, varnames) for arg in expr._args]
            num_bound = sum([bound[0] for bound in arg_bounds]) 
            denom_bound = sum([bound[1] for bound in arg_bounds])
        elif isinstance(expr, sympy.core.add.Add):
            arg_bounds = [FODESystem.bound_degree_expr(arg, varnames) for arg in expr._args]
            denom_bound = sum([bound[1] for bound in arg_bounds])
            if denom_bound == 0:
                num_bound = max([bound[0] for bound in arg_bounds])
            else:
                num_bound = max([bound[0] + denom_bound - bound[1] for bound in arg_bounds])
        elif isinstance(expr, sympy.core.power.Pow):
            arg_bounds = FODESystem.bound_degree_expr(expr._args[0], varnames)
            power = expr._args[1]
            if power >= 0:
                num_bound = arg_bounds[0]*power
                denom_bound = arg_bounds[1]*power
            else:
                num_bound = arg_bounds[1]*(-power)
                denom_bound = arg_bounds[0]*(-power)
        elif isinstance(expr, sympy.core.symbol.Symbol):
            num_bound = 1 if (varnames is None or str(expr) in varnames) else 0
            denom_bound = 0
        elif isinstance(expr, sympy.core.numbers.Number):
            num_bound = 0
            denom_bound = 0
        else:
            raise NotImplementedError

        return (num_bound, denom_bound)

    @staticmethod
    def sparse_evaluation_points_sympy(funcs, varnames, base_sparse, attempts = 5):
        r'''
            Method to get a set of sparse evaluation points for sympy expressions

            This method tries to build a set of points where the evaluation of some
            sympy expressions can be computed while having as many zeros in the input 
            as possible.

            This method acts recursively from bottom to top of the expression tree
            of the functions. This method works both for one expression or a list of
            expressions, where we simply call iteratively to this method with the following
            points.

            Input
                - ``funcs`` - either a list of sympy expressions or a sympy expression
                - ``varnames`` - list of variables to be considered to evaluate
                - ``base_sparse`` - a base set of "sparse" evaluation points.

            Output
            
            A new list of points "as sparse as possible" (i.e., having as many zeros as possible)
            such that any expression in funcs can be evaluated.

            Examples::

                >>> from clue import FODESystem
                >>> import sympy
                >>> a = sympy.Symbol("a")
                >>> b = sympy.Symbol("b")
                >>> c = sympy.Symbol("c")
                >>> d = sympy.Symbol("d")
                >>> FODESystem.sparse_evaluation_points_sympy(a/b, varnames=['a', 'b'], base_sparse=[[1,0],[0,1]])
                [[0, 1], [1, 1]]
        '''
        if(isinstance(funcs, (list, tuple))):
            if(len(funcs) == 0):
                return base_sparse
            result = FODESystem.sparse_evaluation_points_sympy(funcs[0], varnames, base_sparse, attempts)
            return FODESystem.sparse_evaluation_points_sympy(funcs[1:], varnames, result, attempts)
        
        ## The case of simply one expression
        expr = funcs
        if isinstance(expr, sympy.core.mul.Mul):
            ## we need to evaluate all the operands
            result = FODESystem.sparse_evaluation_points_sympy(expr.args, varnames, base_sparse, attempts)
        elif isinstance(expr, sympy.core.add.Add):
            ## we need to evaluate all the operands
            result = FODESystem.sparse_evaluation_points_sympy(expr.args, varnames, base_sparse, attempts)
        elif isinstance(expr, sympy.core.power.Pow):
            ## we need to evaluate the base
            partial = FODESystem.sparse_evaluation_points_sympy(expr.args[0], varnames, base_sparse, attempts)
            try:
                power = int(expr.args[1])
                if(power < 0): # we need to avoid the evaluation to zero of this denominator
                    base_expr = expr.args[0]
                    result = []
                    for point in partial:
                        evaluation = [(symbols(varnames[i]), point[i]) for i in range(len(point))]
                        variables = [str(el) for el in base_expr.free_symbols if str(el) in varnames]
                        to_add = True
                        tries = 0
                        while(base_expr.subs(evaluation) == 0):
                            # if we have something nonzero, we set it up to 1
                            if(any(point[varnames.index(v)] == 0 for v in variables)):
                                for v in variables:
                                    if(point[varnames.index(v)] == 0):
                                        point[varnames.index(v)] = 1
                            else:
                                # if everything is non-zero, we mix them up randomly as many as
                                # ''attempts'' times
                                for v in variables:
                                    point[varnames.index(v)] = randint(1,10)
                                tries += 1
                                if(tries > attempts): 
                                    # if we repeated too many times, we quit and 
                                    # forget about this point
                                    to_add = False
                                    break
                            evaluation = ((symbols(varnames[i]), point[i]) for i in range(len(point)))
                        if(to_add): result.append(point)
                else:
                    result = partial                
            except TypeError:
                result = []
        elif isinstance(expr, sympy.core.symbol.Symbol):
            result = base_sparse
        elif isinstance(expr, sympy.core.numbers.Number):
            result = base_sparse
        else:
            raise NotImplementedError

        return [list(el) for el in set(tuple([tuple(el) for el in result]))]

    ##############################################################################################################
    ### Simulation/Numerical methods
    def derivative(self, _, *x):
        r'''
            Method to compute the right hand side of the system at a specific point and time.

            Since the systems we are considering are always autonomous, the first input (which represents the 
            time input) is discarded. We can always create an autonomous system by adding one equation for the 
            time with the equation `t' = 1`.

            INPUT:

            * ``_``: value for the time of the derivative. This argument is irrelevant in autonomous systems
            * ``x``: list of values (of length ``len(self)``) to represent the point where the derivative will be computed.

            OUTPUT:

            A list with the evaluation of the equations of ``self`` at the given point.

            EXAMPLES::

                >>> from clue import *
                >>> from sympy import QQ
                >>> from sympy.polys.rings import vring
                >>> R = vring(["x0", "x1", "x2"], QQ)
                >>> ## Example 1
                >>> system = FODESystem([x0**2 + x1 + x2, x2, x1], variables=['x0','x1','x2'])
                >>> system.derivative(_, 0,0,0)
                [MPQ(0,1), MPQ(0,1), MPQ(0,1)]
                >>> system.derivative(_, 0,1,1)
                [2, 1, 1]
                >>> system.derivative(_, 2,0,1)
                [5, 1, MPQ(0,1)]
        ''' 
        if len(x) == 1 and isinstance(x[0], Iterable):
            x = x[0]
        
        if len(x) != self.size:
            raise ValueError(f"The size of the input ({len(x)} does not coincide with the variables in the system ({self.size}")

        self.normalize() # we normalize the system (if not yet normalized)
        output = [self.eval_equation(equ, x) for equ in self.equations]
        if self.type in (SparsePolynomial, RationalFunction):
            output = [el.ct for el in output]
        return output

    def simulate(self, t0, t1, x0, tstep=0.01):
        r'''
            Method to simulate the dynamical system

            This method simulates (see :func:`scipy.integrate.solve_ivp`) a solution for the dynamical system 
            on the time interval defined with `(t_0, t_1)` for a fixed starting point `x0`. The output will 
            be given with data for every `tstep`.

            INPUT:

            * ``t0``: starting point of the time interval.
            * ``t1``: ending point of the time interval (can be smaller than ``t0``).
            * ``x0``: starting data (must have length ``len(self)``)
            * ``tstep``: time steps where the output data will be displayed (must be positive).

            OUTPUT:

            A :class:`scipy.integrate._ivp.ivp.OdeResult` with the result of the simulation of ``self`` with the given data.
        '''
        # Checking the input ``x``
        if not isinstance(x0, Iterable):
            raise ValueError(f"The size of the input ({len(x0)} does not coincide with the variables in the system ({self.size}")
        x0 = list(x0) # we cast it to a list
        
        # Checking the input tstep
        if tstep <= 0:
            raise ValueError("The time-step must be strictly positive")

        # Computing the time points for evaluation (all equally distributed)
        tpoints = [t0]
        if t1 < t0: # negative direction
            while tpoints[-1] - tstep > t1:
                tpoints.append(tpoints[-1] - tstep)
        else: # usual direction
            while tpoints[-1] + tstep < t1:
                tpoints.append(tpoints[-1] + tstep)
        tpoints.append(t1)

        simulation = solve_ivp(self.derivative, (t0,t1), x0, t_eval=tpoints) ## TODO: implement properly the simulation with extra functionalities
        # adding the names to the simulation
        simulation.names = self.variables
        return simulation

    def _deviation(self, subspace: Subspace, bound: tuple[tuple[float,float]], num_points: int) -> float:
        r'''
            Method to compute the deviation for a given subspace by sampling.

            The deviation of a subspace for a given system is a measure on how much a subspace is **not**
            a lumping for the system. Let `L` be the matrix defining the subspace and `L^+` its 
            pseudoinverse. Then, if `L` is a lumping of ``self`` we have:

            .. MATH::

                Lf(L^+Lx) = Lf(x)

            This identity does not hold when `L` is not a lumping. Hence, if we evaluate the difference
            `Lf(L^+Lx) - Lf(x)` we will obtain non-zero vectors. The value 

            .. MATH::

                ||Lf(L^+Lx_0) - Lf(x_0)||_2

            is called *deviation* of `L` at the point `x_0`. We can then compute the average deviation of `L` 
            when we are given a bounded domain `\Omega`:

            .. MATH::

                \text{dev}(L; f, \Omega) = \frac{1}{|\Omega|}\int_{\Omega} ||Lf(L^+Lx) - Lf(x)||_2 dx.

            This method computes the average deviation of the subspace `L` given by ``subspace`` in a domain
            of the form `[0,C]^n` where the value of `C` is given by ``bound``. Since computing the integral exactly
            is too costly, we use a Monte-Carlo approach to do so. We sample points from the domain uniformly
            as many times as ``num_points`` and we then compute the average deviation along all these points.

            Input:
            
            * ``subspace``: a subspace defining the candidate for lumping `L`.
            * ``bound``: values for bounding the sampling points. They define the interval `[a,b)` for sampling for each entry.
            * ``num_points``: number of samples to measure the deviation on the Monte-Carlo approach.

            Output: 

            An approximate value for the average deviation of the subspace with respect to ``self`` on the domain `[0,C]^N`.
        '''
        if not isinstance(subspace, OrthogonalSubspace): 
            raise NotImplementedError("Only implemented pseudoinverse for Orthogonal subspaces")
        
        key = subspace.matrix(), bound

        if not key in self.__cache_deviations:
            L = subspace.matrix()
            pi_L = subspace.projector # This is (L^+ L)

            logger.debug("[_deviation] Computing random points...")
            diff_bound = [b[1]-b[0] for b in bound]
            rhs_point = [[random()*diff_bound[i] + bound[i][0] for i in range(self.size)] for _ in range(num_points)] # evaluation points
            logger.debug("[_deviation] Getting the L^+Lx values...")
            lhs_point = [[sum(pi_L.row(i)[j]*sympify(p[j]) for j in pi_L.row(i).nonzero) for i in range(pi_L.nrows)] for p in rhs_point]

            deviations = []
            
            logger.debug("[_deviation] Computing deviation for each point")
            for (lhs, rhs) in zip(lhs_point, rhs_point):
                elhs, erhs = self.eval_equation(self.equations, lhs), self.eval_equation(self.equations, rhs)
                if issubclass(self.type, (SparsePolynomial, RationalFunction)):
                    elhs = [el.get_constant() for el in elhs]; erhs = [el.get_constant() for el in erhs]
                diff = [sum(L.row(i)[j]*(elhs[j]-erhs[j]) for j in L.row(i).nonzero) for i in range(L.nrows)]
                deviations.append(math.sqrt(sum(el**2 for el in diff)))

            logger.debug("[_deviation] Returning the average deviation")
            self.__cache_deviations[key] = mean(deviations)
        return self.__cache_deviations[key]

    def find_acceptable_threshold(self, observable, dev_max: float, increment: float, bound: float | list[float] | list[tuple[float,float]], num_points: int, threshold: float) -> float:
        r'''
            Method to compute an optimal threshold for numerical lumping

            This method computes an optimal threshold for the current system so the numerical lumping have a deviation close
            to a given value. The deviation of the system, given some observables, is the 
        '''
        logger.debug("[find_acceptable_threshold] Checking the argument ''bound''")
        if not isinstance(bound, (list, tuple)):
            bound = self.size*[bound]
        if not len(bound) == self.size:
            raise ValueError(f"The bound for deviation must be a list of as many elements as the size of the system ({self.size})")
        bound = list(bound)
        for i in range(self.size):
            if not isinstance(bound[i], (list, tuple)):
                bound[i] = tuple([0,bound[i]] if bound[i] > 0 else [bound[i],0])
            elif not len(bound[i]) == 2:
                raise TypeError("Each bound must be a pair of numbers")
            elif bound[i][0] > bound[i][1]:
                bound[i] = tuple([bound[i][1], bound[i][0]])
            else:
                bound [i] = tuple(bound[i])
        bound = tuple([(a-threshold, b+threshold) for a,b in bound])
        
        logger.debug("[find_acceptable_threshold] Converting the observable into a valid input")
        if isinstance(observable[0], PolyElement):
            logger.debug("[find_acceptable_threshold] observables in PolyElement format. Casting to SparsePolynomial")
            observable = tuple([SparsePolynomial.from_sympy(el, self.variables).linear_part_as_vec() for el in observable])
        elif isinstance(observable[0], SparsePolynomial):
            observable = tuple([p.linear_part_as_vec() for p in observable])
        else:
            logger.debug("[find_acceptable_threshold] observables seem to be in SymPy expression format, converting")
            observable = tuple([SparseVector.from_list([self.field.convert(p.diff(sympy.Symbol(x))) for x in self.variables], self.field) for p in observable])

        logger.debug("[find_acceptable_threshold] Building matrices for lumping")
        matrices = self.construct_matrices("polynomial")

        epsilon = 0
        current_dev = 0
        logger.debug("[find_acceptable_threshold] Starting the main loop looking for optimal threshold")
        found_max = False
        sign = 1
        while abs(dev_max - current_dev) >= threshold  and increment >= threshold:
            epsilon += sign*increment
            logger.debug(f"[find_acceptable_threshold] Computing deviation for {epsilon = } (computing subspace)")
            subspace = find_smallest_common_subspace(matrices, observable, NumericalSubspace, delta=epsilon)
            logger.debug(f"[find_acceptable_threshold] Computed subspace for {epsilon = } ({subspace.dim()})")
            logger.debug(f"[find_acceptable_threshold] Computing deviation for {epsilon = } (computing deviation)")
            current_dev = self._deviation(subspace, bound, num_points)

            logger.info(f"[find_acceptable_threshold] Current deviation for {epsilon = } ({subspace.dim()}): {current_dev}")
            if current_dev < dev_max - threshold:
                logger.debug(f"[find_acceptable_threshold] Increasing epsilon")
                sign = 1
            elif current_dev > dev_max + threshold:
                logger.debug(f"[find_acceptable_threshold] Reducing epsilon")
                found_max = True
                sign = -1
            if found_max: increment /= 2
        
        logger.debug(f"[find_acceptable_threshold] Found optimal threshold --> {epsilon}")
        logger.debug("[find_acceptable_threshold] Restoring the default subspace class for lumping and its arguments")
        
        return epsilon

    ##############################################################################################################
    ##############################################################################################################

    def lumping(self, observable,
                new_vars_name="y",
                print_system=False,
                print_reduction=True,
                out_format="sympy",
                loglevel=None,
                initial_conditions=None,
                method = "polynomial",
                file=sys.stdout,
    ):
        r'''
            Main function, performs a lumping of a polynomial ODE system
            Input
                - observable - a nonempty list of linear forms in state variables
                            that must be kept non-lumped
                - new_vars_name (optional) - the name for variables in the lumped polynomials
                - print_system and print_reduction (optional) - whether to print the original system and the result, respectively on the screen
                - out_format - "sympy" or "internal", the way the output polynomials should be represented
                the options are sympy polynomials and SparsePolynomial
                - loglevel - INFO (only essential information) or DEBUG (a lot of information about the computation process)
                - initial_conditions - Initial conditions for some elements on the system to be lumped
                - method - user decision about how to compute the internal matrices for lumping. See method 
                :func:`construct_matrices` for further information.
                - file - optional file descriptor to print the results (in case ``print_system`` or ``print_reduction`` are ``True``)

            Output
                a tuple (the right-hand side of an aggregated system, new_variables)

            Examples::

                >>> from clue import *
                >>> from sympy import QQ
                >>> from sympy.polys.rings import vring
                >>> R = vring(["x0", "x1", "x2"], QQ)
                >>> ## Example 1
                >>> system = FODESystem([x0**2 + x1 + x2, x2, x1], variables=['x0','x1','x2'])
                >>> lumping = system.lumping([x0], print_reduction=False,initial_conditions={'x0': 1, 'x1': 2, 'x2': 5})
                >>> lumping.ic
                {'y0': MPQ(1,1), 'y1': MPQ(7,1)}
                >>> lumping.old_vars
                [x0, x1 + x2]
                >>> lumping.is_consistent()
                True
                >>> ## Example 2
                >>> system = FODESystem([x1**2 + 4 * x1 * x2 + 4 * x2**2, 
                ...     x1 + 2 * x0**2, 
                ...     x2 - x0**2], variables=['x0','x1','x2'])
                >>> lumping = system.lumping([x0], print_reduction=False)
                >>> lumping.old_vars
                [x0, x1 + 2*x2]
                >>> lumping.is_consistent()
                True

            We can also lump system involving rational functions (see class 
            :class:`~clue.rational_function.RationalFunction`)::

                >>> varnames = ["x0", "x1", "x2"]
                >>> ## Example 1
                >>> rhs = [RationalFunction.from_string("(x0**2 + x1 + x2)/1", varnames),
                ...     RationalFunction.from_string("x2/1", varnames),
                ...     RationalFunction.from_string("x1/1", varnames)]
                >>> system = FODESystem(rhs, variables=varnames)
                >>> lumping = system.lumping([SparsePolynomial.from_string("x0", varnames)],
                ...       print_reduction=False,
                ...       initial_conditions={"x0" : 1, "x1" : 2, "x2" : 5})
                >>> lumping.ic
                {'y0': MPQ(1,1), 'y1': MPQ(7,1)}
                >>> lumping.old_vars
                [x0, x1 + x2]
                >>> lumping.is_consistent()
                True
                >>> ## Example 2
                >>> rhs = [RationalFunction.from_string("(x1**2 + 4 * x1 * x2 + 4 * x2**2)/1", varnames),
                ...     RationalFunction.from_string("(x1 + 2 * x0**2)/1", varnames),
                ...     RationalFunction.from_string("(x2 - x0**2)/1", varnames)]
                >>> system = FODESystem(rhs, variables=varnames)
                >>> lumping = system.lumping([SparsePolynomial.from_string("x0", varnames)],
                ...       print_reduction=False)
                >>> lumping.is_consistent()
                True

            The following example actually have rational functions involved::

                >>> varnames = ["x", "y"]
                >>> rhs = [RationalFunction.from_string("y/(x-y)", varnames),
                ...     RationalFunction.from_string("x/(x-y)", varnames)]
                >>> system = FODESystem(rhs, variables=varnames)
                >>> lumping = system.lumping([SparsePolynomial.from_string("x-y", varnames)],
                ...       print_reduction=False,
                ...       initial_conditions={"x" : 1, "y" : 2})
                >>> lumping.ic
                {'y0': MPQ(-1,1)}
                >>> lumping.old_vars
                [x - y]
                >>> lumping.is_consistent()
                True

            We add now some tests using some external files from folder ``tests``::

                >>> ## Example 1
                >>> system = FODESystem(file="models/polynomial/ProteinPhosphorylation[2].ode") 
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("S0", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model ProteinPhosphorylation[2]: consistency"
                >>> assert lumping.size == 12, "Error in model ProteinPhosphorylation(2): size"
                >>> ## Example 2
                >>> system = FODESystem(file="models/polynomial/BIOMD0000000101.ode")
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("RI", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model BIOMD0000000101: consistency"
                >>> assert lumping.size == 14, "Error in model BIOMD0000000101: size"
                >>> ## Example 3
                >>> system = FODESystem(file="models/polynomial/MODEL1504160000.ode")
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("cd8_in_spleen", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model MODEL1504160000: consistency"
                >>> assert lumping.size == 8, "Error in model MODEL1504160000: size"
                >>> ## Example 4
                >>> system = FODESystem(file="models/polynomial/MODEL9085850385.ode")
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model MODEL9085850385: consistency"
                >>> assert lumping.size == 54, "Error in model MODEL9085850385: size"
        '''
        ## Putting the logger level active
        if(loglevel != None):
            old_level = logger.getEffectiveLevel()
            if(loglevel == "INFO"):
                logger.setLevel(logging.INFO)
            elif(loglevel == "DEBUG"):
                logger.setLevel(logging.DEBUG)
            elif(loglevel == "WARNING"):
                logger.setLevel(logging.WARNING)
            elif(loglevel == "ERROR"):
                logger.setLevel(logging.ERROR)
        
        logger.debug(":lumping: Starting aggregation")

        ## Normalizing input if needed
        self.normalize()

        if isinstance(observable[0], PolyElement):
            logger.debug(":lumping: observables in PolyElement format. Casting to SparsePolynomial")
            observable = [SparsePolynomial.from_sympy(el, self.variables).linear_part_as_vec() for el in observable]
        elif isinstance(observable[0], SparsePolynomial):
            observable = [p.linear_part_as_vec() for p in observable]
        else:
            logger.debug(":lumping: observables seem to be in SymPy expression format, converting")
            observable = [[self.field.convert(p.diff(sympy.Symbol(x))) for x in self.variables] for p in observable]

        result = self._lumping(observable,
                    new_vars_name,
                    print_system, 
                    print_reduction, 
                    initial_conditions, 
                    method,
                    file
                )

        if out_format == "sympy":
            ## deciding out ring
            if isinstance(result["equations"][0], SparsePolynomial):
                out_ring = result["equations"][0].get_sympy_ring()
                F = out_ring
            elif isinstance(result["equations"][0], RationalFunction):
                out_ring = result["equations"][0].get_sympy_ring()
                F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)
            elif isinstance(result["equations"][0], (list,tuple)):
                if isinstance(result["equations"][0][0], SparsePolynomial):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = out_ring
                elif isinstance(result["equations"][0][0], RationalFunction):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)
            def transform(p):
                if isinstance(p, (list,tuple)):
                    return [transform(q) for q in p]
                elif isinstance(p, SparsePolynomial):
                    return out_ring(p.get_sympy_dict())
                elif isinstance(p, RationalFunction):
                    return F(out_ring(p.numer.get_sympy_dict()))/F(out_ring(p.denom.get_sympy_dict()))
                else:
                    return p # already in sympy
            result["equations"] = [transform(p) for p in result["equations"]]
        elif out_format == "internal":
            pass
        else:
            if(loglevel != None): logger.setLevel(old_level)
            raise ValueError(f"Unknown output format {out_format}")

        ## Fixing the level of the logger
        if(loglevel != None): logger.setLevel(old_level)
        return self._lumped_system_type(old_system = self, dic=result)

    def _lumping(self, observable, 
                new_vars_name='y', 
                print_system=True, 
                print_reduction=False, 
                ic=None, 
                method = "auto_diff",
                file=sys.stdout,
    ):
        """
        Performs a lumping of a polynomial ODE system represented by SparsePolynomial
        Input
            - observable - a nonempty list of linear forms in state variables
                        that must be kept non-lumped, linear forms represented as lists of coefficients
            - new_vars_name (optional) - the name for variables in the lumped polynomials
            - print_system and print_reduction (optional) - whether to print the original system and the result, respectively on the screen
            - ic - Initial conditions for some elements on the system to be lumped
            - method - user decision about how to compute the internal matrices for lumping. See method 
              :func:`construct_matrices` for further information.
            - file - optional file descriptor to print the results (in case ``print_system`` or ``print_reduction`` are ``True``)
        Output
            a dictionary with all the information so the method :func:`lumping`can build the Lumped 
            system (see class :class`LDESystem`)
        """
        logger.debug(":ilumping: Starting aggregation")

        vars_old = self.variables
        
        # Building the matrices for lumping
        start = time.time()
        logger.debug(":ilumping: Computing matrices for perform lumping...")
        matrices = self.construct_matrices(method)
        logger.debug(f"ilumping: -> Computed {len(matrices)} in {time.time()-start}s")

        # Find a lumping
        field = self.field
        vectors_to_include = []
        for linear_form in observable:
            vec = linear_form if isinstance(linear_form, SparseVector) else SparseVector.from_list(linear_form, field)
            vectors_to_include.append(vec)
        vectors_to_include = tuple(vectors_to_include)
        logger.debug(":ilumping: Computing the lumping subspace...")
        start = time.time()
        lumping_subspace = find_smallest_common_subspace(matrices, vectors_to_include, subspace_class=self.lumping_subspace_class, **self.lumping_subspace_kwds)
        logger.debug(f":ilumping: -> Found the lumping subspace in {time.time()-start}s")

        lumped_rhs = self._lumped_system(lumping_subspace, vars_old, field, new_vars_name)

        ## Computing the new variables and their expression in term of old variables
        vars_new = [f"{new_vars_name}{i}" for i in range(lumping_subspace.dim())]
        map_old_variables = [
            SparsePolynomial(vars_old, field, {((j,1),) : v[j] for j in v.nonzero})
            for v in lumping_subspace.basis()
        ]

        # Computing the new initial conditions for the new variables when possible
        ic = self.ic if ic is None else {v : ic.get(v, self.ic.get(v,None)) for v in set(ic).union(self.ic)} # we merge the initial condition dictionaries
        new_ic = {
            new_var : sum(vector[j] * ic[self.variables[j]] for j in vector.nonzero)
            for new_var, vector in zip(vars_new, lumping_subspace.basis()) # we use that all elements in the basis are non-zero
            if all(self.variables[j] in ic for j in vector.nonzero)
        }

        ## Nice printing
        if print_system:
            print("Original system:", file=file)
            for i in range(len(self.equations)):
                print(f"{vars_old[i]}' = {self.equations[i]}", file=file)
            print("Outputs to fix:", file=file)
            print(", ".join(map(str, observable)), file=file)
        
        if print_reduction:
            print("New variables:", file=file)
            for i in range(lumping_subspace.dim()):
                print(f"{vars_new[i]} = {map_old_variables[i]}", file=file)
            if new_ic is not None:
                print("New initial conditions:", file=file)
                for v, val in new_ic.items():
                    print(f"{v}(0) = {float(val)}", file=file)
            print("Lumped system:", file=file)
            for i in range(lumping_subspace.dim()):
                print(f"{vars_new[i]}' = {lumped_rhs[i]}", file=file)

        return {"equations" : lumped_rhs, 
                "variables" : vars_new,
                "ic" : new_ic,
                "name": f"Lumped system [{self.size} -> {len(lumped_rhs)}] ({self.name})",
                "old_vars" : map_old_variables,
                "subspace" : lumping_subspace}
    
    def _lumped_system(self, lumping_subspace, vars_old, field, new_vars_name):
        return lumping_subspace.perform_change_of_variables(self.equations, vars_old, field, new_vars_name)

    def __repr__(self) -> str:
        return f"{self.name if self.name != None else 'Differential system'} [{self.__class__.__name__} -- {self.size} -- {self.type.__name__}]"
        
class LDESystem(FODESystem):
    r'''
        Extended class for a :class:`FODESystem` for lumped systems.

        This class is the natural extension of the class for representing a first order linear 
        system (see class :class:`FODESystem`) where we keep some information on the lumping used
        to obtain the variables of this new system.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic={}, name = None, 
                    old_vars = None, old_system = None, subspace=None,
                    dic=None, file = None, **kwds
    ):
        # Starting the base class data
        super().__init__(equations, observables, variables, ic, name, dic=dic, file=file, **kwds)

        # Adding the specific information for this extended class
        if(old_vars is None):
            if(dic is None or not "old_vars" in dic):
                raise ValueError("Needed a map from the new variables to the old variables.")
            old_vars = dic["old_vars"]
        
        if(old_system is None):
            if(dic is None or not "old_system" in dic):
                raise ValueError("Needed a map from the new variables to the old variables.")
            old_system = dic["old_system"]

        if(subspace is None):
            if (dic is None or not "subspace" in dic):
                raise ValueError("Needed a lumping subspace to define a Lumped System.")
            subspace = dic["subspace"]
        
        self._old_vars : list[SparsePolynomial] = old_vars
        self._old_system : FODESystem = old_system
        self._subspace : Subspace = subspace

    @property
    def old_vars(self):
        return self._old_vars

    @property
    def old_system(self):
        return self._old_system

    @cached_property
    def lumping_matrix(self) -> SparseRowMatrix:
        return self._subspace.matrix()

    @cached_property
    def used_old_vars(self) -> tuple[str]:
        L = self.lumping_matrix
        used_variables = reduce(lambda p,q: p.union(q), [L[i].nonzero for i in L.nonzero])
        return tuple([var for i,var in enumerate(self.old_system.variables) if i in used_variables])

    #------------------------------------------------------------------------------
    # PROPERTIES OF A LUMPING
    @lru_cache(maxsize=2)
    def is_consistent(self, symbolic: bool = False) -> bool:
        return self.check_consistency(self.old_system, self.old_vars, symbolic)

    @lru_cache(maxsize=1)
    def is_unweighted(self) -> bool:
        r'''
            Method to check whether a lumping is unweighted or not.

            A lumping is called ``unweighted`` if all the entries of the lumping matrix are in `{0, 1}`.
        '''
        L = self.lumping_matrix
        return all(L.row(i)[j] == 1 for i in L.nonzero for j in L.row(i).nonzero)

    @lru_cache(maxsize=1)
    def is_disjoint(self) -> bool:
        r'''Checks whether a lumping has disjoint row support'''
        L = self.lumping_matrix
        supports = [L.row(i).nonzero for i in L.nonzero]
        for i in range(len(supports)):
            for j in range(i+1,len(supports)):
                if len(supports[i].intersection(supports[j])) > 0:
                    return False
        return True

    @lru_cache(maxsize=1)
    def is_positive(self) -> bool:
        r'''Checks whether a lumping has disjoint row support'''
        L = self.lumping_matrix
        return all(L.row(i)[j] > 0 for i in L.nonzero for j in L.row(i).nonzero)

    @lru_cache(maxsize=1)
    def is_reducing(self) -> bool:
        r'''
            Method that checks whether the lumping is reducing or not.

            This method checks that the lumping of a system contains fewer variables
            than dimension ahs the new system.

            It can happen when computing a lumping that only a connected component has been detected. In this
            case, the number of used variables from the old system coincides with the dimension of the lumping and 
            is not actually a complete reduction.

            This method allows to check whether this happens or the lumping is actually reducing
            some quantities together.
        '''
        return len(self.used_old_vars) != self.size

    # TYPES OF LUMPING
    @lru_cache(maxsize=1)
    def is_FL(self) -> bool:
        r'''
            Method to check whether a lumping is a Forward Lumping or not.

            A Forward Lumping ((add reference)) is a special type of lumping where the lumping matrix has:
            
            * all entries as zero or one,
            * the support of each row is disjoint.
            
            This concept is directly related with the concept of Forward Equivalence (see :func:`is_FE`). 
            The difference is here we do not need to have all original variables in the support.
        '''
        return self.is_unweighted() and self.is_disjoint()

    @lru_cache(maxsize=1)
    def is_FE(self) -> bool:
        r'''
            Method to check whether a lumping is a Forward Equivalence or not.

            A Forward Equivalence ((add reference)) is a special type of lumping where the lumping matrix has:
            
            * all entries as zero or one,
            * the support of each pair of rows is disjoint.
            * all previous variables appear in the lumping
            
            This concept is directly related with the concept of Forward Lumping (see :func:`is_FL`). 
            The difference is here we require to have all original variables in the support.
        '''
        return (
            self.is_FL() and
            self.old_system.size == len(self.used_old_vars)
        )

    @lru_cache(maxsize=1)
    def is_RWE(self) -> bool:
        r'''
            Method to check whether a lumping is a Robust Weighted Equivalence or not.

            A Robust Weighted Equivalence ((add reference)) is a special type of lumping where the lumping matrix has:
            
            * all entries are non-negative,
            * the support of each pair of rows is disjoint
        '''
        return self.is_positive() and self.is_disjoint()

    @lru_cache(maxsize=1)
    def has_RWE(self) -> bool:
        r'''
            Checks whether a lumped system has a Robust Weighted Lumping (see :func:`get_RWE`)
        '''
        try:
            self.get_RWE()
            return True
        except ValueError:
            return False

    @lru_cache(maxsize=1)
    def get_RWE(self) -> LDESystem:
        r'''
            Method to check whether a lumped system has a RWE of same dimension.

            This method checks whether the lumped system built in ``self`` can be rearrange to have a 
            "Robust Weighted Equivalence" version of itself. This would mean that there is a lumping of the same dimension preserving the same 
            invariant space (i.e., preserving the observables) such that:

            * The rows of the new lumping have disjoint support.
            * The entries of the lumping are non-negative.

            To check this, we use the criteria in ((TODO:add reference)), where we define an equivalence relation on the columns of 
            the current lumping and then, such lumping+ exists if and only if the number of equivalent classes is the number of rows 
            of the lumping.

            This method will return the new lumped system.
        '''
        L = self.lumping_matrix; nrows, ncols = L.dim
        ## First we check if this lumping was lumping+ already
        if all(L.column(j).nonzero_count in (0,1) for j in range(ncols)) and all(all(L[i][j] >= 0 for j in L.row(i).nonzero) for i in L.nonzero):
            return self
        classes = [] 
        # classes will be a list of (i, l) where `i` is the column and `l` is the scaling factor for the representative of the class
        # For `cls` in "classes", cls[0] is always (i,1) and is the representative of the class

        def are_equivalent(v1:SparseVector, v2:SparseVector) -> bool:
            # checking size are the same
            if v1.dim != v2.dim:
                raise ValueError("The two given vectors must have the same length")
            if v1.nonzero != v2.nonzero:
                raise ValueError("The two vectors do not coincide in the non-zero entries")
            first_nz = v1.first_nonzero()
            l = v2[first_nz]/v1[first_nz]
            if all(v2[i] == l*v1[i] for i in v1.nonzero):
                return l
            return False

        ## Building the equivalent classes for the columns
        for i in range(ncols):
            vi = L.column(i)
            if not vi.is_zero():
                for cls in classes:
                    v = L.column(cls[0][0])
                    l = are_equivalent(v,vi)
                    if l:
                        # the column i is in the same class as cls --> we add it with the factor `l`
                        cls.append((i,l))
                        break
                else: # we did not find a suitable class for the column `i` --> we create a new class
                    classes.append([(i,1)])

        if len(classes) != nrows: # there is not a RWE
            raise ValueError("There is no RWE available for this lumped system")

        # We compute the new lumped matrix
        nL = SparseRowMatrix((nrows,ncols),L.field)
        for i,cls in enumerate(classes):
            for (j,l) in cls:
                if l < 0:
                    raise ValueError("The new lumping has negative coefficients!!")
                nL.increment(i,j, l)

        # We return the new lumped system
        nobs = [SparsePolynomial.from_vector(nL.row(i),self._old_system.variables,L.field) for i in range(nrows)]
        return self._old_system.lumping(nobs, print_reduction=False)

#------------------------------------------------------------------------------

__all__ = ["FODESystem", "LDESystem"]