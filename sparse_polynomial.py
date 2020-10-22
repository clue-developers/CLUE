import re

from pyparsing import (
    Literal,
    Word,
    Group,
    Forward,
    alphas,
    alphanums,
    Regex,
    ParseException,
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
    Simplictic class for representing polynomials with sparse exponent vectors
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

    #--------------------------------------------------------------------------

    def __add__(self, other):
        result = SparsePolynomial(self._varnames, self._domain)
        resdata = dict()
        for m, c in self._data.items():
            sum_coef = c + other._data.get(m, self._domain(0))
            if sum_coef != 0:
                resdata[m] = sum_coef
        for m, c in other._data.items():
            if m not in self._data:
                resdata[m] = c
        result._data = resdata
        return result

    #--------------------------------------------------------------------------

    def __iadd__(self, other):
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

    def __isub__(self, other):
        self += (-other)
        return self

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

    def __str__(self):
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
        Parsing a string to a polynomial, sting is allowed to include floating-point numbers
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
        SparsePolynomial.__parser.parseString(s, parseAll=True)

        # for fast lookup
        var_ind_map = {v : i for i, v in enumerate(varnames)} if var_to_ind is None else var_to_ind

        def evaluate_stack(s):
            op = s.pop()
            if op == "unary -":
                return -evaluate_stack(s)
            if op in "+-*":
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
            if op == "^" or op == "**":
                exp = int(s.pop())
                base = evaluate_stack(s)
                return base.exp(exp)
            if re.match(r"^[+-]?\d+(?:\.\d*)?(?:[eE][+-]?\d+)?$", op):
                return SparsePolynomial.from_const(to_rational(op), varnames)
            return SparsePolynomial(varnames, QQ, {((var_ind_map[op], 1),): QQ(1)})

        return evaluate_stack(SparsePolynomial.__parser_stack)

#------------------------------------------------------------------------------
