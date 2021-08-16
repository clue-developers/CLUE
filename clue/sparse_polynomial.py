import re

from pyparsing import (
    Literal,
    Word,
    Group,
    Forward,
    alphas,
    alphanums,
    Regex,
    Suppress,
)

import sympy
from sympy import QQ

#------------------------------------------------------------------------------

def to_rational(s):
    denom = 1
    extra_num = 1
    if ('E' in s) or ('e' in s):
        s, exp = re.split("[Ee]", s)
        if exp[0] == "-":
            denom = 10**(-int(exp))
        else:
            extra_num = 10**(int(exp))

    frac = s.split(".")
    if len(frac) == 1:
        return QQ(int(s) * extra_num, denom)
    return QQ(int(frac[0] + frac[1]) * extra_num, denom * 10**(len(frac[1])))

#------------------------------------------------------------------------------

class SparsePolynomial(object):
    """
    Simplistic class for representing polynomials with sparse exponent vectors
    Fields:
      - domain - coefficient domain
      - var_names - a list of names of variables
      - data - dictionary from monomials to coefficients. Monomials are encoded as
               tuples of pairs (index_of_variable, exponent) with only
               nonzero exponents stored
    """

    __parser = None
    __parser_stack = []

    #--------------------------------------------------------------------------

    def __init__(self, varnames, domain=QQ, data=None):
        self._varnames = varnames
        self._domain = domain
        self._data = dict() if data is None else data

    def dataiter(self):
        return self._data.items()

    @property
    def size(self):
        return len(self._data)

    @property
    def domain(self):
        return self._domain

    @property
    def gens(self):
        return self._varnames.copy()

    @property
    def monomials(self):
        r'''
            Monomials that have a non-zero coefficient in this polynomial.

            This method returns a tuple with the monomials that have a non-zero coefficient
            in this polynomial. This whole polynomial can be retrieved from these monomials
            and the coefficients obtained by :func:`coefficients`.

            Output
                A tuple with :class:`SparsePolynomial` that are the monomials forming this polynomial.

            Examples::

                >>> from sympy import QQ
                >>> from clue.sparse_polynomial import SparsePolynomial
                >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
                >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
                >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
                >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
                >>> p.monomials
                (1, x, y, x*y)
                >>> SparsePolynomial.from_const(1, ["x", "y"]).monomials
                (1,)

            This method return an empty tuple if no monomial is contained, i.e., the polynomial 
            is equal to zero::

                >>> SparsePolynomial(["x", "y"], QQ).monomials
                ()
                >>> SparsePolynomial.from_const(0, ["x", "y"]).monomials
                ()

            The same polynomial can be obtained using together the method :func:`coefficients`::

                >>> n = len(p.dataiter())
                >>> p == sum([p.coefficients[i]*p.monomials[i] for i in range(n)], SparsePolynomial(p.gens, p.domain))
                True
        '''
        return tuple([SparsePolynomial.monomial(term[0], self.gens) for term in self.dataiter()])

    @property
    def coefficients(self):
        r'''
            Coefficients of this polynomial.

            This method returns a tuple with the coefficients that appear
            in this polynomial. This whole polynomial can be retrieved from these coefficients
            and the monomials obtained by :func:`monomials`.

            Output
                A tuple with elements in ``self.domain`` that are the coefficients forming this polynomial.

            Examples::

                >>> from sympy import QQ
                >>> from clue.sparse_polynomial import SparsePolynomial
                >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
                >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
                >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
                >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
                >>> p.monomials
                (1, 1/2, 3, 5)
                >>> SparsePolynomial.from_const(1, ["x", "y"]).monomials
                (1,)

            This method return an empty tuple if no monomial is contained, i.e., the polynomial 
            is equal to zero::

                >>> SparsePolynomial(["x", "y"], QQ).monomials
                ()
                >>> SparsePolynomial.from_const(0, ["x", "y"]).monomials
                ()

            The same polynomial can be obtained using together the method :func:`monomials`::

                >>> n = len(p.dataiter())
                >>> p == sum([p.coefficients[i]*p.monomials[i] for i in range(n)], SparsePolynomial(p.gens, p.domain))
                True
        '''
        return tuple([el[1] for el in self.dataiter()])
    
    @property
    def linear_components(self):
        r'''
            Linear components and coefficients from this polynomial.

            This method returns a set of functions (:class:`SparsePolynomial`)
            that are linearly independent w.r.t. the domain of this 
            polynomial (see :func:`domain`) and a list of coefficients 
            that allows to get the same polynomial again.

            For a polynomial, this is the same as the set of monomials
            of the polynomial and the list of coefficients.

            Output
                Two tuples `T, C` such that ``self == sum(C[i]*T[i] for i in range(len(T)))``.

            Examples

                >>> from sympy import QQ
                >>> from clue.sparse_polynomial import SparsePolynomial
                >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
                >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
                >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
                >>> p = one + x/(2*one) + (3*one)*y + (5*one)*x*y
                >>> p.linear_components()
                (1, x, y, x*y), (2, 1/2, 3, 5)
        '''
        return self.monomials, self.coefficients
        
    #--------------------------------------------------------------------------

    def __add__(self, other):
        result = SparsePolynomial(self._varnames, self._domain)
        resdata = dict()
        for m, c in self._data.items():
            sum_coef = c + other._data.get(m, self._domain(0))
            if sum_coef != 0:
                resdata[m] = sum_coef
        
        if(not isinstance(other, SparsePolynomial)):
            if(other in self.domain):
                other = SparsePolynomial.from_const(other, self.gens)
            else:
                return NotImplemented

        for m, c in other._data.items():
            if m not in self._data:
                resdata[m] = c
        result._data = resdata
        return result

    def __radd__(self, other):
        return self.__add__(other)

    #--------------------------------------------------------------------------

    def __iadd__(self, other):
        if(not isinstance(other, SparsePolynomial)):
            if(other in self.domain):
                other = SparsePolynomial.from_const(other, self.gens)
            else:
                return NotImplemented

        for m, c in other._data.items():
            sum_coef = c + self._data.get(m, self._domain(0))
            if sum_coef != 0:
                self._data[m] = sum_coef
            else:
                if m in self._data:
                    del self._data[m]
        return self

    #--------------------------------------------------------------------------

    def __neg__(self):
        return SparsePolynomial(self._varnames, self._domain, {m: -c for m, c in self._data.items()})

    def __sub__(self, other):
        return self + (-other)

    def __rsub__(self, other):
        return self.__neg__().__add__(other)

    def __isub__(self, other):
        self += (-other)
        return self

    #--------------------------------------------------------------------------
    
    def __eq__(self, other):
        if(not isinstance(other, SparsePolynomial)):
            if(other in self.domain):
                other = SparsePolynomial.from_const(other, self.gens)
            else:
                return False
        if self._data != other._data:
            return False
        else:
            return True

    #--------------------------------------------------------------------------

    def __mul__(self, other):
        """
        Multiplication by a scalar or another polynomial
        For polynomials we use slow quadratic multiplication as needed only for parsing
        """
        if type(other) == SparsePolynomial:
            result = SparsePolynomial(self._varnames, self._domain)
            for ml, cl in self._data.items():
                for mr, cr in other._data.items():
                    dictl = dict(ml)
                    dictr = dict(mr)
                    for varind, exp in dictr.items():
                        if varind in dictl:
                            dictl[varind] += exp
                        else:
                            dictl[varind] = exp
                    m = tuple([(v, dictl[v]) for v in sorted(dictl.keys())])
                    if m in result._data:
                        result._data[m] += cl * cr
                        if result._data[m] == 0:
                            del result._data[m]
                    else:
                        result._data[m] = cl * cr
            return result
        else:
            result = SparsePolynomial(self._varnames, self._domain)
            if other != 0:
                for m, c in self._data.items():
                    result._data[m] = c * other
            return result

    def __rmul__(self, other):
        return self.__mul__(other)

    def __pow__(self, power):
        return self.exp(power)

    #--------------------------------------------------------------------------

    def __floordiv__(self, other):
        """
        Exact division implemented with SymPy

        self // other
        """
        R = self.get_sympy_ring()
        num = R(self.get_sympy_dict()).as_expr()
        denom = R(other.get_sympy_dict()).as_expr()
        if num.is_zero:
            return SparsePolynomial.from_string('0', self._varnames)
        elif num == denom:
            return SparsePolynomial.from_string('1', self._varnames)
        elif denom == 1:
            return self
        quo = R(sympy.polys.polytools.quo(num, denom))
        return SparsePolynomial.from_sympy(quo)

    #--------------------------------------------------------------------------

    def exp(self, power):
        """
        Exponentiation, exp is a *positive* integer
        """
        if power < 0:
            raise ValueError(f"Cannot raise to power {power}, {str(self)}")
        if power == 1:
            return self
        if power % 2 == 0:
            return self.exp(power // 2) * self.exp(power // 2)
        return self * self.exp(power // 2) * self.exp(power // 2)

    #--------------------------------------------------------------------------

    def is_zero(self):
        if len(self._data) == 0:
            return True
        return False

    def is_unitary(self):
        if self._data == {():1}:
            return True
        return False
    #--------------------------------------------------------------------------

    def _pair_to_str(self, pair):
        if pair[1] == 1:
            return self._varnames[pair[0]]
        else:
            return f"{self._varnames[pair[0]]}**{pair[1]}"

    #--------------------------------------------------------------------------

    def _scalar_to_str(self, c):
        # not an elegant way to force elements of algebraic fields be printed with sqrt
        if isinstance(c, sympy.polys.polyclasses.ANP):
            dummy_ring = sympy.ring([], self.domain)[0]
            return f"({dummy_ring(c).as_expr()})"
        if isinstance(c, sympy.polys.fields.FracElement):
            return f"({c})"
        return str(c)

    #--------------------------------------------------------------------------

    def _monom_to_str(self, m, c):
        if c == 0:
            return "0"
        if not m:
            return self._scalar_to_str(c)
        prefix = ""
        if c != self.domain.convert(1):
            if c == self.domain.convert(-1):
                prefix = "-"
            else:
                prefix = self._scalar_to_str(c) + "*"
        return prefix + "*".join(map(lambda p: self._pair_to_str(p), m))

    #--------------------------------------------------------------------------

    def __repr__(self):
        if not self._data:
            return "0"
        return " + ".join([self._monom_to_str(m, c) for m, c in self._data.items()])

    #--------------------------------------------------------------------------

    def linear_part_as_vec(self):
        return [self._data.get(((i, 1), ), self._domain(0)) for i in range(len(self._varnames))]

    #--------------------------------------------------------------------------

    def get_sympy_dict(self):
        result = dict()
        for monom, coef in self._data.items():
            new_monom = [0] * len(self.gens)
            for var, exp in monom:
                new_monom[var] = exp
            result[tuple(new_monom)] = coef
        return result

    #--------------------------------------------------------------------------

    def get_sympy_ring(self):
        return sympy.polys.rings.ring(self.gens, self.domain)[0]

    #--------------------------------------------------------------------------
    def derivative(self, var_name):
        """
        Returns derivative of polynomial with respect to var_name
        """
        if var_name in self._varnames:
            var = self._varnames.index(var_name)
        else:
            return 0

        data = dict()
        for monom, coeff in self._data.items():
            for i in range(len(monom)):
                v, exp = monom[i]
                if v == var:
                    if exp == 1:
                        m_der = tuple(list(monom[:i]) + list(monom[(i + 1):]))
                    else:
                        m_der = tuple(list(monom[:i]) + [(var, exp - 1)] + list(monom[(i + 1):]))
                    data[m_der] = coeff * exp

        return SparsePolynomial(self._varnames, domain=self._domain, data=data)

    #--------------------------------------------------------------------------

    @staticmethod
    def lcm(polys):
        """
        Returns lowest common multiple of given polynomials (computed w/ SymPy)
        """
        R = polys[0].get_sympy_ring()
        sympy_polys = [R(poly.get_sympy_dict()) for poly in polys]
        result = sympy_polys[0]
        for p in sympy_polys[1:]:
            result = result.lcm(p)
        return SparsePolynomial.from_sympy(result)

    @staticmethod
    def gcd(polys):
        """
        Returns greatest common divisor of given polynomials (computed w/ SymPy)
        """
        R = polys[0].get_sympy_ring()
        sympy_polys = []
        for poly in polys:
            if poly.is_unitary():
                return poly
            sympy_dict = poly.get_sympy_dict()
            if sympy_dict:
                sympy_polys.append(R(sympy_dict).as_expr())
        gcd = R(sympy.gcd(sympy_polys))
        return SparsePolynomial.from_sympy(gcd)
    #--------------------------------------------------------------------------

    @staticmethod
    def from_sympy(sympy_poly):
        domain = sympy_poly.ring.domain
        # lambda used to handle the case of the algebraic field of coefficients
        varnames = list(map(lambda g: str(g.as_expr()), sympy_poly.ring.gens))
        data = dict()
        sympy_dict = sympy_poly.to_dict()
        for monom, coef in sympy_dict.items():
            new_monom = []
            for i in range(len(monom)):
                if monom[i]:
                    new_monom.append((i, monom[i]))
            data[tuple(new_monom)] = coef
        return SparsePolynomial(varnames, domain, data)

    #--------------------------------------------------------------------------

    @staticmethod
    def monomial(monomial, varnames):
        each_var = []
        for pair in monomial:
            each_var += [SparsePolynomial.var_from_string(varnames[pair[0]], varnames) ** pair[1]]
        result = SparsePolynomial.from_const(1, varnames)
        for el in each_var:
            result *= el
        return result

    @staticmethod
    def var_from_string(vname, varnames):
        i = varnames.index(vname)
        return SparsePolynomial(varnames, QQ, {((i, 1), ) : QQ(1)})

    @staticmethod
    def from_const(c, varnames):
        return SparsePolynomial(varnames, QQ, {tuple() : c})

    #--------------------------------------------------------------------------

    @staticmethod
    def from_string(s, varnames, var_to_ind = None):
        """
        Parsing a string to a polynomial, string is allowed to include floating-point numbers
        in the standard and scientific notation, they will be converted to rationals

        The code is an adapted version of fourFn example for pyparsing library by Paul McGuire
        https://github.com/pyparsing/pyparsing/blob/master/examples/fourFn.py
        """
        def push_first(toks):
            SparsePolynomial.__parser_stack.append(toks[0])


        def push_unary_minus(toks):
            for t in toks:
                if t == "-":
                    SparsePolynomial.__parser_stack.append("unary -")
                else:
                    break

        # Creating a parser instance if necessary
        if SparsePolynomial.__parser is None:
            fnumber = Regex(r"[+-]?\d+(?:\.\d*)?(?:[eE][+-]?\d+)?")
            ident = Word(alphas, alphanums + "_$")
            # Note: no division
            plus, minus, mult = map(Literal, "+-*")
            lpar, rpar = map(Suppress, "()")
            addop = plus | minus
            multop = mult
            expop = Literal("^") | Literal("**")
        
            expr = Forward()
            atom = (
                addop[...]
                + (
                    (fnumber | ident).setParseAction(push_first)
                    | Group(lpar + expr + rpar)
                )
            ).setParseAction(push_unary_minus)

            factor = Forward()
            factor <<= atom + (expop + factor).setParseAction(push_first)[...]
            term = factor + (multop + factor).setParseAction(push_first)[...]
            expr <<= term + (addop + term).setParseAction(push_first)[...]
            SparsePolynomial.__parser = expr

        # parsing
        try:
            SparsePolynomial.__parser.parseString(s, parseAll=True)
        except:
            print(s)
            raise

        # for fast lookup
        var_ind_map = {v : i for i, v in enumerate(varnames)} if var_to_ind is None else var_to_ind

        def evaluate_stack(s):
            op = s.pop()
            if op == "unary -":
                return -evaluate_stack(s)
            if op in "+-*/":
                # note: operands are pushed onto the stack in reverse order
                op2 = evaluate_stack(s)
                op1 = evaluate_stack(s)
                if op == "+":
                    if op1.size < op2.size:
                        op1, op2 = op2, op1
                    op1 += op2
                    return op1
                if op == "-":
                    op1 -= op2
                    return op1
                if op == "*":
                    return op1 * op2
                if op == "/":
                    raise NotImplementedError
            if op == "^" or op == "**":
                exp = int(s.pop())
                base = evaluate_stack(s)
                return base.exp(exp)
            if re.match(r"^[+-]?\d+(?:\.\d*)?(?:[eE][+-]?\d+)?$", op):
                return SparsePolynomial.from_const(to_rational(op), varnames)
            return SparsePolynomial(varnames, QQ, {((var_ind_map[op], 1),): QQ(1)})

        return evaluate_stack(SparsePolynomial.__parser_stack)

#------------------------------------------------------------------------------
