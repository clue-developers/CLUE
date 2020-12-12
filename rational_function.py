import sympy
from sparse_polynomial import SparsePolynomial

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
        self.denom = denom

    @property
    def domain(self):
        return self._domain

    @property
    def gens(self):
        return self._varnames.copy()

    def derivative(self, var):
        """
        Compute the derivative with respect to a given variable
        """
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
                num_str = s.split("/")[0]
                denom_str = s.split("/")[1]
            else:
                raise NotImplementedError

        num = SparsePolynomial.from_string(num_str, varnames, var_to_ind)
        denom = SparsePolynomial.from_string(denom_str, varnames, var_to_ind)

        return RationalFunction(num, denom)

    def simplify(self):
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
        if not isinstance(other, type(self)): return NotImplemented
        return self.num == other.num and self.denom == other.denom


if __name__ == "__main__":

    # Tests
    varnames = ['x','y','z']

    print("--- Derevative Tests ----------------------------------------------")

    rf1 = RationalFunction.from_string("(3 * x**2 * y**4 * z**7)/(7*x**4 + 3*y**2 * z**9)", varnames)
    rf2 = RationalFunction.from_string("(x**2*y**2)/(z**2)", varnames)
    rf3 = RationalFunction.from_string("(x**2)/(y*z**2)", varnames)

    rf1dx_expected = RationalFunction.from_string("(-(6*y**4*z**7*x*(7*x**4-3*y**2*z**9)))/((7*x**4+3*y**2*z**9)**2)", varnames)
    rf1dx_test = rf1.derivative('x')
    print("Expected: \t", rf1dx_expected)
    print("Actual: \t", rf1dx_test)

    rf2dx_expected = RationalFunction.from_string("(2*y**2*x)/(z**2)", varnames)
    rf2dx_test = rf2.derivative('x')
    print("Expected: \t", rf2dx_expected)
    print("Actual: \t", rf2dx_test)

    rf2dz_expected = RationalFunction.from_string("(-(2*x**2*y**2))/(z**3)", varnames)
    rf2dz_test = rf2.derivative('z')
    print("Expected: \t", rf2dz_expected)
    print("Actual: \t", rf2dz_test)

    rf = RationalFunction.from_string("(x)/(2 * y**2)", varnames)
    rf_dz = rf.derivative('z')
    print(rf_dz)

    sp1 = SparsePolynomial.from_string("2*x**23 + 4", ['x'])
    sp2 = SparsePolynomial.from_string("2*x**23 + 4", ['x'])
    assert sp1 == sp2
    rf1 = RationalFunction.from_string("x/y",['x','y'])
    rf2 = RationalFunction.from_string("x/y",['x','y'])
    assert rf1 == rf2

    print("--- LCM Test --------------------------------------------------------")
    sp1 = SparsePolynomial.from_string("x*y**2 + x**2*y", ['x','y'])
    sp2 = SparsePolynomial.from_string("x**2*y**2", ['x','y'])
    lcm = SparsePolynomial.lcm([sp1,sp2])
    print("Expected: \t", "x**2*y**3 + x**3*y**2")
    print("Actual: \t", lcm)

    print("--- Division Test ---------------------------------------------------")
    sp1 = SparsePolynomial.from_string("x**2 - 1", ['x'])
    sp2 = SparsePolynomial.from_string("x - 1", ['x'])
    quo = sp1//sp2
    print("Expected: \t", "x + 1")
    print("Actual: \t", quo)

    sp = SparsePolynomial.from_string("1",['x'])
    assert sp.is_unitary()

    sp = SparsePolynomial(['x'])
    assert sp.is_zero()


