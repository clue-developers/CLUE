r'''
    Module for structures and code for Uncertain systems
'''
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

        Input:

        - ``equations``: the set of equations for the uncertain system. This must be a list of pairs of equations: the first is the lower bound and 
          second is the upper bound for the uncertain system. The length must be the number of variables.
        - ``observables``: a list of possible observables for the system (see :class:`FODESystem`)
        - ``variables``: names for the variables of the system (see :class:`FODESystem`)
        - ``ic``: (optional) dictionary with initial conditions for some variables.
        - ``name``: (optional) string with a name for this system.
        - ``matrices``: the pair of matrices `m` and `M` defining the uncertain system.
        - ``dic``: dictionary with information to define the system.
        - ``file``: a file to read the system.

        Examples::

            >>> from clue import *
            >>> from sympy import QQ
            >>> from sympy.polys.rings import vring
            >>> R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
            >>> ## Example 1
            2*x0 + 3*x1 + 2*x2, x0+2*x1+x2, 2*x0 + 4*x1 + 2*x2
            >>> usystem = UncertainFODESystem([(x0 + 2*x1 + x2, 3*x0+4*x1+3*x2), (x1, 2*x0+3*x1+2*x2), (x0 + 3*x1 + x2, 3*x0 + 5*x1 + 3*x2)], variables=['x0','x1','x2'])
            >>> usystem.lumping([x0+x2])._subspace
            [[MPQ(1,1), 0, MPQ(1,1)], [0, MPQ(1,1), 0]]
            >>> usystem.lower_equations
            (x0 + 2*x1 + x2, x1, x0 + 3*x1 + x2)
            >>> usystem.upper_equations
            (3*x0 + 4*x1 + 3*x2, 2*x0 + 3*x1 + 2*x2, 3*x0 + 5*x1 + 3*x2)

        We can also create uncertain systems providing the matrix::

            >>> usystem = UncertainFODESystem(
            ...    variables=['a','b','c','d'], 
            ...    matrices=(
            ...        [(8, 20, 18, 14), (10, 8, 5, 16), (30, 24, 15, 48), (16, 40, 36, 28)],
            ...        [(40, 44, 42, 44), (25, 27, 28, 27), (75, 81, 84, 81), (80, 88, 84, 88)]
            ...    ))
            >>> usystem.lower_equations
            (8*a + 10*b + 30*c + 16*d, 20*a + 8*b + 24*c + 40*d, 18*a + 5*b + 15*c + 36*d, 14*a + 16*b + 48*c + 28*d)
            >>> usystem.upper_equations
            (40*a + 25*b + 75*c + 80*d, 44*a + 27*b + 81*c + 88*d, 42*a + 28*b + 84*c + 84*d, 44*a + 27*b + 81*c + 88*d)
            >>> a,b,c,d = usystem.symb_variables()
            >>> usystem.lumping([a+2*d])._subspace
            [[MPQ(1,1), 0, 0, MPQ(2,1)], [0, MPQ(1,1), MPQ(3,1), 0]]
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic={}, name = None, 
                matrices = None, 
                dic=None, file=None, **kwds
    ):
        ## getting equations of the system
        equations = equations if equations != None else (dic.pop("equations", None) if dic != None else None)
        if equations == None:
            variables = variables if variables != None else (dic.pop("variables", None) if dic != None else None)
            matrices = matrices if matrices != None else (dic.pop("matrices", None) if dic != None else None)
            if variables == None:
                raise TypeError("Not enough information provided to determine the variables of the system")
            if matrices == None:
                raise TypeError("Not enough information provided to determine the equations of a Uncertain System")
            m,M = matrices
            get_coeff = lambda m,i,j : m[i,j] if isinstance(m, SparseRowMatrix) else m[i][j]
            symb_vars = [SparsePolynomial.from_string(v, variables) for v in variables]
            equations = [(sum(get_coeff(m,j,i)*symb_vars[j] for j in range(len(variables))), sum(get_coeff(M,j,i)*symb_vars[j] for j in range(len(variables))))  
                        for i in range(len(variables))]

        super().__init__(equations, observables, variables, ic, name, dic=dic, file=file, **kwds)
        self._lumped_system_type = UncertainLDESystem
        if not issubclass(self.type, SparsePolynomial):
            raise TypeError("The uncertain systems are only implemented for polynomial differential systems.")
        if not self.is_linear_system():
            raise TypeError("The uncertain systems are only implemented for linear systems.")

        ## Creating the lumping matrices as the jacobians of the lower and upper systems
        lower_equations = self.lower_equations
        upper_equations = self.upper_equations
        
        m = SparseRowMatrix(self.size, self.field)
        M = SparseRowMatrix(self.size, self.field)
        for i in range(self.size):
            for j in range(self.size):
                m.increment(i,j, lower_equations[j].derivative(self.variables[i]).ct)
                M.increment(i,j, upper_equations[j].derivative(self.variables[i]).ct)
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
    def from_FODESystem(system : FODESystem, delta = 2.5e-4, min_val = -oo, max_val = oo, only_existing = True, type="abs"):
        r'''
            Method to create an uncertain system from a :class:`FODESystem` by altering all the coefficients with a given value `\delta`.

            If ``type`` is "abs" the change is done by adding and substracting `\delta` to the coefficients. If ``type`` is "prop", then
            the coefficients will be changes proportionally where `\delta` is the percentage.

            Examples::

                >>> from clue import *
                >>> from sympy import QQ
                >>> from sympy.polys.rings import vring
                >>> R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
                >>> ## Example 1
                >>> system = FODESystem([2*x0 + 3*x1 + 2*x2, x0+2*x1+x2, 2*x0 + 4*x1 + 2*x2], variables=['x0','x1','x2'])
                >>> usystem = UncertainFODESystem.from_FODESystem(system, 1)
                >>> usystem.lower_equations
                (x0 + 2*x1 + x2, x1, x0 + 3*x1 + x2)
                >>> usystem.upper_equations
                (3*x0 + 4*x1 + 3*x2, 2*x0 + 3*x1 + 2*x2, 3*x0 + 5*x1 + 3*x2)
        '''
        from .rational_function import to_rational
        delta = to_rational(str(delta))
        min_val = to_rational(str(min_val)) if min_val != -oo else -oo
        max_val = to_rational(str(max_val)) if max_val != oo else oo
        if not system.is_linear_system():
            raise TypeError("We need a linear system to create an Uncertain system")

        def __low_coeff(c):
            if only_existing and c != 0:
                if type == "abs":
                    nval = c-delta
                elif type == "prop":
                    nval = c*(1-delta)
                return max(min_val, nval)
            return c
        def __up_coeff(c):
            if only_existing and c != 0:
                if type == "abs":
                    nval = c+delta
                elif type == "prop":
                    nval = c*(1+delta)
                return min(max_val, nval)
            return c

        if isinstance(system, UncertainFODESystem):
            m,M = system._lumping_matr
        else:
            m = [[equation.derivative(v).ct for equation in system.equations] for v in system.variables]
            M = [[c for c in row] for row in m]
        get_row = lambda m, i : [m[i,j] for j in range(m.dim[1])] if isinstance(m, SparseRowMatrix) else m[i]

        m = [[__low_coeff(c) for c in get_row(m,i)] for i in range(system.size)]
        M = [[__up_coeff(c) for c in get_row(M,i)] for i in range(system.size)]

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

    @staticmethod
    def are_equivalent(v1, v2):
        r'''
            Method to check if two vectors are equivalent.

            Two non-zero vectors are equivalent if and only if there is a scaling factor `\lambda` such that `\lambda v_1 = v_2`. 
            This method returns the value for `\lambda`.
        '''
        # checking size are the same
        if len(v1) != len(v2):
            raise ValueError("The two given vectors must have the same length")
        # finding first non-zero entry
        p = 0
        while v1[p] == 0: p+=1

        if p == len(v1):
            raise ValueError("The vector v1 must be non-zero")

        # we compute the candidate for `\lambda`
        l = v2[p]/v1[p]
        if all(v2[i] == l*v1[i] for i in range(len(v1))):
            return l
        return False

    def has_RWL(self):
        r'''
            Checks whether a lumped system has a Robust Weighted Lumping.
        '''
        try:
            self.get_RWL()
            return True
        except ValueError:
            return False

    def get_RWL(self):
        r'''
            Method to check whether a lumped system has a lumping+ of same dimension.

            This method checks whether the lumped system built in ``self`` can be rearrange to have a 
            "lumped+" version of itself. This would mean that there is a lumping of the same dimension preserving the same 
            invariant space (i.e., preserving the observables) such that:

            * The rows of the new lumping have disjoint support.
            * The entries of the lumping are non-negative.

            To check this, we use the criteria in ((TODO:add reference)), where we define an equivalence relation on the columns of 
            the current lumping and then, such lumping+ exists if and only if the number of equivalent classes is the number of rows 
            of the lumping.

            This method will return the new lumped system.
        '''
        L = self._subspace; nrows = len(L); ncols = len(L[0])
        ## First we check if this lumping was lumping+ already
        if all([[L[i][j] for i in range(nrows)].count(0) in (nrows,nrows-1) for j in range(ncols)]) and all(all(L[i][j] >= 0 for j in range(ncols)) for i in range(nrows)):
            return self
        classes = [] 
        # classes will be a list of (i, l) where `i` is the column and `l` is the scaling factor for the representative of the class
        # For `cls` in "classes", cls[0] is always (i,1) and is the representative of the class

        for i in range(ncols):
            vi = [L[j][i] for j in range(nrows)]
            if any(e != 0 for e in vi):
                for cls in classes:
                    v = [L[j][cls[0][0]] for j in range(nrows)]
                    l = UncertainLDESystem.are_equivalent(v,vi)
                    if l:
                        # the column i is in the same class as cls --> we add it with the factor `l`
                        cls.append((i,l))
                        break
                else: # we did not find a suitable class for the column `i` --> we create a new class
                    classes.append([(i,1)])

        if len(classes) != nrows: # there is not a lumping+
            raise ValueError("There is no lumping+ available for this lumped system")

        # We compute the new lumped matrix
        nL = [[0]*ncols]*nrows
        for i,cls in enumerate(classes):
            for (j,l) in cls:
                if l < 0:
                    raise ValueError("The new lumping has negative coefficients!!")
                nL[i][j] = l

        # We return the new lumped system
        symb_vars = self._old_system.symb_variables()
        nobs = [sum(L[i][j]*symb_vars[j] for j in range(ncols)) for i in range(nrows)]
        return self._old_system.lumping(nobs, print_reduction=False)

        


