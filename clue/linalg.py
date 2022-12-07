r'''
    Module for dedicated operations related with Linear Algebra

    In this module we include all the structures and code that is related with Linear Algebra that are 
    useful for the repository CLUE and its main algorithms.

    This module include an implementation (based in Python and Sympy) of a Sparse Vector and a Sparse Matrix.
    The operations between them will use this sparseness to speed up (when possible) the computations
    by omitting some multiplications and sums.

    TODO: add some more documentation
'''
from __future__ import annotations

import copy, logging, math, sympy

from collections import deque

from itertools import combinations

from sympy import GF, QQ, gcd, nextprime, symbols
from sympy.ntheory.modular import isprime
from sympy.polys.domains.domain import Domain
from sympy.polys.fields import FracElement

from .rational_function import RationalFunction, SparsePolynomial

logger = logging.getLogger(__name__)

# the constant responsible for switching to the modular algorithm
TOO_BIG_LENGTH = 10000

class ExpressionSwell(Exception):
    r'''Exception used when a number or expression gets too big.'''
    pass

#------------------------------------------------------------------------------

def rational_reconstruction_sage(a, m):
    r'''
        Rational number reconstruction implementation borrowed from SageMath
        
        Input:
        
        * ``a`` and ``m`` are integers

        Output:

        A "simple" rational number that is congruent `a` modulo `m`
    '''
    a %= m
    if a == 0 or m == 0:
        return QQ(0, 1)
    if m < 0:
        m = -m
    if a < 0:
        a = m - a
    if a == 1:
        return QQ(1, 1)
    u = m
    v = a
    bnd = math.sqrt(m / 2)
    U = (1, 0, u)
    V = (0, 1, v)
    while abs(V[2]) >= bnd:
        q = U[2] // V[2]
        T = (U[0] - q * V[0], U[1] - q * V[1], U[2] - q * V[2])
        U = V
        V = T
    x = abs(V[1])
    y = V[2]
    if V[1] < 0:
        y *= -1
    if x <= bnd and gcd(x, y) == 1:
        return QQ(y, x)
    raise ValueError(f"Rational reconstruction of {a} (mod {m}) does not exist.")

#------------------------------------------------------------------------------

