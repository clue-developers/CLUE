import re

from functools import reduce

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
from sympy import QQ, oo

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

    def __init__(self, varnames, domain=QQ, data=None):
        self._varnames = varnames
        self._domain = domain
        self._data = dict() if data is None else {key : data[key] for key in data if data[key] != QQ(0)}

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
                >>> from clue.rational_function import SparsePolynomial
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
                >>> from clue.rational_function import SparsePolynomial
                >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
                >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
                >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
                >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
                >>> p.coefficients
                (1, 1/2, 3, 5)
                >>> SparsePolynomial.from_const(10, ["x", "y"]).coefficients
                (10,)

            This method return an empty tuple if no monomial is contained, i.e., the polynomial 
            is equal to zero::

                >>> SparsePolynomial(["x", "y"], QQ).coefficients
                ()
                >>> SparsePolynomial.from_const(0, ["x", "y"]).coefficients
                ()

            The same polynomial can be obtained using together the method :func:`monomials`::

                >>> n = len(p.dataiter())
                >>> p == sum([p.coefficients[i]*p.monomials[i] for i in range(n)], SparsePolynomial(p.gens, p.domain))
                True
        '''
        return tuple([el[1] for el in self.dataiter()])
    
    @property
    def content(self):
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
        '''
        return sympy.polys.polytools.gcd(self.coefficients)

    @property
    def constant_term(self):
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
                -10
                >>> sp = SparsePolynomial.from_string("x - y", ['x','y'])
                >>> sp.constant_term
                0
                >>> sp = SparsePolynomial.from_const(13, ['x','y','z'])
                >>> sp.constant_term
                13
                >>> sp = SparsePolynomial(['x']) # zero polynomial
                >>> sp.constant_term
                0

            This property can also be obtained via :func:`ct`::

                >>> sp.ct
                0
        '''
        return self._data.get((), self.domain.zero)

    ct = constant_term #: alias for the constant term property

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
                >>> from clue.rational_function import SparsePolynomial
                >>> x = SparsePolynomial(["x", "y"], QQ, {tuple([(0,1)]): 1})
                >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
                >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
                >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
                >>> p.linear_components
                ((1, x, y, x*y), (1, 1/2, 3, 5))
        '''
        return self.monomials, self.coefficients

    def degree(self, var_name=None):
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
                >>> y = SparsePolynomial(["x", "y"], QQ, {tuple([(1,1)]): 1})
                >>> one = SparsePolynomial(["x", "y"], QQ, {(): 1})
                >>> p = one + x//(2*one) + (3*one)*y + (5*one)*x*y
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
                ValueError: the variable z is not valid for this polynomial

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
                ValueError: the variable a is not valid for this polynomial
                >>> SparsePolynomial.from_const(0, ['x','y']).degree()
                oo
        ''' 
        if(var_name is None):
            degree_fun = lambda monomial : sum(el[1] for el in monomial)
        elif(var_name not in self.gens):
            raise ValueError("the variable %s is not valid for this polynomial" %var_name)
        else:
            def degree_fun(monomial):
                var_index = self.gens.index(var_name)
                red = [el for el in monomial if el[0] == var_index]
                if(len(red) == 0):
                    return 0
                return red[0][1]
        
        if(self.is_zero()):
            return oo

        return max([degree_fun(term[0]) for term in self.dataiter()])

    def variables(self, as_poly=False):
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
        var_index = list(set(sum([[var[0] for var in term[0]] for term in self.dataiter()], [])))

        result = [self.gens[var_index[i]] for i in range(len(var_index))]
        if(as_poly): result = [SparsePolynomial.var_from_string(name, self.gens) for name in result]

        return tuple(result)
    #--------------------------------------------------------------------------

    def __add__(self, other):
        result = SparsePolynomial(self.gens, self.domain)
        resdata = dict()
        for m, c in self._data.items():
            sum_coef = c + other._data.get(m, self.domain(0))
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
            sum_coef = c + self._data.get(m, self.domain(0))
            if sum_coef != 0:
                self._data[m] = sum_coef
            else:
                if m in self._data:
                    del self._data[m]
        return self

    #--------------------------------------------------------------------------

    def __neg__(self):
        return SparsePolynomial(self.gens, self.domain, {m: -c for m, c in self._data.items()})

    def __sub__(self, other):
        return self + (-other)

    def __rsub__(self, other):
        return self.__neg__().__add__(other)

    def __isub__(self, other):
        self += (-other)
        return self

    #--------------------------------------------------------------------------
    
    def __eq__(self, other):
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
            result = SparsePolynomial(self.gens, self.domain)
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
            result = SparsePolynomial(self.gens, self.domain)
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

            **Warning:** when the variables of the divisor are not included in the variables of the dividend, 
            some weird phenomena could happen::

                >>> sp1 = SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x','y'])
                >>> sp2 = SparsePolynomial.from_string("x+y", ['x','y'])
                >>> sp1//sp2
                4 + x**2 + y**2 + -3*y + 3*x + -x*y
                >>> sp3 =  SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x'])
                >>> sp3 == sp1
                True
                >>> sp3//sp2
                2 + x**2 + 2*x
        '''
        if(self.is_zero()):
            return SparsePolynomial.from_const(0 , self.gens)
        elif(self == other):
            return SparsePolynomial.from_const(1 , self.gens)
        elif(self.is_constant() and other.is_constant()):
            return SparsePolynomial.from_const(self.ct/other.ct, self.gens)
        
        ## General case (self != other and 0)
        R = self.get_sympy_ring()
        num = R(self.get_sympy_dict()).as_expr()
        denom = R(other.get_sympy_dict()).as_expr()
        quo = R(sympy.polys.polytools.quo(num, denom))
        return SparsePolynomial.from_sympy(quo)

    def __mod__(self, other):
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

            **Warning:** when the variables of the divisor are not included in the variables of the dividend, 
            some weird phenomena could happen::

                >>> sp1 = SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x','y'])
                >>> sp2 = SparsePolynomial.from_string("x+y", ['x','y'])
                >>> sp1%sp2
                5 + -y**3 + -4*y + 3*y**2
                >>> sp3 =  SparsePolynomial.from_string("x**3 + 3*x**2 + 4*x + 5", ['x'])
                >>> sp3 == sp1
                True
                >>> sp3%sp2
                3
        '''
        R = self.get_sympy_ring()
        num = R(self.get_sympy_dict()).as_expr()
        denom = R(other.get_sympy_dict()).as_expr()
        if num.is_zero:
            return SparsePolynomial.from_string('0', self.gens)
        elif num == denom:
            return SparsePolynomial.from_const(1, self.gens)
        elif denom == 1:
            return self
        quo = R(sympy.polys.polytools.rem(num, denom))
        return SparsePolynomial.from_sympy(quo)

    #--------------------------------------------------------------------------

    def eval(self, **values):
        r'''
            Method to evaluate a polynomial.

            This method evaluates a polynomial subtituing its variables by given values simultaneously.
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
            if(el in rem_variables):
                rem_variables.remove(el)
        rem_variables = [self.gens.index(el) for el in rem_variables]
        values = {self.gens.index(el) : values[el] for el in values if el in self.gens}
        ## Here `rem_variables` contains the indices of the variables remaining in the evaluation
        ## and values `values` contains a dictionary index -> value (instead of the anme of the variable)
        
        new_data = {}
        for monomial in self._data:
            ## cleaning from monomial the variables evaluated
            new_monomial = tuple([var for var in monomial if var[0] in rem_variables])
            ## computing the new coefficient for the new monomial
            value = reduce(lambda p, q : p*q, [self._data[monomial]] + [values[var[0]]**var[1] for var in monomial if not var[0] in rem_variables])

            ## adding the new monomial
            if(new_monomial in new_data):
                new_data[new_monomial] += value
            else:
                new_data[new_monomial] = value
        ## Returning the resulting polynomial
        return SparsePolynomial(self.gens, self.domain, new_data)

    #--------------------------------------------------------------------------

    def exp(self, power):
        """
        Exponentiation, ``power`` is a *positive* integer
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
        if len(self._data) == 0:
            return True
        return False

    def is_unitary(self):
        r'''
            Checks equality with `1`.

            This methods checks whether a :class:`SparsePolynomial` is exactly 1 or not.

            Output
                ``True`` if ``self == 1`` holds.

            Examples::

                >>> from clue.rational_function import *
                >>> sp = SparsePolynomial.from_string("1",['x'])
                >>> sp.is_unitary()
                True
                >>> sp = SparsePolynomial(['x'])
                >>> sp.is_unitary()
                False
                >>> sp = SparsePolynomial.from_string("x**2*y - 2*x*y", ['x','y','z'])
                >>> sp.is_unitary()
                False
        '''
        if self._data == {():1}:
            return True
        return False
    
    def is_constant(self):
        r'''
            Checks wheter a polynomial is a constant

            This method checks whether a :class:`SparsePolynomial` is a constant or not. For doing so
            we simply check if ``self`` is zero (see :func:`is_zero`) or if the only monomial in the 
            polynomial is `()` (i.e., the monomial `1`).

            Output
                ``True`` if ``self`` is a constant polynomial, ``False`` otherwise.

            Examples::

                TODO: add examples
        '''
        return self.is_zero() or (len(self._data) == 1 and () in self._data)
    #--------------------------------------------------------------------------

    def _pair_to_str(self, pair):
        if pair[1] == 1:
            return self.gens[pair[0]]
        else:
            return f"{self.gens[pair[0]]}**{pair[1]}"

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
        return [self._data.get(((i, 1), ), self.domain(0)) for i in range(len(self.gens))]

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

    def get_constant(self):
        return self.constant_term

    def get_sympy_ring(self):
        return sympy.polys.rings.ring(self.gens, self.domain)[0]

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

    #--------------------------------------------------------------------------
    def derivative(self, var_name):
        """
        Returns derivative of polynomial with respect to var_name
        """
        if var_name in self.gens:
            var = self.gens.index(var_name)
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

        return SparsePolynomial(self.gens, domain=self._domain, data=data)

    #--------------------------------------------------------------------------

    @staticmethod
    def lcm(polys):
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
        polys_sp = [p.to_sympy() for p in polys]
        result = polys_sp[0]
        for p in polys_sp[1:]:
            result = result.gcd(p)
        return SparsePolynomial.from_sympy(result)

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

    @staticmethod
    def from_string(s, varnames):
        return RationalFunction.from_string(s, varnames).get_poly()

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

class RationalFunction:
    """
    Class for representing rational function with sparse polynomials
    Fields:
      - num - numerator SparsePolynomial
      - denom - denominator SparsePolynomial
    """

    __parser = None
    __parser_stack = []

    def __init__(self, num, denom):
        assert type(num) == SparsePolynomial
        assert type(denom) == SparsePolynomial
        assert num.domain == denom.domain
        self._domain = num.domain
        assert num.gens == denom.gens
        self._varnames = num.gens
        self.num = num
        assert not denom.is_zero()
        self.denom = denom
        if denom != SparsePolynomial.from_const(1, self.gens):
            self.simplify()

    @staticmethod
    def from_const(val, varnames):
        return RationalFunction(
            SparsePolynomial.from_const(val, varnames),
            SparsePolynomial.from_const(1, varnames)
        )

    #--------------------------------------------------------------------------
    def is_polynomial(self):
        return self.denom.is_constant()

    def get_poly(self):
        if self.is_polynomial():
            return self.num * (QQ(1) / QQ(self.denom.ct))
        raise ValueError(f"{self} is not a polynomial")

    def is_zero(self):
        return self.denom.is_zero()

    #--------------------------------------------------------------------------
    @property
    def domain(self):
        return self._domain

    #--------------------------------------------------------------------------
    @property
    def gens(self):
        return self._varnames.copy()

    #--------------------------------------------------------------------------
    @property
    def size(self):
        return self.denom.size + self.num.size

    #--------------------------------------------------------------------------
    def valuation(self, var_name):
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
        return self.num.degree(var_name) - self.denom.degree(var_name)

    #--------------------------------------------------------------------------
    def derivative(self, var):
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

    #--------------------------------------------------------------------------
    def simplify(self):
        r'''
            Simplify a rational function in-place.

            Method that removes the common factors between the numerator and 
            denominator of ``self``. It is based on the method :func:`~clue.rational_function.SparsePolynomial`
            and the exact division implementation.

            The simplification is performed *in-place*, meaning there is no output for this method, but
            instead, the result is stored within the same object.
        '''
        # Removing the gcd of numerator and denominator (whatever Sympy finds)
        gcd = SparsePolynomial.gcd([self.num, self.denom])
        if(not gcd.is_unitary()):
            self.num = self.num // gcd
            self.denom = self.denom // gcd

        # Removing the content of the denominator
        c = SparsePolynomial.from_const(self.denom.content, self.gens)
        if(not c.is_unitary()):
            self.num = self.num // c
            self.denom = self.denom // c

    #--------------------------------------------------------------------------
    def __str__(self):
        return f"({self.num})/({self.denom})"

    def __repr__(self):
        return f"RationalFunction({self.num}, {self.denom})"

    #--------------------------------------------------------------------------
    def __mul__(self, other):
        if type(other) == RationalFunction:
            rf = RationalFunction(self.num * other.num, self.denom * other.denom)
        else:
            rf = RationalFunction(self.num * other, self.denom)
        return rf

    def __rmul__(self, other):
        return self.__mul__(other)

    def __add__(self, other):
        if type(other) == RationalFunction:
            if self.denom == other.denom:
                rf = RationalFunction(self.num + other.num, self.denom)
            else:
                rf = RationalFunction(self.num*other.denom + other.num*self.denom, self.denom*other.denom)
            return rf
        elif type(other) == SparsePolynomial:
            return self + RationalFunction(other, SparsePolynomial.from_const(1, self.gens))
        else:
            return self + RationalFunction.from_const(1, self.gens)

    def __radd__(self, other):
        return self.__add__(other)

    def __truediv__(self, other):
        return RationalFunction(self.num * other.denom, self.denom * other.num)

    #--------------------------------------------------------------------------

    def __neg__(self):
        return RationalFunction(-self.num, self.denom)

    def __sub__(self, other):
        return self + (-other)

    def __rsub__(self, other):
        return self.__neg__().__add__(other)

    def __isub__(self, other):
        self += (-other)
        return self

    def __iadd__(self, other):
        if self.denom == other.denom:
            self.num += other.num
            return self
        self = self + other
        return self

    #--------------------------------------------------------------------------
    def eval(self, **values):
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
                (0)/(y*z**2)
                >>> print(rf.eval(y=1,z=2))
                (x)/(4)
                >>> print(rf.eval(y=2))
                (x)/(2*z**2)

            The denominator can not be evaluated to zero, or an :class:`ZeroDivisionError` would be raised::

                >>> print(rf.eval(y=0))
                Traceback (most recent call last):
                ...
                ZeroDivisionError: A zero from the denominator was found
        '''
        num = self.num.eval(**values)
        denom = self.denom.eval(**values)

        if(denom.is_zero()):
            raise ZeroDivisionError("A zero from the denominator was found")
        
        return RationalFunction(num, denom)

    #--------------------------------------------------------------------------
    def get_constant(self):
        return self.num.ct/self.denom.ct

    def get_sympy_ring(self):
        return sympy.polys.rings.ring(self.gens, self.domain)[0]

    #--------------------------------------------------------------------------
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

    #--------------------------------------------------------------------------
    def exp(self, power):
        """
        Exponentiation, ``power`` is a *positive* integer
        """
        if power < 0:
            raise ValueError(f"Cannot raise to power {power}, {str(self)}")
        if power == 1:
            return self
        if power % 2 == 0:
            return self.exp(power // 2) * self.exp(power // 2)
        return self * self.exp(power // 2) * self.exp(power // 2)

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
            ident = Word(alphas, alphanums + "_$")
            plus, minus, mult, div = map(Literal, "+-*/")
            lpar, rpar = map(Suppress, "()")
            addop = plus | minus
            multop = mult | div
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
            RationalFunction.__parser = expr

        # parsing
        try:
            RationalFunction.__parser.parseString(s, parseAll=True)
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
                    return op1 / op2
            if op == "^" or op == "**":
                exp = int(s.pop())
                base = evaluate_stack(s)
                return base.exp(exp)
            if re.match(r"^[+-]?\d+(?:\.\d*)?(?:[eE][+-]?\d+)?$", op):
                return RationalFunction.from_const(to_rational(op), varnames)
            return RationalFunction(
                SparsePolynomial(varnames, QQ, {((var_ind_map[op], 1),): QQ(1)}), 
                SparsePolynomial.from_const(1, varnames)
            )

        return evaluate_stack(RationalFunction.__parser_stack)

#------------------------------------------------------------------------------
