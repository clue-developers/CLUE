r'''
    Module for a description of the aithmetic of `n`-ual numbers.

    This module contains a basic Python implementation of `n`-ual numbers in the class
    :class:`NualNumber`.
'''


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

        Assume the coordinates of the dual numbes belong to a ring `R`. Then,
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
            >>> a**10 == a
            True
            >>> c**3
            [64, 48, 32, 16]
    '''
    def __init__(self, coeffs):
        self.__size = len(coeffs)
        self.__coeffs = [coeffs[i] for i in range(self.__size)]

    @property
    def size(self):
        return self.__size

    @property
    def coeffs(self):
        return self.__coeffs.copy()

    # Sequence methods
    def __len__(self):
        return self.size

    def __getitem__(self, items):
        return self.coeffs[items]

    def __iter__(self):
        return iter(self.coeffs)

    ## Comparison methods
    def __eq__(self, other):
        if(not isinstance(other, NualNumber)):
            return False
        # other is a NualNumber
        if(self.size != other.size):
            return False

        return all(self[i] == other[i] for i in range(self.size))

    ## Arithmetic operations
    def __add__(self, other):
        if(not isinstance(other, NualNumber)):
            try:
                other = NualNumber(other)
            except:
                return NotImplemented
        # other is now a NualNumber
        if(self.size != other.size):
            return NotImplemented # impossible to compute with different sizes

        return NualNumber([self[i]+other[i] for i in range(self.size)])

    def __mul__(self, other):
        if(not isinstance(other, NualNumber)):
            try:
                other = NualNumber(other)
            except:
                return NotImplemented
        # other is now a NualNumber
        if(self.size != other.size):
            return NotImplemented # impossible to compute with different sizes

        return NualNumber([self[0]*other[0]] + [self[0]*other[i]+self[i]*other[0] for i in range(1, self.size)])

    def __neg__(self):
        return NualNumber([-c for c in self.coeffs])

    def __abs__(self):
        return NualNumber([abs(c) for c in self.coeffs])

    def __sub__(self, other):
        try:
            other = -other # getting the negation of other
        except:
            return NotImplemented

        return self + other # using code for __add__

    def __pow__(self, exp):
        com = self[0]**(exp-1)
        return NualNumber([c*com for c in self.coeffs])

    def __radd__(self, other): return self.__add__(other)

    def __rsub__(self, other): return (-self).__add__(other)

    def __rmul__(self, other): return self.__mul__(other)

    def __iadd__(self, other): return self.__add__(other)

    def __isub__(self, other): return (self).__sub__(other)

    def __imul__(self, other): return self.__mul__(other)

    ## Other magic methods
    def __str__(self):
        return str(self.coeffs)

    def __repr__(self): return str(self)

    def __hash__(self):
        return sum(hash(c) for c in self.coeffs)
    
        

    