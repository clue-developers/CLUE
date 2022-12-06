r'''
    Module for dedicated operations related with Linear Algebra

    In this module we include all the structures and code that is related with Linear Algebra that are 
    useful for the repository CLUE and its main algorithms.

    This module include an implementation (based in Python and Sympy) of a Sparse Vector and a Sparse Matrix.
    The operations between them will use this sparseness to speed up (when possible) the computations
    by omitting some multiplications and sums.

    TODO: add some more documentation
'''
import copy, logging, math
from bisect import bisect

import sympy
from sympy import GF, QQ, gcd, nextprime, symbols
from sympy.ntheory.modular import isprime
from sympy.polys.fields import FracElement

from .rational_function import RationalFunction, SparsePolynomial

logger = logging.getLogger(__name__)

# the constant responsible for switching to the modular algorithm
TOO_BIG_LENGTH = 10000

class ExpressionSwell(Exception):
    pass

#------------------------------------------------------------------------------

def rational_reconstruction_sage(a, m):
    """
    Rational number reconstruction implementation borrowed from Sage
    Input
      a and m are integers
    Output
      a "simple" rational number that is congruent a modulo m
    """
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
    """
    A class for sparse vectors. Contains the following fields:
      dim - the dimension of the ambient space
      nonzero - sorted list of the indices of the nonzero coordinates
      data - dictionary containing nonzero coordinates in the form index_of_the_coordinate : value
      field - the field of the entries (of type sympy.polys.domains.domain.Domain)
    """
    def __init__(self, dim, field=QQ):
        self._dim = dim
        self._data = dict()
        self._nonzero = []
        self._field = field

    @property
    def dim(self):
        return self._dim

    @property
    def field(self):
        return self._field

    def nonzero_iter(self):
        return iter(self._nonzero)

    def digits(self):
        """
        Only over Q: the length of the representation of the longest coordinate
        """
        if not self._nonzero:
            return 0
        digits_Q = lambda a : math.ceil(math.log10(abs(a.numerator*a.denominator))) if hasattr(a, "denominator") else max(math.ceil(math.log10(a)))
        return max(digits_Q(c) for c in self._data.values())

    def density(self):
        return len(self._nonzero) / self._dim

    #--------------------------------------------------------------------------

    def reduce(self, coef, vect):
        """
        self = self + c * v
        """
        if not coef: # case coeff == 0
            return # no changes

        new_nonzero = []
        left, right = 0, 0
        while (left < len(self._nonzero) or right < len(vect._nonzero)):
            if right == len(vect._nonzero): # all remaining coeffs from vect are zero
                ## Nothing else needs to be done
                new_nonzero.extend(self._nonzero[left:])
                left = len(self._nonzero)
            elif left == len(self._nonzero): # all remaining coeffs from self are zero
                ## We add all the elements of vect
                new_nonzero.extend(vect._nonzero[right:])
                for i in range(right, len(vect._nonzero)):
                    self._data[vect._nonzero[i]] = coef * vect._data[vect._nonzero[i]]
                right = len(vect._nonzero)
            else: ## There are remaining elements for both vectors
                if self._nonzero[left] == vect._nonzero[right]: # We are on the same index
                    ## Compute the new value
                    result = self._data[self._nonzero[left]] + coef * vect._data[vect._nonzero[right]]
                    if result: # If not zero, we keep the information
                        self._data[self._nonzero[left]] = result
                        new_nonzero.append(self._nonzero[left])
                    else: # Otherwise, we remove the element
                        del self._data[self._nonzero[left]]
                    left += 1
                    right += 1
                elif self._nonzero[left] < vect._nonzero[right]: # Next coefficient is only for self
                    ## We do nothing
                    new_nonzero.append(self._nonzero[left])
                    left += 1
                else: # Next coefficient is only for vect
                    ## We add this part
                    new_nonzero.append(vect._nonzero[right])
                    self._data[vect._nonzero[right]] = coef * vect._data[vect._nonzero[right]]
                    right += 1
        self._nonzero = new_nonzero

    #--------------------------------------------------------------------------

    def scale(self, coef):
        if not coef:
            self._nonzero = []
            self._data = dict()
        else:
            for i in self._nonzero:
                self._data[i] = self._data[i] * coef

    #--------------------------------------------------------------------------

    def __getitem__(self, i):
        if(i < 0 or i >= self.dim):
            raise IndexError(f"element {i} non-existent")
        return self._data.get(i, 0)

    def __setitem__(self, i, value):
        if(i < 0 or i >= self.dim):
            raise IndexError(f"element {i} non-existent")
        if bisect(self._nonzero, i) == 0 or self._nonzero[bisect(self._nonzero, i) - 1] != i:
            self._nonzero.insert(bisect(self._nonzero, i), i)
        self._data[i] = value

    def copy(self):
        r"""
            Returns a shallow copy of the vector.
        """
        copied = SparseVector(self.dim, self.field)
        for i in self.nonzero_iter():
            copied.__append__(i, self[i])
        return copied

    def as_matrix(self, nrows):
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
        for el in self.nonzero_iter():
            row = el // ncols
            col = el % ncols
            output.increment(row, col, self[el])

        return output

    #--------------------------------------------------------------------------

    def inner_product(self, rhs):
        if rhs.nonzero_count() < self.nonzero_count():
            return rhs.inner_product(self)
        result = self.field(0)
        for i in self._nonzero:
            if i in rhs._data:
                result += self._data[i] * rhs._data[i]
        return result

    #--------------------------------------------------------------------------

    def __append__(self, i, value):
        """
        makes self[i] = value *given that* all the coordinates with the index r and more were zero
        """
        self._nonzero.append(i)
        self._data[i] = value

    #--------------------------------------------------------------------------

    def apply_matrix(self, matr):
        if(self.dim != matr.ncols):
            raise TypeError(f"Impossible to multiply matrix with {matr.ncols} with vector of size {self.dim}")
        result = SparseVector(self.dim, self.field)
        for i in matr.nonzero_iter():
            prod = self.inner_product(matr.row(i))
            if prod:
                result.__append__(i, prod)
        return result

    #--------------------------------------------------------------------------

    def is_zero(self):
        return len(self._nonzero) == 0

    #--------------------------------------------------------------------------

    def first_nonzero(self):
        if self._nonzero:
            return self._nonzero[0]
        return -1

    #--------------------------------------------------------------------------

    def to_list(self):
        result = [0] * self.dim
        for i in range(len(self._nonzero)):
            result[self._nonzero[i]] = self._data[self._nonzero[i]]
        return result

    #--------------------------------------------------------------------------

    def nonzero_count(self):
        return len(self._nonzero)

    #--------------------------------------------------------------------------

    def reduce_mod(self, modulus):
        """
        Returns the reduction modulo modulus
        Defined only for field == QQ
        """
        if self.field != QQ:
            raise ValueError(f"Reduction can be done only for a vector over rationals but the field is {self.field}")
        mod_field = GF(modulus)
        result = SparseVector(self.dim, mod_field)
        for i in self._nonzero:
            entry = self._data[i]
            if mod_field.convert(entry.denominator) == 0:
                raise ZeroDivisionError(f"Division by zero while taking modulo {modulus}")
            entry_mod = mod_field.convert(entry.numerator) / mod_field.convert(entry.denominator)
            if entry_mod:
                result.__append__(i, entry_mod)
        return result

    #--------------------------------------------------------------------------

    @classmethod
    def from_list(cls, entries_list, field):
        result = cls(len(entries_list), field)
        for i, num in enumerate(entries_list):
            to_insert = field.convert(num)
            if to_insert:
                result.__append__(i, to_insert)
        return result

    #--------------------------------------------------------------------------

    def rational_reconstruction(self):
        """
          Input
            self
          Output
            a SparseVector over rationals with given reductions
          Works only over fields of the form GF(p), where p is a prime number
        """
        if (not self.field.is_FiniteField) or (not isprime(self.field.characteristic())):
            raise ValueError(f"Rational reconstruction is not available over {self.field}")
        result = SparseVector(self.dim, QQ)
        for ind in self._nonzero:
            try:
                result.__append__(ind, rational_reconstruction_sage(self[ind].to_int(), self.field.characteristic()))
            except ValueError:
                logger.debug("Rational reconstruction problems: %d, %d", self[ind], self.field.characteristic())
        return result