class SparseVector(object):
    r'''
        Class for representing Sparse Vectors. 

        A Sparse vector representation uses the fact that "many" of its entries are zero to 
        perform more efficient computations. Namely, we store the indices that are not zero and
        the value at such index.

        All operations must be tweaked accordingly to use this property. We can measure how sparse
        is a vector by counting the proportion of non-zero entries w.r.t. the number of total entries.
        This can be obtain with the method :func:`density`.

        From a sparse vector we can obtain the following data:

        * ``dim``: contains the dimension (i.e., length) of the vector
        * ``nonzero``: set of non-zero indices in the vector.
        * ``data``: a dictionary `i \rightarrow v[i]` only containing as keys the non-zero elements.
        * ``field``: basic space (from Sympy) used for reference on where the elements belong.

        Although a :class:`SparseVector` can be built empty (giving the dimension) and then be filled out,
        we also offer the method :func:`from_list` that receives the vector in list format and build the 
        corresponding :class:`SparseVector` representation.

        Input:

        * ``dim``: dimension of the vector to be created.
        * ``field``: (``sympy.QQ`` by default) structure from Sympy determining the ambient space of the coefficients. 

        TODO: add examples of vectors, how they are created and some operations with them
    '''
    def __init__(self, dim : int, field : Domain = QQ):
        self.dim : int = dim
        self.__data : dict[int]= dict()
        self.nonzero : set[int] = set()
        self.field : Domain = field

    def digits(self):
        r'''
            Method to compute the maximal number of digits of a sparse vector.

            This method computes (when ``self.field`` is the rational numbers) the number of digits
            of all the entries of the :class:`SparseVector` and returns the maximal number obtained.
            This can used as a measure on how big is the vector.
            
            Output:

            The number of digits of the biggest entry. If the field is not the rational numbers, we 
            raise a :class:`TypeError`.

            TODO: add examples
        '''
        if self.field != QQ:
            raise TypeError("The number of digits can only be computed over the rational numbers")
        if not self.nonzero:
            return 0

        def __digits_rational(a):
            if hasattr(a, "denominator"):
                a = int(a.numerator * a.denominator)
            a = abs(a)
            if a in (1,0):
                return 1
            return math.ceil(math.log10(a))
        return max(__digits_rational(c) for c in self.__data.values())

    def density(self):
        r'''Method to measure the sparseness density of a vector'''
        return len(self.nonzero) / self.dim

    #--------------------------------------------------------------------------

    def reduce(self, coef, vect : SparseVector):
        r'''
            Inplace operation of ``self + coef*vect``.

            This method computes the new :class:`SparseVector` equal to ``self + coef*vect`` but 
            storing the output inplace (i.e., changing the value of ``self``).

            [Optimized] This method is optimized to exploit the sparseness of the vector.

            Input: 

            * ``coef``: an element in ``self.field`` to be used as scaling factor.
            * ``vect``: vector that will be used for reducing ``self``.

            Output:

            This method DO NOT return anything. The result is stored in-place ``self``.

            Examples::

                >>> from clue.linalg import *
                >>> v = SparseVector.from_list([1,0,0])
                >>> v.to_list()
                [MPQ(1,1), 0, 0]
                >>> w = SparseVector.from_list([0,1,1])
                >>> v.reduce(3, w)
                >>> v.to_list()
                [MPQ(1,1), MPQ(3,1), MPQ(3,1)]
        '''
        if not coef or vect.is_zero(): # case coeff == 0 or vect == 0
            return # no changes

        for index in vect.nonzero:
            # version 1 : just getting the element
            # self[index] = self[index] + coef*vect.__data[index]
            # version 2 : only making sum when it is in
            self[index] = (self.__data[index] + coef*vect.__data[index]) if index in self.nonzero else (coef*vect.__data[index])

    #--------------------------------------------------------------------------

    def scale(self, coef):
        r'''
            Method to scale in-place a vector

            This method computes the scaled vector ``coef*self`` and stores the result in ``self``.
            
            [Optimized] This method is optimized to exploit the sparseness of the vector.

            Input: 

            * ``coef``: an element in ``self.field`` to be used as scaling factor.

            Output:

            This method DO NOT return anything. The result is stored in-place ``self``.

            TODO: add examples
        '''
        if not coef: # the result is zero
            self.nonzero = set()
            self.__data = dict()
        else:
            # we access the __data directly to avoid the checking in __setitem__ and __getitem__
            for i in self.nonzero:
                self.__data[i] = self.__data[i] * coef

    #--------------------------------------------------------------------------

    def __getitem__(self, i : int):
        if(i < 0 or i >= self.dim):
            raise IndexError(f"Element {i} out of dimension")
        return self.__data.get(i, 0)

    def __setitem__(self, i : int, value):
        if(i < 0 or i >= self.dim):
            raise IndexError(f"Element {i} out of dimension")
        if value: # non-zero case
            self.nonzero.add(i)
            self.__data[i] = value
        else:
            self.nonzero.discard(i)
            self.__data.pop(i,None)

    def copy(self):
        r'''
            Returns a shallow copy of the vector.
        '''
        copied = SparseVector(self.dim, self.field)
        # using copy is faster that going one by one
        copied.nonzero = self.nonzero.copy()
        copied.__data = self.__data.copy()
        return copied

    def as_matrix(self, nrows : int):
        r'''
            Return a copy of this vector as a matrix with ``nrows`` rows.

            This method returns a :class:`SparseMatrix` that can be constructed
            using the inputs of this vector in the given numbers of rows.

            This method is the inverse equivalent of :func:`SparseMatrix.to_vector`.

            Input
              - ``nrows`` - number of rows for the final matrix. If the number of rows does
                not divide the length of the vector, a :class:`ValueError` is raised.

            Output
            
            A :class:`SparseMatrix` such that the method :func:`SparseMatrix.to_vector` return 
            a copy of ``self``.

            Examples::

                >>> from clue.clue import SparseVector, SparseRowMatrix
                >>> from sympy import QQ
                >>> v = SparseVector.from_list([1,10,0,0,0,7,17,8,9,0,0,1], QQ)
                >>> print(v.as_matrix(3).pretty_print())
                [ 1 10  0 0 ]
                [ 0  7 17 8 ]
                [ 9  0  0 1 ]
                >>> print(v.as_matrix(4).pretty_print())
                [  1 10 0 ]
                [  0  0 7 ]
                [ 17  8 9 ]
                [  0  0 1 ]
                >>> v.as_matrix(5)
                Traceback (most recent call last):
                ...
                ValueError: this vector does not represent a matrix with 5 rows
        '''
        if self.dim % nrows != 0:
            raise ValueError(f"this vector does not represent a matrix with {nrows} rows")

        ncols = self.dim//nrows
        output = SparseRowMatrix((nrows, ncols), self.field)
        for index in self.nonzero:
            row = index // ncols
            col = index % ncols
            output.increment(row, col, self.__data[index])

        return output

    #--------------------------------------------------------------------------

    def inner_product(self, rhs : SparseVector):
        r'''
            Scalar product of two vectors

            This method computes the scalar product of ``self`` with another vector given in ``rhs``.

            [Optimized] This method is optimized to exploit the sparseness of the vectors.

            Input: 

            * ``rhs``: vector that will be used for the scalar product with ``self``.

            Output:

            The scalar product of ``self`` and ``rhs`` as an element in ``self.field``.

            TODO: add examples
        '''
        if self.is_zero() or rhs.is_zero():
            return self.field.zero
        # computing the intersection 
        common_indices = self.nonzero.intersection(rhs.nonzero)
        result = self.field.zero
        for index in common_indices:
            result += self.__data[index] * rhs.__data[index]

        return result

    #--------------------------------------------------------------------------

    def apply_matrix(self, matr : SparseRowMatrix):
        r'''
            Method to compute the application of a matrix to self to the left (`M\cdot v`)

            This method applies to a :class:`SparseRowMatrix` `M` given by ``matr`` the :class:`SparseVector`.

            [Optimized] This method is optimized to exploit the sparseness of the vector and the matrix.

            Input: 

            * ``matr``: matrix `M` to which we will apply ``self``.

            Output:

            The scalar product of ``self`` and ``rhs`` as an element in ``self.field``.

            TODO: add examples
        '''
        if(self.dim != matr.ncols):
            raise TypeError(f"Impossible to multiply matrix with {matr.ncols} with vector of size {self.dim}")
        result = SparseVector(matr.nrows, self.field)
        
        for i in matr.nonzero:
            result[i] = self.inner_product(matr.row(i)) # __setitem__ checks if the value is zero or not
        return result

    #--------------------------------------------------------------------------

    def is_zero(self):
        r'''Method to check whether a vector is zero or not'''
        return len(self.nonzero) == 0

    #--------------------------------------------------------------------------

    def first_nonzero(self):
        r'''Method to obtain the first index that is not zero'''
        if self.nonzero:
            return next(iter(self.nonzero))
        return -1

    #--------------------------------------------------------------------------

    def to_list(self):
        r'''Method to transform a :class:`SparseVector` into a list'''
        result = [0] * self.dim
        for i in self.nonzero:
            result[i] = self.__data[i]
        return result

    #--------------------------------------------------------------------------

    def nonzero_count(self):
        r'''Method to compute the number of non-zero entries of a vector'''
        return len(self.nonzero)

    #--------------------------------------------------------------------------

    def reduce_mod(self, mod : int):
        r'''
            Method to compute a reduction of ``self`` using a modulus.

            This method computes a reduction of ``self`` where every input has been reduced using a prime modulus. 
            This means that for every entry, for both numerator and denominator we compute the value modulus ``mod``.
            This, combined with a reconstruction method (see :func:`rational_reconstruction`), allows to perform 
            operations with smaller size and obtain the true final result.

            This method only works if ``self.field`` are the rational numbers.

            Input:

            * ``mod``: a prime over which we will compute the modulus.

            Output:

            A :class:`SparseVector` over a finite field whose entries are the reduction modulo ``mod`` of ``self``.

            TODO: add examples
        '''
        if self.field != QQ:
            raise ValueError(f"Reduction can be done only for a vector over rationals but the field is {self.field}")
        mod_field = GF(mod)
        result = SparseVector(self.dim, mod_field)
        for i in self.nonzero:
            entry = self.__data[i]
            red_den = mod_field.convert(entry.denominator)
            if red_den == 0:
                raise ZeroDivisionError(f"Division by zero while taking modulo {mod}")
            result[i] = mod_field.convert(entry.numerator) / red_den # __setitem__ checks if it is zero
        return result

    #--------------------------------------------------------------------------

    @classmethod
    def from_list(cls, entries_list : list | tuple, field : Domain = QQ):
        r'''Method to build a new :class:`SparseVector` from a dense representation (i.e., a list or tuple)'''
        result = cls(len(entries_list), field)
        for i, num in enumerate(entries_list):
            to_insert = field.convert(num)
            if to_insert:
                result[i] = to_insert # __setitem__ updates the nonzero attribute
        return result

    #--------------------------------------------------------------------------

    def rational_reconstruction(self):
        r'''
            Method to make a rational reconstruction from a modular expression.

            This method converts this modular sparse vector into a rational vector using 
            a rational reconstruction algorithm (see :func:`rational_reconstruction_sage`)

            We apply that method to each entry of ``self`` and return the new rational vector.

            This method only work if the field of ``self`` is finite.

            Output:

            A new :class:`SparseVector` with the rationals as field that can be obtained 
            from ``self`` as a rational reconstruction.

            TODO: add examples
        '''
        if (not self.field.is_FiniteField) or (not isprime(self.field.characteristic())):
            raise ValueError(f"Rational reconstruction is not available over {self.field}")
        result = SparseVector(self.dim, QQ)
        for ind in self.nonzero:
            try:
                result[ind] = rational_reconstruction_sage(self[ind].to_int(), self.field.characteristic())
            except ValueError:
                logger.debug("Rational reconstruction problems: %d, %d", self[ind], self.field.characteristic())
        return result

