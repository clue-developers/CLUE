import sympy
from .sparse_polynomial import SparsePolynomial

class RationalFunction:
    """
    Class for representing rational function with sparse polynomials
    Fields:
      - num - numerator SparsePolynomial
      - denom - denominator SparsePolynomial
    """
    def __init__(self, num, denom):
        assert num.domain == denom.domain
        self._domain = num.domain
        assert num.gens == denom.gens
        self._varnames = num.gens
        self.num = num
        assert not denom.is_zero()
        self.denom = denom

    @property
    def domain(self):
        return self._domain

    @property
    def gens(self):
        return self._varnames.copy()

    def valuation(self, var_name):
        r'''
            Valuation of a rational function w.r.t. a variable.

            A valuation is a map `\nu: D \rightarrow \mathbb{Z}` such that

            .. MATH::

                nu(p\cdot q) = \nu(p) + \nu(q) \qquad \nu(p + q) \geq \min(\nu(p), \nu(q))

            In particular, the functions `\nu_v(p/q) = \deg_v(p) - \deg_v(q)` is such a
            valuation. This method returns the valuation w.r.t. a variable of this 
            rational function. It is based on the method :func:`clue.sparse_polynomial.SparsePolynomial.degree`.

            Input
                ``var_name`` - name (string) of the variable to compute the degree.

            Output
                The valuation of ``self`` w.r.t. ```var_name``.

            TODO: add examples and tests
        '''
        return self.num.degree(var_name) - self.denom.degree(var_name)

    def derivative(self, var):
        r'''
            Compute the derivative with respect to a given variable.

            This method computes the derivative of the rational function represented by ``self``
            with respect to a variable provided by ``var``.

            A rational function `f(x) = p(x)/q(x)` always satisfies the quotient rule for derivations:

            .. MATH::

                f'(x) = \frac{p'(x)q(x) - q'(x)p(x)}{q(x)^2}

            This method uses such formula and the method :func:`~clue.sparse_polynomial.SparsePolynomial.derivative`.

            Input
                ``var`` - name (string) of the variable with respect we compute the derivative.

            Output
                A rational function :class:`RationalFunction` with the derivative of ``self`` w.r.t. ``var``.

            Examples::

                >>> from clue.rational_function import *
                >>> varnames = ['x','y','z']
                >>> rf1 = RationalFunction.from_string("(3 * x**2 * y**4 * z**7)/(7*x**4 + 3*y**2 * z**9)", varnames)
                >>> rf1dx_expected = RationalFunction.from_string("(-(6*y**4*z**7*x*(7*x**4-3*y**2*z**9)))/((7*x**4+3*y**2*z**9)**2)", varnames)
                >>> rf1.derivative('x') == rf1dx_expected
                True
                >>> rf2 = RationalFunction.from_string("(x**2*y**2)/(z**2)", varnames)
                >>> rf2dx_expected = RationalFunction.from_string("(2*y**2*x)/(z**2)", varnames)
                >>> rf2.derivative('x') == rf2dx_expected
                True
                >>> rf2dz_expected = RationalFunction.from_string("(-(2*x**2*y**2))/(z**3)", varnames)
                >>> rf2.derivative('z') == rf2dz_expected
                True
                >>> rf3 = RationalFunction.from_string("(x**2)/(y*z**2)", varnames)
                >>> rf3dx_expected = RationalFunction.from_string("(2*x)/(y*z**2)", varnames)
                >>> rf3.derivative('x') == rf3dx_expected
                True
                >>> rf3dy_expected = RationalFunction.from_string("-(x**2)/(y**2*z**2)", varnames)
                >>> rf3.derivative('y') == rf3dy_expected
                True
                >>> rf3dz_expected = RationalFunction.from_string("(-2*x**2)/(y*z**3)", varnames)
                >>> rf3.derivative('z') == rf3dz_expected
                True

            If the variable provided does not show up in the rational function, the zero function is returned::

                >>> rf1.derivative('a')
                RationalFunction(0, 49*x**8 + 42*x**4*y**2*z**9 + 9*y**4*z**18)
                >>> rf1.derivative('a') == 0
                True
                >>> rf1.derivative('xy') == 0
                True
                >>> rf = RationalFunction.from_string("(x)/(2 * y**2)", varnames)
                >>> rf_dz = rf.derivative('z')
                >>> print(rf_dz)
                (0)/(4*y**4)
        '''
        d_num = self.denom * self.num.derivative(var) - self.num * self.denom.derivative(var)
        d_denom = self.denom*self.denom
        return RationalFunction(d_num, d_denom)

    @staticmethod
    def from_string(s, varnames, var_to_ind = None):
        """
        Parsing a string to a rational function, sting is allowed to include floating-point numbers
        in the standard and scientific notation, they will be converted to rationals

        IMPORTANT: String must contain only one "/"!
        """
        if "/" not in s:
            num_str = s
            denom_str = "1"
        else:
            split = s.split("/")
            if len(split) == 2:
                num_str = split[0]
                denom_str = split[1]
            else:
                raise NotImplementedError

        num = SparsePolynomial.from_string(num_str, varnames, var_to_ind)
        denom = SparsePolynomial.from_string(denom_str, varnames, var_to_ind)

        return RationalFunction(num, denom)

    def simplify(self):
        r'''
            Simplify a rational function in-place.

            Method that removes the common factors between the numerator and 
            denominator of ``self``. It is based on the method :func:`~clue.sparse_polynomial.SparsePolynomial`
            and the exact division implementation.

            The simplification is performed *in-place*, meaning there is no output for this method, but
            instead, the result is stored within the same object.

            Examples::

                >>> from clue.rational_function import *
                >>> f = RationalFunction.from_string("(x**2 + 2*x + 1)/(x+1)", ['x'])
                >>> print(f)
                (x**2 + 2*x + 1)/(x + 1)
                >>> f.simplify(); print(f)
                (1 + x)/(1)
            
            This method also works with multivariate polynomials::

                >>> rf = RationalFunction.from_string("(PI3KInactive**3*boundEGFReceptor**2*kPI3K + PI3KInactive**3*RasActive**2*kPI3KRas + KmPI3K*PI3KInactive**2*RasActive**2*kP
                ...: I3KRas + KmPI3KRas*PI3KInactive**2*boundEGFReceptor**2*kPI3K)/(PI3KInactive**2 + KmPI3K*KmPI3KRas + KmPI3K*PI3KInactive + KmPI3KRas*PI3KInactive)",
                ...:                                         ['PI3KInactive',
                ...:                                         'boundEGFReceptor',
                ...:                                         'kPI3K',
                ...:                                         'RasActive',
                ...:                                         'kPI3KRas',
                ...:                                         'KmPI3K',
                ...:                                         'KmPI3KRas',
                ...:                                         ])
                >>> print(rf)
                (PI3KInactive**3*boundEGFReceptor**2*kPI3K + PI3KInactive**3*RasActive**2*kPI3KRas + PI3KInactive**2*RasActive**2*kPI3KRas*KmPI3K + PI3KInactive**2*boundEGFReceptor**2*kPI3K*KmPI3KRas)/(PI3KInactive**2 + KmPI3K*KmPI3KRas + PI3KInactive*KmPI3K + PI3KInactive*KmPI3KRas)
                >>> rf.simplify(); print(rf)
                (PI3KInactive**3*boundEGFReceptor**2*kPI3K + PI3KInactive**3*RasActive**2*kPI3KRas + PI3KInactive**2*RasActive**2*kPI3KRas*KmPI3K + PI3KInactive**2*boundEGFReceptor**2*kPI3K*KmPI3KRas)/(PI3KInactive**2 + KmPI3K*KmPI3KRas + PI3KInactive*KmPI3K + PI3KInactive*KmPI3KRas)
        '''
        gcd = SparsePolynomial.gcd([self.num, self.denom])
        self.num = self.num // gcd
        self.denom = self.denom // gcd

    def __str__(self):
        return f"({self.num})/({self.denom})"

    def __repr__(self):
        return f"RationalFunction({self.num}, {self.denom})"

    def __mul__(self, other):
        if type(other) == RationalFunction:
            rf = RationalFunction(self.num * other.num, self.denom * other.denom)
        else:
            rf = RationalFunction(self.num * other, self.denom)
        rf.simplify()
        return rf

    def __add__(self, other):
        if self.denom == other.denom:
            rf = RationalFunction(self.num + other.num, self.denom)
        else:
            rf = RationalFunction(self.num*other.denom + other.num*self.denom, self.denom*other.denom)
        rf.simplify()
        return rf

    def get_sympy_ring(self):
        return sympy.polys.rings.ring(self.gens, self.domain)[0]

    def __eq__(self, other):
        r'''
            Equality method for :class:`RationalFunction`.

            Two rational functions `p(x)/q(x)` and `r(x)/s(x)` are equal if and only if

            .. MATH::

                p(x)s(x) - q(x)r(x) = 0.

            This method checks such identity for ``self`` and ``other``. In case that ``other``
            is not a :class:`RationalFunction`, the method :func:`RationalFunction.from_string`
            is used to try and convert ``other`` into a rational function.

            Since we need to check and identity of polynomials, this method is based on 
            :func:`clue.sparse_polynomial.SparsePolynomial.__eq__`.

            Input
                ``other`` - object to compare with ``self``.

            Output
                ``True`` if ``other`` and ``self`` are mathematically equal, ``False`` otherwise.

            Examples::

                >>> from clue.rational_function import *
                >>> rf1 = RationalFunction.from_string("x/y",['x','y'])
                >>> rf2 = RationalFunction.from_string("x/y",['x','y'])
                >>> rf1 is rf2
                False
                >>> rf1 == rf2 
                True

            It is interesting to remark that this equality recognizes identical rational functions
            without performing any simplification (see methid :func:`simplify`), so ``self`` does not 
            change after executing an equality check::

                >>> rf3 = RationalFunction.from_string("x**2/(x*y)", ['x','y'])
                >>> rf3_str = str(rf3)
                >>> rf1 == rf3
                True
                >>> str(rf3) == rf3_str
                True
                >>> rf3.simplify(); str(rf3) == rf3_str
                False
        '''
        if not isinstance(other, type(self)): 
            if(not isinstance(other, RationalFunction)):
                try:
                    other = RationalFunction.from_string(str(other), self.gens)
                except:
                    return NotImplemented
        return self.num*other.denom == other.num*self.denom

