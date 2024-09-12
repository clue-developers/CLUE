r'''
    File for implementing the sympy domains that rely on primitive datatypes. This is 
    used for numerical purposes.
'''

from numpy import (csingle, cdouble, clongdouble, 
                   half, single, double, longdouble)
from sympy import PythonRational
from sympy.polys.domains.domainelement import DomainElement
from sympy.polys.domains.field import Field

class NumericalField:
    def __init__(self, dtype):
        self.__dtype = dtype
        self.one = self.__dtype(1)
        self.zero = self.__dtype(0)
        ## Some attribute to mimic Sympy fields
        self.is_Exact = False
        self.is_Numerical = True
        
    @property
    def dtype(self):
        return self.__dtype
    
    def convert(self, data):
        return self.__dtype(data)
    
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
    
    def __eq__(self, other) -> bool:
        return isinstance(other, NumericalField) and self.dtype == other.dtype
    
RR = NumericalField(double)
RR16 = NumericalField(half)
RR32 = NumericalField(single)
RR64 = RR
RR128 = NumericalField(longdouble)
CC = NumericalField(cdouble)
CC64 = NumericalField(csingle)
CC256 = NumericalField(clongdouble)

Domain = Field | NumericalField
ExactElement = PythonRational | DomainElement
NumericalElement = csingle | cdouble | clongdouble | half | single | double | longdouble
Element = ExactElement | NumericalElement

__all__ = ["NumericalField", "RR", "CC"]