#------------------------------------------------------------------------------

class SparseRowMatrix(object):
    r'''
        Class for representing Sparse Matrices by rows. 

        A Sparse Matrix representation uses the fact that "many" of its entries are zero to 
        perform more efficient computations. For this row matrices, we store the rows as sparse 
        vectors (see :class:`SparseVector`) and the set of indices which rows are non-zero vectors.

        All operations must be tweaked accordingly to use this property. We can measure how sparse
        is a vector by counting the proportion of non-zero entries w.r.t. the number of total entries.
        This can be obtain with the method :func:`density`.

        From a sparse matrix we can obtain the following data:

        * ``nrows``: number of rows of the matrix. 
        * ``ncols``: number of columns of the matrix.
        * ``nonzero``: set of indices such that the rows are non-zero vectors.
        * ``field``: a sympy structure where all elements will belong.

        Input:

        * ``dim``: dimension of the vector to be created. It must be either an integer or a tuple of integers. If only one 
          integer is provided we create a square matrix.
        * ``field``: (``sympy.QQ`` by default) structure from Sympy determining the ambient space of the coefficients. 

        TODO: add examples of vectors, how they are created and some operations with them
    '''
    def __init__(self, dim : int | list[int] | tuple[int], field : Domain = QQ):
        if(not isinstance(dim, (list, tuple))):
            dim = (dim, dim)
        
        self.nrows : int = dim[0]
        self.ncols : int = dim[1]
        self.__data : dict[int, SparseVector] = dict()
        self.nonzero : set[int] = set()
        self.field : Domain = field

    @property
    def dim(self): return self.nrows, self.ncols

    def copy(self):
        r'''
            Returns a copy of the matrix.
        '''
        res = SparseRowMatrix(self.dim, self.field)
        res.nonzero = self.nonzero.copy()
        res.__data = {i : self.row(i).copy() for i in self.__data}
        return res

    def transpose(self):
        r'''Method that returns the transposed matrix of ``self``'''
        result = SparseRowMatrix((self.ncols, self.nrows), self.field)
        for j in range(self.ncols):
            jth_col = self.column(j)
            if not jth_col.is_zero():
                result.__data[j] = jth_col
                result.nonzero.add(j)
        return result
            
    #--------------------------------------------------------------------------
    def nonzero_count(self):
        r'''Method to compute the number of non-zero entries of a matrix'''
        return sum([v.nonzero_count() for v in self.__data.values()])

    def density(self):
        r'''Method to measure the sparseness density of a matrix'''
        return self.nonzero_count() / self.nrows*self.ncols

    #--------------------------------------------------------------------------

    def __setitem__(self, cell : tuple[int,int] | list[int], value):
        i, j = cell
        if(i < 0 and i >= self.nrows):
            raise IndexError(f"Row {i} out of dimension")
        if(j < 0 and j >= self.ncols):
            raise IndexError(f"Column {j} out of dimension")
        
        if i in self.nonzero:
            self.__data[i][j] = value
            if self.__data[i].is_zero():
                del self.__data[i]
                self.nonzero.remove(i)
        elif value: # we are adding non-zero
            self.nonzero.add(i)
            self.__data[i] = SparseVector(self.ncols, self.field)
            self.__data[i][j] = value
         
    #--------------------------------------------------------------------------

    def __getitem__(self, cell: int | tuple[int,int]):
        if isinstance(cell, int): # we return the row
            return self.row(cell)
        elif isinstance(cell, tuple) and len(cell) == 2: # we return the item
            i,j = cell
            if(i < 0 and i >= self.nrows):
                raise IndexError(f"Row {i} out of dimension")
            if(j < 0 and j >= self.ncols):
                raise IndexError(f"Column {j} out of dimension")
            
            return self.__data[i][j] if i in self.nonzero else self.field.zero

    #--------------------------------------------------------------------------

    def increment(self, i : int, j: int, extra):
        r'''
            Method to increment the value of an element by a given quantity.

            This method uses __setitem__, hence removing the vector if we end up with a 
            whole zero row.
        '''
        self[i, j] = self[i, j] + extra

    #--------------------------------------------------------------------------

    def row(self, i : int):
        r'''Method to obtain the ``i``-th row as a :class:`SparseVector`'''
        if i < 0 or i >= self.nrows: 
            raise IndexError(f"Row {i} out of dimension")

        return self.__data.get(i, SparseVector(self.ncols, self.field))

    def column(self, j : int):
        r'''Method to obtain the ``j``-th column as a :class:`SparseVector`'''
        column = SparseVector(self.nrows, self.field)
        for i in self.nonzero:
            row = self.__data[i]
            if j in row.nonzero:
                column[i] = row[j]
        return column
        
    #--------------------------------------------------------------------------

    def reduce_mod(self, modulus : int):
        r'''
            Method to compute a reduction of ``self`` using a modulus.

            This method computes a reduction of ``self`` where every input has been reduced using a prime modulus. 
            This means that for every entry, for both numerator and denominator we compute the value modulus ``mod``.
            This, combined with a reconstruction method (see :func:`rational_reconstruction`), allows to perform 
            operations with smaller size and obtain the true final result.

            This method only works if ``self.field`` are the rational numbers.

            Input:

            * ``mod``: a prime over which we will compute the modulus.

            Output:

            A :class:`SparseRowMatrix` over a finite field whose entries are the reduction modulo ``mod`` of ``self``.

            TODO: add examples
        '''
        if self.field != QQ:
            raise ValueError(f"Reduction can be done only for a vector over rationals but the field is {self.field}")
        result = SparseRowMatrix(self.dim, GF(modulus))
        for i in self.nonzero:
            row_reduced = self.__data[i].reduce_mod(modulus)
            if not row_reduced.is_zero():
                result.nonzero.add(i)
                result.__data[i] = row_reduced
        return result

    #--------------------------------------------------------------------------

    def to_vector(self):
        r'''Method that transforms a matrix into a vector with row-first preference'''
        result = SparseVector(self.nrows*self.ncols, self.field)
        for i in self.nonzero:
            ith_row = self.row(i)
            for j in ith_row.nonzero:
                result[self.ncols*i + j] = ith_row[j]
        return result

    def to_list(self):
        r'''Return the Sparse matrix as a list of lists (dense representation)'''
        return [[self[i,j] for j in range(self.ncols)] for i in range(self.nrows)]

    def pretty_print(self):
        r'''Method to generate a pretty printing of the Sparse matrix'''
        entries = [[str(el) for el in row] for row in self.to_list()]
        sizes = [[len(el) for el in row] for row in entries]
        max_sizes = [max(sizes[i][j] for i in range(self.nrows)) for j in range(self.ncols)]
        return "\n".join(
            ["[ " +  " ".join([(max_sizes[j] - sizes[i][j])*" " + entries[i][j] for j in range(self.ncols)]) + " ]"
            for i in range(self.nrows)]
        )

    @classmethod
    def from_vectors(cls, rows : list[SparseVector] | tuple[SparseVector]):
        r'''
            Static method to create a matrix from a list of vectors.
        '''
        result = cls((len(rows), rows[0].dim), rows[0].field)
        result.nonzero = {i for i in range(len(rows)) if (not rows[i].is_zero())}
        result.__data = {i : rows[i] for i in result.nonzero}

        return result