#------------------------------------------------------------------------------

class SparseRowMatrix(object):
    """
    A class for sparse matrices. Contains the following fields:
      nrows - number of rows for the matrix
      ncols - number of columns for the matrix
      _nonzero - sorted list of the indices of the nonzero rows
      _data - dictionary containing nonzero rows in the form index_of_the_row : SparseVector
      field - the field of entries (of type sympy.polys.domains.domain.Domain)
    """
    def __init__(self, dim, field):
        if(not isinstance(dim, (list, tuple))):
            dim = (dim, dim)
        
        self._nrows = dim[0]
        self._ncols = dim[1]
        self._data = dict()
        self._nonzero = []
        self._field = field

    @property
    def dim(self):
        r'''
            Property with the size of the matrix in format ``(nrows, ncols)``
        '''
        return self.nrows, self.ncols

    @property
    def nrows(self):
        r'''
            Property with the number of rows of the sparse matrix.
        '''
        return self._nrows
    @property
    def ncols(self):
        r'''
            Property with the number of columns of the sparse matrix.
        '''
        return self._ncols

    @property
    def field(self):
        return self._field

    def copy(self):
        res = SparseVector(self.dim, self._field)
        res._nonzero = self._nonzero.copy()
        res._data = self._data.copy()
        return res

    #--------------------------------------------------------------------------

    def nonzero_iter(self):
        return iter(self._nonzero)

    def nonzero_count(self):
        return sum([v.nonzero_count() for v in self._data.values()])

    def density(self):
        return self.nonzero_count() / self.nrows*self.ncols

    #--------------------------------------------------------------------------

    def __setitem__(self, cell, value):
        i, j = cell
        if(i < 0 and i >= self.nrows):
            raise IndexError(f"row {i} non-existent")
        if(j < 0 and j >= self.ncols):
            raise IndexError(f"column {j} non-existent")
        if bisect(self._nonzero, i) == 0 or self._nonzero[bisect(self._nonzero, i) - 1] != i:
            self._nonzero.insert(bisect(self._nonzero, i), i)
            self._data[i] = SparseVector(self.ncols, self.field)
        self._data[i][j] = value

    #--------------------------------------------------------------------------

    def __getitem__(self, cell):
        i,j = cell
        if(i < 0 and i >= self.nrows):
            raise IndexError(f"row {i} non-existent")
        if(j < 0 and j >= self.ncols):
            raise IndexError(f"column {j} non-existent")
        if not i in self._data:
            return self.field.convert(0)
        return self._data[i][j]

    #--------------------------------------------------------------------------

    def increment(self, i, j, extra):
        self[i, j] = self[i, j] + extra

    #--------------------------------------------------------------------------

    def row(self, i):
        if i in self._data:
            return self._data[i]
        elif i > 0 or i < self.nrows:
            return SparseVector(self.ncols, self.field)
        raise IndexError(f"row {i} non-existent")

    #--------------------------------------------------------------------------

    def reduce_mod(self, modulus):
        """
        Returns the reduction modulo modulus
        Works only if field == QQ
        """
        if self.field != QQ:
            raise ValueError(f"Reduction can be done only for a vector over rationals but the field is {self.field}")
        result = SparseRowMatrix(self.dim, GF(modulus))
        for i in self._nonzero:
            row_reduced = self._data[i].reduce_mod(modulus)
            if not row_reduced.is_zero():
                result._nonzero.append(i)
                result._data[i] = row_reduced
        return result

    #--------------------------------------------------------------------------

    def to_vector(self):
        """
        Returns :class:`SparseVector` representation of matrix

        a b -> a
        c d    b
               c
               d
        """
        result = SparseVector(self.nrows*self.ncols)
        for i in self.nonzero_iter():
            ith_column = self._data[i]
            for j in ith_column.nonzero_iter():
                result[self.ncols*i + j] = ith_column[j]
        return result

    def as_list(self):
        r'''
            Return the Sparse matrix as a list of lists.
        '''
        return [[self[i,j] for j in range(self.ncols)] for i in range(self.nrows)]

    def pretty_print(self):
        r'''
            Method to generate a pretty printing of the Sparse matrix
        '''
        entries = [[str(el) for el in row] for row in self.as_list()]
        sizes = [[len(el) for el in row] for row in entries]
        max_sizes = [max(sizes[i][j] for i in range(self.nrows)) for j in range(self.ncols)]
        return "\n".join(
            ["[ " +  " ".join([(max_sizes[j] - sizes[i][j])*" " + entries[i][j] for j in range(self.ncols)]) + " ]"
            for i in range(self.nrows)]
        )
