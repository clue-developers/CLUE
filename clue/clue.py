r"""
    Main module of CLUE

    This module includes the main classes and algorithms for the project CLUE (Constrained LUmpings). In this file
    we provide an implementation on the differential systems and the methods to perform the corresponding 
    constrained lumpings.

    TODO: add more documentation
"""

from __future__ import annotations

import logging, math, sympy, sys, time
from collections.abc import Collection, Mapping
from functools import cached_property, reduce, lru_cache
from io import IOBase
from itertools import product
from numpy import apply_along_axis, array, ndarray, matmul, mean, sum as npsum
from numpy.linalg import norm
from numpy.random import normal, uniform
from random import random, randint
from scipy.integrate import solve_ivp
from sympy import QQ, RR, lambdify, symbols, oo
from sympy.polys.fields import FracElement
from sympy.polys.rings import PolyElement
from typing import Any, Callable, Optional

from .linalg import (
    SparseRowMatrix,
    Subspace,
    OrthogonalSubspace,
    NumericalSubspace,
    SparseVector,
    find_smallest_common_subspace,
)
from .nual import NualNumber
from .ode_parser import read_system
from .rational_function import SparsePolynomial, RationalFunction
from .simulations import apply_matrix

## Configuring logger for this module
logger = logging.getLogger(__name__)


### Generic methods to manipulate expressions
@lru_cache(maxsize=None)
def _func_for_expr(expr, varnames, domain):
    if isinstance(expr, sympy.core.add.Add):

        def __func(*args):
            return reduce(
                lambda p, q: p + q,
                [_func_for_expr(arg, varnames, domain)(*args) for arg in expr.args],
            )

    elif isinstance(expr, sympy.core.mul.Mul):

        def __func(*args):
            return reduce(
                lambda p, q: p * q,
                [_func_for_expr(arg, varnames, domain)(*args) for arg in expr.args],
            )

    elif isinstance(expr, sympy.core.power.Pow):

        def __func(*args):
            base = _func_for_expr(expr.args[0], varnames, domain)(*args)
            exp = _func_for_expr(expr.args[1], varnames, domain)(*args)
            if isinstance(exp, FracElement):
                return base ** int(exp.as_expr())
            return base ** int(exp)

    elif isinstance(expr, (sympy.core.numbers.Rational, sympy.core.numbers.Float)):

        def __func(*args):  # pylint: disable=unused-argument
            return domain.convert(expr)

    elif isinstance(expr, sympy.core.symbol.Symbol) and str(expr) in varnames:
        __func = lambdify([symbols(v) for v in varnames], expr, modules="sympy")
    elif isinstance(expr, sympy.core.symbol.Symbol):

        def __func(*args):  # pylint: disable=unused-argument
            return domain.convert(expr)

    else:
        raise TypeError("Incorrect expression found [%s]: %s" % (type(expr), expr))

    return __func


def _automated_differentiation(expr, varnames, domain, point):
    r"""
    Method to compute automatic differentiation of a sympy expression
    """
    if expr == 0:
        return NualNumber([0 for _ in range(len(varnames) + 1)])

    if isinstance(expr, (SparsePolynomial, RationalFunction)):
        return expr.automated_diff(
            **{varnames[i]: point[i] for i in range(len(varnames))}
        )
    else:
        func = _func_for_expr(expr, tuple(varnames), domain)
        to_eval = [
            NualNumber(
                [domain.convert(point[i])]
                + [
                    domain.convert(1) if j == i else domain.convert(0)
                    for j in range(len(point))
                ]
            )
            for i in range(len(point))
        ]
        return func(*to_eval)