#------------------------------------------------------------------------------

class Subspace(object):
    r'''
        Class representing a linear subspace. 

        A linear subspace is generated by a set of linearly independent vectors (called based). 

        Given a basis for a subspace of `mathbb{Q}^n`, there are possible canonical representations
        for the basis. One of the most prominent is the echelon form. Here the vectors in 
        the basis has as many zeros as possible.

        This class represents a linear subspace by storing a basis in echelon form using a dictionary
        where the key is the pivot position (the first non-zero) and the corresponding element of the 
        basis.

        A vector is in valid form if the pivot element is 1.

        Input:

        * ``field``: a base sympy structure representing the base field for this to be a subspace.

        TODO: add examples
    '''
    def __init__(self, field : Domain):
        self.field : Domain = field
        self.echelon_form : dict[int, SparseVector] = dict()

    def copy(self):
        r'''
            Returns a copy of the linear subspace.
        '''
        res = Subspace(self.field)
        res.echelon_form = {k: v.copy() for k, v in self.echelon_form.items()}
        return res

    def ambient_dimension(self):
        if len(self.echelon_form) == 0:
            return math.inf
        return next(iter(self.echelon_form.values())).dim

    def dim(self):
        r'''Returns the dimension of the subspace'''
        return len(self.echelon_form)

    def digits(self):
        r'''Returns the size of the elements in the basis of a subspace'''
        if not self.echelon_form:
            return 0
        return max([v.digits() for v in self.echelon_form.values()])

    def densities(self):
        r'''Returns the sparseness density of each element of the basis of a subspace'''
        return [m.density() for m in self.echelon_form.values()]

    #--------------------------------------------------------------------------

    def reduce_vector(self, vector : SparseVector):
        r'''
            Method to reduce a vector with respect to a subspace

            Accordingly to the echelon form, we can see if a vector is inside a subspace by 
            "reducing" the vector, i.e., creating as many zeros as possible by using the pivots 
            in the echelon form.

            If the reduced vector is the zero vector, then the input ``vector`` was originally in
            the subspace. Otherwise, the basis together with the reduced vector is the echelon form
            for the subspace generated by ``self`` and ``vector``.

            This method computes the reduced vector in-place. This means the input ``vector`` is 
            changed in the execution of this method.

            Input: 
            
            * ``vector``: a :class:`SparseVector` that will be reduced w.r.t. ``self``.

            Output:

            The reduced vector. It is the same object as the input ``vector`` since the method
            modifies the input inplace.

            TODO: add examples
        '''
        for piv, vect in self.echelon_form.items():
            if vector[piv]:
                vector.reduce(-vector[piv], vect)
            if vector.is_zero(): break
        return vector

    def contains(self, vector : SparseVector):
        r'''Checks whether a vector is in ``self`` or not.'''
        return self.reduce_vector(vector.copy()).is_zero()

    def __contains__(self, vector : SparseVector):
        r'''Magic implementation for the "in" syntax in Python'''
        return self.contains(vector)

    def absorb_new_vector(self, new_vector : SparseVector):
        r'''
            Method to extend the subspace using a new vector.

            This method absorbs a new vector into the subspace. This means that we modify 
            the :class:`Subspace` to guarantee the vector given in ``new_vector`` is contained in 
            ``self``.

            We use the method :func:`reduce_vector` to create the new element in the echelon form 
            of the basis. If the method returns the zero vector, we do nothing. Otherwise we add
            to the basis the resulting vector (which provides a new basis in echelon form).

            Input:

            * ``new_vector``: a :class:`SparseVector` that will be absorbed by ``self``.

            Output:

            The new pivot position. If ``new_vector`` was in ``self``, we return -1.

            TODO: add examples
        '''
        new_vector = self.reduce_vector(new_vector)

        # We check if ``new_vector`` was in ``self``
        if new_vector.is_zero():
            return -1

        # We compute the pivot position
        pivot = new_vector.first_nonzero()
        # We set the pivot value to 1
        new_vector.scale(self.field.one / new_vector[pivot])

        # We make zeros above the new pivot
        for piv, vect in self.echelon_form.items():
            if pivot in vect.nonzero:
                self.echelon_form[piv].reduce(-vect[pivot], new_vector)

        self.echelon_form[pivot] = new_vector
        return pivot

    #--------------------------------------------------------------------------

    def apply_matrices_inplace(self, matrices : list[SparseRowMatrix], monitor_length : bool = False):
        r'''
            Method to compute the smallest invariant subspace of some matrices containing ``self``.

            This method computes the smallest linear subspace that is invariant under a given set of matrices
            and contains the subspace defined by ``self``.

            This method is inplace. This means the subspace ``self`` will be changed during the execution.

            This method may control that the intermediate expressions are not too big. If the flag 
            ``monitor_length`` is set to True and some value exceeds the size given by ``TOO_BIG_LENGTH``
            we raise a :class:`ExpressionSwell``.

            Input:

            * ``matrices``: a list of :class:`SparseMatrix` used as input.
            * ``monitor_length``: flag to mark if we control the size of expressions or not

            Output:

            This method DOES NOT return anything. This method works inplace.

            TODO: add examples
        '''
        to_process = deque()
        to_process.extendleft(list(self.echelon_form.values()))
        i = 1
        while to_process and self.ambient_dimension() > self.dim():
            vector = to_process.pop()

            logger.debug(f"  Multiplying vector {i}th by {len(matrices)} matrices...")
            for matrix in matrices:
                prod = vector.apply_matrix(matrix)
                if not prod.is_zero():
                    new_pivot = self.absorb_new_vector(prod)
                    if new_pivot != -1: # the space has been extended
                        to_process.appendleft(prod)
                        if monitor_length and self.digits() > TOO_BIG_LENGTH:
                            raise ExpressionSwell
            
            logger.debug(f"  Done")
            i += 1

    def check_invariance(self, matrices : list[SparseRowMatrix]):
        r'''
            Method to check if this subspace is invariant under some matrices.

            Input:

            * ``matrices``: a list of :class:`SparseMatrix` to check.

            Output:

            Boolean value marking whether ``self`` is invariant under ``matrices``.

            TODO: add examples
        '''
        for matr in matrices:
            for vec in self.echelon_form.values():
                prod = vec.apply_matrix(matr)
                if not prod in self:
                    return False
        return True

    #--------------------------------------------------------------------------

    def check_inclusion(self, other : Subspace):
        r'''
            Checks whether a subspace is included in ``self``.

            Input:

            * ``other``: the subspace that will be checked the inclusion.

            Output:

            A boolean value indicated whether all the vectors in ``other`` and in ``self``.

            TODO: add values
        '''
        return all(vec in self for vec in other.echelon_form.values())

    #--------------------------------------------------------------------------

    def reduce_mod(self, modulus):
        r'''
            Method to compute a reduction of ``self`` using a modulus.

            This method computes a reduction of ``self`` where every input has been reduced using a prime modulus. 
            This means that for every vector, we compute its reduction using ``mod``.

            This method only works if ``self.field`` are the rational numbers.

            Input:

            * ``mod``: a prime over which we will compute the modulus.

            Output:

            A :class:`SparseRowMatrix` over a finite field whose entries are the reduction modulo ``mod`` of ``self``.

            TODO: add examples
        '''
        if self.field != QQ:
            raise ValueError(f"Reduction can be done only for a vector over rationals but the field is {self.field}")
        result = Subspace(GF(modulus))
        for vec in self.echelon_form.values():
            to_add = vec.reduce_mod(modulus)
            if not to_add.is_zero():
                result.absorb_new_vector(to_add)
        return result

    #--------------------------------------------------------------------------

    def basis(self):
        r'''
            Method to obtain a basis of ``self`` sorted by the pivot index in the echelon form.
        '''
        return [self.echelon_form[piv] for piv in self.parametrizing_coordinates()]

    def matrix(self):
        r'''
            Method to compute a matrix representing the basis of the subspace
        '''
        return SparseRowMatrix.from_vectors(self.basis())

    #--------------------------------------------------------------------------

    def parametrizing_coordinates(self):
        r'''Indices over which a projection is surjective (i.e., the indices of the pivots)'''
        return sorted(self.echelon_form.keys())

    #--------------------------------------------------------------------------

    def perform_change_of_variables(self, rhs, old_vars, domain, new_vars_name='y'):
        """
            TODO: not reviewed
          Restrict a system of ODEs with the rhs given by
          rhs (SparsePolynomial or RationalFunction) to the subspace
          new_vars_name (optional) - the name for variables in the lumped polynomials
        """
        #old_vars = rhs[0].gens
        #domain = rhs[0].domain
        new_vars = [new_vars_name + str(i) for i in range(self.dim())]
        pivots = set(self.parametrizing_coordinates())
        lpivots = sorted(pivots)
        basis = self.basis()

        logger.debug("Constructing new rhs")
        if isinstance(rhs[0], SparsePolynomial):
            new_rhs = [SparsePolynomial(old_vars, domain) for _ in range(self.dim())]
        elif isinstance(rhs[0], RationalFunction):
            new_rhs = [RationalFunction.from_const(0, old_vars) for _ in range(self.dim())]
        else:
            new_rhs = [0 for _ in range(self.dim())]
        for i, vec in enumerate(basis):
            logger.debug(f"    Equation number {i}")
            for j in vec.nonzero:
                # ordering is important due to the implementation of
                # multiplication for SparsePolynomial
                if not isinstance(vec[j], FracElement):
                    new_rhs[i] += rhs[j] * vec[j]
                else:
                    new_rhs[i] += rhs[j] * vec[j].as_expr()

        logger.debug("Plugging zero to nonpivot coordinates")

        if isinstance(rhs[0], SparsePolynomial):
            shrunk_polys = []
            for p in new_rhs:
                filtered_dict = dict()
                for monom, coef in p.dataiter():
                    new_monom = []
                    skip = False
                    for var, exp in monom:
                        if var not in pivots:
                            skip = True
                            break
                        else:
                            new_monom.append((lpivots.index(var), exp))
                    if not skip:
                        new_monom = tuple(new_monom)
                        filtered_dict[new_monom] = coef

                shrunk_polys.append(SparsePolynomial(new_vars, domain, filtered_dict))

            return shrunk_polys

        elif isinstance(rhs[0], RationalFunction):
            # plugging all nonpivot variables with zeros
            shrunk_rfs = []
            for rf in new_rhs:

                num_filtered_dict = dict()
                for monom, coef in rf.numer.dataiter():
                    new_monom = []
                    skip = False
                    for var, exp in monom:
                        if var not in pivots:
                            skip = True
                            break
                        else:
                            new_monom.append((lpivots.index(var), exp))
                    if not skip:
                        new_monom = tuple(new_monom)
                        num_filtered_dict[new_monom] = coef
                new_num = SparsePolynomial(new_vars, domain, num_filtered_dict)

                denom_filtered_dict = dict()
                for monom, coef in rf.denom.dataiter():
                    new_monom = []
                    skip = False
                    for var, exp in monom:
                        if var not in pivots:
                            skip = True
                            break
                        else:
                            new_monom.append((lpivots.index(var), exp))
                    if not skip:
                        new_monom = tuple(new_monom)
                        denom_filtered_dict[new_monom] = coef
                new_denom = SparsePolynomial(new_vars, domain, denom_filtered_dict)

                shrunk_rfs.append(RationalFunction(new_num,new_denom))

            return shrunk_rfs
        else:
            ## here basis is in normal form, meaning that 
            ## for basis[j] the element in lpivots[i] is 1 if i==j, 0 otherwise
            new_vars = symbols(",".join(new_vars))
            new_vars = [new_vars] if type(new_vars) == sympy.core.symbol.Symbol else new_vars
            old_vars = symbols(",".join(old_vars))
            old_vars = [old_vars] if type(old_vars) == sympy.core.symbol.Symbol else old_vars
            subs = {v : 0 for v in old_vars}
            for j in range(len(lpivots)):
                if isinstance(basis[j][lpivots[j]], FracElement):
                    subs[old_vars[lpivots[j]]] += new_vars[j]/basis[j][lpivots[j]].as_expr()
                else:
                    subs[old_vars[lpivots[j]]] += new_vars[j]/basis[j][lpivots[j]]

            shrunk_expr = [expr.subs(subs) for expr in new_rhs]
            # Maybe here add for expanding the new expression
            return shrunk_expr

    #--------------------------------------------------------------------------

    def rational_reconstruction(self):
        r'''
            Method to make a rational reconstruction from a modular expression.

            This method converts this modular linear subspace into a rational vector using 
            a rational reconstruction algorithm (see :func:`rational_reconstruction_sage`)

            This method runs a rational reconstruction to each vector in the basis. In this
            case, we can preserve the set of pivots, hence the new set of vectors will be 
            in echelon form.

            Output:

            A new :class:`Subspace` with the rationals as field that can be obtained 
            from ``self`` as a rational reconstruction.

            TODO: add examples
        '''
        if (not self.field.is_FiniteField) or (not isprime(self.field.characteristic())):
            raise ValueError(f"Rational reconstruction is not available over {self.field}")
 
        result = Subspace(QQ)
        for pivot, vector in self.echelon_form.items():
            result.echelon_form[pivot] = vector.rational_reconstruction()
        return result

