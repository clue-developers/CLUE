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
        # self.simplify()
        # print(self)

    @property
    def domain(self):
        return self._domain

    @property
    def gens(self):
        return self._varnames.copy()

    def simplify(self):
        """
        Simplify self through smypy.
        """
        out_ring = self.get_sympy_ring()
        sympy_num = out_ring(self.num.get_sympy_dict())
        sympy_denom = out_ring(self.denom.get_sympy_dict())
        # ! FIX AWFUL SIMPLIFICATION 
        simple_sympy_rf = sympy.simplify('('+str(sympy_num)+')/('+str(sympy_denom)+')', rational=True)
        s = str(simple_sympy_rf)
        if "/" not in s:
            num_str = s
            denom_str = "1"
        else:
            split = s.split("/")
            if len(split) == 2:
                num_str = s.split("/")[0]
                denom_str = s.split("/")[1]
            else:
                raise RuntimeError
        self.num = SparsePolynomial.from_string(num_str, self._varnames)
        self.denom = SparsePolynomial.from_string(denom_str, self._varnames)

    def derivative(self, var):
        """
        Compute the derivative with respect to a given variable
        """
        d_num = self.denom * self.num.derivative(var) - self.num * self.denom.derivative(var)
        d_denom = self.denom*self.denom
        return RationalFunction(d_num,d_denom)

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
                raise RuntimeError

        num = SparsePolynomial.from_string(num_str, varnames, var_to_ind)
        denom = SparsePolynomial.from_string(denom_str, varnames, var_to_ind)

        # print(f"({num})/({denom})")

        return RationalFunction(num, denom)

    def __str__(self):
        return f"({self.num})/({self.denom})"

    def __repr__(self):
        return f"RationalFunction({self.num}, {self.denom})"

    def __mul__(self, other):
        if type(other) == RationalFunction:
            return RationalFunction(self.num * other.num, self.denom * other.num)
        else:
            return RationalFunction(self.num * other, self.denom)

    def __add__(self, other):
        if self.denom == other.denom:
            return RationalFunction(self.num + other.num, self.denom)
        else:
            return RationalFunction(self.num*other.denom + other.num*self.denom, self.denom*other.denom)

    def get_sympy_ring(self):
        return sympy.polys.rings.ring(self.gens, self.domain)[0]


if __name__ == "__main__":

    # Tests
    varnames = ['x','y','z']

    not_simple_rf = RationalFunction.from_string("(5*x**10*y)/(10*x**8*y+20*y**2)", ['x','y'])
    print("(x**10)/(2*x**8 + 4*y)")
    print(not_simple_rf)

    rf1 = RationalFunction.from_string("(3 * x**2 * y**4 * z**7)/(7*x**4 + 3*y**2 * z**9)", varnames)
    rf2 = RationalFunction.from_string("(x**2*y**2)/(z**2)", varnames)
    rf3 = RationalFunction.from_string("(x**2)/(y*z**2)", varnames)

    rf1dx_expected = RationalFunction.from_string("(-(6*y**4*z**7*x*(7*x**4-3*y**2*z**9)))/((7*x**4+3*y**2*z**9)**2)", varnames)
    rf1dx_test = rf1.derivative('x')
    print(rf1dx_expected)
    print(rf1dx_test)

    rf2dx_expected = RationalFunction.from_string("(2*y**2*x)/(z**2)", varnames)
    rf2dx_test = rf2.derivative('x')
    print(rf2dx_expected)
    print(rf2dx_test)

    rf2dz_expected = RationalFunction.from_string("(-(2*x**2*y**2))/(z**3)", varnames)
    rf2dz_test = rf2.derivative('z')
    print(rf2dz_expected)
    print(rf2dz_test)

