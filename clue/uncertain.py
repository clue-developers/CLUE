r'''
    Module for structures and code for Uncertain systems
'''
from itertools import product
from functools import cached_property

from sympy import QQ, oo

import sys

from .clue import FODESystem, LDESystem, SparseRowMatrix
from .rational_function import SparsePolynomial

class UncertainFODESystem(FODESystem):
    r'''
        Class to represent a Linear Uncertain Differential System (LUDS).

        A LUDS is defined by two constant matrices `m` and `M` with the property `m \leq M` (where the 
        inequality is interpreted entry-wise) and consider all possible Linear Differential Systems of 
        shape 

        .. MATH::

            x'(t) = A(t)x(t),

        where `A(t)` is a matrix of measurable functions such that:

        * `m \leq A(t) \leq M` for all `t \geq 0`.
        * If `x(t)` is a solution to the system defined by `A(t)` with `x(0) \leq 0`, then `x(t) \geq 0` for all the domain where `x(t)` is defined.

        This class allows to represent these uncertain systems and provide new methods to check specific properties from these systems.

        INPUT:

        * ``equations``: the set of equations for the uncertain system. This must be a list of pairs of equations: the first is the lower bound and 
          second is the upper bound for the uncertain system. The length must be the number of variables.
        * ``observables``: a list of possible observables for the system (see :class:`FODESystem`)
        * ``variables``: names for the variables of the system (see :class:`FODESystem`)
        * ``ic``: (optional) dictionary with initial conditions for some variables.
        * ``name``: (optional) string with a name for this system.
        * ``matrices``: the pair of matrices `m` and `M` defining the uncertain system.
        * ``dic``: dictionary with information to define the system.
        * ``file``: a file to read the system.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic={}, name = None, 
                matrices = None, 
                dic=None, file=None, **kwds
    ):
        equations = equations if equations != None else (dic.pop("equations", None) if dic != None else None)
        variables = variables if variables != None else (dic.pop("variables", None) if dic != None else None)
        if equations != None: # the equations are given as actual equations
            if len(equations) != len(variables):
                raise TypeError(f"Wrong number of equations ({len(equations)}) given (expected {len(variables)})")
            # we need to compute the matrices.
            lower_equations = [equ[0] for equ in equations]
            upper_equations = [equ[1] for equ in equations]
            if any(not isinstance(el, SparsePolynomial) for el in lower_equations + upper_equations):
                raise TypeError("The equations must be given as Sparse Polynomials")
            if any(not (all(equation.degree(v) in (1,0) for v in variables) and equation.ct == 0) for equation in lower_equations + upper_equations):
                raise TypeError("The equations must be homogeneous and linear equations")
            m = SparseRowMatrix(len(variables), lower_equations[0].domain)
            M = SparseRowMatrix(len(variables), lower_equations[0].domain)
            for i in range(len(variables)):
                for j in range(len(variables)):
                    m.increment(i,j, lower_equations[i].derivative(variables[j]).ct)
                    M.increment(i,j, upper_equations[i].derivative(variables[j]).ct)
        elif matrices != None:
            m, M = matrices
            if not isinstance(m, SparseRowMatrix):
                if not isinstance(m, (list,tuple)) or not all(isinstance(row, (list,tuple)) for row in m):
                    raise TypeError("The lower matrix must be a matrix")
                if len(m) != len(variables) or any(len(row) != len(variables) for row in m):
                    raise TypeError(f"The lower matrix must have {len(variables)} rows and columns")
                om = m
                m = SparseRowMatrix(len(m), QQ)
                for i in range(len(om)):
                    for j in range(len(om)):
                        m.increment(i,j, om[i][j])
            if not isinstance(M, SparseRowMatrix):
                if not isinstance(M, (list,tuple)) or not all(isinstance(row, (list,tuple)) for row in M):
                    raise TypeError("The lower matrix must be a matrix")
                if len(M) != len(variables) or any(len(row) != len(variables) for row in M):
                    raise TypeError(f"The lower matrix must have {len(variables)} rows and columns")
                oM = M
                M = SparseRowMatrix(len(M), QQ)
                for i in range(len(oM)):
                    for j in range(len(oM)):
                        M.increment(i,j, oM[i][j])

            if any(el != len(variables) for el in (*m.dim, *M.dim)):
                raise ValueError(f"The given matrices must be square and with size exactly {len(variables)}")

            ## Building the equations
            symb_vars = [SparsePolynomial.from_string(v, variables) for v in variables]
            lower_equations = [sum(m[i,j]*symb_vars[j] for j in range(len(variables))) for i in range(len(variables))]
            upper_equations = [sum(M[i,j]*symb_vars[j] for j in range(len(variables))) for i in range(len(variables))]

            equations = [tuple([lower_equations[i], upper_equations[i]]) for i in range(len(variables))]

        # At this point, the matrices m and M are fully defined. We require m <= M:
        if any(m[i,j] > M[i,j] for (i,j) in product([range(a) for a in m.dim])):
            raise ValueError("The matrices defining an uncertain system must be ordered")

        super().__init__(equations, observables, variables, ic, name, dic=dic, file=file)
        self._lumped_system_type = UncertainFODESystem
        self._lumping_matr["polynomial"] = [m,M]

    @property
    def lower_equations(self):
        return tuple([self.equations[i][0] for i in range(self.size)])

    @property
    def lower_system(self):
        new_name = None if self.name is None else f"{self.name} [lower]"
        return FODESystem(list(self.lower_equations), self.observables, self.variables,self.ic,new_name)

    @property
    def upper_equations(self):
        return tuple([self.equations[i][1] for i in range(self.size)])

    @property
    def upper_system(self):
        new_name = None if self.name is None else f"{self.name} [upper]"
        return FODESystem(list(self.upper_equations), self.observables, self.variables,self.ic,new_name)

    @cached_property
    def bounds(self): 
        r'''
            Bounds of the degrees for the right hand side.

            Since the :class:`UncertainFODESystem` only represent linear systems, then the system has always degree 1 in the numerator and 
            it has no denominator, then the bounds are `(1,0)`.
        '''
        return (1,0)

    @cached_property
    def species(self):
        r'''
            Return the names of the species of a system.

            A specie is a variable that is not constant, i.e., its equation is not 0.
        '''
        return [self.variables[i] for i in range(self.size) if any(equ != 0 for equ in self.equations[i])]

    @cached_property
    def pars(self):
        r'''
            Return the names of the parameter of a system.

            A parameter is a variable that is constant, i.e., its equation is 0.
        '''
        return [self.variables[i] for i in range(self.size) if all(equ == 0 for equ in self.equations[i])]

    @cached_property
    def type(self):
        self.normalize()
        return type(self.equations[0][0])

    def all_equations(self):
        for equation in self.equations:
            yield equation[0]
            yield equation[1]

    def check_consistency(self, *_): ## TODO
        r'''
            This method was removed for Uncertain systems
        '''
        raise NotImplementedError(f"Method 'check_consistency' not valid for {self.__class__}")

    def evaluate_parameters(self, _):
        r'''
            This method was removed for Uncertain systems
        '''
        raise NotImplementedError(f"Method 'evaluate_parameters' not valid for {self.__class__}")
       
    def scale_model(self, _):
        r'''
            This method was removed for Uncertain systems
        '''
        raise NotImplementedError(f"Method 'scale_model' not valid for {self.__class__}")

    ##############################################################################################################
    ### Lumping methods
    ##############################################################################################################
    def lumping(self, observable, new_vars_name="y", print_system=False, print_reduction=True, loglevel=None, initial_conditions=None, method="polynomial", file=sys.stdout):
        r'''
            Method for lumping a system (see :func:`FODESystem.lumping`).

            In this case we have removes the argument "out_format" because we require objects to be SparsePolynomials always.
        '''
        return super().lumping(observable, new_vars_name, print_system, print_reduction, "internal", loglevel, initial_conditions, method, file)

    def _lumped_system(self, lumping_subspace, vars_old, field, new_vars_name):
        lower_equs = lumping_subspace.perform_change_of_variables(self.lower_equations, vars_old, field, new_vars_name)
        upper_equs = lumping_subspace.perform_change_of_variables(self.upper_equations, vars_old, field, new_vars_name)
        return [tuple([lower_equs[i], upper_equs[i]]) for i in range(len(lower_equs))]

    ##############################################################################################################
    ### Some special creation methods
    ##############################################################################################################
    @staticmethod
    def from_FODESystem(system : FODESystem, delta = 2.5e-4, min_val = -oo, max_val = oo):
        r'''
            Method to create an uncertain system from a :class:`FODESystem` by altering all the coefficients with a given value `\delta`.

            Examples::

                >>> from clue import *
                >>> from sympy import QQ
                >>> from sympy.polys.rings import vring
                >>> R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
                >>> ## Example 1
                >>> system = FODESystem([2*x0 + 3*x1 + 2*x2, x0+2*x1+x2, 2*x0 + 4*x1 + 2*x2], variables=['x0','x1','x2'])
                >>> usystem = UncertainFODESystem.from_FODESystem(system, 1)
        '''
        from .rational_function import to_rational
        delta = to_rational(str(delta))
        min_val = to_rational(str(min_val)) if min_val != -oo else -oo
        max_val = to_rational(str(max_val)) if max_val != oo else oo
        if not system.is_linear_system():
            raise TypeError("We need a linear system to create an Uncertain system")

        if isinstance(system, UncertainFODESystem):
            m,M = system._lumping_matr
        else:
            m = [[equation.derivative(v).ct for v in system.variables] for equation in system.equations]
            M = [[c for c in row] for row in m]

        m = [[max(c - delta, min_val) for c in row] for row in m]
        M = [[min(c + delta, max_val) for c in row] for row in M]

        new_name = None if system.name is None else system.name + f"[altered by +-{delta}]"
        return UncertainFODESystem(None, system.observables, system.variables, system.ic, new_name,(m,M))

class UncertainLDESystem(LDESystem,UncertainFODESystem):
    r'''
        Class for lumped Uncertain linear Differential systems.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic= None, name = None, 
                    matrices = None, old_vars = None, old_system = None,
                    dic=None, **kwds):
        super().__init__(equations, observables, variables, ic, name, old_vars = old_vars, old_system = old_system, dic=dic, matrices = matrices, **kwds)

