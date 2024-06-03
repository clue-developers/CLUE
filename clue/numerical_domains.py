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
    
RR = NumericalField(float64)
RR16 = NumericalField(float16)
RR32 = NumericalField(float32)
RR64 = RR
RR128 = NumericalField(float128)
CC = NumericalField(complex128)
CC64 = NumericalField(complex64)
CC256 = NumericalField(complex256)

__all__ = ["NumericalField", "RR", "CC"]
