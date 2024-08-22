from __future__ import annotations

import re

from functools import cached_property

from pyparsing import (
    Literal,
    Group,
    Forward,
    alphas,
    alphanums,
    Regex,
    Suppress,
)

import sympy
from sympy import QQ, oo
from sympy import PythonRational as MPQ
from typing import Any, Collection, Optional


from .linalg import SparseVector
from .nual import NualNumber
from .numerical_domains import NumericalField, Domain, Element

# ------------------------------------------------------------------------------

def to_rational(s: str) -> MPQ:
    denom = 1
    extra_num = 1
    if ("E" in s) or ("e" in s):
        s, exp = re.split("[Ee]", s)
        if exp[0] == "-":
            denom = 10 ** (-int(exp))
        else:
            extra_num = 10 ** (int(exp))

    frac = s.split(".")
    if len(frac) == 1:
        return QQ(int(s) * extra_num, denom)
    return QQ(int(frac[0] + frac[1]) * extra_num, denom * 10 ** (len(frac[1])))

# ------------------------------------------------------------------------------
class SparseMonomial(dict):
    def __init__(self, data: dict[int, int] | list[tuple[int, int]]):
        self.__blocked = False
        if isinstance(data, dict):
            for (v,e) in data.items():
                self[v] = e
        elif isinstance(data, (list,tuple)):
            for (v,e) in data:
                if v in self:
                    self[v] += e
                else:
                    self[v] = e

        self.__hash = None
        self.__blocked = True

    def __mul__(self, other: SparseMonomial) -> SparseMonomial:
        if not isinstance(other, SparseMonomial):
            return NotImplemented
        
        res_dict = self.copy()
        for (v, e) in other.items():
            if v in res_dict:
                res_dict[v] += e
            else:
                res_dict[v] = e

        return SparseMonomial(res_dict)

    def eval(self, values: dict[int, Any]) -> tuple[Any, SparseMonomial]:
        r'''
            Evaluates a monomial given a certain set of values.

            It returns the evaluated element together with the remaining monomial after the evaluation.
        '''
        C = 1
        rem_dict = dict()
        for (v, e) in self.items():
            if v in values:
                C *= values[v]**e
            else:
                rem_dict[v] = e

        return C, SparseMonomial(rem_dict)

    def change_variables(self, new_vars: dict[int, int]) -> SparseMonomial:
        r'''
            Change the indices of the variable give a specific map.
        '''
        return SparseMonomial([(v if v not in new_vars else new_vars[v], e) for (v,e) in self.items()])

    def max_var(self) -> int:
        return max(self)

    def variables(self) -> tuple[int]:
        return tuple(self.keys())

    def degree(self, variable: Optional[int] = None) -> int:
        r'''
            Method to get the degree of a variable in a monomial.

            This method returns the exponent associated with a variable in a monomial 
            returning zero when the variable is nto present. This method do **not**
            check any limit on the variable index.

            If no index is provided, a general degree is returned instead.
        '''
        if variable is None:
            return sum(self.values())
        
        return self.get(variable, 0)

    def derivative(self, variable: int) -> tuple[int, SparseMonomial]:
        r'''
            Method that computes the derivative of a monomial w.r.t. a variable.

            This method returns the coefficient generated and the new monomial.
        '''
        if not variable in self:
            return 0, SparseMonomial(dict())
        
        exponent = self[variable]
        new_data = self.copy()
        if exponent == 1:
            del new_data[variable]
        else:
            new_data[variable] -= 1
        
        return exponent, SparseMonomial(new_data)

    def __hash__(self) -> int:
        if self.__hash is None:
            self.__hash = hash(tuple(sorted(self.items())))
        return self.__hash
    
    def __setitem__(self, key: int, value: int) -> None:
        if not self.__blocked:
            return super().__setitem__(key, value)
        else:
            raise NotImplementedError("SparseMonomial are inmutable")
        
    def to_string(self, *varnames: str) -> str:
        if len(varnames) == 1 and isinstance(varnames, (tuple, list)):
            varnames = varnames[0]
        if len(varnames) <= self.max_var():
            raise ValueError(f"Not enough variable names provided for this SparseMonomial")
        if len(self) == 0:
            return "1"
        else:
            return "*".join(f"{varnames[v]}{f'**{e}' if e > 1 else ''}" for (v,e) in self.items())