#------------------------------------------------------------------------------


class OrthogonalSubspace(Subspace):
    r'''
        Class to represent a linear subspace where the basis stores is orthonormal.

        This class reuses the attributes from the class :class:`Subspace` matching:

        * :attr:`echelon_form` will now be a dictionary where the key are simply an index value
          and the value are the elements of an orthonormal basis. The meaning of a pivot is lost
          for this kind of Subspaces.

        TODO: add more documentation and examples

        Methods that are overriden:

        * :func:`reduce_vector`
        * :func:`absorb_new_vector`
        * :func:`apply_matrices_inplace` --> just forcing the ``monitor_length`` to be ``False``
        * :func:`reduce_mod` --> we disable this method for this class (no modular approach implemented)
        * :func:`parametrizing_coordinates` --> we speed-up this methdo because we know the keys of the dictionary
        * :func:`perform_change_of_variables`
        * :func:`rational_reconstruction` --> we disable this method for this class (no modular approach implemented)
    '''
    def __init__(self, field: Domain):
        super().__init__(field)
        self.__projector = None

    @property
    def projector(self):
        r'''
            Method that returns a matrix that computes the orthogonal projection over ``self`` for any vector.

            Since the basis of ``self`` is orthonormal, then this matrix can be computed as `L^T L` where
            `L` is the matrix whose rows are the basis elements of ``self``.

            Hence, the `n \times n` matrix that is `L^T L` is composed by the scalar product of all the 
            columns of `L`.
        '''
        if self.__projector is None and self.ambient_dimension() < math.inf:
            self.__projector = SparseRowMatrix(self.ambient_dimension(), self.field)
        return self.__projector

    def reduce_vector(self, vector: SparseVector):
        r'''
            Method to reduce a vector with respect to a subspace

            In a orthogonal subspace, the reduced version of a vector is the difference between the 
            vector and its orthogonal projection, implying the reduced vector is orthogonal to
            the subspace if and only if the vector is not in it.

            Let `L` be a `m\times n` matrix where `n` is the ambient space of the subspace and 
            the rows of `L` are the orthonormal basis of ``self``. Then, for any given vector `v`, 
            its orthogonal projection can be computed by

            .. MATH::

                \pi_L(v) = L^T L v

            Hence, the reduced version of the vector if simply `v - \pi_L(v)`.

            **Remark 1**: since the basis of ``self`` is orthonormal, then `L L^T` is the `m\times m` 
            identity matrix.

            **Remark 2**: the matrix `L^T L` is of size `n \times n`. 

            Hence, if a reduced vector is not zero, we can add its normalized version to self to obtain a new
            orthonormal basis for the space containing ``self`` and the original vector.

            This method computes the reduced vector in-place. This means the input ``vector`` is 
            changed in the execution of this method.

            Input: 
            
            * ``vector``: a :class:`SparseVector` that will be reduced w.r.t. ``self``.

            Output:

            The reduced vector. It is the same object as the input ``vector`` since the method
            modifies the input inplace.

            TODO: add examples
        '''
        if not vector.is_zero() and self.dim() > 0:
            # first we compute the projection of the vector 
            pi_v = vector.apply_matrix(self.projector)
            # we then compute the difference
            vector.reduce(-self.field.one, pi_v)

        return vector

    def absorb_new_vector(self, new_vector: SparseVector):
        new_vector = self.reduce_vector(new_vector)

        # We check if ``new_vector`` was in ``self``
        if new_vector.is_zero():
            return -1

        # we simplify the gcd of the numerators
        if self.field == QQ:
            new_vector.scale(self.field.one / math.gcd(*[new_vector[i].numerator for i in new_vector.nonzero]))

        # Now new_vector ir orthogonal to ``self``. We can simply add it to the Subspace
        self.echelon_form[self.dim()] = new_vector
        # we update the orthogonal projector
        norm2 = new_vector.inner_product(new_vector)
        # updating outisde the diagonal
        for (i,j) in combinations(new_vector.nonzero, 2):
            to_add = (new_vector._SparseVector__data[i] * new_vector._SparseVector__data[j]) / norm2
            self.projector.increment(i,j,to_add)
            self.projector.increment(j,i,to_add)
        # updating the diagonal
        for i in new_vector.nonzero:
            to_add = (new_vector._SparseVector__data[i] * new_vector._SparseVector__data[i]) / norm2
            self.projector.increment(i,i,to_add)

        return self.dim() - 1

    def apply_matrices_inplace(self, matrices: list[SparseRowMatrix], monitor_length: bool = False):
        return super().apply_matrices_inplace(matrices, False)

    def reduce_mod(self, _):
        raise NotImplementedError("Modular approach is NOT valid for Orthogonal basis")

    def parametrizing_coordinates(self):
        return list(range(len(self.echelon_form)))

    def perform_change_of_variables(self, rhs, old_vars, domain, new_vars_name='y'):
        n = self.ambient_dimension(); m = self.dim()
        new_vars = [new_vars_name + str(i) for i in range(m)]
        # we build the matrix of the space and its pseudoinverse
        L = self.matrix()
        L2 = L.copy()
        for i in L2.nonzero:
            L2.row(i).scale(self.field.one / L2.row(i).inner_product(L2.row(i)))
        psi_L = L2.transpose()

        logger.debug("Constructing new rhs")
        if isinstance(rhs[0], (SparsePolynomial, RationalFunction)):
            y = [SparsePolynomial.from_string(var, new_vars) for var in new_vars]
            x = [SparsePolynomial.from_string(var, old_vars) for var in old_vars]
        else:
            y = symbols(new_vars)
            x = symbols(old_vars)

        # we apply the pseudoinverse to the new variables
        psi_L_y = [(x[i], sum(psi_L[i][j] * y[j] for j in range(m))) for i in range(n)]
        # we apply the functions given in rhs
        new_rhs = [old_equ.subs(psi_L_y) for old_equ in rhs]
        # we apply the basis to the obtained result
        new_rhs = [sum(L[j,i]*new_rhs[i] for i in range(n)) for j in range(m)]
        return new_rhs

    def rational_reconstruction(self):
        raise NotImplementedError("Modular approach is NOT valid for Orthogonal basis")
        
