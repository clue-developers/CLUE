r'''
    Module for a description of the arithmetic of `n`-ual numbers.

    This module contains a basic Python implementation of `n`-ual numbers in the class
    :class:`NualNumber`.
'''
from __future__ import annotations

from numerical_domains import Domain, Element

class NualNumber:
    r'''
        Dual numbers can be defined as a special ring structure in vectors of 
        two coordinates `(v_1, v_2)` where the addition and product are defined 
        as follows:

        .. MATH::

            \begin{array}{rcl}
                (v_1, v_2) + (w_1 , w_2) &=& (v_1 + w_1, v_2 + w_2)\\
                (v_1, v_2) (w_1, w_2) &=& (v_1w_1, v_1w_2 + v_2w_1)
            \end{array}

        Assume the coordinates of the dual numbers belong to a ring `R`. Then,
        the dual numbers can be understood as the elements of the quotient ring

        .. MATH::

            R_2 = \frac{R[\varepsilon]}{\langle \varepsilon^2\rangle}.

        In these rings, any element can be written as `a + b\varepsilon` obtaining a 
        natural bijection with `R^2` by taking `(a,b) \mapsto a + b \varepsilon`. If
        we set the addition and multiplication described above for dual numbers, that 
        bijection is, indeed, a ring isomorphism.

        More generically, the `n`-ual numbers are the elements of the quotient ring

        .. MATH::

            R_n = \frac{R[\varepsilon_1,\ldots,\varepsilon_{n-1}]}{\langle \varepsilon_i \varepsilon_j\ :\ i,j =1,\ldots, n-1\rangle}

        In this case, the elements can be viewed as vectors of `n` coordinates with termwise
        addition and the special product defined by:

        .. MATH::

            \mathbf{a} \mathbf{b} = (a_1b_1, a_1b_2 + a_2b_1, \ldots, a_1b_n + a_nb_1).

        Input:
            ``coeffs``: coordinates of a `n`-ual number. It must be a list, tuple or any
            object that can be called by ``len`` and indexed by integer numbers. The elements
            inside are not checked, but must accept all arithmetic operations defined in this
            class.

        Examples::

            >>> from clue.nual import *
            >>> a = NualNumber([1,2]); b = NualNumber([2,3])
            >>> a + b
            [3, 5]
            >>> a * b
            [2, 7]
            >>> a = NualNumber([1,2,3,4])
            >>> a == b
            False
            >>> c = NualNumber([4,3,2,1]); c
            [4, 3, 2, 1]
            >>> a - c
            [-3, -1, 1, 3]
            >>> a * c
            [4, 11, 14, 17]
            >>> a**10 == [1, 20, 30, 40]
            True
            >>> c**3
            [64, 144, 96, 48]
            >>> b**2
            [4, 12]

        Elements in the ring of coefficients are naturally embedded into `n`-ual numbers.
        This class also allow natural operations with these elements extending 
        them by adding zeros on the other coordinates::

            >>> a - 1
            [0, 2, 3, 4]
            >>> a - set([1])
            Traceback (most recent call last):
            ...
            TypeError: bad operand type for unary -: 'set'
            >>> a + set([1,2,3,4])
            Traceback (most recent call last):
            ...
            TypeError: unsupported operand type(s) for +: 'int' and 'set'
            >>> a + [1,2,3,4] == 2*a
            True

        `n`-ual numbers can often be inverted. In fact, the ring `R_n` described above
        has the following two properties:

        * All elements are units or zero divisors.
        * Zero divisors are those elements with first coefficient equal to zero.

        This class also includes the arithmetic for dividing by all the units in the ring::

            >>> a = NualNumber([1,2,3])
            >>> 1/a
            [1.0, -2.0, -3.0]
            >>> a * (1/a) == 1
            True
            >>> a/[3,2,1]
            [0.3333333333333333, 0.4444444444444444, 0.8888888888888888]

        Be aware that these divisions may not be exact computations. For example, divisions with
        the Python type ``int`` lead to the use of ``float`` type output, which is not an exact domain
        of computations.
    '''

    def __init__(self, coeffs: list[Element] | tuple[Element], field: Domain = None, cast: bool = False):
        self.__size = len(coeffs)
        if cast and isinstance(field, Domain):
            self.__coeffs = [field.convert(coeffs[i]) for i in range(self.__size)]
        else:
            self.__coeffs = [coeffs[i] for i in range(self.__size)]
        self.__field = field
        self.__cache_pow = dict()

    @staticmethod
    def constant(value: Element, dim: int, field: Domain = None):
        zero = 0 if field is None else field.zero
        value = value if field is None else field.convert(value)
        return NualNumber([value] + [zero for _ in range(dim-1)], field, False)
    
    @staticmethod
    def one(dim: int, field: Domain = None):
        return NualNumber.constant(field.one if field is not None else 1, dim, field)
    @staticmethod
    def zero(dim: int, field: Domain = None):
        return NualNumber.constant(field.zero if field is not None else 0, dim, field)

    @property
    def size(self) -> int:
        return self.__size

    @property
    def coeffs(self) -> list[Element]:
        return self.__coeffs.copy()
    
    @property
    def field(self) -> Domain:
        return self.__field

    def _to_nual(self, other: Element) -> NualNumber:
        r'''
        Method to convert an element into a `n`-ual number of the same length as ``self``.

        This method will be used in all arithmetic operations with :class:`NualNumber`
        to convert the other input to the same type if possible and will follow these rules:

        * If ``other`` can be set as input for :class:`NualNumber`, then we create the
          corresponding element and check if the length are the same. A :class:`ValueError`
          will be raised if the length does not coincide.
        * Otherwise, we put ``other`` in a list of the same length as ``self`` and create
          the corresponding :class:`NualNumber`. The behavior of the arithmetic will now
          rely on the type of the data inside the :class:`NualNumber`.

        Input:
            ``other`` - object to be casted into the same type of NualNumber

        Output:
            A :class:`NualNumber` with the casted version of ``other`` with the same
            length as ``self``.

        Examples::

            >>> from clue.nual import *
            >>> a = NualNumber([1,2,3])
            >>> a._to_nual(2)
            [2, 0, 0]
            >>> a._to_nual(set([1]))
            [{1}, 0, 0]
            >>> a._to_nual([1])
            Traceback (most recent call last):
            ...
            TypeError: The input [1] has incorrect length
            >>> a._to_nual(NualNumber([4,5,6]))
            [4, 5, 6]
            >>> a._to_nual([1,4,2])
            [1, 4, 2]
            >>> a._to_nual(a) == a
            True
        '''
        if not isinstance(other, NualNumber) or other.__field != self.__field:        
            try:
                other = NualNumber(other, self.__field, True)
            except TypeError:
                other = NualNumber.constant(other, self.size, self.__field)

        ## If a NualNumber was created, we check the tpe is correct
        if other.size == self.size:
            return other
        else:
            raise TypeError(f"The input {other} has incorrect length")

    def change_base(self, new_field: Domain) -> NualNumber:
        r'''It changes the type of the elements forcing it to be a fixed domain'''
        if new_field == self.__field:
            return self
        return NualNumber(self.__coeffs, new_field, True)

    # Sequence methods
    def __len__(self) -> int:
        return self.size

    def __getitem__(self, items) -> Element | list[Element]:
        return self.coeffs[items]

    def __iter__(self):
        return iter(self.coeffs)

    ## Comparison methods
    def is_zero(self) -> bool:
        return all(c == (self.__field.zero if self.__field is not None else 0) for c in self.coeffs)

    def __eq__(self, other: NualNumber | Element) -> bool:
        try:
            return (self - other).is_zero()
        except TypeError:
            return False

    ## Arithmetic operations
    def __add__(self, other: NualNumber | Element) -> NualNumber:
        try:
            other = self._to_nual(other)
        except TypeError:
            return NotImplemented

        # other is now a NualNumber with the same size
        return NualNumber([self[i] + other[i] for i in range(self.size)], self.__field)

    def __mul__(self, other: NualNumber | Element) -> NualNumber:
        try:
            other = self._to_nual(other)
        except TypeError:
            return NotImplemented

        # other is now a NualNumber with the same size
        return NualNumber(
            [self[0] * other[0]]
            + [self[0] * other[i] + self[i] * other[0] for i in range(1, self.size)],
            self.__field
        )

    def __neg__(self) -> NualNumber:
        return NualNumber([-c for c in self.coeffs], self.__field)

    def __abs__(self):
        return NualNumber([abs(c) for c in self.coeffs], self.__field)

    def __sub__(self, other) -> NualNumber:
        # other is now a NualNumber with the same size
        return self.__add__(-other)  # using code for __add__

    def __inv__(self) -> NualNumber:
        if self[0] == 0:
            raise ZeroDivisionError(f"{self.size}-ual numbers with first term 0 are not invertible")

        return NualNumber([1 / self[0]] + [-self[i] / self[0] ** 2 for i in range(1, self.size)], self.__field)

    def __truediv__(self, other: NualNumber | Element) -> NualNumber:
        try:
            other = self._to_nual(other)
        except TypeError:
            return NotImplemented

        # other is now a NualNumber with the same size
        return self * (other.__inv__())  # using code for __mul__

    def __pow__(self, exp: int) -> NualNumber:
        r'''
        Computes the power of a `n`-ual number for arbitrary constant exponent.

        This method computes the power of a nual number by the following formula:

        .. MATH::

            (a_1,a_2,\ldots,a_n)^\alpha = a_1^{\alpha-1}(a_1, \alpha a_2,\ldots, \alpha a_n).

        This formula is based in the General Binomial Theorem that states that, for any `x`, `y`
        and `\alpha \in \mathbb{C}`, it holds:

        .. MATH::

            (x + y)^\alpha = \sum_{k=0}^{\infty} \binom{\alpha}{k}x^{\alpha-k}y^k.

        Since `n`-ual numbers are elements in the ring

        .. MATH::

            R_n = \frac{R[\varepsilon_1,\ldots,\varepsilon_{n-1}]}{\langle \varepsilon_i \varepsilon_j\ :\ i,j =1,\ldots, n-1\rangle}

        we have that:

        .. MATH::

            (a_1,a_2,\ldots,a_n)^\alpha = \left((a_1,0,\ldots,0) + (0,a_2,\ldots,a_n)\right)^\alpha.

        On one hand, it is easy t see that `(0,a_2,\ldots,a_n)^k = 0` for all `k\geq 2`. Hence the infinite sum
        of the binomial theorem is truncated to a sum of two terms for `k=0` and `k=1`, leading to the formula
        depicted above.

        This method then works for any exponent `\alpha` such that ``self[0]``has implemented the method ``__pow__``.
        '''
        if not exp in self.__cache_pow:
            ## Particular cases for exp == 0 or 1
            if exp == 0:
                self.__cache_pow[0] = NualNumber.one(self.__field)
            elif exp == 1:
                self.__cache_pow[1] =  self
            else:
                int_exp = int(exp)
                if int_exp != exp:
                    pass
                else:
                    exp = int_exp  # changing the type of exp to int

                com = self[0] ** (exp - 1)
                self.__cache_pow[exp] = NualNumber([self[0] * com] + [exp * self[i] * com for i in range(1, self.size)])
        return self.__cache_pow[exp]

    def __rpow__(self, base: Element) -> NualNumber:
        from sympy import log

        return self.exp() ** log(base)

    def __radd__(self, other: NualNumber | Element) -> NualNumber:
        return self.__add__(other)

    def __rsub__(self, other: NualNumber | Element) -> NualNumber:
        return (-self).__add__(other)

    def __rmul__(self, other: NualNumber | Element) -> NualNumber:
        return self.__mul__(other)

    def __rtruediv__(self, other: NualNumber | Element) -> NualNumber:
        return (self.__inv__()).__mul__(other)

    def __iadd__(self, other: NualNumber | Element) -> NualNumber:
        return self.__add__(other)

    def __isub__(self, other: NualNumber | Element) -> NualNumber:
        return self.__sub__(other)

    def __imul__(self, other: NualNumber | Element) -> NualNumber:
        return self.__mul__(other)

    def __itruediv__(self, other: NualNumber | Element) -> NualNumber:
        return self.__truediv__(other)

    ## Other magic methods
    def __str__(self) -> str:
        return str(self.coeffs)

    def __repr__(self) -> str:
        return str(self)

    def __hash__(self) -> int:
        return hash(self.coeffs)

    def exp(self) -> NualNumber:
        r'''
        Method that computes the value ``e**self``.

        This method computes the exponential of ``self`` using the transcendental
        element `e` from the Sympy library. This method works for any type of entries
        that are valid for the __pow__ method in Sympy.

        If we consider the `n`-ual number `(a_1,\ldots,a_n)`, we can write it down as

        .. MATH::

            (a_1,\ldots, a_n) = (a_1, 0, \ldots, 0) + (0, a_2, \ldots, a_n) = a + b,

        in such a way that the second summand has the property `b^2 = 0`. Now, using the
        multiplicative property of the exponential:

        .. MATH::

            \exp(a + b) = e^a \exp(b) = e^a \sum_{k\geq 0}\frac{b^n}{n!} = e^a(1 + b).

        If we write this as vectors, then we easily get the formula:

        .. MATH::

            \exp((a_1,\ldots,a_n)) = (e^{a_1}, e^{a_1}a_2, \ldots, e^{a_1}a_n)
        '''
        from sympy import E

        com = E ** self[0]
        return NualNumber([com] + [com * self[i] for i in range(1, self.size)])