class SparsePolynomial(object):
    r'''
    Simplistic class for representing polynomials with sparse exponent vectors

    Input
        ``varnames`` - list of names of the variables for the polynomial.
        ``domain`` - ambient space (in sympy format) for the coefficients of the polynomial
        ``data`` - dictionary from monomials to coefficients. Monomials are encoded as
            tuples of pairs (index_of_variable, exponent) with only nonzero exponents stored

    Examples::

        >>> from clue.rational_function import *
        >>> from sympy import parse_expr, simplify
        >>> poly = "a * (3 * a + b) - 8.5 * (a + b)**5 - 3 * c * b * (c - a)"
        >>> parsed = parse_expr(poly)
        >>> sp = SparsePolynomial.from_string(poly, ["a", "b", "c"])
        >>> simplify(parse_expr(str(sp)) - parsed) == 0
        True
        >>> poly = "(a + b + c**2)**5 - 3 * a + b * 17 * 19 * 0.5"
        >>> parsed = parse_expr(poly)
        >>> sp = SparsePolynomial.from_string(poly, ["a", "b", "c"])
        >>> simplify(parse_expr(str(sp)) - parsed) == 0
        True
    '''
    def __init__(self, 
                 varnames: list[str], 
                 domain: Domain = QQ, 
                 data: dict[(tuple[tuple[int,int]] | SparseMonomial), Element] = None, 
                 cast: bool = True):
        self._varnames = varnames
        self._domain = domain

        self._data : dict[SparseMonomial, Any] = dict()
        if data is not None:
            for key, value in data.items():
                if cast:
                    if isinstance(value, NualNumber):
                        value = value.change_base(domain)
                    else:
                        value = domain.convert(value)
                if value != domain.zero:
                    monomial = SparseMonomial(key) if not isinstance(key, SparseMonomial) else key
                    if monomial in self._data:
                        self._data[monomial] += value
                    else:
                        self._data[monomial] = value

        self.__cache_pow : dict[int, SparsePolynomial]= dict()


    def dataiter(self):
        return self._data.items()

    @property
    def size(self) -> int:
        return len(self._data)

    @property
    def domain(self) -> Domain:
        return self._domain

    @property
    def gens(self) -> tuple[str]:
        return self._varnames.copy()

    @property
    def monomials(self) -> tuple[SparsePolynomial]:
        r'''
        Monomials that have a non-zero coefficient in this polynomial.

        This method returns a tuple with the monomials that have a non-zero coefficient
        in this polynomial. This whole polynomial can be retrieved from these monomials
        and the coefficients obtained by :func:`coefficients`.

        Output
            A tuple with :class:`SparsePolynomial` that are the monomials forming this polynomial.

        Examples::

            >>> from sympy import QQ
            >>> from clue.rational_function import SparsePolynomial
            >>> p = SparsePolynomial.from_string("1 + x/2 + 3*y + 5*x*y", ['x','y'])
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

            >>> p == sum([c*m for (c,m) in zip(p.coefficients, p.monomials)], SparsePolynomial(p.gens, p.domain))
            True
        '''
        return tuple(
            [
                SparsePolynomial.monomial(term[0], self._varnames, self.domain)
                for term in self.dataiter()
            ]
        )

    @property
    def coefficients(self) -> tuple[Element]:
        r'''
        Coefficients of this polynomial.

        This method returns a tuple with the coefficients that appear
        in this polynomial. This whole polynomial can be retrieved from these coefficients
        and the monomials obtained by :func:`monomials`.

        Output
            A tuple with elements in ``self.domain`` that are the coefficients forming this polynomial.

        Examples::

            >>> from sympy import QQ
            >>> from clue.rational_function import SparsePolynomial
            >>> p = SparsePolynomial.from_string("1 + x/2 + 3*y + 5*x*y", ['x','y'])
            >>> print(p.coefficients)
            (MPQ(1,1), MPQ(1,2), MPQ(3,1), MPQ(5,1))
            >>> SparsePolynomial.from_const(10, ["x", "y"]).coefficients
            (MPQ(10,1),)

        This method return an empty tuple if no monomial is contained, i.e., the polynomial
        is equal to zero::

            >>> SparsePolynomial(["x", "y"], QQ).coefficients
            ()
            >>> SparsePolynomial.from_const(0, ["x", "y"]).coefficients
            ()

        The same polynomial can be obtained using together the method :func:`monomials`::

            >>> p == sum([c*m for (c,m) in zip(p.coefficients, p.monomials)], SparsePolynomial(p.gens, p.domain))
            True
        '''
        return tuple([el[1] for el in self.dataiter()])

    @property
    def content(self) -> Element:
        r'''
        Content of a polynomial.

        For a polynomial, the content is the greatest common divisor of its coefficients. This
        computation is performed on the domain of ``self`` and may have interesting behaviors
        when the domain is a field.

        Output
            An element in ``self.domain`` that is the GCD of the coefficients of ``self``.

        Examples::

            >>> from sympy import QQ
            >>> from clue.rational_function import SparsePolynomial
            >>> p = SparsePolynomial.from_string("15*x + 6", ["x"])
            >>> p.content
            3
            >>> p = SparsePolynomial.from_string("15*x + 6", ["x"])//SparsePolynomial.from_string("7", ["x"])
            >>> p.content
            3/7

        The constants always return their value::

            >>> p = SparsePolynomial.from_const(QQ(5)/QQ(7), ['x'])
            >>> p.content
            5/7
            >>> p = SparsePolynomial.from_string("15", ['x'])
            >>> p.content
            15
            >>> p = SparsePolynomial(['x'])
            >>> p.content
            0

        In the case the field of the polynomial is numerical we simply return the unit::

            >>> from clue.numerical_domains import RR
            >>> p = SparsePolynomial.from_string("12*x^2 - 6*x*y + 3", ["x","y"], RR)
            >>> p.content
            1.0
        '''
        if isinstance(self.domain, NumericalField):
            return self.domain.one
        else:
            return sympy.polys.polytools.gcd(self.coefficients)

    @property
    def constant_term(self) -> Element:
        r'''
        Constant coefficient of a Sparse polynomial.

        This property is the value of the constant term of the polynomial.
        This is the coefficients associated with the monomial `1`. In terms
        of the current implementation, this is the coefficient that can
        be obtained with ``self._data.get((), 0)``.

        Output
            An element in ``self.domain`` that is the coefficient of the monomial `1`.

        Examples::

            >>> from clue.rational_function import *
            >>> sp = SparsePolynomial.from_string("x*y*z + x*6 - 10", ['x','y','z'])
            >>> sp.constant_term
            MPQ(-10,1)
            >>> sp = SparsePolynomial.from_string("x - y", ['x','y'])
            >>> sp.constant_term
            MPQ(0,1)
            >>> sp = SparsePolynomial.from_const(13, ['x','y','z'])
            >>> sp.constant_term
            MPQ(13,1)
            >>> sp = SparsePolynomial(['x']) # zero polynomial
            >>> sp.constant_term
            MPQ(0,1)

        This property can also be obtained via :func:`ct`::

            >>> sp.ct
            MPQ(0,1)
        '''
        return self._data.get(SparseMonomial([]), self.domain.zero)

    ct = constant_term  #: alias for the constant term property

    @property
    def linear_components(self) -> tuple[tuple[SparsePolynomial],tuple[Element]]:
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
            >>> from clue.rational_function import SparsePolynomial
            >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
            >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
            >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
            >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
            >>> print(p.linear_components)
            ((1, x, y, x*y), (MPQ(1,1), MPQ(1,2), MPQ(3,1), MPQ(5,1)))
        '''
        return self.monomials, self.coefficients

    def degree(self, var_name: Optional[str] = None) -> int:
        r'''
        Obtain the degree of this polynomial (maybe with respect to some variable)

        This method computes the degree of a :class:`SparsePolynomial`. If the input is
        ``None``, the result is the total degree of the polynomial. Otherwise, we
        return the degree of ``self`` w.r.t. the given variable.

        Input
            ``var_name`` - name (string) of the variable to compute the degree.

        Output
            If ``var_name`` is ``None``, the total degree is returned, otherwise
            we return the degree of ``self`` w.r.t. ```var_name``.

        Examples::

            >>> from sympy import QQ
            >>> from clue.rational_function import SparsePolynomial
            >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
            >>> x.degree()
            1
            >>> x.degree('x')
            1
            >>> x.degree('y')
            0
            >>> p = SparsePolynomial.from_string("1 + x/2 + 3*y + 5*x*y", ['x','y'])
            >>> p.degree()
            2
            >>> p.degree('x')
            1
            >>> p.degree('y')
            1

        In case a variable that does not exists is given, a ValueError is raised::

            >>> p.degree('z')
            Traceback (most recent call last):
            ...
            ValueError: Variable z is not valid for this polynomial

        By convention, if the polynomial is zero, we stablish the degree to be ``oo``
        which is the infinity in :mod:`sympy`.

            >>> zero = SparsePolynomial(['x','y','z'],QQ)
            >>> zero.degree()
            oo
            >>> zero.degree('x')
            oo
            >>> zero.degree('a')
            Traceback (most recent call last):
            ...
            ValueError: Variable a is not valid for this polynomial
            >>> SparsePolynomial.from_const(0, ['x','y']).degree()
            oo
        '''
        if var_name is not None and var_name not in self._varnames:
            raise ValueError(f"Variable {var_name} is not valid for this polynomial")
        
        if self.is_zero():
            return oo
        
        var_index = self._varnames.index(var_name) if var_name is not None else None
        return max(m.degree(var_index) for m in self._data)

    def variables(self, as_poly: bool = False) -> tuple[str] | tuple[SparsePolynomial]:
        r'''
        Variables that actually appear in the polynomial.

        This method computes the variables that appear in the :class:`SparsePolynomial`
        or, equivalently, the variables that have a positive degree.

        Input
            ``as_poly`` - (optional) decides whether to return the names of the
            variables (``False``) or the variables as :class:`SparsePolynomial` (``True``)


        Output
            A tuple with the variables that have positive degree.

        Examples::

            >>> from sympy import QQ
            >>> from clue.rational_function import SparsePolynomial
            >>> x = SparsePolynomial(["x", "y", "z"], QQ, {tuple([(0,1)]): 1})
            >>> x.variables()
            ('x',)
            >>> x.variables(True)
            (x,)
            >>> y = SparsePolynomial(["x", "y", "z"], QQ, {tuple([(1,1)]): 1})
            >>> one = SparsePolynomial(["x", "y", "z"], QQ, {(): 1})
            >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
            >>> p.variables()
            ('x', 'y')
            >>> p.variables(True)
            (x, y)

        The constant polynomials provide an empty tuple as result::

            >>> one.variables()
            ()
            >>> SparsePolynomial(["x", "y", "z"], QQ).variables() # checking the zero polynomial
            ()
        '''
        var_indices = tuple(sorted(set(sum([m.variables() for m in self._data], tuple()))))
        variables = tuple(self._varnames[ind] for ind in var_indices)
        if as_poly:
            variables = tuple(SparsePolynomial.variable(var, self._varnames, self.domain) for var in variables)
        
        return variables

    def __check_SparsePolynomial(self, other: SparsePolynomial | Element | str) -> SparsePolynomial:
        ## Checking the argument "other"
        if not isinstance(other, SparsePolynomial):
            if other in self.domain:
                other = SparsePolynomial.from_const(other, self._varnames, self.domain)
            elif isinstance(other, str):
                other = SparsePolynomial.from_string(other, self._varnames, self.domain)
            else:
                raise TypeError(f"Incompatible types: received {other.__class__}")

        ## Checking consistency of operands
        if self.domain != other.domain:
            raise TypeError(f"Incompatible domains between SparsePolynomials ({self.domain} vs {other.domain})")
        elif len(self._varnames) != len(other._varnames):
            if len(other._varnames) < len(self._varnames) and (self._varnames[:len(other._varnames)] == other._varnames): # we can extend other to self
                other = SparsePolynomial(self._varnames, self.domain, other._data, False)
            else:
                raise TypeError(f"Incompatible number of variables between SparsePolynomials ({len(self._varnames)} != {len(other._varnames)})")
        
        return other

    # --------------------------------------------------------------------------


    def __add__(self, other: SparsePolynomial) -> SparsePolynomial:
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            try:
                return other.__radd__(self)
            except Exception:
                return NotImplemented
        
        ## Computing solution
        resdata = self._data.copy()
        for m, c in other._data.items():
            if m in resdata:
                new_val = resdata[m] + c
                if new_val == self.domain.zero:
                    del resdata[m]
                else:
                    resdata[m] = new_val
            else:
                resdata[m] = c
        
        return SparsePolynomial(self._varnames, self.domain, resdata, False)

    def __radd__(self, other: SparsePolynomial) -> SparsePolynomial:
        return self.__add__(other)

    # --------------------------------------------------------------------------

    def __iadd__(self, other: SparsePolynomial) -> SparsePolynomial:
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            return NotImplemented
        
        ## Computing solution
        for m, c in other._data.items():

            if m in self._data:
                new_val = self._data[m] + c
                if new_val == self.domain.zero:

                    del self._data[m]
                else:
                    self._data[m] = new_val
            else:
                self._data[m] = c
        return self

    # --------------------------------------------------------------------------

    def __neg__(self) -> SparsePolynomial:
        return SparsePolynomial(
            self._varnames, self.domain, {m: -c for m, c in self._data.items()}, False
        )

    def __sub__(self, other: SparsePolynomial) -> SparsePolynomial:
        return self + (-other)

    def __rsub__(self, other: SparsePolynomial) -> SparsePolynomial:
        return (-self) + (other)

    def __isub__(self, other: SparsePolynomial) -> SparsePolynomial:
        self += -other
        return self

    # --------------------------------------------------------------------------

    def __eq__(self, other: SparsePolynomial) -> bool:
        r'''
        Equality method for :class:`SparsePolynomial`.

        Input
            ``other`` - object to compare with ``self``.

        Output
            ``True`` if ``other`` is a sparse polynomial (or a constant in the domain of ``self``,
            see property :func:`domain`) and has the same data as ``self``.

        Examples::

            >>> from clue.rational_function import *
            >>> sp1 = SparsePolynomial.from_string("2*x**23 + 4", ['x'])
            >>> sp2 = SparsePolynomial.from_string("2*x**23 + 4", ['x'])
            >>> sp1 is sp2
            False
            >>> sp1 == sp2
            True

        This method also recognizes ``other`` to be elements in ``self.domain``::

            >>> sp = SparsePolynomial.from_string("1 + 6", ['x'])
            >>> sp == 7
            True

        This equality check do not distinguish between variable names: the order
        that is used in self.gens is critical here::

            >>> sp1 = SparsePolynomial.from_string("x + 2*y", ['x','y'])
            >>> sp2 = SparsePolynomial.from_string("2*x + y", ['y','x'])
            >>> sp1 == sp2
            True
        '''
        ## Checking the argument "other"
        try:
            sself, other = self, self.__check_SparsePolynomial(other)
        except TypeError:
            try:
                sself, other = other.__check_SparsePolynomial(self), other
            except TypeError:
                return False
        
        return sself._data == other._data

    def __hash__(self) -> int:
        r'''Method to get the hash of a SparsePolynomial'''
        return sum(hash(m) for m in self._data)

    # --------------------------------------------------------------------------

    def __mul__(self, other: SparsePolynomial) -> SparsePolynomial:
        r'''
            Multiplication by a scalar or another polynomial
            For polynomials we use slow quadratic multiplication as needed only for parsing
        '''
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            try:
                return other.__rmul__(self)
            except Exception:
                return NotImplemented
        
        resdata = dict()
        for ml, cl in self._data.items():
            for mr, cr in other._data.items():
                m = ml * mr
                if m in resdata:
                    resdata[m] += cl * cr
                else:
                    resdata[m] = cl * cr
        return SparsePolynomial(self._varnames, self.domain, resdata, False)

    def __rmul__(self, other: SparsePolynomial) -> SparsePolynomial:
        return self.__mul__(other)

    def __pow__(self, power: SparsePolynomial) -> SparsePolynomial:
        return self.exp(power)

    # --------------------------------------------------------------------------

    def __floordiv__(self, other: SparsePolynomial) -> SparsePolynomial:
        r'''
        Exact division implemented with SymPy.

        This method implements the magic logic behind ``//``. This method computes
        the *exact division* between two :class:`SparsePolynomials`. This, if we consider
        an Euclidean division of the type

        .. MATH::

            A(\mathbf{x}) = q(\mathbf{x})B(\mathbf{x}) + r(\mathbf{x}),

        then this method returns the polynomial `q(\mathbf{x})`. It is based on the
        SymPy computation of the exact division. The remainder can be obtained in a similar
        way with the magic syntax ``%``.

        Input
            ``other`` - polynomial that will be the quotient (i.e., `B(\mathbf{x})`)

        Output
            The exact division polynomial `q(\mathbf{x})`.

        Examples::

            >>> from clue.rational_function import *
            >>> sp1 = SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x','y'])
            >>> sp2 = SparsePolynomial.from_string("x+1", ['x'])
            >>> sp1//sp2
            2 + x**2 + 2*x
            >>> sp1 = SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x','y'])
            >>> sp2 = SparsePolynomial.from_string("x+y", ['x','y'])
            >>> sp1//sp2
            4 + x**2 + y**2 - 3*y + 3*x - x*y
            >>> sp3 =  SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x'])
            >>> sp3 == sp1
            True
            >>> sp3//sp2
            4 + x**2 + y**2 - 3*y + 3*x - x*y
        '''
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            try:
                return other.__rfloordiv__(self)
            except Exception:
                return NotImplemented
        
        if other.is_zero():
            raise ZeroDivisionError(f"Dividing by a zero SparsePolynomial")
        elif self.is_zero(): ## 0/other = 0
            return SparsePolynomial.from_const(0, self._varnames, self.domain)
        elif self == other: ## Other is self, hence the division is exact
            return SparsePolynomial.from_const(1, self._varnames, self.domain)
        elif self.is_constant() and other.is_constant(): ## Constant division
            return SparsePolynomial.from_const(self.ct / other.ct, self._varnames, self.domain)
        elif other.is_constant(): ## Direct division
            C = other.ct
            return SparsePolynomial(self._varnames, self.domain, {m : c / C for (m,c) in self._data.items()}, False)

        ## General case (self != other and 0)
        try:
            R = self.get_sympy_ring()
            num = R(self.get_sympy_dict()).as_expr()
            denom = R(other.get_sympy_dict()).as_expr()
            quo = R(sympy.polys.polytools.quo(num, denom))
            
            return SparsePolynomial.from_sympy(quo, self._varnames)
        except NotImplementedError: ## We can not do division, we return 0
            return SparsePolynomial(self._varnames, self.domain) 

    def __rfloordiv__(self, other: SparsePolynomial) -> SparsePolynomial:
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            return NotImplemented

        return other // self

    def __mod__(self, other: SparsePolynomial) -> SparsePolynomial:
        r'''
        Remainder computation implemented with SymPy.

        This method implements the magic logic behind ``%``. This method computes
        the *remainder* between two :class:`SparsePolynomials`. This, if we consider
        an Euclidean division of the type

        .. MATH::

            A(\mathbf{x}) = q(\mathbf{x})B(\mathbf{x}) + r(\mathbf{x}),

        then this method returns the polynomial `r(\mathbf{x})`. It is based on the
        SymPy computation of the exact division. The remainder can be obtained in a similar
        way with the magic syntax ``%``.

        Input
            ``other`` - polynomial that will be the quotient (i.e., `B(\mathbf{x})`)

        Output
            The exact division polynomial `r(\mathbf{x})`.

        Examples::

            >>> from clue.rational_function import *
            >>> sp1 = SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x','y'])
            >>> sp2 = SparsePolynomial.from_string("x+1", ['x'])
            >>> sp1%sp2
            3
            >>> sp1 = SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x','y'])
            >>> sp2 = SparsePolynomial.from_string("x+y", ['x','y'])
            >>> sp1%sp2
            5 - 4*y - y**3 + 3*y**2
            >>> sp3 =  SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x'])
            >>> sp3 == sp1
            True
            >>> sp3%sp2
            -4*y - y**3 + 3*y**2 + 5
        '''
        return self - (self // other) * other

    def __truediv__(self, other: SparsePolynomial) -> SparsePolynomial:
        r'''
        True division for sparse polynomials.

        This method implements the magic logic behind ``/``. This method computes
        the *true division* between two :class:`SparsePolynomials`. This will
        create :class:`RationalFunction` when the exact division (see :func:`__floordiv__`
        and :func:`__mod__`) is different to the true division.

        Input
            ``other`` - polynomial that will be the quotient

        Output
            The true division polynomial. If ``self % other == 0`` the output is a
            :class:`SparsePolynomial`, otherwise a :class:`RationalFunction`.

        Examples::

            >>> from clue.rational_function import *
            >>> p1 = SparsePolynomial.from_string("x^2 + 2*x*y + y^2", ['x','y'])
            >>> p2 = SparsePolynomial.from_string("x+y", ['x','y'])
            >>> p1/p2
            x + y
            >>> isinstance(p1/p2, SparsePolynomial)
            True
            >>> p2/p1
            RationalFunction(1, x + y)
            >>> p1/"x"
            RationalFunction(x**2 + 2*x*y + y**2, x)
            >>> p1/10
            1/10*x**2 + 1/5*x*y + 1/10*y**2
            >>> isinstance(p1/10, SparsePolynomial)
            True

        '''
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            try:
                return other.__rtruediv__(self)
            except Exception:
                return NotImplemented
        
        if other.is_zero():
            raise ZeroDivisionError(f"Dividing by a zero SparsePolynomial")
        elif self.is_zero(): ## 0/other = 0
            return SparsePolynomial.from_const(0, self._varnames, self.domain)
        elif self == other: ## Other is self, hence the division is exact
            return SparsePolynomial.from_const(1, self._varnames, self.domain)
        elif self.is_constant() and other.is_constant(): ## Constant division
            return SparsePolynomial.from_const(self.ct / other.ct, self._varnames, self.domain)
        elif other.is_constant(): ## Direct division
            C = other.ct
            return SparsePolynomial(self._varnames, self.domain, {m : c / C for (m,c) in self._data.items()}, False)
        else: ## Keeping SparsePolynomial if the division is exact
            if (self % other).is_zero():  
                return self // other
            return RationalFunction(self, other)

    def __rtruediv__(self, other: SparsePolynomial) -> SparsePolynomial:
        ## Checking the argument "other"
        try:
            other = self.__check_SparsePolynomial(other)
        except TypeError:
            return NotImplemented

        return other / self

    # --------------------------------------------------------------------------

    def eval(self, **values: Element) -> SparsePolynomial:
        r'''
        Method to evaluate a polynomial.

        This method evaluates a polynomial substituting its variables by given values simultaneously.
        Currently, the only valid input for the values are elements contained in
        ``self.domain``.

        TODO: include evaluation with elements that are :class:`SparsePolynomial`.
        TODO: implement a wider evaluation with generic entries?

        Input
            values - dictionary containing the names fo the variables to be evaluated and the values to plug-in.

        Output
            the evaluated polynomial in the given values.

        Examples::

            >>> from clue.rational_function import *
            >>> sp = SparsePolynomial.from_string("x**2*z + y", ['x','y','z'])
            >>> sp.eval(x=2)
            4*z + y
            >>> sp.eval(x = 1/QQ(2), y = 3, z = 2)
            7/2
            >>> sp.eval(y=0)
            x**2*z
            >>> sp.eval()
            x**2*z + y
            >>> sp.eval(x=0, y=0)
            0
        '''
        # analyzing the values given
        rem_variables = [el for el in self.gens]
        for el in values:
            if el in rem_variables:
                rem_variables.remove(el)

        rem_variables_indices = [self._varnames.index(el) for el in rem_variables]
        rem_variables_indices = {el : i for (i,el) in enumerate(rem_variables_indices)}
        values = {
            self._varnames.index(el): (
                values[el].change_base(self.domain)
                if isinstance(values[el], NualNumber)
                else self.domain.convert(values[el])
            )
            for el in values
            if el in self._varnames
        }

        ## Here `rem_variables_indices` contains the indices of the variables remaining in the evaluation
        ## and values `values` contains a dictionary index -> value (instead of the name of the variable)
        new_data = {}
        for monomial, coefficient in self._data.items():
            C, rem_mon = monomial.eval(values)
            new_monomial = rem_mon.change_variables(rem_variables_indices)
            
            ## adding the new monomial
            if not new_monomial in new_data:
                new_data[new_monomial] = self.domain.zero
            new_data[new_monomial] += C*coefficient

        ## Returning the resulting polynomial (only remaining variables appear in the polynomial)
        return SparsePolynomial(rem_variables, self.domain, new_data, cast=True)

    def subs(self, to_subs=None, **values):
        r'''
        More generic method that allows to substitute in a SparsePolynomial all the appearing variables.

        Examples::

            >>> from clue.rational_function import *
            >>> p = SparsePolynomial.from_string("x**2 + y", ["x", "z", "y"])
            >>> q1 = SparsePolynomial.from_string("x**2 + z", ["x", "z"])
            >>> q2 = SparsePolynomial.from_string("z-x", ["x", "z"])
            >>> p.subs([("x", q1), ("y", q2)])
            x**4 + 2*x**2*z + z**2 + z - x
            >>> p.subs(x=q1, y=q2)
            x**4 + 2*x**2*z + z**2 + z - x
        '''
        if isinstance(to_subs, (list, tuple)):
            if len(values) > 0:
                raise TypeError(
                    "The method subs works either with a list of substitutions or with a dictionary, not mixed"
                )
            values = {str(var): val for (var, val) in to_subs}

        if any(not v in values for v in self.variables()):
            raise TypeError(
                f"Not enough variables were given for substitution. Required {self.variables()}, given {list(values.keys())}"
            )

        # we assume the user has provided everything of the same type
        to_sub = {self._varnames.index(k): v for (k, v) in values.items()}
        result = 0
        for monomial, coefficient in self._data.items():
            C, rem_mon = monomial.eval(to_sub)
            mon = SparsePolynomial.monomial(rem_mon, self._varnames, self.domain) if rem_mon else 1
            result += C*coefficient*mon
        
        return result

    @cached_property
    def numerical_evaluator(self):
        return eval(f"lambda {','.join(self._varnames)}: {str(self)}")

    def automated_diff(self, **values: Element) -> NualNumber:
        r'''
        Method to compute automated differentiation of a Sparse polynomial

        This method uses the idea of Automatic Differentiation to compute
        using an evaluation with `n`-ual numbers (see class:`clue.nual.NualNumber`)
        the evaluation of the polynomial together with all the evaluations of
        the partial derivatives of the polynomial.

        This method only works if the provided values covers all possible variables
        of the polynomial.

        Input:
            ``values`` - dictionary with ``(varname, value)`` for (at least) all the variables
            appearing in ``self`` (see method ``variables``).

        Output:
            A tuple `(p_0,...,p_k)` where `p_0` is the evaluation of ``self`` at the given point,
            and `p_i` is the evaluation of the partial derivative of ``self`` at the given point
            with respect to the `i`-th variable of ``self.gens``.

        Examples::

            TODO add the examples
        '''
        if any(v not in values for v in self.variables()):
            raise ValueError(
                "Not enough information provided for automatic differentiation"
            )

        gens = self._varnames
        n = len(gens)

        if self.is_constant():
            return NualNumber.constant(self.ct, n, self.domain)
        to_eval = {
            gens[i]: NualNumber(
                [self.domain.convert(values.get(gens[i], 0))] + [self.domain.one if j == i else self.domain.zero for j in range(n)],
                self.domain
            )
            for i in range(n)
        }

        result = self.eval(**to_eval).ct
        if not isinstance(result, NualNumber):  # evaluation was zero
            return NualNumber.zero(n + 1, self.domain)
        return result

    # --------------------------------------------------------------------------

    def exp(self, power: int) -> SparsePolynomial:
        '''
        Exponentiation, ``power`` is a *positive* integer
        '''
        if power not in self.__cache_pow:
            if power < 0:
                raise ValueError(f"Cannot raise to power {power}, {str(self)}")
            if power == 0:
                self.__cache_pow[0] = SparsePolynomial.from_const(1, self._varnames, self.domain)
            if power == 1:
                self.__cache_pow[1] = self
            self.__cache_pow[power] = self.exp(power // 2) * self.exp(power // 2 + power % 2)
        return self.__cache_pow[power]

    # --------------------------------------------------------------------------

    def is_zero(self) -> bool:
        r'''
        Checks equality with `0`.

        This methods checks whether a :class:`SparsePolynomial` is exactly 0 or not.

        Output
            ``True`` if ``self == 0`` holds.

        Examples::

            >>> from clue.rational_function import *
            >>> sp = SparsePolynomial.from_string("1",['x'])
            >>> sp.is_zero()
            False
            >>> sp = SparsePolynomial(['x'])
            >>> sp.is_zero()
            True
            >>> sp = SparsePolynomial.from_string("x**2*y - 2*x*y", ['x','y','z'])
            >>> sp.is_zero()
            False
        '''
        return len(self._data) == 0

    def is_one(self) -> bool:
        r'''
        Checks equality with `1`.

        This methods checks whether a :class:`SparsePolynomial` is exactly 1 or not.

        Output
            ``True`` if ``self == 1`` holds.

        Examples::

            >>> from clue.rational_function import *
            >>> sp = SparsePolynomial.from_string("1",['x'])
            >>> sp.is_one()
            True
            >>> sp = SparsePolynomial(['x'])
            >>> sp.is_one()
            False
            >>> sp = SparsePolynomial.from_string("x**2*y - 2*x*y", ['x','y','z'])
            >>> sp.is_one()
            False
        '''
        return self.is_constant() and self.ct == self.domain.one

    def is_constant(self) -> bool:
        r'''
        Checks whether a polynomial is a constant

        This method checks whether a :class:`SparsePolynomial` is a constant or not. For doing so
        we simply check if ``self`` is zero (see :func:`is_zero`) or if the only monomial in the
        polynomial is `()` (i.e., the monomial `1`).

        Output
            ``True`` if ``self`` is a constant polynomial, ``False`` otherwise.

        Examples::

            TODO: add examples
        '''
        return self.is_zero() or self.degree() == 0

    def is_linear(self) -> bool:
        r'''
            Method to checkt whether a :class:`SparsePolynomial` is linear or not.

            Examples::

                >>> from clue import *
                >>> p = SparsePolynomial.from_string("3*x + 2*y - 1", ["x", "y"])
                >>> p.is_linear()
                True
                >>> p = SparsePolynomial.from_const(1, ["a", "b", "c"])
                >>> p.is_linear()
                True
                >>> p = SparsePolynomial(["x", "a"])
                >>> p.is_linear()
                True
                >>> p = SparsePolynomial.from_string("3*x**2 + 2*y - 1", ["x", "y"])
                >>> p.is_linear()
                False
                >>> p = SparsePolynomial.from_string("3*x + 2*y*x - 1", ["x", "y"])
                >>> p.is_linear()
                False
                >>> p = SparsePolynomial.from_string("3*x + 2*y**5 - 1", ["x", "y"])
                >>> p.is_linear()
                False
        '''
        return self.degree() in (0, 1, oo)

    # --------------------------------------------------------------------------

    def _scalar_to_str(self, c) -> str:
        # not an elegant way to force elements of algebraic fields be printed with sqrt
        if isinstance(c, sympy.polys.polyclasses.ANP):
            dummy_ring = sympy.ring([], self.domain)[0]
            return f"({dummy_ring(c).as_expr()})"
        if isinstance(c, sympy.polys.fields.FracElement):
            return f"({c})"
        return str(c)

    # --------------------------------------------------------------------------

    def _term_to_str(self, m: SparseMonomial, c) -> str:
        if c == self.domain.zero:
            return "+", "0"

        prefix = "+"
        try: # Checking sign if the domain is ordered
            if c < 0:
                c *= -1
                prefix = "-"
        except Exception:
            pass

        if not m: # The monomial is the 1
            return prefix, self._scalar_to_str(c)

        # at this moment the coefficient is positive (or not comparable to 0)
        return prefix, (
            "" if c == self.domain.one else self._scalar_to_str(c) + "*"
        ) + m.to_string(self._varnames)


    # --------------------------------------------------------------------------

    def __repr__(self) -> str:
        if not self._data:
            return "0"
        # at least one term is included in the polynomial
        terms = [self._term_to_str(m, c) for m, c in self._data.items()]

        return (
            (terms[0][0] if terms[0][0] == "-" else "")
            + terms[0][1]
            + (" " if len(terms) > 1 else "")
            + " ".join(" ".join(term) for term in terms[1:])
        )

    # --------------------------------------------------------------------------

    def linear_part_as_vec(self) -> SparseVector:
        r'''
            Method to convert the linear part of a :class:`SparsePolynomial` into a :class:`SparseVector`

            This method converts the coefficients from the linear terms (i.e., terms of degree exactly 1)
            into a :class:`SparseVector`. This vector will have as many dimensions as number of variables 
            ``self`` has and their order is determined by ``self._varnames``.

            The other coefficients are ignored and no error is raised if other monomials are present in 
            ``self``.

            Examples::

                >>> from clue import *
                >>> p = SparsePolynomial.from_string("1 + 3*x - 2*y + z + z*x - y*z + y*x", ["x", "y", "z"])
                >>> p.linear_part_as_vec().to_list()
                [MPQ(3,1), MPQ(-2,1), MPQ(1,1)]
                >>> p = SparsePolynomial.from_string("1 + 3*x - 2*y + z + z*x - y*z + y*x", ["z", "x", "y"])
                >>> p.linear_part_as_vec().to_list()
                [MPQ(1,1), MPQ(3,1), MPQ(-2,1)]
                >>> p = SparsePolynomial.from_string("1 + z + z*x - y*z + y*x", ["z", "x", "y"])
                >>> p.linear_part_as_vec().to_list()
                [MPQ(1,1), 0, 0]
        '''
        out = SparseVector(len(self._varnames), self.domain)
        for i in range(len(self._varnames)):
            v = SparseMonomial([(i, 1)])
            if v in self._data:
                out[i] = self._data[v]
        return out

    # --------------------------------------------------------------------------

    def get_sympy_dict(self) -> dict[list[int],Element]:
        result = dict()
        for monom, coef in self._data.items():
            new_monom = [0] * len(self._varnames)
            for var, exp in monom.items():
                new_monom[var] = exp
            result[tuple(new_monom)] = coef
        return result

    # --------------------------------------------------------------------------

    def get_constant(self) -> Element:
        return self.constant_term

    def get_sympy_ring(self):
        if isinstance(self.domain, NumericalField):
            raise NotImplementedError(f"Sympy Polynomial Ring not defined for NumericalField domains")
        return sympy.polys.rings.ring(self._varnames, self.domain)[0]

    def to_sympy(self):
        r'''
        Returns the SymPy polynomial represented by ``self``.

        All the elements of type :class:`SparsePolynomial` can be transformed into
        an element in a SymPy polynomial ring. This is useful for some functionalities
        (see :func:`lcm` and :func:`gcd`).

        This method is simply a natural sequence of the methods :func:`get_sympy_ring`
        and :func:`get_sympy_dict`.

        Output
            A SymPy polynomial represented by ``self``.

        Examples::

            >>> from clue.rational_function import *
            >>> sp = SparsePolynomial.from_string("x**2*y-x*z**2", ['x','y','z'])
            >>> type(sp.to_sympy())
            <class 'sympy.polys.rings.PolyElement'>
            >>> sp.to_sympy()
            x**2*y - x*z**2
            >>> SparsePolynomial.from_sympy(sp.to_sympy()) == sp
            True
        '''
        return self.get_sympy_ring()(self.get_sympy_dict())

    def change_base(self, new_domain: Domain) -> SparsePolynomial:
        r'''Change the domain of the SparsePolynomial and creates a copy for it'''
        return SparsePolynomial(self._varnames, new_domain, self._data, True)

    # --------------------------------------------------------------------------
    def derivative(self, var_name: str) -> SparsePolynomial:
        '''
        Returns derivative of polynomial with respect to var_name
        '''
        if var_name in self._varnames:
            var = self._varnames.index(var_name)
        else:
            return 0

        data = dict()
        for monom, coeff in self._data.items():
            c, nm = monom.derivative(var)
            if c != 0:
                data[nm] = c * coeff

        return SparsePolynomial(self._varnames, self._domain, data, False)

    # --------------------------------------------------------------------------

    @staticmethod
    def lcm(polys: list[SparsePolynomial]) -> SparsePolynomial:
        r'''
        Returns lowest common multiple of given polynomials (computed w/ SymPy)

        This method computes (using SymPy) the least common multiple of a list of
        sparse polynomials. This method assumes that all the :class:`SparsePolynomials`
        generates the same SymPy ring (see method :func:`get_sympy_ring`) and
        can be casted naturally to it.

        Input
            ``polys`` - list of sparse polynomials to compute the least common multiple.

        Output
            A :class:`SparsePolynomial` with the least common multiple of all the
            polynomials in ``polys``.

        Examples::

            >>> from clue.rational_function import *
            >>> sp1 = SparsePolynomial.from_string("x*y**2 + x**2*y", ['x','y'])
            >>> sp2 = SparsePolynomial.from_string("x**2*y**2", ['x','y'])
            >>> lcm = SparsePolynomial.lcm([sp1,sp2])
            >>> lcm == SparsePolynomial.from_string("x**2*y**3 + x**3*y**2", ['x','y'])
            True
        '''
        sympy_polys = [p.to_sympy() for p in polys]
        result = sympy_polys[0]
        for p in sympy_polys[1:]:
            result = result.lcm(p)
        return SparsePolynomial.from_sympy(result)

    @staticmethod
    def gcd(polys: list[SparsePolynomial]) -> SparsePolynomial:
        '''
        Returns greatest common divisor of given polynomials (computed w/ SymPy)
        '''
        polys_sp = [p.to_sympy() for p in polys]
        result = polys_sp[0]
        for p in polys_sp[1:]:
            result = result.gcd(p)
        return SparsePolynomial.from_sympy(result)

    # --------------------------------------------------------------------------

    @staticmethod
    def from_sympy(sympy_poly, varnames: Optional[list[str]] = None) -> SparsePolynomial:
        r'''Static method inverse to :func:`to_sympy`'''
        domain = sympy_poly.ring.domain
        # lambda used to handle the case of the algebraic field of coefficients
        if varnames is None:
            varnames = list(map(lambda g: str(g.as_expr()), sympy_poly.ring.gens))
        data = dict()
        sympy_dict = sympy_poly.to_dict()
        for monom, coef in sympy_dict.items():
            new_monom = []
            for i in range(len(monom)):
                if monom[i]:
                    new_monom.append((i, monom[i]))
            data[SparseMonomial(new_monom)] = coef
        return SparsePolynomial(varnames, domain, data)

    @staticmethod
    def from_vector(vector: SparseVector | Collection, varnames: list[str] = None, domain: Domain = QQ) -> SparsePolynomial:
        r'''
            Static method inverse to :func:`linear_part_as_vec`. It returns the same polynomial only if the original polynomial was linear
            without a constant term.
            
            Examples:: 

                >>> from clue import *
                >>> p = SparsePolynomial.from_string("1 + 3*x - 2*y + z + z*x - y*z + y*x", ["x", "y", "z"])
                >>> SparsePolynomial.from_vector(p.linear_part_as_vec(), p.gens, p.domain)
                3*x - 2*y + z
                >>> p = SparsePolynomial.from_string("3*x + 2*y", ["x", "y"])
                >>> p == SparsePolynomial.from_vector(p.linear_part_as_vec(), p.gens, p.domain)
                True
        '''
        if isinstance(vector, SparseVector):
            if len(varnames) != vector.dim:
                raise TypeError(
                    f"The list must have as many elements ({len(vector)}) as variables ({len(varnames)})"
                )
            domain = vector.field
            data = {SparseMonomial([(i, 1)]): vector[i] for i in vector.nonzero}
            cast = False
        else:
            if len(vector) != len(varnames):
                raise TypeError(
                    f"The list must have as many elements ({len(vector)}) as variables ({len(varnames)})"
                )
            data = {SparseMonomial([(i, 1)]): el for i, el in enumerate(vector) if el != 0}
            cast = True
        return SparsePolynomial(varnames, domain, data, cast)

    # --------------------------------------------------------------------------

    @staticmethod
    def monomial(monomial: SparseMonomial, varnames: list[str], domain: Domain) -> SparsePolynomial:
        if not isinstance(monomial, SparseMonomial):
            monomial = SparseMonomial(monomial)
        return SparsePolynomial(varnames, domain, {monomial : domain.one}, False)

    @staticmethod
    def variable(vname: str, varnames: list[str], domain: Domain = QQ) -> SparsePolynomial:
        i = varnames.index(vname)
        return SparsePolynomial.monomial([(i,1)], varnames, domain)

    @staticmethod
    def from_const(c: Any, varnames: list[str], domain: Domain = QQ) -> SparsePolynomial:
        return SparsePolynomial(varnames, domain, {SparseMonomial(()): c})

    @staticmethod
    def from_string(s: str, varnames: list[str], domain: Domain = QQ) -> SparsePolynomial:
        return RationalFunction.from_string(s, varnames, domain).get_poly()

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------


class RationalFunction:
    r'''
        Class for representing rational function with sparse polynomials

        Input:
            ``num`` - numerator SparsePolynomial
            ``denom`` - denominator SparsePolynomial

        Examples::

            >>> from clue.rational_function import *
            >>> from sympy import parse_expr, simplify
            >>> rat_fun = "0.1"
            >>> parsed = parse_expr(rat_fun)
            >>> rf = RationalFunction.from_string(rat_fun, ["a", "b", "c"])
            >>> simplify(parse_expr(str(rf)) - parsed) == 0
            True
            >>> rat_fun = "1 / a + 1 / b"
            >>> parsed = parse_expr(rat_fun)
            >>> rf = RationalFunction.from_string(rat_fun, ["a", "b", "c"])
            >>> simplify(parse_expr(str(rf)) - parsed) == 0
            True
            >>> rat_fun = "1 / (1 + 1/b + 1/(c + 1 / (a + b + 1/c)))"
            >>> parsed = parse_expr(rat_fun)
            >>> rf = RationalFunction.from_string(rat_fun, ["a", "b", "c"])
            >>> simplify(parse_expr(str(rf)) - parsed) == 0
            True
            >>> rat_fun = "(a + b) / (1 - a + 1/ (b + c)) - 3/5 + (7 + a) / (c + 1 / b)"
            >>> parsed = parse_expr(rat_fun)
            >>> rf = RationalFunction.from_string(rat_fun, ["a", "b", "c"])
            >>> simplify(parse_expr(str(rf)) - parsed) == 0
            True
            >>> rat_fun = "(a + b + c**2)**5 - 3 * a + b * 17 * 19 * 0.5"
            >>> parsed = parse_expr(rat_fun)
            >>> rf = RationalFunction.from_string(rat_fun, ["a", "b", "c"])
            >>> simplify(parse_expr(str(rf)) - parsed) == 0
            True
    '''

    __parser = None
    __parser_stack = []

    def __init__(self, numer: SparsePolynomial, denom: SparsePolynomial):
        if isinstance(numer, SparsePolynomial) and isinstance(denom, SparsePolynomial):
            try:
                numer, denom = numer, numer._SparsePolynomial__check_SparsePolynomial(denom)
            except TypeError:
                try:
                    numer, denom = denom._SparsePolynomial__check_SparsePolynomial(numer), denom
                except TypeError:
                    raise TypeError(f"Incompatible SparsePolynomials for a Rational Function")
        elif isinstance(numer, SparsePolynomial):
            denom = numer._SparsePolynomial__check_SparsePolynomial(denom)
        elif isinstance(denom, SparsePolynomial):
            numer = denom._SparsePolynomial__check_SparsePolynomial(numer)

        ## numer and denom are SparsePolynomial with same domain and variables
        if denom.is_zero():
            raise ZeroDivisionError(f"Trying to create a RationalFunction with zero denominator")

        ## Assigning the values for the rational function
        self._domain = numer.domain
        self._varnames = numer.gens
        self.numer = numer
        self.denom = (
            denom
            if not self.numer.is_zero()
            else SparsePolynomial.from_const(1, self.numer._varnames, self._domain)
        )

        ## Simplifying the rational function if the denominator is not 1
        if self._domain.is_Exact and denom != SparsePolynomial.from_const(
            1, self.gens, self.domain
        ):
            self.simplify()

        self.__cache_pow = dict()

    @staticmethod
    def from_const(val, varnames: list[str], domain: Domain = QQ) -> RationalFunction:
        return RationalFunction(
            SparsePolynomial.from_const(val, varnames, domain),
            SparsePolynomial.from_const(1, varnames, domain),
        )

    # --------------------------------------------------------------------------
    def is_polynomial(self) -> bool:
        return self.denom.is_constant()

    def get_poly(self) -> SparsePolynomial:
        if self.is_polynomial():
            return self.numer * (self.domain.one / self.denom.ct)
        raise ValueError(f"{self} is not a polynomial")

    def is_zero(self) -> bool:
        return self.numer.is_zero()

    def is_constant(self) -> bool:
        return self.is_zero() or (self.numer.is_constant() and self.denom.is_constant())

    # --------------------------------------------------------------------------
    @property
    def domain(self) -> Domain:
        return self._domain

    # --------------------------------------------------------------------------
    @property
    def gens(self) -> tuple[str]:
        return self._varnames.copy()

    # --------------------------------------------------------------------------
    @property
    def size(self) -> int:
        return self.denom.size + self.numer.size

    def variables(self, as_poly: bool = False) -> list[SparsePolynomial|str]:
        return tuple(
            set(
                list(self.numer.variables(as_poly))
                + list(self.denom.variables(as_poly))
            )
        )

    # --------------------------------------------------------------------------
    def valuation(self, var_name: str) -> int:
        r'''
            Valuation of a rational function w.r.t. a variable.

            A valuation is a map `\nu: D \rightarrow \mathbb{Z}` such that

            .. MATH::

                nu(p\cdot q) = \nu(p) + \nu(q) \qquad \nu(p + q) \geq \min(\nu(p), \nu(q))

            In particular, the functions `\nu_v(p/q) = \deg_v(p) - \deg_v(q)` is such a
            valuation. This method returns the valuation w.r.t. a variable of this
            rational function. It is based on the method :func:`clue.rational_function.SparsePolynomial.degree`.

            Input
                ``var_name`` - name (string) of the variable to compute the degree.

            Output
                The valuation of ``self`` w.r.t. ```var_name``.

            TODO: add examples and tests
        '''
        return self.numer.degree(var_name) - self.denom.degree(var_name)

    # --------------------------------------------------------------------------
    def derivative(self, var: str) -> RationalFunction:
        r'''
            Compute the derivative with respect to a given variable.

            This method computes the derivative of the rational function represented by ``self``
            with respect to a variable provided by ``var``.

            A rational function `f(x) = p(x)/q(x)` always satisfies the quotient rule for derivations:

            .. MATH::

                f'(x) = \frac{p'(x)q(x) - q'(x)p(x)}{q(x)^2}

            This method uses such formula and the method :func:`~clue.rational_function.SparsePolynomial.derivative`.

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
                RationalFunction(0, 1)
                >>> rf1.derivative('a') == 0
                True
                >>> rf1.derivative('xy') == 0
                True
                >>> rf = RationalFunction.from_string("(x)/(2 * y**2)", varnames)
                >>> rf_dz = rf.derivative('z')
                >>> print(rf_dz)
                (0)/(1)
        '''
        d_num = self.denom * self.numer.derivative(var) - self.numer * self.denom.derivative(var)
        d_denom = self.denom * self.denom
        return RationalFunction(d_num, d_denom)

    # --------------------------------------------------------------------------
    def simplify(self) -> None:
        r'''
            Simplify a rational function in-place.

            Method that removes the common factors between the numerator and
            denominator of ``self``. It is based on the method :func:`~clue.rational_function.SparsePolynomial`
            and the exact division implementation.

            The simplification is performed *in-place*, meaning there is no output for this method, but
            instead, the result is stored within the same object.
        '''
        # Removing the gcd of numerator and denominator (whatever Sympy finds)
        gcd = SparsePolynomial.gcd([self.numer, self.denom])
        if not gcd.is_one():
            self.numer = self.numer // gcd
            self.denom = self.denom // gcd

        # Removing the content of the denominator
        c = SparsePolynomial.from_const(self.denom.content, self.gens, self.domain)
        if not c.is_one():
            self.numer = self.numer // c
            self.denom = self.denom // c

    # --------------------------------------------------------------------------
    def __str__(self) -> str:
        return f"({self.numer})/({self.denom})"

    def __repr__(self) -> str:
        return f"RationalFunction({self.numer}, {self.denom})"

    # --------------------------------------------------------------------------
    def __mul__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        if isinstance(other, RationalFunction):
            rf = RationalFunction(self.numer * other.numer, self.denom * other.denom)
        else:
            rf = RationalFunction(self.numer * other, self.denom)
        return rf

    def __rmul__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        return self.__mul__(other)

    def __add__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        if isinstance(other, RationalFunction):
            if self.denom == other.denom:
                rf = RationalFunction(self.numer + other.numer, self.denom)
            else:
                rf = RationalFunction(
                    self.numer * other.denom + other.numer * self.denom,
                    self.denom * other.denom,
                )
            return rf
        elif isinstance(other, SparsePolynomial):
            return self + RationalFunction(
                other, SparsePolynomial.from_const(1, self.gens, self.domain)
            )
        else:
            return self + RationalFunction.from_const(other, self.gens, self.domain)

    def __radd__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        return self.__add__(other)

    def __truediv__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        if isinstance(other, RationalFunction): # basic case
            return RationalFunction(self.numer * other.denom, self.denom * other.numer)
        else:
            return RationalFunction(self.numer, self.denom * other)

    def __rtruediv__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        if isinstance(other, RationalFunction): # basic case
            return RationalFunction(self.denom * other.numer, self.numer * other.denom)
        else:
            return RationalFunction(self.denom, self.numer * other)

    def __pow__(self, exp: int) -> RationalFunction:
        return RationalFunction(self.numer**exp, self.denom**exp)

    # --------------------------------------------------------------------------

    def __neg__(self) -> RationalFunction:
        return RationalFunction(-self.numer, self.denom)

    def __sub__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        return self + (-other)

    def __rsub__(self, other: SparsePolynomial | RationalFunction) -> RationalFunction:
        return self.__neg__().__add__(other)

    # --------------------------------------------------------------------------
    def eval(self, **values) -> RationalFunction:
        r'''
            Method that evaluates a rational function.

            This method evaluates a rational function performing a simultaneous substitution of the
            given variables for some specific values. This is based on the method
            :func:`~clue.rational_function.SparsePolynomial.eval`. See that method for further
            limitations.

            Input
                values - dictionary containing the names fo the variables to be evaluated and the values to plug-in.

            Output
                the evaluation in the given values.

            Examples::

                >>> from clue.rational_function import *
                >>> rf = RationalFunction.from_string("x/(y*z**2)", ['x','y','z'])
                >>> print(rf.eval(x=0))
                0
                >>> print(rf.eval(y=1,z=2))
                1/4*x
                >>> print(rf.eval(y=2))
                (1/2*x)/(z**2)

            The denominator can not be evaluated to zero, or an :class:`ZeroDivisionError` would be raised::

                >>> print(rf.eval(y=0))
                Traceback (most recent call last):
                ...
                ZeroDivisionError: A zero from the denominator was found
        '''
        # we evaluate first the denominator
        denom = self.denom.eval(**values)

        if denom.is_zero():  # if zero: raise an error
            raise ZeroDivisionError("A zero from the denominator was found")

        # otherwise we evaluate numerator and compute the quotient
        numer = self.numer.eval(**values)
        return numer / denom

    def subs(self, to_subs=None, **values):
        r'''
            Method to substitute variables in a rational function (not only with points)

            See method :func:`clue.rational_functions.SparsePolynomial.subs` for further information.
        '''
        denom = self.denom.subs(to_subs, **values)

        if denom == 0:
            raise ZeroDivisionError("A zero from the denominator was found while substituting")

        numer = self.numer.subs(to_subs, **values)
        return numer / denom

    @cached_property
    def numerical_evaluator(self):
        return eval(
            f"lambda {','.join(self._varnames)}: ({str(self.numer)})/({str(self.denom)})"
        )

    def automated_diff(self, **values: Element) -> NualNumber:
        return self.numer.automated_diff(**values) / self.denom.automated_diff(**values)

    # --------------------------------------------------------------------------
    def get_constant(self) -> Element:
        return self.numer.ct / self.denom.ct

    def linear_part_as_vec(self) -> SparseVector:
        constant_parts = self.automated_diff(**{v: 0 for v in self.gens})
        out = SparseVector(len(self.gens), self.domain)
        for i in range(len(self.gens)):
            out[i] = constant_parts[i + 1]
        return out

    def get_sympy_ring(self):
        return self.numer.get_sympy_ring()

    def change_base(self, new_domain: Domain) -> RationalFunction:
        r'''Change the domain of the RationalFunction'''
        return RationalFunction(
            self.numer.change_base(new_domain), self.denom.change_base(new_domain)
        )

    # --------------------------------------------------------------------------
    def __eq__(self, other: SparsePolynomial | RationalFunction) -> bool:
        r'''
            Equality method for :class:`RationalFunction`.

            Two rational functions `p(x)/q(x)` and `r(x)/s(x)` are equal if and only if

            .. MATH::

                p(x)s(x) - q(x)r(x) = 0.

            This method checks such identity for ``self`` and ``other``. In case that ``other``
            is not a :class:`RationalFunction`, the method :func:`RationalFunction.from_string`
            is used to try and convert ``other`` into a rational function.

            Since we need to check and identity of polynomials, this method is based on
            :func:`clue.rational_function.SparsePolynomial.__eq__`.

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
        '''
        if not isinstance(other, RationalFunction):
            if isinstance(other, SparsePolynomial):
                other = RationalFunction(other, SparsePolynomial.from_const(1, other._varnames, other._domain))
            elif other in self.domain:
                other = RationalFunction.from_const(other, self._varnames, self.domain)
            elif isinstance(other, str):
                other = RationalFunction.from_string(
                    str(other), self.gens, self.domain
                )
            
        
        return self.numer * other.denom == other.numer * self.denom

    def __hash__(self) -> int:
        return hash(self.numer) * hash(self.denom)

    # --------------------------------------------------------------------------
    def exp(self, power: int) -> RationalFunction:
        '''
            Exponentiation, ``power`` is a *positive* integer
        '''
        return self**power

    # --------------------------------------------------------------------------
    @staticmethod
    def from_string(s: str, varnames: list[str], domain: Domain = QQ, var_to_ind: dict[str,int] = None) -> RationalFunction:
        '''
            Parsing a string to a polynomial, string is allowed to include floating-point numbers
            in the standard and scientific notation, they will be converted to rationals

            The code is an adapted version of fourFn example for pyparsing library by Paul McGuire
            https://github.com/pyparsing/pyparsing/blob/master/examples/fourFn.py
        '''

        def push_first(toks):
            RationalFunction.__parser_stack.append(toks[0])

        def push_unary_minus(toks):
            for t in toks:
                if t == "-":
                    RationalFunction.__parser_stack.append("unary -")
                else:
                    break

        # Creating a parser instance if necessary
        if RationalFunction.__parser is None:
            fnumber = Regex(r"[+-]?\d+(?:\.\d*)?(?:[eE][+-]?\d+)?")
            ident = Regex(
                f"(\\d[{alphanums+'_$'}]*[{alphas}]+[{alphanums+'_$'}]*)|([{alphas}]+[{alphanums+'_$'}]*)"
            )  # Word(alphanums, alphanums + "_$") # ident = Word(alphas, alphanums + "_$")
            plus, minus, mult, div = map(Literal, "+-*/")
            lpar, rpar = map(Suppress, "()")
            addop = plus | minus
            multop = mult | div
            expop = Literal("^") | Literal("**")

            expr = Forward()
            atom = (
                addop[...]
                + (
                    (fnumber | ident).setParseAction(
                        push_first
                    )  # (ident | fnumber).setParseAction(push_first)
                    | Group(lpar + expr + rpar)
                )
            ).setParseAction(push_unary_minus)

            factor = Forward()
            factor <<= atom + (expop + factor).setParseAction(push_first)[...]
            term = factor + (multop + factor).setParseAction(push_first)[...]
            expr <<= term + (addop + term).setParseAction(push_first)[...]
            RationalFunction.__parser = expr

        # parsing
        try:
            RationalFunction.__parser.parseString(s, parseAll=True)
        except:
            print(s)
            raise

        # for fast lookup
        var_ind_map = (
            {v: i for i, v in enumerate(varnames)} if var_to_ind is None else var_to_ind
        )

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
                    return op1 / op2
            if op == "^" or op == "**":
                exp_str = s.pop()
                exp = to_rational(exp_str)
                if exp.denominator != 1:
                    raise ValueError(
                        "invalid literal for int() with base 10: %s" % exp_str
                    )
                exp = int(exp)
                base = evaluate_stack(s)
                return base.exp(exp)
            if re.match(r"^[+-]?\d+(?:\.\d*)?(?:[eE][+-]?\d+)?$", op):
                return RationalFunction.from_const(to_rational(op), varnames, domain)
            return RationalFunction(
                SparsePolynomial(
                    varnames, domain, {SparseMonomial([(var_ind_map[op], 1)]): domain.one}
                ),
                SparsePolynomial.from_const(1, varnames, domain),
            )

        return evaluate_stack(RationalFunction.__parser_stack)

    @staticmethod
    def from_sympy(sympy_expr, varnames: list[str], domain: Domain = QQ) -> RationalFunction:
        num, den = sympy_expr.as_expr().as_numer_denom()
        num = SparsePolynomial.from_string(str(num), varnames, domain)
        den = SparsePolynomial.from_string(str(den), varnames, domain)
        return RationalFunction(num, den)


# ------------------------------------------------------------------------------

__all__ = ["SparsePolynomial", "RationalFunction"]