### Structure for a differential system
class FODESystem:
    r"""
    Class to represent a system of First Order Differential Equations.

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
    """

    def __init__(
        self,
        equations=None,
        observables=None,
        variables=None,
        ic={},
        pars=None,
        name=None,
        dic=None,
        file=None,
        **kwds,
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
            equations = dic["equations"]
        if variables is None:
            if dic is None or (not "variables" in dic):
                raise ValueError("No name for variables were given.")
            variables = dic["variables"]
        observables = (
            observables
            if observables != None
            else (dic.get("observables", None) if dic != None else None)
        )
        ic = ic if ic != {} else (dic.get("ic", {}) if dic != None else {})
        name = (
            name if name != None else (dic.get("name", None) if dic != None else None)
        )
        pars = (
            pars if pars != None else (dic.get("pars", None) if dic != None else None)
        )

        # Now we have the data in the first arguments
        self._equations = list(equations)
        self._observables = observables
        self._variables = variables
        self._ic = ic
        self._name = name
        self._pars = pars
        self.__matrices_subspace_class = kwds.get("matrices_subspace", Subspace)
        self.__matrices_subspace_kwds = kwds.get("matrices_subspace_kwds", {})
        self.__lumping_subspace_class = kwds.get("lumping_subspace", Subspace)
        self.__lumping_subspace_kwds = kwds.get("lumping_subspace_kwds", {})
        self.__linear_part = kwds.get("linear_part", None)

        self._lumping_matr = {}
        self.__normalize_input = False
        self._lumped_system_type = LDESystem
        self.__cache_deviations = {}
        self.__cache_thresholds = {}
        self.__cache_numerical_evaluator = {}

    @staticmethod
    def PerturbedFromSystem(
        system: FODESystem,
        noise: str | Callable[[Any], Any] = "normal",
        amplitude: float = 0.005,
        zeros=False,
    ):
        r"""
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
        """
        #######################################################################
        ## Creating the noise function if given by str
        if isinstance(noise, str):
            if noise == "normal":
                noise = lambda v: normal(v, amplitude)
            elif noise == "uniform":
                noise = lambda v: uniform(v - amplitude / 2, v + amplitude / 2)
            else:
                raise ValueError(
                    f"The noise given by '{noise}' is not valid. Only 'normal' and 'uniform' are allowed."
                )

        #######################################################################
        ## Defining auxiliary functions for creating the new system
        ## Polynomials
        def __perturb_SparsePolynomial(poly: SparsePolynomial, zeros: bool = False):
            n = len(poly.gens)
            if poly.degree() == oo and zeros:
                return SparsePolynomial.from_const(noise(0), poly.gens, poly.domain)
            elif not zeros:
                new_data = {mon: noise(val) for mon, val in poly.dataiter()}
            else:
                new_data = {}
                for mon in product(*[range(poly.degree(v) + 1) for v in poly.gens]):
                    mon = tuple(
                        (i, mon[i]) for i in range(n) if mon[i] != 0
                    )  # creating the monomial structure
                    new_data[mon] = noise(
                        poly._data.get(mon, 0)
                    )  # adding the noise to the monomial

            return SparsePolynomial(poly.gens, poly.domain, new_data)

        ## Rational functions
        def __perturb_RationalFunction(func: RationalFunction, zeros: bool = False):
            numer = __perturb_SparsePolynomial(func.numer, zeros)
            denom = 0
            while denom == 0:
                denom = __perturb_SparsePolynomial(func.denom, zeros)

            return RationalFunction(numer, denom)

        ## Sympy expressions
        def __perturb_SympyExpr(expr, zeros: bool = False):
            ## TODO This need to be implemented
            raise NotImplementedError(
                "Perturbation of Sympy expressions not yet implemented"
            )

        #######################################################################
        ## Creating the new system
        ## Equations
        if system.type is SparsePolynomial:
            new_eqs = [
                __perturb_SparsePolynomial(poly, zeros) for poly in system.equations
            ]
        elif system.type is RationalFunction:
            new_eqs = [
                __perturb_RationalFunction(func, zeros) for func in system.equations
            ]
        else:
            new_eqs = [__perturb_SympyExpr(expr) for expr in system.equations]
        ## Observables
        new_obs = (
            [__perturb_SparsePolynomial(poly, zeros) for poly in system.observables]
            if system.observables != None
            else None
        )
        ## Initial conditions
        new_ic = (
            {key: system.field.convert(noise(val)) for (key, val) in system.ic.items()}
            if system.ic != None
            else None
        )
        ## Name
        new_name = (
            f"Perturbed system{f' [{system.name}]' if system.name != None else ''}"
        )

        return FODESystem(new_eqs, new_obs, system.variables, new_ic, new_name)

    @staticmethod
    def LinearSystem(
        matrix: SparseRowMatrix,
        observables=None,
        variables=None,
        ic={},
        name=None,
        **kwds,
    ):
        if not isinstance(matrix, SparseRowMatrix):
            raise TypeError("The matrix must be given in SparseRowMatrix format")

        if matrix.nrows != matrix.ncols:
            raise TypeError(
                "The given matrix is not a square matrix and can not define a differential system"
            )
        variables = (
            [f"x{i}" for i in range(matrix.nrows)] if variables is None else variables
        )
        if len(variables) != matrix.nrows:
            raise ValueError(
                "The number of variables must match the size of the matrix"
            )

        equations = [
            SparsePolynomial.from_vector(matrix.column(i), variables)
            for i in range(len(variables))
        ]
        system = FODESystem(
            equations, observables, variables, ic, name, linear_part=matrix, **kwds
        )
        system._lumping_matr["polynomial"] = [
            matrix
        ]  # the matrix for lumping is just the defining matrix
        return system

    # Getters of attributes
    @property
    def equations(self):
        return self._equations

    @property
    def observables(self):
        return self._observables

    @property
    def variables(self):
        return self._variables

    @property
    def ic(self):
        return self._ic

    def set_ic(self, new_ic: dict[str, float] | list[float] | tuple[float], fill: bool = True):
        r'''
            Method to set the initial conditions on the system

            Input:
            
            * ``new_ic``: new set of values for the initial conditions. We allow two formats for this input:
              a list/tuple of values in the same order as variables appear in ``self.variables``, or a dictionary,
              where the key is the name of the variable and the value is the new initial condition for it. 
            * ``fill``: in the case of the dictionary input, this argument indicates whther to fill with zeros all
              variables not appearing in the dictionary.
        '''
        if not isinstance(new_ic, (dict, list, tuple)):
            raise TypeError("The initial conditions must be a dictionary, a list or a tuple")

        if isinstance(new_ic, dict):
            if not all([key in self.variables for key in new_ic.keys()]):
                raise ValueError("The initial conditions must be a dictionary with species as keys")
            for key in self.variables:
                if key in new_ic.keys():
                    self._ic[key] = new_ic[key]
                elif fill:
                    self._ic[key] = 0

        elif isinstance(new_ic, (list, tuple)):
            if len(new_ic) > len(self.variables):
                raise ValueError(
                    "The initial conditions must be a list or tuple with at most as many elements than the number of variables"
                )

            for i,key in enumerate(self.variables):
                if i < len(new_ic):
                    self._ic[key] = new_ic[i]
                elif fill:
                    self._ic[key] = 0


    @property
    def name(self):
        return self._name

    @property
    def matrices_subspace_class(self):
        return self.__matrices_subspace_class

    @property
    def matrices_subspace_kwds(self):
        return self.__matrices_subspace_kwds

    @property
    def lumping_subspace_class(self):
        return self.__lumping_subspace_class

    @property
    def lumping_subspace_kwds(self):
        return self.__lumping_subspace_kwds

    @lumping_subspace_class.setter
    def lumping_subspace_class(self, new_val):
        new_class, kwds = new_val
        if not issubclass(new_class, Subspace):
            raise TypeError("The subspace class must inherit from Subspace")
        self.__lumping_subspace_class = new_class
        self.__lumping_subspace_kwds = kwds

    @cached_property
    def bounds(self):
        r"""
        Bounds of the degrees for the right hand side.

        This tuple contains bounds for the degree of the numerator and denominator
        of the rational functions (or polynomials) that are the equations of
        the differential system (see property :func:`equations`).
        """
        ## Normalizing data if needed
        self.normalize()

        ## Computing the bounds
        if isinstance(self.equations[0], SparsePolynomial):
            Dn = max([equ.degree() for equ in self.equations if equ != 0])
            Dd = 0
        elif isinstance(self.equations[0], RationalFunction):
            Dn = max([equ.numer.degree() for equ in self.equations if equ != 0])
            Dd = max(equ.denom.degree() for equ in self.equations)
        else:  # sympy expression case
            bounds = [
                FODESystem.bound_degree_expr(equ, self.variables)
                for equ in self.equations
            ]
            Dn = max(bound[0] for bound in bounds)
            Dd = max(bound[1] for bound in bounds)
        return (Dn, Dd)

    @cached_property
    def size(self):
        return len(self._equations)

    @cached_property
    def nspecies(self):
        r"""
        Counts the number of species of a system

        See property :func:`species` for further information.
        """
        return len(self.species)

    @cached_property
    def species(self):
        r"""
        Return the names of the species of a system.

        A specie is a variable that is not constant, i.e., its equation is not 0.
        """
        return [v for v in self.variables if (v not in self.pars)]

    @cached_property
    def npars(self):
        r"""
        Counts the number of parameters of a system

        See property :func:`pars` for further information.
        """
        return len(self.pars)

    @cached_property
    def pars(self):
        r"""
        Return the names of the parameter of a system.

        A parameter is a variable that is constant, i.e., its equation is 0.
        """
        return (
            self._pars
            if self._pars != None
            else [self.variables[i] for i in range(self.size) if self.equations[i] == 0]
        )

    @cached_property
    def field(self):
        r"""
        Property that gives the ground field of the system.

        The ground field is a sympy structure that allows the user to manipulate any rational
        expression in all the symbols appearing in the equations that are not variables (see
        property :func:`variables`).

        This is different that the property :func:`pars`, since those are the actual variables
        that are constant.
        """
        # Normalizing equations if needed
        self.normalize()

        # computing the field
        equations = self.all_equations()
        if issubclass(self.type, (SparsePolynomial, RationalFunction)):
            return next(equations).domain
        else:
            ## Deciding between reals or rationals
            domain = RR if any(eq.evalf() == eq for eq in equations if eq != 0) else QQ
            ## Computing the parameters on the expressions
            allvars = set()
            for eq in equations:
                allvars = allvars.union(eq.free_symbols)
            params = list(filter(lambda s: str(s) not in self.variables, allvars))
            if len(params) == 0:
                logger.debug(
                    f"[field] no parameters, the ground field is {domain} then"
                )
                return domain
            else:
                logger.debug(
                    f"[field] some parameters found, extending {domain} as needed"
                )
                return sympy.FractionField(domain, [str(p) for p in params])

    @cached_property
    def type(self):
        self.normalize()
        return type(self.equations[0])

    def linear_part(self) -> SparseRowMatrix:
        r"""Build a matrix with the linear part of the equations"""
        if self.__linear_part == None:
            self.normalize()
            self.__linear_part = FODESystem.evaluate_jacobian(
                self.equations,
                self.variables,
                self.field,
                [0 for _ in range(self.size)],
            )
        return self.__linear_part

    @lru_cache(maxsize=1)
    def is_linear_system(self):
        r"""Checker to see if a system is linear or not"""
        if not issubclass(self.type, SparsePolynomial):
            return False

        return all(equation.is_linear() for equation in self.all_equations())

    @lru_cache(maxsize=1)
    def is_weighted_system(self):
        r"""Checks if any coefficient is not 0 or 1"""
        self.normalize()
        if issubclass(self.type, SparsePolynomial):
            return any(
                any((not c in (0, 1)) for c in equ.coefficients)
                for equ in self.equations
            )
        return True  # if not sparse polynomials, then we considered weighted by default

    def all_equations(self):
        r"""
        Return a generator with all the equations of the system
        """
        yield from self.equations

    def symb_variables(self):
        r"""
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
        """
        self.normalize()
        variables = self.variables
        if isinstance(self.equations[0], (SparsePolynomial, RationalFunction)):
            return tuple(
                [
                    SparsePolynomial.var_from_string(v, variables, self.field)
                    for v in variables
                ]
            )
        else:
            return tuple([symbols(v) for v in variables])

    ## more specialized getters
    def equation(self, varname):
        r"""
        Returns the equation associated with a variable name.
        """
        return self.equations[self.variables.index(varname)]

    def __decide_type(self):
        r"""
        Method to decide the type for the normalized equations
        """
        target_type = 0  # 0 = SparsePolynomial; 1 = RationalFunction; 2 = Expression
        # first loop to decide target
        equations = self.all_equations()
        equ = next(equations)
        while target_type < 2 and not (equ is None):
            if isinstance(equ, PolyElement):
                if equ != 0 and any(min(d for d in m) < 0 for m in equ.monoms()):
                    # PolyElement with negative exponents --> sympy
                    logger.log(
                        5,
                        "[normalize] found PolyElement with negative exponents --> sympy",
                    )
                    target_type = 2
                # PolyElement with no negative exponents --> polynomial: do not change target_type
            elif isinstance(equ, FracElement):
                numer, denom = equ.numer, equ.denom
                if numer == 0:  # fraction is zero, nothing is needed
                    pass
                elif denom == 1:  # maybe a polynomial is enough
                    if numer != 0 and min(
                        min(d for d in m) < 0 for m in numer.monoms()
                    ):  # FracElement with numerator with neg. exponents
                        logger.log(
                            5,
                            "[normalize] found FracElement (den=1, num w. neg. exp.) --> RationalFunction",
                        )
                        target_type = 1
                else:  # we have a proper fraction, we need a RationalFunction
                    logger.log(
                        5, "[normalize] found FracElement (den!=1) --> RationalFunction"
                    )
                    target_type = 1
            elif isinstance(equ, SparsePolynomial):
                pass  # the type do not change because of a SparsePolynomial
            elif isinstance(equ, RationalFunction):
                # we check the denominator to see if it is not 1
                if equ.denom != 1:  # we need at least a RationalFunction
                    logger.log(
                        5,
                        "[normalize] found RationalFunction (den!=1) --> RationalFunction",
                    )
                    target_type = 1
            else:  # other cases all to sympy
                logger.log(5, "[normalize] found something different --> sympy")
                target_type = 2
            equ = next(equations, None)

        return target_type

    def __transform_equation(self, equation, type):
        r"""
        Method to transform the equations of the system to the normalized setting.
        """
        if isinstance(equation, PolyElement):
            if type == 0:
                nequation = SparsePolynomial.from_sympy(equation, self.variables)
            elif type == 1:
                nequation = RationalFunction.from_string(
                    str(equation.as_expr()), self.variables
                )
            elif type == 2:
                nequation = equation.as_expr()
        elif isinstance(equation, FracElement):
            if type == 0:
                nequation = SparsePolynomial.from_sympy(equation.numer, self.variables)
            elif type == 1:
                nequation = RationalFunction.from_string(
                    str(equation.as_expr()), self.variables
                )
            elif type == 2:
                nequation = equation.as_expr()
        elif isinstance(equation, SparsePolynomial):
            if type == 0:
                nequation = equation
            elif type == 1:
                nequation = RationalFunction(
                    equation,
                    SparsePolynomial.from_const(1, self.variables, equation.domain),
                )
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
            nequation = tuple(
                [self.__transform_equation(equ, type) for equ in equation]
            )
        else:
            if type == 0:
                raise TypeError("Reached SparsePolynomial from something weird")
            elif type == 1:
                raise TypeError("Reached RationalFunction from something weird")
            elif type == 2:
                nequation = equation
        return nequation

    def normalize(self):
        r"""
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

        """
        if not self.__normalize_input:
            type = self.__decide_type()
            for i in range(self.size):
                nequ = self.__transform_equation(self.equations[i], type)
                self._equations[i] = nequ
            self.__normalize_input = True

    def eval_equation(self, equations, point):
        r"""
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
        """
        if isinstance(point, (list, tuple, ndarray)):
            if len(point) != self.size:
                raise TypeError(
                    "Not enough values to evaluate an equation (format list)"
                )

            point = {self.variables[i]: point[i] for i in range(self.size)}
        elif isinstance(point, dict):
            if any(not (var in self.variables) for var in point):
                raise ValueError(
                    "A given variable for evaluation does not exist in the system (format dict)"
                )

        self.normalize()
        symb_evaluations = [(symbols(k), v) for (k, v) in point.items()]
        sparse_evaluations = point

        was_list = True
        if not isinstance(
            equations, (list, tuple)
        ):  # we allow a list of elements to evaluate
            equations = [equations]
            was_list = False

        result = []

        for equation in equations:
            if isinstance(
                equation, int
            ):  # given an index --> considering the corresponding equation
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

        if not was_list:
            return result[0]
        return result

    def numerical_evaluator(self, equation):
        if isinstance(equation, str):
            equation = self.variables.index(equation)
        elif not isinstance(equation, int):
            equation = self.equations.index(equation)

        if equation < 0 or equation >= self.size:
            raise IndexError("The given equation is out of bounds.")

        if not equation in self.__cache_numerical_evaluator:
            exact_equation = self.equations[equation]
            if isinstance(exact_equation, (SparsePolynomial, RationalFunction)):
                func = exact_equation.numerical_evaluator
            else:  # sympy case
                func = eval(
                    f"lambda {','.join(self.variables)}: {str(exact_equation if not hasattr(exact_equation, 'evalf') else exact_equation.evalf())}"
                )
            self.__cache_numerical_evaluator[equation] = func
        return self.__cache_numerical_evaluator[equation]

    def check_consistency(
        self,
        other: FODESystem,
        map_variables: list[SparsePolynomial],
        how: str = "exact",
    ):
        r"""
        Method that check the consistency of the differential systems

        this method checks if ``self`` is obtained from the system ``other``
        after the change of variables provided by ``map_variables``.

        Each variable must be given as a linear :class:`~clue.rational_function.SparsePolynomial`.

        Input:

        * ``other``: the system for which we will compare with.
        * ``map_variables``: a list of linear functions that represent the variables of ``self`` in terms of the
          variables of ``other``.
        * ``how`` decides how to check consistency. There are three different options:
            * "symbolic": the computations are performed symbolically using SymPy. This is the slowest but the answer
              is guaranteed to be correct.
            * "exact": evaluates in one point and check if the system is consistent using exact computations (based on
              the SymPy domain in ``self.field``). When it returns ``False`` is guaranteed to be correct.
            * "numeric": same as "exact" but with numerical computations. It is the fastest but checking equality is done
              with a numerical threshold of 1e-10.
        """
        ########################################################
        # Normalizing equations if needed
        self.normalize()
        x2y = SparseRowMatrix.from_vectors(
            [poly.linear_part_as_vec() for poly in map_variables]
        )

        ########################################################
        ### g(Lx) =? Lf(x)
        ########################################################
        ########################################################
        # Computing the values of the variables of ``other`` (x)
        if how == "symbolic":
            x = other.symb_variables()
        elif how == "exact":
            x = [self.field.convert(randint(1, 100)) for _ in other.variables]
        elif how == "numeric":
            x = 100 * uniform(size=other.size)
            x2y = x2y.to_numpy(dtype=x.dtype)
        else:
            raise ValueError("The method must be in 'symbolic', 'exact' or 'numeric'")

        ########################################################
        # Computing the right hand-side of the check
        fx = (
            other.derivative(..., x)
            if how in ("symbolic", "numeric")
            else other.eval_equation(other.equations, x)
        )
        if how in ("symbolic", "exact"):
            Lx = [sum(row[i] * x[i] for i in row.nonzero) for row in x2y]
            Lfx = [sum(row[i] * fx[i] for i in row.nonzero) for row in x2y]
        else:
            Lx = matmul(x2y, x)
            Lfx = matmul(x2y, fx)

        ########################################################
        # Computing the left hand-side of the check
        gLx = (
            self.derivative(..., Lx)
            if how in ("symbolic", "numeric")
            else self.eval_equation(self.equations, Lx)
        )

        ########################################################
        # Comparing the data
        if how in ("symbolic", "exact"):
            result = all(lhs == rhs for lhs, rhs in zip(gLx, Lfx))
        else:
            result = all(abs(gLx - Lfx) < 1e-10)

        return result

    def evaluate_parameters(self, values):
        r"""
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
        """
        self.normalize()

        # checking we do not have non-parameters in the list
        for specie in self.species:
            if specie in values:
                raise ValueError(
                    f"Can not evaluate the variable {specie} [it is not a parameter]"
                )

        # removing unnecessary values
        values = {k: v for (k, v) in values.items() if k in self.pars}
        indices_parameters = [self.variables.index(k) for k in values]

        # computing the new equations --> we remove the equations from the evaluated parameters
        new_equations = [
            self.eval_equation(i, values)
            for i in range(self.size)
            if not (i in indices_parameters)
        ]

        # computing the new observables (if any)
        new_observables = (
            None
            if self.observables == None
            else self.eval_equation(self.observables, values)
        )

        # computing the remaining variables
        new_variables = [
            self.variables[i] for i in range(self.size) if (not i in indices_parameters)
        ]

        # removing parameters from initial conditions (if any)
        if self.ic is None:
            new_ic = {}
        else:
            new_ic = {k: v for (k, v) in self.ic.items() if (not k in values)}

        # setting the new name
        new_name = None
        if self.name != None:
            new_name = f"{self.name}_evaluated" # f"{self.name}_evaluated[{';'.join(f'{k}->{v}' for (k,v) in values.items())}]"

        # returning the resulting system
        return FODESystem(
            new_equations,  # the equations has less variables
            new_observables,  # the observables are also evaluated
            new_variables,  # the remaining variables
            ic = new_ic,  # the initial values do not have the evaluated parameters
            name = new_name,  # we keep the name of the system
        )

    def remove_parameters_ic(self):
        r"""
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
        """
        if self.ic is None:
            return self

        return self.evaluate_parameters(
            {par: self.ic[par] for par in self.pars if par in self.ic}
        )

    def scale_model(self, values):
        r"""
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
        """
        if isinstance(values, dict):
            sym_variables = self.symb_variables()
            changes = {
                self.variables[i]: sym_variables[i] / values.get(self.variables[i], 1)
                for i in range(len(self.variables))
            }
            new_equations = [
                self.eval_equation(i, changes) * values.get(self.variables[i], 1)
                for i in range(len(self.variables))
            ]
            new_observables = (
                self.eval_equation(self.observables, changes)
                if self.observables != None
                else None
            )
            new_ic = (
                {self.ic[v] * values.get(v, 1) for v in self.ic}
                if self.ic != None
                else None
            )
            new_name = (
                f"{self.name}_scaled[{list(changes.values())}]"
                if self.name != None
                else None
            )

            return FODESystem(
                new_equations,  # the equations with the scaled variables
                new_observables,  # the observables are also scaled
                self.variables,  # the variables does not change when scaling
                new_ic,  # the initial values are adapted accordingly
                new_name,  # we update the name of the system with the scaling
            )
        else:  # the case when all values are the same -->
            return self.scale_model({v: values for v in self.variables})

    ##############################################################################################################
    ### I/O METHODS
    def save(self, file: str, format: str = "clue"):
        r"""
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
        """
        self.normalize()
        if not format in ("ode", "clue"):
            raise ValueError(
                "The format only allow the ERODE format ('ode') and binary ('clue')"
            )

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
            file.write(
                "  " + var + (f" = {self.ic[var]}" if var in self.ic else "") + "\n"
            )
        file.write(" end parameters\n")
        # we write the variables
        file.write(f" begin inits\n")
        for var in self.species:
            file.write(
                "  " + var + (f" = {self.ic[var]}" if var in self.ic else "") + "\n"
            )
        file.write(" end inits\n")
        # we write the equations
        file.write(" begin ODE\n")
        for var in self.species:
            file.write("  " + f"d({var}) = " + str(self.equation(var)) + "\n")
        file.write(" end ODE\n")
        file.write("end model\n")

    @staticmethod
    def load(file: str) -> FODESystem:
        r"""
        Static method to load a :class:`FODESystem`. It is the opposite of the method :func:`save`.
        """
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
        r"""
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
        """
        # Deciding the valid method for this system
        if method == "polynomial" and (not issubclass(self.type, SparsePolynomial)):
            logger.warning(
                f"[construct_matrices] Method [{method}] selected but input is not SparsePolynomial. Trying random..."
            )
            method = "random"
        if method == "rational" and (not issubclass(self.type, RationalFunction)):
            logger.warning(
                f"[construct_matrices] Method [{method}] selected but input is not RationalFunction. Trying auto_diff..."
            )
            method = "auto_diff"
        if method == "random" and (
            not issubclass(self.type, (SparsePolynomial, RationalFunction))
        ):
            logger.warning(
                f"[construct_matrices] Method [{method}] selected but input is not RationalFunction. Trying auto_diff..."
            )
            method = "auto_diff"
        if not method in ("polynomial", "rational", "random", "auto_diff"):
            raise NotImplementedError(f"The method selected [{method}] is not valid.")

        # Building the matrices with the selected algorithm
        if not method in self._lumping_matr:
            if method == "polynomial":
                self._lumping_matr[method] = tuple(
                    self._construct_matrices_from_polys()
                )
            elif method == "rational":
                self._lumping_matr[method] = tuple(
                    self._construct_matrices_from_rational_functions()
                )
            elif method == "random":
                self._lumping_matr[method] = tuple(
                    self._construct_matrices_evaluation_random()
                )
            else:  # case of "auto_diff"
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
        logger.debug(
            "[_construct_matrices_from_polys] Starting constructing matrices (SparsePolynomial)"
        )
        polys = self.equations
        variables = self.variables
        field = self.field

        jacobians = dict()
        for p_ind, poly in enumerate(polys):
            logger.log(
                5,
                "[_construct_matrices_from_polys] Processing polynomial number %d",
                p_ind,
            )
            for monom, coef in poly.dataiter():
                for i in range(len(monom)):
                    var, exp = monom[i]
                    if exp == 1:
                        m_der = tuple(list(monom[:i]) + list(monom[(i + 1) :]))
                    else:
                        m_der = tuple(
                            list(monom[:i]) + [(var, exp - 1)] + list(monom[(i + 1) :])
                        )
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
        logger.debug(
            "[_construct_matrices_from_rational_functions] Starting constructing matrices (RationalFunction)"
        )

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
        d = list(
            filter(
                (lambda x: x != SparsePolynomial.from_const(1, [], self.field)), denoms
            )
        )
        lcm = lcm_rec(d, 0, len(d))
        lcm = lcm * lcm

        p = [lcm // (denom * denom) for denom in denoms]

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
                logger.log(
                    5,
                    "[_construct_matrices_from_rational_functions] Processing numerator polynomial number %d",
                    p_ind,
                )
                for m, coef in poly.dataiter():
                    if m not in jacobians:
                        jacobians[m] = SparseRowMatrix(len(variables), field)
                    jacobians[m].increment(row_ind, col_ind, coef)

        return list(jacobians.values())

    def _construct_matrices_evaluation_random(self, prob_err=0.01):
        logger.debug(
            "[_construct_matrices_evaluation_random] Starting constructing random matrices (RationalFunction)"
        )

        rational_functions = self.equations
        variables = self.variables
        field = self.field

        # Compute Jacobian
        J = [[rf.derivative(v) for rf in rational_functions] for v in variables]

        # we create the matrices by evaluating the jacobian
        subspace = self.matrices_subspace_class(field, **self.matrices_subspace_kwds)
        pivot_index = subspace.absorb_new_vector(
            FODESystem.build_random_evaluation_matrix(J).to_vector()
        )
        n = sum(
            sum(1 for el in row if el != 0) for row in J
        )  # number of non-zero entries
        m = 1  # number of random generated matrices
        start = time.time()
        finished = False
        while not finished:
            while pivot_index >= 0:
                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_matrix(J).to_vector()
                )
                if pivot_index >= 0:
                    m += 1
                if m % 10 == 0:
                    logger.log(
                        5,
                        f"[_construct_matrices_evaluation_random] Generated {m} random matrices...",
                    )
            ## We had a linearly dependant matrix: we check the probability of this being complete
            logger.log(
                5,
                f"[_construct_matrices_evaluation_random] Found a linearly dependant matrix after {m} attempts.",
            )
            if m >= n:  # we grew too much, reached the maximal
                logger.log(
                    5,
                    f"[_construct_matrices_evaluation_random] We found the maximal amount of linearly independent matrices",
                )
                finished = True
            else:  # we checked (probabilistic) if we have finished
                logger.log(
                    5,
                    f"[_construct_matrices_evaluation_random] We compute the maximal bound for the random coefficients to have \
                    less than {prob_err} probability to get an element in the current space.",
                )
                Dn, Dd = self.bounds
                # Value for the size of coefficients (see paper ``Exact linear reduction for rational dynamics``)
                N = int(math.ceil((Dn + 2 * m * Dd) / prob_err)) + self.size * Dd

                logger.log(
                    5,
                    f"[_construct_matrices_evaluation_random] Bound for the coefficients: {N}",
                )

                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_matrix(J, max=N).to_vector()
                )
                if pivot_index < 0:  # we are finished
                    logger.log(
                        5,
                        "[_construct_matrices_evaluation_random] The new matrix is in the vector space: we are done",
                    )
                    finished = True
                else:  # we add the matrix to the list
                    logger.log(
                        5, "The new matrix is NOT in the vector space: we continue"
                    )

        logger.debug(
            f"[_construct_matrices_evaluation_random] -> I created {m} linearly independent matrices in {time.time()-start}s"
        )
        # We return the basis obtained
        return [el.as_matrix(self.size) for el in subspace.basis()]

    def _construct_matrices_AD_random(self, prob_err=0.01):
        r"""
        Method to build evaluations of the jacobian of ``funcs`` by automatic differentiation.

        This method computes evaluations of the Jacobian matrix of ``funcs`` by
        using automatic differentiation (i.e., without actually computing the symbolic
        derivatives of the functions in ``funcs``).

        This method relies on method :func:`build_random_evaluation_jacobian` which can work
        with :class:`clue.rational_function.SparsePolynomial`, :class:`clue.rational_function.RationalFunction`
        and sympy expressions.

        The computation of the actual error bound depends on the type of input in ``funcs``.
        """
        logger.debug(
            "[_construct_matrices_AD_random] Starting constructing random matrices (AD -- RationalFunction)"
        )
        funcs = self.equations
        varnames = self.variables
        field = self.field

        subspace = self.matrices_subspace_class(field, **self.matrices_subspace_kwds)

        # computing number of non-zero entries in the jacobian
        if isinstance(funcs[0], (SparsePolynomial, RationalFunction)):
            n = sum(len(func.variables()) for func in funcs)
        else:
            n = sum(
                len([el for el in func.free_symbols if str(el) in self.variables])
                for func in funcs
            )
        logger.log(5, "[_construct_matrices_AD_random] bound for dimension: %d" % n)

        start_global = time.time()

        # We first create some sparse evaluations
        ## Computing invalid singleton evaluations
        start = time.time()
        sparse_eval_points = self._sparse_evaluation_points()
        end = time.time()
        logger.log(
            5,
            f"[_construct_matrices_AD_random] Created {len(sparse_eval_points)} sparse evaluation points in {end-start}s",
        )
        pivot_index = None
        for i, point in enumerate(sparse_eval_points):
            start = time.time()
            new_matr = FODESystem.evaluate_jacobian(funcs, varnames, field, point)
            pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
            end = time.time()
            logger.log(
                5,
                f"[_construct_matrices_AD_random] Processed {i+1}/{len(sparse_eval_points)} sparse points. Current dimension: {subspace.dim()}. Last in {end- start}",
            )

        if subspace.dim() == 0:
            logger.log(
                5,
                f"[_construct_matrices_AD_random] No sparse evaluation was done. Creating one starting evaluation...",
            )
            start = time.time()
            pivot_index = subspace.absorb_new_vector(
                FODESystem.build_random_evaluation_jacobian(
                    funcs, varnames, field
                ).to_vector()
            )
            end = time.time()
            logger.log(
                5,
                f"[_construct_matrices_AD_random] Matrix created and checked in {end - start}",
            )

        finished = subspace.dim() >= n
        logger.debug(
            f"[_construct_matrices_AD_random] Created {subspace.dim()} matrices from sparse points."
        )

        while not finished:
            while pivot_index >= 0:
                start = time.time()
                new_matr = FODESystem.build_random_evaluation_jacobian(
                    funcs, varnames, field
                )
                new_matr_vect = new_matr.to_vector()
                pivot_index = subspace.absorb_new_vector(new_matr_vect)
                if pivot_index >= 0:
                    logger.log(
                        5,
                        f"[_construct_matrices_AD_random] New matrix density: {new_matr_vect.density()}",
                    )
                if subspace.dim() % 10 == 0:
                    logger.debug(
                        f"[_construct_matrices_AD_random] Generated {subspace.dim()} random matrices..."
                    )
                logger.log(
                    5,
                    f"[_construct_matrices_AD_random] Densities for now {subspace.densities()}",
                )
                end = time.time()
                logger.log(
                    5, f"[_construct_matrices_AD_random] Matrix in {end - start}"
                )
            ## We had a linearly dependant matrix: we check the probability of this being complete
            logger.log(
                5,
                f"[_construct_matrices_AD_random] Found a linearly dependant matrix after {subspace.dim()} attempts.",
            )
            if subspace.dim() >= n:  # we grew too much, reached the maximal
                logger.log(
                    5,
                    f"[_construct_matrices_AD_random] We found the maximal amount of linearly independent matrices",
                )
                finished = True
            else:  # we checked (probabilistic) if we have finished
                logger.log(
                    5,
                    f"[_construct_matrices_AD_random] We compute the maximal bound for the random coefficients to have less than {prob_err} probability \
                to get an element in the current space.",
                )
                Dn, Dd = self.bounds
                # Value for the size of coefficients (see paper ``Exact linear reduction for rational dynamics``)
                N = (
                    int(math.ceil((Dn + 2 * subspace.dim() * Dd) / prob_err))
                    + self.size * Dd
                )

                logger.log(
                    5,
                    f"[_construct_matrices_AD_random] Bound for the (prob.) coefficients: {N}",
                )

                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_jacobian(
                        funcs, varnames, field, max=N
                    ).to_vector()
                )
                if pivot_index < 0:  # we are finished
                    logger.log(
                        5,
                        "[_construct_matrices_AD_random] The new matrix is in the vector space: we are done",
                    )
                    finished = True
                else:  # we add the matrix to the list
                    logger.log(
                        5,
                        "[_construct_matrices_AD_random] The new matrix is NOT in the vector space: we continue",
                    )

        logger.debug(
            f"[_construct_matrices_AD_random] -> I created {subspace.dim()} linearly independent matrices in {time.time()-start_global}s"
        )
        # We return the basis obtained
        return [el.as_matrix(self.size) for el in subspace.basis()]

    def _sparse_evaluation_points(self):
        base_sparse = [
            i * [0] + [1] + (self.size - i - 1) * [0] for i in range(self.size)
        ]
        if isinstance(self.equations[0], SparsePolynomial):
            result = base_sparse
        elif isinstance(self.equations[0], RationalFunction):
            denoms = [el.denom for el in self.equations]
            result = []
            for point in base_sparse:
                current = [
                    el
                    for el in denoms
                    if el.eval(
                        **{self.variables[i]: point[i] for i in range(self.size)}
                    )
                    == 0
                ]
                while len(current) > 0:
                    for v in current[0].variables():
                        if point[self.variables.index(v)] == 0:
                            point[self.variables.index(v)] = 1
                            break
                    current = [
                        el
                        for el in denoms
                        if el.eval(
                            **{self.variables[i]: point[i] for i in range(self.size)}
                        )
                        == 0
                    ]
                result.append(point)
        else:  # sympy expression case
            result = FODESystem.sparse_evaluation_points_sympy(
                self.equations, self.variables, base_sparse
            )
        return result

    ##############################################################################################################
    ### Static and private methods for building matrices
    @staticmethod
    def evaluate_matrix(matrix, values):
        r"""
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
        """
        varnames = matrix[0][0].gens
        domain = matrix[0][0].domain

        if len(values) != len(varnames):
            raise ValueError(
                "Evaluation this matrix requires exactly %d values (%d given)"
                % (len(varnames), len(values))
            )

        values = {varnames[i]: values[i] for i in range(len(values))}
        result = SparseRowMatrix(len(matrix), domain)
        for i in range(len(matrix)):
            for j in range(len(matrix[i])):
                if matrix[i][j] != 0:
                    evaluation = matrix[i][j].eval(**values).get_constant()
                    if evaluation != 0:
                        result.increment(i, j, evaluation)
        return result

    @staticmethod
    def build_random_evaluation_matrix(matrix, min=0, max=100, attempts=1000):
        r"""
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
        """
        varnames = matrix[0][0].gens

        for _ in range(attempts):
            values = tuple([randint(min, max) for _ in range(len(varnames))])
            try:
                return FODESystem.evaluate_matrix(matrix, values)
            except KeyboardInterrupt as e:
                raise e
            except ZeroDivisionError:
                pass

        raise ValueError(
            "After %d attempts, we did not find a valid random evaluation. Consider changing the bounds."
            % attempts
        )

    @staticmethod
    def evaluate_jacobian(funcs, varnames, domain, values):
        r"""
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
        """
        nrows = len(funcs)
        ncols = len(varnames)

        matrix = [
            _automated_differentiation(func, varnames, domain, values)[1:]
            for func in funcs
        ]  # this needs to be transposed
        result = SparseRowMatrix(len(matrix[0]), domain)
        for i in range(nrows):
            for j in range(ncols):
                if matrix[i][j] != 0:
                    result.increment(j, i, matrix[i][j])  # indices are transposed
        return result

    @staticmethod
    def build_random_evaluation_jacobian(
        funcs, varnames, domain, min=0, max=20, attempts=1000, index=None
    ):
        r"""
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
        """
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
        r"""
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
        """
        if isinstance(expr, sympy.core.mul.Mul):
            arg_bounds = [
                FODESystem.bound_degree_expr(arg, varnames) for arg in expr._args
            ]
            num_bound = sum([bound[0] for bound in arg_bounds])
            denom_bound = sum([bound[1] for bound in arg_bounds])
        elif isinstance(expr, sympy.core.add.Add):
            arg_bounds = [
                FODESystem.bound_degree_expr(arg, varnames) for arg in expr._args
            ]
            denom_bound = sum([bound[1] for bound in arg_bounds])
            if denom_bound == 0:
                num_bound = max([bound[0] for bound in arg_bounds])
            else:
                num_bound = max(
                    [bound[0] + denom_bound - bound[1] for bound in arg_bounds]
                )
        elif isinstance(expr, sympy.core.power.Pow):
            arg_bounds = FODESystem.bound_degree_expr(expr._args[0], varnames)
            power = expr._args[1]
            if power >= 0:
                num_bound = arg_bounds[0] * power
                denom_bound = arg_bounds[1] * power
            else:
                num_bound = arg_bounds[1] * (-power)
                denom_bound = arg_bounds[0] * (-power)
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
    def sparse_evaluation_points_sympy(funcs, varnames, base_sparse, attempts=5):
        r"""
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
        """
        if isinstance(funcs, (list, tuple)):
            if len(funcs) == 0:
                return base_sparse
            result = FODESystem.sparse_evaluation_points_sympy(
                funcs[0], varnames, base_sparse, attempts
            )
            return FODESystem.sparse_evaluation_points_sympy(
                funcs[1:], varnames, result, attempts
            )

        ## The case of simply one expression
        expr = funcs
        if isinstance(expr, sympy.core.mul.Mul):
            ## we need to evaluate all the operands
            result = FODESystem.sparse_evaluation_points_sympy(
                expr.args, varnames, base_sparse, attempts
            )
        elif isinstance(expr, sympy.core.add.Add):
            ## we need to evaluate all the operands
            result = FODESystem.sparse_evaluation_points_sympy(
                expr.args, varnames, base_sparse, attempts
            )
        elif isinstance(expr, sympy.core.power.Pow):
            ## we need to evaluate the base
            partial = FODESystem.sparse_evaluation_points_sympy(
                expr.args[0], varnames, base_sparse, attempts
            )
            try:
                power = int(expr.args[1])
                if (
                    power < 0
                ):  # we need to avoid the evaluation to zero of this denominator
                    base_expr = expr.args[0]
                    result = []
                    for point in partial:
                        evaluation = [
                            (symbols(varnames[i]), point[i]) for i in range(len(point))
                        ]
                        variables = [
                            str(el)
                            for el in base_expr.free_symbols
                            if str(el) in varnames
                        ]
                        to_add = True
                        tries = 0
                        while base_expr.subs(evaluation) == 0:
                            # if we have something nonzero, we set it up to 1
                            if any(point[varnames.index(v)] == 0 for v in variables):
                                for v in variables:
                                    if point[varnames.index(v)] == 0:
                                        point[varnames.index(v)] = 1
                            else:
                                # if everything is non-zero, we mix them up randomly as many as
                                # ''attempts'' times
                                for v in variables:
                                    point[varnames.index(v)] = randint(1, 10)
                                tries += 1
                                if tries > attempts:
                                    # if we repeated too many times, we quit and
                                    # forget about this point
                                    to_add = False
                                    break
                            evaluation = (
                                (symbols(varnames[i]), point[i])
                                for i in range(len(point))
                            )
                        if to_add:
                            result.append(point)
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
        r"""
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
            >>> system.derivative(..., 0,0,0)
            [0, 0, 0]
            >>> system.derivative(..., 0,1,1)
            [2, 1, 1]
            >>> system.derivative(..., 2,0,1)
            [5, 1, 0]
        """
        if len(x) == 1 and isinstance(x[0], Collection):
            x = x[0]

        if len(x) != self.size:
            raise ValueError(
                f"The size of the input ({len(x)} does not coincide with the variables in the system ({self.size}"
            )

        self.normalize()  # we normalize the system (if not yet normalized)
        if isinstance(x, ndarray):
            if len(x.shape) == 2:
                output = apply_along_axis(lambda v: self.derivative(..., v), 0, x)
            elif len(x.shape) == 1:
                output = array(
                    [self.numerical_evaluator(i)(*x) for i in range(self.size)],
                    dtype=x.dtype,
                )
            else:
                raise TypeError(
                    "Incompatible numpy array for evaluating derivatives: only dimension 1 or 2 accepted."
                )
        else:
            output = [self.numerical_evaluator(i)(*x) for i in range(self.size)]
        return output

    def simulate(self, t0, t1, x0=None, tstep=0.01, view=None, **kwds):
        r"""
        Method to simulate the dynamical system

        This method simulates (see :func:`scipy.integrate.solve_ivp`) a solution for the dynamical system
        on the time interval defined with `(t_0, t_1)` for a fixed starting point `x0`. The output will
        be given with data for every `tstep`.

        INPUT:

        * ``t0``: starting point of the time interval.
        * ``t1``: ending point of the time interval (can be smaller than ``t0``).
        * ``x0``: starting data (must have length ``len(self)``). If not given, we take values (0 as default) from ``self.ic``.
        * ``tstep``: time steps where the output data will be displayed (must be positive).
        * ``view``: list of linear combinations of variables to be filtered from the simulation. If none are given, we return the 
          complete simulation of the system.
        * ``kwds``: other arguments to be passed to the ivp solver. See :func:`scipy.integrate.solve_ivp` for further information

        OUTPUT:

        A :class:`scipy.integrate._ivp.ivp.OdeResult` with the result of the simulation of ``self`` with the given data.
        """
        # Checking the input ``x``
        if x0 is None:
            if self.ic is None:
                raise ValueError("Impossible to compute simulation: no initial data given")
            x0 = [self.ic.get(v, 0.0) for v in self.variables]
        
        if not isinstance(x0, (Collection, Mapping)):
            raise TypeError(f"The given initial condition is not of valid type: must be a list or a dictionary")
        elif isinstance(x0, Mapping):
            x0 = [x0.get(v, 0.0) for v in self.variables]
        elif isinstance(x0, Collection):
            if len(x0) != self.size:
                raise ValueError(
                    f"The size of the input ({len(x0)}) does not coincide with the variables in the system ({self.size})"
                )

        x0 = list(x0)  # we cast it to a list

        # Checking the input tstep
        if tstep <= 0:
            raise ValueError("The time-step must be strictly positive")
        
        # Checking the input view
        if view is not None:
            if not isinstance(view, (list,tuple)):
                raise TypeError(f"The views must be a list of elements to be observed from the simulation")
            elif len(view) == 0:
                raise ValueError(f"The given view has nothing to observe.")
            view = self.__process_observable(view)
            O = SparseRowMatrix.from_vectors(view).to_numpy()
            

        # Computing the time points for evaluation (all equally distributed)
        tpoints = [t0]
        if t1 < t0:  # negative direction
            while tpoints[-1] - tstep > t1:
                tpoints.append(tpoints[-1] - tstep)
        else:  # usual direction
            while tpoints[-1] + tstep < t1:
                tpoints.append(tpoints[-1] + tstep)
        tpoints.append(t1)

        simulation = solve_ivp(self.derivative, (t0, t1), x0, t_eval=tpoints, **kwds)
        # adding the names to the simulation
        simulation.names = self.variables

        ## Apply matrix on simulation
        if view is not None: # we need to apply the observe matrix built from the view
            simulation = apply_matrix(simulation, O)
        return simulation

    def _deviation(
        self, subspace: Subspace, bound: tuple[tuple[float, float]], num_points: int
    ) -> float:
        r"""
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

        TODO: minimize list operations, remove castings by using np arrays for L and PL
        """
        if not isinstance(subspace, OrthogonalSubspace):
            raise NotImplementedError(
                "Only implemented pseudoinverse for Orthogonal subspaces"
            )

        key = subspace.matrix(), bound

        if not key in self.__cache_deviations:
            L = subspace.matrix()
            pi_L = subspace.projector  # This is (L^+ L)

            logger.debug("[_deviation] Computing random points...")
            diff_bound = [b[1] - b[0] for b in bound]
            ## TODO: CHeck maybe a better way of doing this
            rhs_point = [
                array(
                    [random() * diff_bound[i] + bound[i][0] for i in range(self.size)]
                )
                for _ in range(num_points)
            ]  # evaluation points
            logger.debug("[_deviation] Getting the L^+Lx values...")
            ## TODO: try with all in numpy ##
            ## rhs_point = array([[random()*diff_bound[i] + bound[i][0] for i in range(self.size)]) for _ in range(num_points)]) # rows are the evaluation points
            ## pi_L = pi_L.to_numpy(dtype=float).transpose()
            ## lhs_point =  matmul(rhs_point, pi_L) # the rows are the desired points
            ##
            lhs_point = [
                array(
                    [
                        npsum(
                            [float(pi_L.row(i)[j]) * p[j] for j in pi_L.row(i).nonzero]
                        )
                        for i in range(pi_L.nrows)
                    ]
                )
                for p in rhs_point
            ]

            deviations = []

            logger.debug("[_deviation] Computing deviation for each point")
            ## TODO: try with all in numpy ##
            ## L = L.to_numpy(dtype=float)
            ## diff_evals = self.derivative(..., lhs_point) - self.derivative(..., rhs_point) ## rows are the differences on the (f(lhs) - f(rhs))
            ## diff = matmul(diff_evals, L.transpose()) # the rows are the L(f(L^T x)) - L(f(x))
            ## deviations = diff.apply_along_axis(lambda v : norm(v, ord=2), 0, diff)
            for lhs, rhs in zip(lhs_point, rhs_point):
                diff_evals = self.derivative(..., lhs) - self.derivative(..., rhs)
                diff = array(
                    [
                        npsum(
                            [
                                float(L.row(i)[j]) * (diff_evals[j])
                                for j in L.row(i).nonzero
                            ]
                        )
                        for i in range(L.nrows)
                    ]
                )
                deviations.append(norm(diff, ord=2))

            logger.debug("[_deviation] Returning the average deviation")
            self.__cache_deviations[key] = mean(deviations)
        return self.__cache_deviations[key]

    def __process_observable(self, observable: list) -> tuple[SparseVector]:
        r"""Processing observable arguments in lumping/deviation methods"""
        logger.debug(
            "[__process_observable] Converting the observable into a valid input"
        )
        processed_observable = []
        for obs in observable:
            if isinstance(obs, PolyElement):
                logger.debug(
                    "[__process_observable] observables in PolyElement format. Casting to SparsePolynomial"
                )
                processed_observable.append(
                    SparsePolynomial.from_sympy(
                        obs, self.variables
                    ).linear_part_as_vec()
                )
            elif isinstance(obs, SparsePolynomial):
                processed_observable.append(obs.linear_part_as_vec())
            elif isinstance(obs, (list, tuple, ndarray)):
                processed_observable.append(SparseVector.from_list(obs, self.field))
            elif isinstance(obs, str):
                processed_observable.append(
                    SparsePolynomial.from_string(
                        obs, self.variables, self.field
                    ).linear_part_as_vec()
                )
            elif not isinstance(obs, SparseVector):
                logger.debug(
                    "[__process_observable] observables seem to be in SymPy expression format, converting"
                )
                processed_observable.append(
                    SparseVector.from_list(
                        [
                            self.field.convert(obs.diff(sympy.Symbol(x)))
                            for x in self.variables
                        ]
                    )
                )
            else:
                processed_observable.append(obs)

        return tuple(vector.change_base(self.field) for vector in processed_observable)

    def __process_bound(self, bound, threshold):
        r"""Processing observable and bound for find_acceptable/maximal_threshold"""
        logger.debug("[__process_bound] Converting the bound into a valid input")
        if not isinstance(bound, (list, tuple)):
            bound = self.size * [bound]
        if not len(bound) == self.size:
            raise ValueError(
                f"The bound for deviation must be a list of as many elements as the size of the system ({self.size})"
            )
        bound = list(bound)
        for i in range(self.size):
            if not isinstance(bound[i], (list, tuple)):
                bound[i] = tuple([0, bound[i]] if bound[i] > 0 else [bound[i], 0])
            elif not len(bound[i]) == 2:
                raise TypeError("Each bound must be a pair of numbers")
            elif bound[i][0] > bound[i][1]:
                bound[i] = tuple([bound[i][1], bound[i][0]])
            else:
                bound[i] = tuple(bound[i])
        bound = tuple([(a - threshold, b + threshold) for a, b in bound])

        return bound

    def find_maximal_threshold(
        self,
        observable: list,
        matrix_algorithm: str = "polynomial",
    ):
        r"""
        Method that gets the maximal threshold for numerical lumping for a given observable.
        Input:
            - ``observable``: a list of observables
        Output:
            - maximal epsilon

        Numerical lumping creates a reduction of the system (similar to exact lumping) where the distance of a point to the
        linear space decides whether to add or not a vector to such linear subspace.

        This method computes a value for the allowed distance for a given observable such that the numerical lumping
        of the observable is itself.

        Examples::
            >>> from clue import *
            >>> from sympy import QQ
            >>> from sympy.polys.rings import vring
            >>> R = vring(["x0", "x1", "x2"], QQ)
            >>> system = FODESystem([x1**2 +4.05*x1*x2+4*x2**2, 2*x0-4*x2, -x0-x1], variables=['x0','x1','x2'])
            >>> eps = system.find_maximal_threshold(['x0'])
            >>> eps
            8.966744

        """
        observable = self.__process_observable(observable)

        key = observable 

        if not key in self.__cache_thresholds:
            logger.debug("[find_maximal_threshold] Building matrices for lumping")
            matrices = self.construct_matrices(matrix_algorithm)
            subspace = OrthogonalSubspace(self.field)
            for obs in observable:
                subspace.absorb_new_vector(obs)
            logger.debug(
                "[find_maximal_threshold] Computing the vectors that would be added"
            )
            rows = []
            for i in subspace.matrix().nonzero:
                vector = subspace.matrix().row(i)
                for M in matrices:
                    row = vector.apply_matrix(M)
                    # we scale the new vector depending on the ground field
                    if row.nonzero_count():
                        rows.append(row)
            logger.debug(f"[find_maximal_threshold] Need to check {len(rows)} vectors")
            logger.debug(
                f"[find_maximal_threshold] Maximal norm of the rows: {math.sqrt(max([el.inner_product(el) for el in rows], default=0))}"
            )
            logger.debug(
                f"[find_maximal_threshold] Dimension of the subspace: {subspace.dim()}"
            )
            ## vectors to check
            if len(rows) == 0:
                self.__cache_thresholds[key] = (
                    1.0,
                )  # arbitrary epsilon  due to already a lumping
            else:
                for row in rows:
                    row.reduce(-self.field.one, row.apply_matrix(subspace.projector))
                logger.debug("[find_maximal_threshold] Computing maximal norm")
                epsilon = math.sqrt(max(el.inner_product(el) for el in rows))
                self.__cache_thresholds[key] = epsilon

        return self.__cache_thresholds[key]

    # def find_acceptable_threshold(
        # self,
        # observable: list,
        # dev_max: float,
        # bound: float | list[float] | list[tuple[float, float]],
        # num_points: int,
        # threshold: float,
        # with_tries: bool = False,
        # matrix_algorithm: str = "polynomial",
    # ) -> float | tuple[float, int]:
        # r"""
        # Method to compute an optimal threshold for numerical lumping
        # This method computes an optimal threshold for the current system so the numerical lumping has a deviation close
        # to a given value.

        # Input:
            # - ``observable``: a list of observables
            # - ``dev_max``: maximum allowed deviation
        # Output:
            # - ``low_size``: maximal epsilon that leads to a lower deviation than the max
            # - ``tries`` (optional): number of iterations

        # The deviation of the system, given some observables, is the

        # Examples::
            # >>> from clue import *
            # >>> from sympy import QQ
            # >>> from sympy.polys.rings import vring
            # >>> R = vring(["x0", "x1", "x2"], QQ)
            # >>> system = FODESystem([x1**2 +4.05*x1*x2+4*x2**2, 2*x0-4*x2, -x0-x1], variables=['x0','x1','x2'])
            # >>> bound = [(0,1) for i in range(system.size)]
            # >>> eps = system.find_acceptable_threshold(['x0'],0.01, bound, 100, 1e-6)
            # >>> eps
            # 0.089109
        # """
        # observable, bound = self.__process_observable(observable), self.__process_bound(
            # bound, threshold
        # )

        # logger.debug("[find_acceptable_threshold] Building matrices for lumping")
        # matrices = self.construct_matrices(matrix_algorithm)

        # logger.debug(
            # "[find_acceptable_threshold] Computing maximal epsilon and its deviation"
        # )
        # max_epsilon, last_deviation = self.find_maximal_threshold(
            # observable, bound, num_points, threshold, matrix_algorithm=matrix_algorithm
        # )
        # low_size, high_size = (
            # max_epsilon if last_deviation < dev_max else 0
        # ), max_epsilon
        # current_dev = last_deviation if last_deviation < dev_max else 0
        # tries = 1
        # logger.debug(
            # f"[find_acceptable_threshold] Initial interval of search: [{low_size},{high_size}]"
        # )
        # if last_deviation >= dev_max:
            # # If the maximal reduction is above the maximal deviation, we do a binary search from 0 to max_epsilon
            # while (
                # abs(dev_max - current_dev) >= threshold
                # and (high_size - low_size) > threshold
            # ):
                # epsilon = (high_size + low_size) / 2
                # logger.debug(f"[find_acceptable_threshold] New value for {epsilon = }")
                # logger.log(
                    # 5,
                    # f"[find_acceptable_threshold] Computing deviation for {epsilon = } (computing subspace)",
                # )
                # subspace = find_smallest_common_subspace(
                    # matrices, observable, NumericalSubspace, delta=epsilon
                # )
                # logger.log(
                    # 5,
                    # f"[find_acceptable_threshold] Computed subspace for {epsilon = } ({subspace.dim()})",
                # )
                # logger.log(
                    # 5,
                    # f"[find_acceptable_threshold] Computing deviation for {epsilon = } (computing deviation)",
                # )
                # current_dev = self._deviation(subspace, bound, num_points)
                # logger.debug(
                    # f"[find_acceptable_threshold] Current deviation for {epsilon = } ({subspace.dim()}): {current_dev}"
                # )
                # if current_dev < dev_max - threshold:
                    # low_size, high_size = epsilon, high_size
                # elif current_dev > dev_max + threshold:
                    # low_size, high_size = low_size, epsilon
                # else:
                    # low_size, high_size = epsilon, epsilon
                # logger.debug(
                    # f"[find_acceptable_threshold] New interval search: [{low_size},{high_size}]"
                # )
                # tries += 1

        # logger.debug(
            # f"[find_acceptable_threshold] Found optimal threshold --> {low_size}"
        # )
        # if with_tries:
            # return low_size, tries
        # return low_size

    def find_next_reduction(
        self,
        observable,
        eps_min: float = 0,
        with_tries: bool = False,
        threshold: float = 1e-9,
        matrix_algorithm: str = "polynomial",
    ) -> tuple[int, int, float, float, int] | tuple[int, int, float, float]:
        r"""
        Method to compute the next possible reduction for a numerical lumping

        Given an initial epsilon ``e_min``, there exists an epsilon e such that the number of species in the reduction changes from ``left_size`` to ``right_size``.
        This method computes an interval ``I =(left_eps, right_eps)`` of size lesser or equal to ``threshold`` such that the real change happens at ``e \in I``
        Input:
            - ``observable``: a list of observables
            - ``eps_min``: lowest starting value of epsilon

        Output:
            - ``left_size``: largest size lesser or equal to allowed_size
            - ``right_size``: smallest size greater or equal to allowed_size
            - ``left_eps``: epsilon value generating left_size
            - ``right_eps``: epsilon value generating right_eps
            - ``tries``: number of iterations

        Examples::
            >>> from clue import *
            >>> from sympy import QQ
            >>> from sympy.polys.rings import vring
            >>> R = vring(["x0", "x1", "x2"], QQ)
            >>> system = FODESystem([x1**2 +4.05*x1*x2+4*x2**2, 2*x0-4*x2, -x0-x1], variables=['x0','x1','x2'])
            >>> system.find_next_reduction(['x0'])
            (3, 2, 0.089109, 0.089110)

        """
        observable = self.__process_observable(observable) 

        logger.debug("[find_next_reduction] Building matrices for lumping")
        matrices = self.construct_matrices(matrix_algorithm)

        logger.debug(
            "[find_next_reduction] Computing maximal epsilon and its deviation"
        )
        max_epsilon  = self.find_maximal_threshold(
            observable, matrix_algorithm=matrix_algorithm
        )
        left_eps = eps_min
        right_eps = max_epsilon
        if left_eps == 0:
            logger.debug("[find_next_reduction] Exact reduction detected.")
            l_subspace = find_smallest_common_subspace(
                matrices, observable, OrthogonalSubspace
            )
        else:
            l_subspace = find_smallest_common_subspace(
                matrices, observable, NumericalSubspace, delta=left_eps
            )
        left_size = l_subspace.dim()

        r_subspace = find_smallest_common_subspace(
            matrices, observable, NumericalSubspace, delta=right_eps
        )
        right_size = r_subspace.dim()

        if with_tries:
            tries = 1

        logger.debug(
            f"[find_next_reduction] Initial interval of search: [{left_eps},{right_eps}]"
        )
        while (right_eps - left_eps) > threshold:
            epsilon = (right_eps + left_eps) / 2
            logger.debug(f"[find_next_reduction] New value for {epsilon = }")
            logger.log(
                5,
                f"[find_next_reduction] Computing lumping dimension for {epsilon = } (computing subspace)",
            )
            subspace = find_smallest_common_subspace(
                matrices, observable, NumericalSubspace, delta=epsilon
            )
            n_epsilon = subspace.dim()
            logger.log(
                5,
                f"[find_acceptable_threshold] Computed subspace for {epsilon = } ({n_epsilon})",
            )
            if n_epsilon < left_size:
                left_eps, right_eps, right_size = left_eps, epsilon, n_epsilon
            elif n_epsilon >= left_size:
                left_eps, right_eps, left_size = epsilon, right_eps, n_epsilon
            logger.debug(
                f"[find_next_reduction] New interval search: [{left_eps},{right_eps}]"
            )

            if with_tries:
                tries += 1

        logger.debug(
            f"[find_next_reduction] Reduction change found in interval -->[{left_eps},{right_eps}]"
        )
        if with_tries:
            return left_size, right_size, left_eps, right_eps, tries
        return left_size, right_size, left_eps, right_eps

    def find_reduction_given_size(
        self,
        observable,
        percentage_size: Optional[float] = None,
        max_size: Optional[int] = None,
        with_tries: bool = False,
        threshold: float = 1e-15,
        matrix_algorithm: str = "polynomial",
    ) -> tuple[int, int, float, float, int] | tuple[int, int, float, float]:
        r"""
        Method to compute the a reduction for a numerical lumping based on a maximum allowed size for the reduced model.
        Input:
            - ``observable``: a list of observables
            - ``percentage_size``: percentage of the original size of the model
            - ``max_size``: maximum allowed size of the reduced model

        Output:
            - ``left_size``: largest size lesser or equal to percentage_size
            - ``right_size``: smallest size greater or equal to percentage_size
            - ``left_eps``: epsilon value generating left_size
            - ``right_eps``: epsilon value generating right_eps
            - ``tries``: number of iterations

        Examples::
            >>> from clue import *
            >>> from sympy import QQ
            >>> from sympy.polys.rings import vring
            >>> R = vring(["x0", "x1", "x2"], QQ)
            >>> system = FODESystem([x1**2 +4.05*x1*x2+4*x2**2, 2*x0-4*x2, -x0-x1], variables=['x0','x1','x2'])
            >>> bound = [(0,1) for i in range(system.size)]
            >>> system.find_reduction_given_size(['x0'],percentage_size=0.5)
            (2, 1, 4.483372, 8.966744)
            >>> system.find_reduction_given_size(['x0'],percentage_size=0.7)
            (3, 2, 0.089109, 0.089110)

        """
        observable = self.__process_observable(observable)

        if max_size is not None and percentage_size is not None:
            raise ValueError(
                "The arguments 'max_size' and 'percentage_size' cannot be given at the same time."
            )
        elif max_size is not None:
            max_n = max_size 
        elif percentage_size is not None:
            max_n = percentage_size * self.size
        else:
            raise ValueError(f"Either `max_size` or `percentage_size` must be given")

        logger.debug("[find_reduction_given_size] Building matrices for lumping")
        matrices = self.construct_matrices(matrix_algorithm)

        logger.debug(
            "[find_reduction_given_size] Computing maximal epsilon and its deviation"
        )
        max_epsilon  = self.find_maximal_threshold(
            observable, matrix_algorithm=matrix_algorithm
        )

        left_eps = 0
        right_eps = max_epsilon
        if left_eps == 0:
            logger.debug("[find_reduction_given_size] Exact reduction detected.")
            l_subspace = find_smallest_common_subspace(
                matrices, observable, OrthogonalSubspace
            )
        else:
            l_subspace = find_smallest_common_subspace(
                matrices, observable, NumericalSubspace, delta=left_eps
            )
        left_size = l_subspace.dim()

        r_subspace = find_smallest_common_subspace(
            matrices, observable, NumericalSubspace, delta=right_eps
        )
        right_size = r_subspace.dim()

        if max_n > left_size:
            logger.log(
                5,
                f"[find_reduction_given_size] Desired size ({max_n}) larger than exact reduction size ({left_size}). Returning exact reduction.",
            )
            right_size = left_size
            right_eps = left_eps
        elif max_n < right_size:
            logger.log(
                5,
                f"[find_reduction_given_size] Desired size ({max_n}) smaller than minimum size ({right_size}). Setting desired size to {right_size}",
            )
            max_n = right_size

        tries = 1
        logger.debug(
            f"[find_reduction_given_size] Initial interval of search: [{left_eps},{right_eps}]"
        )
        while (right_eps - left_eps) > threshold:
            epsilon = (right_eps + left_eps) / 2
            logger.debug(f"[find_reduction_given_size] New value for {epsilon = }")
            logger.log(
                5,
                f"[find_reduction_given_size] Computing lumping dimension for {epsilon = } (computing subspace)",
            )
            subspace = find_smallest_common_subspace(
                matrices, observable, NumericalSubspace, delta=epsilon
            )
            n_epsilon = subspace.dim()
            logger.log(
                5,
                f"[find_acceptable_threshold] Computed subspace for {epsilon = } ({n_epsilon})",
            )
            if n_epsilon < max_n:
                left_eps, right_eps, right_size = left_eps, epsilon, n_epsilon
            elif n_epsilon >= max_n:
                left_eps, right_eps, left_size = epsilon, right_eps, n_epsilon
                break
            logger.debug(
                f"[find_reduction_given_size] New interval search: [{left_eps},{right_eps}]"
            )
            tries += 1

        logger.debug(
            f"[find_reduction_given_size] Reduction change found in interval -->[{left_eps},{right_eps}]"
        )
        if with_tries:
            return left_size, right_size, left_eps, right_eps, tries
        return left_size, right_size, left_eps, right_eps

    ##############################################################################################################
    ##############################################################################################################

    def lumping(
        self,
        observable,
        new_vars_name="y",
        print_system=False,
        print_reduction=False,
        out_format="sympy",
        loglevel=None,
        initial_conditions=None,
        method="polynomial",
        file=sys.stdout,
    ):
        r"""
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
            - include_parameters - whether to include parameters as variables in the lumping. 


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
        """
        #######################################################################################
        ### PREPROCESSING
        #######################################################################################
        ## Putting the logger level active
        if loglevel != None:
            old_level = logger.getEffectiveLevel()
            if loglevel == "INFO":
                logger.setLevel(logging.INFO)
            elif loglevel == "DEBUG":
                logger.setLevel(logging.DEBUG)
            elif loglevel == "WARNING":
                logger.setLevel(logging.WARNING)
            elif loglevel == "ERROR":
                logger.setLevel(logging.ERROR)

        logger.debug("[lumping] Starting aggregation")

        ## Normalizing input if needed
        self.normalize()

        observable = self.__process_observable(observable)

        #######################################################################################
        ### MAIN COMPUTATION
        #######################################################################################
        result = self._lumping(
            observable,
            new_vars_name,
            print_system,
            print_reduction,
            initial_conditions,
            method,
            file,
        )
        #######################################################################################
        ### POSTPROCESSING
        #######################################################################################
        if out_format == "sympy":
            ## deciding out ring
            out_ring = None
            if isinstance(result["equations"][0], SparsePolynomial):
                out_ring = result["equations"][0].get_sympy_ring()
                F = out_ring
            elif isinstance(result["equations"][0], RationalFunction):
                out_ring = result["equations"][0].get_sympy_ring()
                F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)
            elif isinstance(result["equations"][0], (list, tuple)):
                if isinstance(result["equations"][0][0], SparsePolynomial):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = out_ring
                elif isinstance(result["equations"][0][0], RationalFunction):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)

            def transform(p):
                if not out_ring is None:
                    if isinstance(p, (list, tuple)):
                        return [transform(q) for q in p]
                    elif isinstance(p, SparsePolynomial):
                        return out_ring(p.get_sympy_dict())
                    elif isinstance(p, RationalFunction):
                        return F(out_ring(p.numer.get_sympy_dict())) / F(
                            out_ring(p.denom.get_sympy_dict())
                        )
                    else:
                        return p  # already in sympy
                else:
                    return p  # already in sympy

            result["equations"] = [transform(p) for p in result["equations"]]
        elif out_format == "internal":
            pass
        else:
            if loglevel != None:
                logger.setLevel(old_level)
            raise ValueError(f"Unknown output format {out_format}")

        ## Fixing the level of the logger
        if loglevel != None:
            logger.setLevel(old_level)
        return self._lumped_system_type(old_system=self, dic=result)

    def app_lumping(
        self,
        observable,
        new_vars_name="y",
        print_system=False,
        print_reduction=False,
        out_format="sympy",
        loglevel=None,
        initial_conditions=None,
        method="polynomial",
        file=sys.stdout,
        epsilon: Optional[float] = None,
        max_size: Optional[int] = None
    ):
        r'''
            Method to create a numerical lumping.

            Input:

            * See method :func:`lumping` for the first arguments.
            * ``epsilon``: desired numerical value for the epsilon-CLUE.
            * ``max_size``: maximal allowed size of the reduction. If given, ``epsilon`` will not be considered.

            If none of the arguments ``epsilon`` nor ``max_size`` are given, the method will return the first numerical reduction that 
            does not coincide with the exact reduction.
        '''

        #######################################################################################
        ### PREPROCESSING
        #######################################################################################
        ## Setting the logger level active
        if loglevel != None:
            old_level = logger.getEffectiveLevel()
            if loglevel == "INFO":
                logger.setLevel(logging.INFO)
            elif loglevel == "DEBUG":
                logger.setLevel(logging.DEBUG)
            elif loglevel == "WARNING":
                logger.setLevel(logging.WARNING)
            elif loglevel == "ERROR":
                logger.setLevel(logging.ERROR)

        logger.debug("[lumping] Starting aggregation")

        ## Normalizing input if needed
        self.normalize()

        observable = self.__process_observable(observable)

        old_lumping_class = self.lumping_subspace_class
        old_lumping_kwds = self.lumping_subspace_kwds

        # Computing numerical subspace
        if epsilon is not None and max_size is not None:
            raise ValueError("Arguments `epsilon` and `max_size` cannot be given at the same time")


        if max_size is not None:
            _,_,_,epsilon = self.find_reduction_given_size(observable, max_size=max_size, matrix_algorithm=method)
        elif epsilon is None:
            _,_,_,epsilon = self.find_next_reduction(observable, matrix_algorithm=method)

        self.lumping_subspace_class = NumericalSubspace, {"delta": epsilon}

        # Main computation

        result = self._lumping(
            observable,
            new_vars_name,
            print_system,
            print_reduction,
            initial_conditions,
            method,
            file,
        )

        #######################################################################################
        ### POSTPROCESSING
        #######################################################################################

        self.lumping_subspace_class = old_lumping_class, old_lumping_kwds

        if out_format == "sympy":
            ## deciding out ring
            out_ring = None
            if isinstance(result["equations"][0], SparsePolynomial):
                out_ring = result["equations"][0].get_sympy_ring()
                F = out_ring
            elif isinstance(result["equations"][0], RationalFunction):
                out_ring = result["equations"][0].get_sympy_ring()
                F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)
            elif isinstance(result["equations"][0], (list, tuple)):
                if isinstance(result["equations"][0][0], SparsePolynomial):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = out_ring
                elif isinstance(result["equations"][0][0], RationalFunction):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)

            def transform(p):
                if not out_ring is None:
                    if isinstance(p, (list, tuple)):
                        return [transform(q) for q in p]
                    elif isinstance(p, SparsePolynomial):
                        return out_ring(p.get_sympy_dict())
                    elif isinstance(p, RationalFunction):
                        return F(out_ring(p.numer.get_sympy_dict())) / F(
                            out_ring(p.denom.get_sympy_dict())
                        )
                    else:
                        return p  # already in sympy
                else:
                    return p  # already in sympy

            result["equations"] = [transform(p) for p in result["equations"]]
        elif out_format == "internal":
            pass
        else:
            if loglevel != None:
                logger.setLevel(old_level)
            raise ValueError(f"Unknown output format {out_format}")

        ## Fixing the level of the logger
        if loglevel != None:
            logger.setLevel(old_level)
        return self._lumped_system_type(old_system=self, dic=result)



    def _lumping(
        self,
        observable,
        new_vars_name="y",
        print_system=True,
        print_reduction=False,
        ic=None,
        method="auto_diff",
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
        logger.debug("[_lumping] Starting aggregation")

        vars_old = self.variables

        # Building the matrices for lumping
        start = time.time()
        logger.debug("[_lumping] Computing matrices for perform lumping...")
        matrices = self.construct_matrices(method)
        logger.debug(f"[_lumping] -> Computed {len(matrices)} in {time.time()-start}s")

        # Find a lumping
        field = self.field
        vectors_to_include = []
        for linear_form in observable:
            vec = (
                linear_form
                if isinstance(linear_form, SparseVector)
                else SparseVector.from_list(linear_form, field)
            )
            vectors_to_include.append(vec)
        vectors_to_include = tuple(vectors_to_include)
        logger.debug(
            f"[_lumping] Computing the lumping subspace [class={self.lumping_subspace_class}, args={self.lumping_subspace_kwds}]"
        )
        start = time.time()
        lumping_subspace = find_smallest_common_subspace(
            matrices,
            vectors_to_include,
            subspace_class=self.lumping_subspace_class,
            **self.lumping_subspace_kwds,
        )
        logger.debug(
            f"[_lumping] -> Found the lumping subspace in {time.time()-start}s"
        )

        lumped_rhs = self._lumped_system(
            lumping_subspace, vars_old, field, new_vars_name
        )

        ## Computing the new variables and their expression in term of old variables
        vars_new = [f"{new_vars_name}{i}" for i in range(lumping_subspace.dim())]
        map_old_variables = [
            SparsePolynomial(vars_old, field, {((j, 1),): v[j] for j in v.nonzero})
            for v in lumping_subspace.basis()
        ]

        # Computing the new initial conditions for the new variables when possible
        ic = (
            self.ic
            if ic is None
            else {v: ic.get(v, self.ic.get(v, None)) for v in set(ic).union(self.ic)}
        )  # we merge the initial condition dictionaries
        new_ic = {
            new_var: sum(vector[j] * ic[self.variables[j]] for j in vector.nonzero)
            for new_var, vector in zip(
                vars_new, lumping_subspace.basis()
            )  # we use that all elements in the basis are non-zero
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
        if self.size == len(lumped_rhs):
            logger.warning(f"[lumping] lumped size ({len(lumped_rhs)}) and original size ({self.size}) are the same.")

        return {
            "equations": lumped_rhs,
            "variables": vars_new,
            "ic": new_ic,
            "name": f"Lumped system [{self.size} -> {len(lumped_rhs)}] ({self.name})",
            "old_vars": map_old_variables,
            "subspace": lumping_subspace,
        }

    def _lumped_system(self, lumping_subspace, vars_old, field, new_vars_name):
        return lumping_subspace.perform_change_of_variables(
            self.equations, vars_old, field, new_vars_name
        )

    def __repr__(self) -> str:
        return f"{self.name if self.name != None else 'Differential system'} [{self.__class__.__name__} -- {self.size} -- {self.type.__name__}]"


class LDESystem(FODESystem):
    r"""
    Extended class for a :class:`FODESystem` for lumped systems.

    This class is the natural extension of the class for representing a first order linear
    system (see class :class:`FODESystem`) where we keep some information on the lumping used
    to obtain the variables of this new system.
    """

    def __init__(
        self,
        equations=None,
        observables=None,
        variables=None,
        ic={},
        name=None,
        old_vars=None,
        old_system=None,
        subspace=None,
        dic=None,
        file=None,
        **kwds,
    ):
        # Starting the base class data
        super().__init__(
            equations, observables, variables, ic, name, dic=dic, file=file, **kwds
        )

        # Adding the specific information for this extended class
        if old_vars is None:
            if dic is None or not "old_vars" in dic:
                raise ValueError(
                    "Needed a map from the new variables to the old variables."
                )
            old_vars = dic["old_vars"]

        if old_system is None:
            if dic is None or not "old_system" in dic:
                raise ValueError(
                    "Needed a map from the new variables to the old variables."
                )
            old_system = dic["old_system"]

        if subspace is None:
            if dic is None or not "subspace" in dic:
                raise ValueError("Needed a lumping subspace to define a Lumped System.")
            subspace = dic["subspace"]

        self._old_vars: list[SparsePolynomial] = old_vars
        self._old_system: FODESystem = old_system
        self._subspace: Subspace = subspace

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
        used_variables = reduce(
            lambda p, q: p.union(q), [L[i].nonzero for i in L.nonzero]
        )
        return tuple(
            [
                var
                for i, var in enumerate(self.old_system.variables)
                if i in used_variables
            ]
        )

    # ------------------------------------------------------------------------------
    # PROPERTIES OF A LUMPING
    @lru_cache(maxsize=2)
    def is_consistent(self, how: str = "exact") -> bool:
        return self.check_consistency(self.old_system, self.old_vars, how)

    @lru_cache(maxsize=1)
    def is_unweighted(self) -> bool:
        r"""
        Method to check whether a lumping is unweighted or not.

        A lumping is called ``unweighted`` if all the entries of the lumping matrix are in `{0, 1}`.
        """
        L = self.lumping_matrix
        return all(L.row(i)[j] == 1 for i in L.nonzero for j in L.row(i).nonzero)

    @lru_cache(maxsize=1)
    def is_disjoint(self) -> bool:
        r"""Checks whether a lumping has disjoint row support"""
        L = self.lumping_matrix
        supports = [L.row(i).nonzero for i in L.nonzero]
        for i in range(len(supports)):
            for j in range(i + 1, len(supports)):
                if len(supports[i].intersection(supports[j])) > 0:
                    return False
        return True

    @lru_cache(maxsize=1)
    def is_positive(self) -> bool:
        r"""Checks whether a lumping has disjoint row support"""
        L = self.lumping_matrix
        return all(L.row(i)[j] > 0 for i in L.nonzero for j in L.row(i).nonzero)

    @lru_cache(maxsize=1)
    def is_reducing(self) -> bool:
        r"""
        Method that checks whether the lumping is reducing or not.

        This method checks that the lumping of a system contains fewer variables
        than dimension ahs the new system.

        It can happen when computing a lumping that only a connected component has been detected. In this
        case, the number of used variables from the old system coincides with the dimension of the lumping and
        is not actually a complete reduction.

        This method allows to check whether this happens or the lumping is actually reducing
        some quantities together.
        """
        return len(self.used_old_vars) != self.size

    # OBSERVABLES
    def observe(self, observable: SparsePolynomial|SparseVector|str|Collection[SparsePolynomial|SparseVector|str]):
        r'''
            Method that express a value in old variables in terms of the lumped variables.

            When computing a lumping (see method :func:`FODESystem.lumping`), some of the original variables are no
            longer observable while some of the combinations are still available in the lumped system. This can be checked
            in a :class:`LDESystem` by inspecting the old variables (:func:`old_vars` and :func:`old_system`) and the 
            obtained lumping matrix (see :func:`lumping_matrix`).

            This method takes a linear combination of old variables and checks whether it can be observed (and how) in the 
            reduced system.

            Input:

            * ``observable``: a linear combination of variables in :func:`old_system`. It can be given in any of the following formats:
            
              * A :class:`SparsePolynomial` compatible with :func:`old_system`. It must be a linear polynomial.
              * A :class:`SparseVector` compatible with :func:`old_system`. It must have appropriate dimension.
              * A string representing the observable. It will be casted to a polynomial in the :func:`old_system`.
              * A list/tuple of the previous elements.
            
            Output:

            A :class:`SparsePolynomial` in the lumped variables representing the observable or an :class:`ValueError` when
            the observation was not possible.

            When a list/tuple is provided, the putput is again a tuple.
        '''
        ## We handle the list/tuple case separately
        if isinstance(observable, (list,tuple)):
            return tuple(self.observe(obs) for obs in observable)
        
        ## If we receive a string, we convert it to a SparsePolynomial in the old system
        if isinstance(observable, str):
            observable = SparsePolynomial.from_string(observable, self.old_system.variables, self.old_system.field)
        ## If we receive a SparsePolynomial we check it is linear and convert it into a SparseVector
        if isinstance(observable, SparsePolynomial):
            if not observable.is_linear():
                raise ValueError(f"A polynomial observable ({observable}) is NOT linear")
            observable = observable.linear_part_as_vec()
        ## If we receive a SparseVector, we check its dimension
        if isinstance(observable, SparseVector):
            if observable.dim != self.old_system.size:
                raise ValueError(f"A vector observable has an invalid dimension (got {len(observable)}, required {self.old_system.size})")
            
        ## At this point we have a valid vector to be observed. We check if it is in the space
        if not self._subspace.contains(observable):
            raise ValueError("The given observable is not in the lumped subspace")
        return SparsePolynomial.from_vector(self._subspace.find_in(observable), self.variables, domain=self.field)        

    # TYPES OF LUMPING
    @lru_cache(maxsize=1)
    def is_FL(self) -> bool:
        r"""
        Method to check whether a lumping is a Forward Lumping or not.

        A Forward Lumping ((add reference)) is a special type of lumping where the lumping matrix has:

        * all entries as zero or one,
        * the support of each row is disjoint.

        This concept is directly related with the concept of Forward Equivalence (see :func:`is_FE`).
        The difference is here we do not need to have all original variables in the support.
        """
        return self.is_unweighted() and self.is_disjoint()

    @lru_cache(maxsize=1)
    def is_FE(self) -> bool:
        r"""
        Method to check whether a lumping is a Forward Equivalence or not.

        A Forward Equivalence ((add reference)) is a special type of lumping where the lumping matrix has:

        * all entries as zero or one,
        * the support of each pair of rows is disjoint.
        * all previous variables appear in the lumping

        This concept is directly related with the concept of Forward Lumping (see :func:`is_FL`).
        The difference is here we require to have all original variables in the support.
        """
        return self.is_FL() and self.old_system.size == len(self.used_old_vars)

    @lru_cache(maxsize=1)
    def is_RWE(self) -> bool:
        r"""
        Method to check whether a lumping is a Robust Weighted Equivalence or not.

        A Robust Weighted Equivalence ((add reference)) is a special type of lumping where the lumping matrix has:

        * all entries are non-negative,
        * the support of each pair of rows is disjoint
        """
        return self.is_positive() and self.is_disjoint()

    @lru_cache(maxsize=1)
    def has_RWE(self) -> bool:
        r"""
        Checks whether a lumped system has a Robust Weighted Lumping (see :func:`get_RWE`)
        """
        try:
            self.get_RWE()
            return True
        except ValueError:
            return False

    @lru_cache(maxsize=1)
    def get_RWE(self) -> LDESystem:
        r"""
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
        """
        L = self.lumping_matrix
        nrows, ncols = L.dim
        ## First we check if this lumping was lumping+ already
        if all(L.column(j).nonzero_count in (0, 1) for j in range(ncols)) and all(
            all(L[i][j] >= 0 for j in L.row(i).nonzero) for i in L.nonzero
        ):
            return self
        classes = []
        # classes will be a list of (i, l) where `i` is the column and `l` is the scaling factor for the representative of the class
        # For `cls` in "classes", cls[0] is always (i,1) and is the representative of the class

        def are_equivalent(v1: SparseVector, v2: SparseVector) -> bool:
            # checking size are the same
            if v1.dim != v2.dim:
                raise ValueError("The two given vectors must have the same length")
            if v1.nonzero != v2.nonzero:
                raise ValueError(
                    "The two vectors do not coincide in the non-zero entries"
                )
            first_nz = v1.first_nonzero()
            l = v2[first_nz] / v1[first_nz]
            if all(v2[i] == l * v1[i] for i in v1.nonzero):
                return l
            return False

        ## Building the equivalent classes for the columns
        for i in range(ncols):
            vi = L.column(i)
            if not vi.is_zero():
                for cls in classes:
                    v = L.column(cls[0][0])
                    l = are_equivalent(v, vi)
                    if l:
                        # the column i is in the same class as cls --> we add it with the factor `l`
                        cls.append((i, l))
                        break
                else:  # we did not find a suitable class for the column `i` --> we create a new class
                    classes.append([(i, 1)])

        if len(classes) != nrows:  # there is not a RWE
            raise ValueError("There is no RWE available for this lumped system")

        # We compute the new lumped matrix
        nL = SparseRowMatrix((nrows, ncols), L.field)
        for i, cls in enumerate(classes):
            for j, l in cls:
                if l < 0:
                    raise ValueError("The new lumping has negative coefficients!!")
                nL.increment(i, j, l)

        # We return the new lumped system
        nobs = [
            SparsePolynomial.from_vector(nL.row(i), self._old_system.variables, L.field)
            for i in range(nrows)
        ]
        return self._old_system.lumping(nobs, print_reduction=False)


# ------------------------------------------------------------------------------

__all__ = ["FODESystem", "LDESystem"]