#------------------------------------------------------------------------------

def find_smallest_common_subspace(matrices, vectors_to_include, subspace_class = Subspace):
    """
      Input
        - matrices - an iterator for matrices (SparseMatrix)
        - vectors_to_include - a list of vectors (SparseVector)
      Output
        a smallest invariant subspace for the matrices containing the vectors
    """
    field = vectors_to_include[0].field
    original_subspace = subspace_class(field)
    for vec in vectors_to_include:
        original_subspace.absorb_new_vector(vec)

    if field != QQ:
        original_subspace.apply_matrices_inplace(matrices)
        return original_subspace

    space_copy = copy.deepcopy(original_subspace)
    try:
        original_subspace.apply_matrices_inplace(matrices, monitor_length=True)
        return original_subspace
    except ExpressionSwell:
        original_subspace = space_copy
        logger.debug("Rationals are getting too long, switching to the modular algorithm")
        modulus = 2**31 - 1
        primes_used = 1
        while True:
            logger.debug("Working modulo: %d", modulus)
            try:
                matrices_reduced = [matr.reduce_mod(modulus) for matr in matrices]
                subspace_reduced = original_subspace.reduce_mod(modulus)
                subspace_reduced.apply_matrices_inplace(matrices_reduced)
                reconstruction = subspace_reduced.rational_reconstruction()
                if reconstruction.check_invariance(matrices):
                    if reconstruction.check_inclusion(original_subspace):
                        logger.debug("We used %d primes", primes_used)
                        return reconstruction
                    else:
                        logger.debug("Didn't pass the inclusion check")
                else:
                    logger.debug("Didn't pass the invariance check")
            except ValueError:
                pass
            except ZeroDivisionError:
                logger.debug(f"{modulus} was a bad prime for reduction, going for the next one")
            modulus = nextprime(modulus**2)
            primes_used += 1

__all__ = ["SparseVector", "SparseRowMatrix", "Subspace", "OrthogonalSubspace", "find_smallest_common_subspace"]