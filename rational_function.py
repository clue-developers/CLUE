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
        # TODO: Simpify
        assert num.domain == denom.domain
        assert num.gens == denom.gens
        self._domain = num.domain
        # self._varnames = set(num.gens).union(set(denom.gens))
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
        d_num = self.denom * self.num.derivative(var) - self.num * self.denom.derivative(var) # SparsePolynomial.derevative
        d_denom = self.denom*self.denom
        return RationalFunction(d_num,d_denom)

    @staticmethod
    def from_string(s, varnames, var_to_ind = None):
        """
        Parsing a string to a rational function, sting is allowed to include floating-point numbers
        in the standard and scientific notation, they will be converted to rationals

        IMPORTANT: String must contain only one "/"!
        """
        num = SparsePolynomial.from_string(s.split("/")[0], varnames, var_to_ind)
        denom = SparsePolynomial.from_string(s.split("/")[1], varnames, var_to_ind)
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


