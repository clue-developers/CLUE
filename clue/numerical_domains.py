r'''
    File for implementing the sympy domains that rely on primitive datatypes. This is 
    used for numerical purposes.
'''

from numpy import (complex64, complex128, complex256, 
                   float16, float32, float64, float128)

class NumericalField:
    def __init__(self, dtype):
        self.__dtype = dtype
        ## Some attribute to mimic Sympy fields
        self.is_Exact = False
        self.is_Numerical = True
        
    @property
    def dtype(self):
        return self.__dtype
    
    def convert(self, data):
        return self.__dtype(data)
    
    @property
    def one(self):
        return self.__dtype(1)
    
    @property
    def zero(self):
        return self.__dtype(0)
    
    def __contains__(self, element):
        r'''
            Method to check whether an element can be seen as an element of the numerical field.

            This method tries to convert the element to the :class:`NumericalField` and compares 
            the result. If the two elements are equal, then we consider the element is in the field.

            To guarantee the proper behavior of other functions, we recommend to still use the method
            :func:`convert` before operating with ``element``.

            Input:

            - ``element``: the element to be checked.

            Output:

            ``True`` if the given ``element`` can be seen as an element of ``self``.

            Examples::

                >>> from clue.numerical_domains import RR, CC
                >>> from sympy import QQ
                >>> 1 in RR # integers can be reals
                True
                >>> 1.0 in RR # floats are reals
                True
                >>> 1j in RR # complex are not reals
                False
                >>> 1+0j in RR # we do not check specifically the imaginary part
                False
                >>> 
                >>> 1 in CC # integers can be reals
                True
                >>> 1.0 in CC # floats are reals
                True
                >>> 1j in CC # complex are not reals
                True

            However, we ca not distinguish elements that are not from primitive types of Python
            even when they are technically part of the field::

                >>> half = QQ(1,2)
                >>> half in RR
                False
                >>> QQ.evalf(half) in RR
                True
        '''
        try:
            return self.convert(element) == element
        except Exception:
            return False
    
    def __repr__(self):
        return f"NumField[{self.__dtype}]"
    
RR = NumericalField(float64)
RR16 = NumericalField(float16)
RR32 = NumericalField(float32)
RR64 = RR
RR128 = NumericalField(float128)
CC = NumericalField(complex128)
CC64 = NumericalField(complex64)
CC256 = NumericalField(complex256)

__all__ = ["NumericalField", "RR", "CC"]