#------------------------------------------------------------------------------

class Subspace(object):
    """
    Class representing a subspace. Contains
      - field
      - echelon_form - a dictionary of the form number : SparseVector such that
        the vectors form a basis of the subspace and constitute reduced
        row echelon form and the corresponding number for each vector is
        the index of the pivot Example (with dense vectors) : {0: [1, 0, 1], 1: [0, 1, 3]}
    """

    def __init__(self, field):
        self._field = field
        self._echelon_form = dict()

    def copy(self):
        res = Subspace(self._field)
        res._echelon_form = {k: v.copy() for k, v in self._echelon_form.items()}
        return res

    @property
    def field(self):
        return self._field

    def dim(self):
        return len(self._echelon_form)

    def digits(self):
        """
        Only over Q: the maximal number of digits in the rational numbers used
        """
        if not self._echelon_form:
            return 0
        return max([v.digits() for v in self._echelon_form.values()])

    def densities(self):
        return [m.density() for m in self._echelon_form.values()]

    #--------------------------------------------------------------------------

    def reduce_vector(self, vector):
        """
        Input
          - ``vector`` - a SparseVector to be reduced with respect to this subspace. This is 
            performed inplace, changing the input of the method.
        Output
          the vector once it is reduced.
        """
        for piv, vect in self._echelon_form.items():
            if vector[piv]:
                vector.reduce(-vector[piv], vect)
        return vector

    def contains(self, vector):
        """
            Checks whether a vector is in ``self`` or not. 
        """
        return self.reduce_vector(vector.copy()).is_zero()

    def absorb_new_vector(self, new_vector):
        """
        Input
          - new_vector - a SparseVector
        Output
          the index of the pivot of the new basis vector if such emerges, -1 otherwise
        """
        new_vector = self.reduce_vector(new_vector)

        if new_vector.is_zero():
            return -1

        pivot = new_vector.first_nonzero()
        new_vector.scale(self.field.convert(1) / new_vector[pivot])
        for piv, vect in self._echelon_form.items():
            if vect[pivot]:
                self._echelon_form[piv].reduce(-vect[pivot], new_vector)

        self._echelon_form[pivot] = new_vector
        return pivot

    #--------------------------------------------------------------------------

    def apply_matrices_inplace(self, matrices, monitor_length=False):
        """
          Input
            - matrices - a list of matrices (SparseMatrix)
            - monitor_length - if set True, the ExpressionSwell exception will be raised
                if there will be an intermediate result exceeding TOO_BIG_LENGTH (only over Q!)
          Output
            No output. The subspace is transformed to the smallest invariant subspace
            of the matrices containing the original one
        """
        new_pivots = set(self._echelon_form.keys())

        while new_pivots:
            pivots_to_process = new_pivots.copy()
            new_pivots = set()
            for pivot in pivots_to_process:
                for m_index, matr in enumerate(matrices):
                    if m_index % 100 == 0:
                        logger.debug("  Multiply by matrix %d", m_index)
                    m_index += 1
                    prod = self._echelon_form[pivot].apply_matrix(matr)
                    if not prod.is_zero():
                        new_pivot = self.absorb_new_vector(prod)
                        if new_pivot != -1:
                            new_pivots.add(new_pivot)
                            if monitor_length and self.digits() > TOO_BIG_LENGTH:
                                raise ExpressionSwell

    #--------------------------------------------------------------------------

    def check_invariance(self, matrices):
        """
          Input
            - matrices - a list of matrices (SparseMatrix)
          Output
             whether the vector space is invariant under the matrices
        """
        for matr in matrices:
            for vec in self._echelon_form.values():
                prod = vec.apply_matrix(matr)
                if self.absorb_new_vector(prod) != -1:
                    return False
        return True

    #--------------------------------------------------------------------------

    def check_inclusion(self, other):
        """
          Input
            - other - a subspace of the same dimension
          Output
             whether other is contained in self
        """
        for vec in other.basis():
            if self.absorb_new_vector(vec) != -1:
                return False
        return True

    #--------------------------------------------------------------------------

    def reduce_mod(self, modulus):
        """
        Reduction modulo prime modulus.
        Works only for field == QQ
        """
        if self.field != QQ:
            raise ValueError(f"Reduction can be done only for a vector over rationals but the field is {self.field}")
        result = Subspace(GF(modulus))
        for piv, vec in self._echelon_form.items():
            vec_red = vec.reduce_mod(modulus)
            if not vec_red.is_zero():
                result._echelon_form[piv] = vec_red
        return result

    #--------------------------------------------------------------------------

    def basis(self):
        return [self._echelon_form[piv] for piv in sorted(self._echelon_form.keys())]

    #--------------------------------------------------------------------------

    def parametrizing_coordinates(self):
        """
        A list of self.dim coordinates such that the projection onto these coordinates is surjective
        """
        return sorted(self._echelon_form.keys())

    #--------------------------------------------------------------------------

    def perform_change_of_variables(self, rhs, old_vars, domain, new_vars_name='y'):
        """
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
            for j in vec.nonzero_iter():
                # ordering is important due to the implementation of
                # multiplication for SparsePolynomial
                if not isinstance(vec._data[j], FracElement):
                    new_rhs[i] += rhs[j] * vec._data[j]
                else:
                    new_rhs[i] += rhs[j] * vec._data[j].as_expr()

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
            # raise NotImplementedError("The conversion to new variables in sympy is not yed implemented")

    #--------------------------------------------------------------------------

    def rational_reconstruction(self):
        """
          Input
            self
          Output
            a subspace with this set of reductions modulo prime
          Works only for fields of the form GF(p) (p - prime)
        """
        if (not self.field.is_FiniteField) or (not isprime(self.field.characteristic())):
            raise ValueError(f"Rational reconstruction is not available over {self.field}")
 
        result = Subspace(QQ)
        for pivot in self._echelon_form.keys():
            result._echelon_form[pivot] = self._echelon_form[pivot].rational_reconstruction()
        return result

#------------------------------------------------------------------------------

def find_smallest_common_subspace(matrices, vectors_to_include):
    """
      Input
        - matrices - an iterator for matrices (SparseMatrix)
        - vectors_to_include - a list of vectors (SparseVector)
      Output
        a smallest invariant subspace for the matrices containing the vectors
    """
    field = vectors_to_include[0].field
    original_subspace = Subspace(field)
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

__all__ = ["SparseVector", "SparseRowMatrix", "Subspace", "find_smallest_common_subspace"]