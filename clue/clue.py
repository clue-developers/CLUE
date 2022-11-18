from bisect import bisect
import copy, logging, math, sys, time

from random import randint

from functools import cached_property, reduce, lru_cache

import sympy
from sympy import GF, QQ, gcd, nextprime, lambdify, symbols, oo
from sympy.ntheory.modular import isprime
from sympy.polys.fields import FracElement
from sympy.polys.rings import PolyElement

from clue.parser import read_system

from .rational_function import SparsePolynomial, RationalFunction
from .nual import NualNumber

## Configuring logger for this module
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s %(levelname)-8s %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
fh = logging.FileHandler("clue.log")
ch = logging.StreamHandler(sys.stderr)
fh.setFormatter(formatter); ch.setFormatter(formatter)
logger.addHandler(fh); logger.addHandler(ch)
logger.propagate = False

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
        return max(len(str(c)) for c in self._data.values())

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

### Generic methods to manipulate expressions
@lru_cache
def _func_for_expr(expr, varnames, domain):
    if(isinstance(expr, sympy.core.add.Add)):
        def __func(*args):
            return reduce(lambda p, q : p + q, [_func_for_expr(arg, varnames, domain)(*args) for arg in expr.args])
    elif(isinstance(expr, sympy.core.mul.Mul)):
        def __func(*args):
            return reduce(lambda p, q : p * q, [_func_for_expr(arg, varnames, domain)(*args) for arg in expr.args])
    elif(isinstance(expr, sympy.core.power.Pow)):
        def __func(*args):
            base = _func_for_expr(expr.args[0], varnames, domain)(*args)
            exp = _func_for_expr(expr.args[1], varnames, domain)(*args)
            if isinstance(exp, FracElement):
                return base**int(exp.as_expr())
            return base**int(exp)
    elif(isinstance(expr, sympy.core.numbers.Rational)):
        def __func(*args): #pylint: disable=unused-argument
            return domain.convert(expr)
    elif(isinstance(expr, sympy.core.symbol.Symbol) and str(expr) in varnames):
        __func = lambdify([symbols(v) for v in varnames], expr, modules="sympy")
    elif(isinstance(expr, sympy.core.symbol.Symbol)):
        def __func(*args): #pylint: disable=unused-argument
            return domain.convert(expr)
    else:
        raise TypeError("Incorrect expression found [%s]: %s" %(type(expr), expr))

    return __func

def _automated_differentiation(expr, varnames, domain, point):
    r'''
        Method to compute automatic differentiation of a sympy expression
    '''
    if(expr == 0):
        return NualNumber([0 for _ in range(len(varnames)+1)])
    
    if(isinstance(expr, (SparsePolynomial, RationalFunction))):
        return expr.automated_diff(**{varnames[i] : point[i] for i in range(len(varnames))})
    else:
        func = _func_for_expr(expr, tuple(varnames), domain)
        to_eval = [NualNumber([domain.convert(point[i])] + [domain.convert(1) if j == i else domain.convert(0) for j in range(len(point))]) for i in range(len(point))]
        return func(*to_eval)


### Structure for a differential system
class FODESystem:
    r'''
        Class to represent a system of Firs Order Differential Equations.

        This class allows to store intermediate steps to save time in computations.
        It will also offer functionality to choose more freely the algorithms to do the 
        computations when several are available.

        There are several ways to initialize a differential system:

        * Provide all information needed by itself: using the arguments ``equations``,
          ``observables``, ``variables``, ``ic``and ``name``. If ``equations`` is provided
          this is the method of creation chosen.
        * Provide a file to be read (using the argument ``file``). We will use the clue parser
          with the arguments given in ``kwds``.
        * Provide a dictionary with the data (using the argument ``dic``). In this case, at least 
          an entry with key ``'equations'`` must be provided.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic={}, name = None, 
                dic=None, file = None, **kwds
    ):
        if(equations is None):
            if(dic is None):
                if(file is None):
                    raise ValueError("Not enough data provided to build a system.")
            
                read_ic = kwds.get("read_ic", False)
                parser = kwds.get("parser", "polynomial")
                dic = read_system(file, read_ic, parser)
            
            # Now dic is not None and we can use it to read the data
            equations = dic['equations']
            observables = dic.get('observables', None)
            variables = dic.get('variables')
            ic = dic.get('ic', {})
            name = dic.get('name', None)
        
        # Now we have the data in the first arguments
        self._equations = equations
        self._observables = observables
        self._variables = variables
        self._ic = ic
        self._name = name

        self._lumping_matr = {}
        self.__normalize_input = False
        self._lumped_system_type = LDESystem

    # Getters of attributes
    @property
    def equations(self): return self._equations
    @property
    def observables(self): return self._observables
    @property
    def variables(self): return self._variables
    @property
    def ic(self): return self._ic
    @property
    def name(self): return self._name
    @cached_property
    def bounds(self): 
        r'''
            Bounds of the degrees for the right hand side.

            This tuple contains bounds for the degree of the numerator and denominator
            of the rational functions (or polynomials) that are the equations of 
            the differential system (see property :func:`equations`).
        '''
        ## Normalizing data if needed
        self.normalize()

        ## Computing the bounds
        if(isinstance(self.equations[0], SparsePolynomial)):
            Dn = max([equ.degree() for equ in self.equations if equ != 0])
            Dd = 0
        elif(isinstance(self.equations[0], RationalFunction)):
            Dn = max([equ.numer.degree() for equ in self.equations if equ != 0])
            Dd = max(equ.denom.degree() for equ in self.equations)
        else: # sympy expression case
            bounds = [FODESystem.bound_degree_expr(equ, self.variables) for equ in self.equations]
            Dn = max(bound[0] for bound in bounds)
            Dd = max(bound[1] for bound in bounds)
        return (Dn, Dd)

    @cached_property
    def size(self): return len(self._equations)

    @cached_property
    def nspecies(self):
        r'''
            Counts the number of species of a system

            See property :func:`species` for further information.
        '''
        return len(self.species)

    @cached_property
    def species(self):
        r'''
            Return the names of the species of a system.

            A specie is a variable that is not constant, i.e., its equation is not 0.
        '''
        return [self.variables[i] for i in range(self.size) if self.equations[i] != 0]

    @cached_property
    def npars(self):
        r'''
            Counts the number of parameters of a system

            See property :func:`pars` for further information.
        '''
        return len(self.pars)

    @cached_property
    def pars(self):
        r'''
            Return the names of the parameter of a system.

            A parameter is a variable that is constant, i.e., its equation is 0.
        '''
        return [self.variables[i] for i in range(self.size) if self.equations[i] == 0]

    @cached_property
    def field(self):
        r'''
            Property that gives the ground field of the system.

            The ground field is a sympy structure that allows the user to manipulate any rational
            expression in all the symbols appearing in the equations that are not variables (see 
            property :func:`variables`).

            This is different that the property :func:`pars`, since those are the actual variables
            that are constant.
        '''
        # Normalizing equations if needed
        self.normalize()
        
        # computing the field
        equations = self.all_equations()
        if(issubclass(self.type, (SparsePolynomial, RationalFunction))):
            return next(equations).domain
        else:
            allvars = set()
            for eq in equations:
                allvars = allvars.union(eq.free_symbols)
            params = list(filter(lambda s: str(s) not in self.variables, allvars))
            if len(params) == 0:
                logger.debug(":field: no parameters, the ground field is QQ then")
                return QQ
            else:
                logger.debug(":field: some parameters found, extending Q as needed")
                return sympy.FractionField(QQ, [str(p) for p in params])

    @cached_property
    def type(self):
        self.normalize()
        return type(self.equations[0])

    @lru_cache(maxsize=1)
    def is_linear_system(self):
        r'''Checker to see if a system is linear or not'''
        if not issubclass(self.type, SparsePolynomial):
            return False

        for equation in self.all_equations():
            if any((not equation.degree(v) in (0,1)) for v in self.variables) or equation.ct != 0:
                return False
        return True

    def all_equations(self):
        r'''
            Return a generator with all the equations of the system
        '''
        yield from self.equations

    def symb_variables(self):
        r'''
            Return a list with the variables represented as symbolic objects compatible with the type of the equations

            This method is useful when we want to create the variables from scratch and use them algebraically without
            considering their type anymore (since it will coincide with the general type decide after normalizing).

            Output:

            A tuple with the variables in the same order as in :func:`variables` represented in the class given by 
            :func:`type`.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y'], QQ)
                >>> ode = FODESystem([x**2*y**2 - x**3*y**2], variables=['x','y'])
                >>> ode.type
                <class 'clue.rational_function.SparsePolynomial'>
                >>> ode.symb_variables()
                (x, y)
                >>> all(type(var) == ode.type for var in ode.symb_variables())
                True
                >>> R = vring(['x','y','z'], QQ)
                >>> ode = FODESystem([x**2*y**-2 - z**-2*y**2], variables=['x','y','z'])
                >>> ode.type
                <class 'sympy.core.add.Add'>
                >>> ode.symb_variables()
                (x, y, z)
                >>> type(ode.symb_variables()[0])
                <class 'sympy.core.symbol.Symbol'>
        '''
        self.normalize()
        variables = self.variables
        if isinstance(self.equations[0], (SparsePolynomial, RationalFunction)):
            return tuple([SparsePolynomial.from_string(v, variables) for v in variables])
        else:
            return tuple([symbols(v) for v in variables])

    ## more specialized getters
    def equation(self, varname):
        r'''
            Returns the equation associated with a variable name.
        '''
        return self.equations[self.variables.index(varname)]

    def __decide_type(self):
        r'''
            Method to decide the type for the normalized equations
        '''
        target_type = 0 # 0 = SparsePolynomial; 1 = RationalFunction; 2 = Expression
        # first loop to decide target
        equations = self.all_equations(); equ = next(equations)
        while target_type < 2 and not(equ is None):
            if isinstance(equ, PolyElement):
                if equ != 0 and min(min(d for d in m) < 0 for m in equ.monoms()): 
                    # PolyElement with negative exponents --> sympy
                    logger.debug(":normalize: found PolyElement with negative exponents --> sympy")
                    target_type = 2
                # PolyElement with no negative exponents --> polynomial: do not change target_type
            elif isinstance(equ, FracElement):
                numer, denom = equ.numer, equ.denom
                if numer == 0: # fraction is zero, nothing is needed
                    pass
                elif denom == 1: # maybe a polynomial is enough
                    if numer != 0 and min(min(d for d in m) < 0 for m in numer.monoms()): # FracElement with numerator with neg. exponents
                        logger.debug(":normalize: found FracElement (den=1, num w. neg. exp.) --> RationalFunction")
                        target_type = 1
                else: # we have a proper fraction, we need a RationalFunction
                    logger.debug(":normalize: found FracElement (den!=1) --> RationalFunction")
                    target_type = 1
            elif isinstance(equ, SparsePolynomial):
                pass # the type do not change because of a SparsePolynomial
            elif isinstance(equ, RationalFunction):
                # we check the denominator to see if it is not 1
                if equ.denom != 1: # we need at least a RationalFunction
                    logger.debug(":normalize: found RationalFunction (den!=1) --> RationalFunction")
                    target_type = 1
            else: # other cases all to sympy
                logger.debug(":normalize: found something different --> sympy")
                target_type = 2
            equ = next(equations, None)
        
        return target_type

    def __transform_equation(self, equation, type):
        r'''
            Method to transform the equations of the system to the normalized setting.
        '''
        if isinstance(equation, PolyElement):
            if type == 0:
                nequation = SparsePolynomial.from_sympy(equation, self.variables)
            elif type == 1:
                nequation = RationalFunction.from_string(str(equation.as_expr()), self.variables)
            elif type == 2:
                nequation = equation.as_expr()
        elif isinstance(equation, FracElement):
            if type == 0:
                nequation = SparsePolynomial.from_sympy(equation.numer, self.variables)
            elif type == 1:
                nequation = RationalFunction.from_string(str(equation.as_expr()), self.variables)
            elif type == 2:
                nequation = equation.as_expr()
        elif isinstance(equation, SparsePolynomial):
            if type == 0:
                nequation = equation
            elif type == 1:
                nequation = RationalFunction(equation, RationalFunction.from_const(1, self.variables))
            elif type == 2:
                nequation = equation.to_sympy().as_expr()
        elif isinstance(equation, RationalFunction):
            if type == 0:
                nequation = equation.numer
            elif type == 1:
                nequation = equation
            elif type == 2:
                nequation = equation.to_sympy().as_expr()
        elif isinstance(equation, list):
            nequation = [self.__transform_equation(equ, type) for equ in equation]
        elif isinstance(equation, tuple):
            nequation = tuple([self.__transform_equation(equ, type) for equ in equation])
        else:
            if type == 0:
                raise TypeError("Reached SparsePolynomial from something weird")
            elif type == 1:
                raise TypeError("Reached RationalFunction from something weird")
            elif type == 2:
                nequation = equation
        return nequation

    def normalize(self):
        r'''
            Method that rewrites the equations of ``self`` to fit into all the methods in the class.

            This method transforms the equations of this :class:`FODESystem` by changing its type to 
            the best choice among:
            
            * :class:`~clue.rational_function.SparsePolynomial`: this is the best but most restrictive class
              for a system. It requires a polynomial input and exploits the sparseness of it to speed up 
              computations.
            * :class:`~clue.rational_function.RationalFunction`: this class is a rational function on the 
              form `numer/denom`. This is less restrictive than the polynomial input but needs that the 
              input is given in the specific form.
            * A SymPy expression: avoiding special classes as :class:`PolyElement` or :class:`FracElement`,
              we use the basic expression structure in SymPy for all the inputs that do not fit the previous
              two formats.

            **REMARK**: this method do not return anything and change the equations *in-place*.

            Examples:

            We start by showing what happen when using objects in the class :class:`~sympy.polys.rings.PolyElement`::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y'], QQ)
                >>> ode = FODESystem([x**2*y**2 - x**3*y**2], variables=['x','y'])
                >>> type(ode.equations[0]) # it is a PolyElement and it is a polynomial
                <class 'sympy.polys.rings.PolyElement'>
                >>> ode.normalize() # they change to SparsePolynomial
                >>> type(ode.equations[0])
                <class 'clue.rational_function.SparsePolynomial'>
                >>> ode.equations[0]
                x**2*y**2 + -x**3*y**2
                >>> ode = FODESystem([x**2*y**-2 - x**-2*y**2], variables=['x','y'])
                >>> type(ode.equations[0]) # it is a PolyElement! even with negative exponents!
                <class 'sympy.polys.rings.PolyElement'>
                >>> ode.normalize() # they change to expressions
                >>> type(ode.equations[0])
                <class 'sympy.core.add.Add'>
                >>> ode.equations[0]
                x**2/y**2 - y**2/x**2

            We repeat the examples but now using the class :class:`~sympy.polys.fields.FracElement`::

                >>> x,y = R.to_field().gens
                >>> ode = FODESystem([x**2*y**-2 - x**-2*y**2], variables=['x','y'])
                >>> type(ode.equations[0])
                <class 'sympy.polys.fields.FracElement'>
                >>> ode.normalize() # they change to RationalFunction
                >>> type(ode.equations[0])
                <class 'clue.rational_function.RationalFunction'>

        '''
        if not self.__normalize_input:
            type = self.__decide_type()
            for i in range(self.size):
                nequ = self.__transform_equation(self.equations[i], type)
                self._equations[i] = nequ
            self.__normalize_input = True

    def eval_equation(self, equations, point):
        r'''
            Method to evaluate a equations in a particular value.
            
            This method unifies the way of evaluating the equations of a differential system.
            After normalizing the system, we only have three options for the equations:
            
            * :class:`~clue.rational_function.SparsePolynomial`
            * :class:`~clue.rational_function.RationalFunction`
            * A Sympy expression.

            The first two can be evaluated with the method ``eval``. However, SymPy expressions
            are evaluated with the method ``subs`` and a different type of input.

            This method allows to evaluate all type of equations with the same interface and input.

            Input:

            - ``equations``: either an equation or index of the equation to be evaluated, or a list of these two things.
            - ``point``: list of values (with the length given by ``self.size``) or a dictionary with the 
              variables we want to evaluate.

            Output:

            The evaluation of the ``equations`` at ``point``. If the input is only one element, we return that element. Otherwise, we 
            return a list.
        '''
        if isinstance(point, (list, tuple)):
            if len(point) != self.size:
                raise TypeError("Not enough values to evaluate an equation (format list)")

            point = {self.variables[i] : point[i] for i in range(self.size)}
        elif isinstance(point, dict):
            if any(not (var in self.variables) for var in point):
                raise ValueError("A given variable for evaluation does not exist in the system (format dict)")

        self.normalize()
        symb_evaluations = [(symbols(k),v) for (k,v) in point.items()]
        sparse_evaluations = point

        was_list = True
        if not isinstance(equations, (list, tuple)): # we allow a list of elements to evaluate
            equations = [equations]
            was_list = False
            
        result = []

        for equation in equations:
            if isinstance(equation, int): # given an index --> considering the corresponding equation
                equation = self.equations[equation]

            if isinstance(equation, list):
                result.append(self.eval_equation(equation, point))
            elif isinstance(equation, tuple):
                result.append(tuple(self.eval_equation(equation, point)))
            elif isinstance(equation, (SparsePolynomial, RationalFunction)):
                result.append(equation.eval(**sparse_evaluations))
            elif hasattr(equation, "subs"):
                result.append(equation.subs(symb_evaluations))
            else:
                result.append(equation)
        
        if not was_list: return result[0]
        return result

    def check_consistency(self, other, map_variables, symbolic=False):
        r'''
            Method that check the consistency of the differential systems

            this method checks if ``self`` is obtained from the system ``other``
            after the change of variables provided by ``map_variables``.

            Each variable must be given as a linear :class:`~clue.rational_function.SparsePolynomial`.
        '''
        ########################################################
        # Normalizing equations if needed
        self.normalize()

        ########################################################
        # Obtaining some evaluation data
        if symbolic:
            dic_y_eval = {self.variables[i] : map_variables[i] for i in range(self.size)}
            xdot_eval = other.equations
        else:
            ## Evaluating the variables
            x_eval = [randint(1,100) for _ in other.variables]
            dic_x_eval = {other.variables[i] : x_eval[i] for i in range(other.size)}
            y_eval = [poly.eval(**dic_x_eval).ct for poly in map_variables]
            dic_y_eval = {self.variables[i] : y_eval[i] for i in range(self.size)}
            
            ## Evaluation other rhs
            xdot_eval = [other.eval_equation(i, dic_x_eval) for i in range(other.size)]

        ########################################################
        # COMPUTING LHS OF THE SYSTEM
        vec_vars = [el.linear_part_as_vec() for el in map_variables]
        lhs = [sum(vec_vars[i][j]*xdot_eval[j] for j in range(other.size)) for i in range(self.size)]
        # lhs is a list of elements of type depending on other.equations (symbolic) or number (not symbolic)
        
        ########################################################
        # COMPUTING RHS OF THE SYSTEM
        equations_to_eval = self.equations
        if symbolic: # we cast everything into sympy to do evaluation
            if isinstance(self.equations[0], SparsePolynomial):
                equations_to_eval = [el.to_sympy().as_expr() for el in equations_to_eval]
            elif isinstance(self.equations[0], RationalFunction):
                equations_to_eval = [(el.numer.to_sympy()/el.denom.to_sympy()).as_expr() for el in equations_to_eval]
            else:
                equations_to_eval = [el.as_expr() for el in equations_to_eval]

        if(isinstance(equations_to_eval[0], (SparsePolynomial, RationalFunction))):
            # this only happens if symbolic is False, so we evaluate to numbers
            rhs = [eq.eval(**dic_y_eval) for eq in equations_to_eval]
        else: # sympy case
            for k,v in list(dic_y_eval.items()):
                if isinstance(v, SparsePolynomial):
                    dic_y_eval[k] = v.to_sympy().as_expr()
                elif isinstance(v, RationalFunction):
                    dic_y_eval[k] = (v.numer.to_sympy()/v.denom.to_sympy()).as_expr()
            rhs = [eq.subs([(k, v) for k,v in dic_y_eval.items()]) for eq in equations_to_eval]

            if symbolic:
                if isinstance(other.equations[0], SparsePolynomial):
                    rhs = [SparsePolynomial.from_string(str(el), other.variables) for el in rhs]
                elif isinstance(other.equations[0], RationalFunction):
                    rhs = [RationalFunction.from_sympy(el, other.variables) for el in rhs]
                else:
                    ### TODO: make a comparison with sympy expressions instead of rational functions
                    lhs = [RationalFunction.from_sympy(el, other.variables) for el in lhs]
                    rhs = [RationalFunction.from_sympy(el, other.variables) for el in rhs]

        return lhs == rhs

    def evaluate_parameters(self, values):
        r'''
            Method that evaluate some of the parameters of the system to specific values

            Input
                - ``values``: a dictionary with the names of the parameters to evaluate as keys and the 
                  new values as the values.

            Output

            A new :class:`FODESystem` with the remaining equations of the system after evaluating the parameters
            with the given values.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y','a','b','c'], QQ)
                >>> ode = FODESystem([a*x**2*y**2 - b*x**3*y**2, -c*y*x,0,0,0], variables=['x','y','a','b','c'])
                >>> ode.pars
                ['a', 'b', 'c']
                >>> ode_eval = ode.evaluate_parameters({'a': 3, 'b': 0, 'c': -1})
                >>> ode_eval.variables
                ['x', 'y']
                >>> ode_eval.pars
                []
                >>> ode_eval.equations
                [3*x**2*y**2, x*y]

            The evaluation of the parameters can be performed partially (i.e., without providing all the parameters at once)::

                >>> ode_eval = ode.evaluate_parameters({'b' : 0})
                >>> ode_eval.pars
                ['a', 'c']
                >>> ode_eval.equations
                [a*x**2*y**2, -c*x*y, 0, 0]

            We even allow names that are not in the system::

                >>> ode_eval = ode.evaluate_parameters({'aa' : 0})
                >>> ode_eval.variables == ode.variables
                True
                >>> ode_eval.equations == ode.equations
                True

            But we will raise a :class:`ValueError` if we try to evaluate a variable that is not a parameter::

                >>> ode.species
                ['x', 'y']
                >>> ode_eval = ode.evaluate_parameters({'a' : 0, 'x' : 3})
                Traceback (most recent call last):
                ...
                ValueError: Can not evaluate the variable x [it is not a parameter]
        '''
        self.normalize()

        # checking we do not have non-parameters in the list
        for specie in self.species:
            if specie in values:
                raise ValueError(f"Can not evaluate the variable {specie} [it is not a parameter]")

        # removing unnecessary values
        values = {k : v for (k,v) in values.items() if k in self.pars}
        indices_parameters = [self.variables.index(k) for k in values]

        # computing the new equations --> we remove the equations from the evaluated parameters
        new_equations = [self.eval_equation(i, values) for i in range(self.size) if not (i in indices_parameters)]

        # computing the new observables (if any)
        new_observables = None if self.observables == None else self.eval_equation(self.observables, values)

        # computing the remaining variables
        new_variables = [self.variables[i] for i in range(self.size) if (not i in indices_parameters)]

        # removing parameters from initial conditions (if any)
        if self.ic is None: new_ic = {}
        else: new_ic = {k : v for (k,v) in self.ic.items() if (not k in values)}

        # setting the new name
        new_name = f"{self.name}_evaluated[{';'.join(f'{k}->{v}' for (k,v) in values.items())}]" if self.name != None else None

        # returning the resulting system
        return FODESystem(
            new_equations,  # the equations has less variables
            new_observables,# the observables are also evaluated
            new_variables,  # the remaining variables
            new_ic,         # the initial values do not have the evaluated parameters
            new_name       # we keep the name of the system
            )
            
    def remove_parameters_ic(self):
        r'''
            Method to compute a smaller system removing known parameters.

            This method evaluates the parameters of the systems whose initial conditions are known.
            This simplifies the system by removing variables from the list when the variables are constants
            (i.e., they are parameters with a fixed value). When this value was given as initial condition,
            we can simply remove this variable from the system.

            Output:

            A new :class:`FODESystem` where all the parameters whose initial condition is given has been evaluated.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y','a','b','c'], QQ)
                >>> ode = FODESystem([a*x**2*y**2 - b*x**3*y**2, -c*y*x,0,0,0], variables=['x','y','a','b','c'], ic={'a': 3, 'b' : 0})
                >>> ode.pars
                ['a', 'b', 'c']
                >>> ode_eval = ode.remove_parameters_ic()
                >>> ode_eval.variables
                ['x', 'y', 'c']
                >>> ode_eval.pars
                ['c']
                >>> ode_eval.equations
                [3*x**2*y**2, -c*x*y, 0]
        '''
        if self.ic is None: return self

        return self.evaluate_parameters({par : self.ic[par] for par in self.pars if par in self.ic})
    
    def scale_model(self, values):
        r'''
            Method to re-scale all variable of the model.

            This method do the substitution `x \mapsto x*c_x` for each variable where the factor `c_x` can be set differently for each variable.

            Since the scaling is only linear, the changes only show up in the right-hand side of the system. Namely, we do the previous substitution
            in each equation for all variables simultaneously and then for the equation related with `x`, we divide by `c_x`.

            The observables are also adapted with the same change.

            Input:
                - ``values``: dictionary with the names of the parameters to evaluate and their re-scaling factor. If a variable is not given it remains 
                  as it is (i.e., it has a factor of 1).

            Output: 

            A new :class:`FODESystem` with the rescaled equations.

            Examples::

                >>> from clue import *
                >>> from sympy import vring, QQ, symbols
                >>> R = vring(['x','y','a','b','c'], QQ)
                >>> ode = FODESystem([a*x**2*y**2 - b*x**3*y**2, -c*y*x,0,0,0], variables=['x','y','a','b','c'])
                >>> x,y,a,b,c = ode.symb_variables()
                >>> scaled_parameters = ode.scale_model({'a' : 3, 'b' : 4, 'c': 7})
                >>> scaled_parameters.equations
                [a*x**2*y**2/3 - b*x**3*y**2/4, -c*x*y/7, 0, 0, 0]
                >>> scaled_variables = ode.scale_model({'x' : 3, 'y' : 4})
                >>> scaled_variables.equations
                [a*x**2*y**2/48 - b*x**3*y**2/144, -c*x*y/3, 0, 0, 0]
        '''
        if isinstance(values, dict):
            sym_variables = self.symb_variables()
            changes = {self.variables[i] : sym_variables[i]/values.get(self.variables[i], 1) for i in range(len(self.variables))}
            new_equations = [self.eval_equation(i, changes)*values.get(self.variables[i], 1) for i in range(len(self.variables))]
            new_observables = self.eval_equation(self.observables, changes) if self.observables != None else None
            new_ic = {self.ic[v]*values.get(v,1) for v in self.ic} if self.ic != None else None
            new_name = f"{self.name}_scaled[{list(changes.values())}]" if self.name != None else None

            return FODESystem(
                new_equations,  # the equations with the scaled variables
                new_observables,# the observables are also scaled
                self.variables, # the variables does not change when scaling
                new_ic,         # the initial values are adapted accordingly
                new_name        # we update the name of the system with the scaling
                )
        else: # the case when all values are the same -->
            return self.scale_model({v: values for v in self.variables})

    ##############################################################################################################
    ## Methods for preparing to get the lumping
    ##############################################################################################################
    def construct_matrices(self, method):
        r'''
            Method to build the matrices necessary for lumping purposes using 
            different methods.

            The argument method is a string containing:

            * "polynomial": only works when the input are :class:`clue.rational_function.SparsePolynomial`. It
              relies on splitting the jacobian matrix into their coefficients in different monomials.
            * "rational": only works when the input are :class:`clue.rational_function.RationalFunction`
              and it relies on expanding the jacobian matrices and splitting into monomials.
            * "random": only works when the input are :class:`clue.rational_function.RationalFunction`
              or lower and it relies on random evaluation of the jacobian matrix after computing this 
              matrix explicitly.
            * "auto_diff": it works for any type of input (i.e., Sympy expressions or classes in 
              the module :mod:`clue.rational_function`) and it computes random evaluations of the jacobian
              matrix using automatic differentiation.

            This method will cache the result depending on the method chosen, so different methods can be compared.

            If a method is selected that is not valid for the type of the system, the next type will be tried too.            
        '''
        # Deciding the valid method for this system
        if(method == "polynomial" and (not issubclass(self.type, SparsePolynomial))):
            logger.warning(f"Method [{method}] selected but input is not SparsePolynomial. Trying random...")
            method = "random"
        if(method == "rational" and (not issubclass(self.type, RationalFunction))):
            logger.warning(f"Method [{method}] selected but input is not RationalFunction. Trying auto_diff...")
            method = "auto_diff"
        if(method == "random" and (not issubclass(self.type, (SparsePolynomial, RationalFunction)))):
            logger.warning(f"Method [{method}] selected but input is not RationalFunction. Trying auto_diff...")
            method = "auto_diff"
        if(not method in ("polynomial", "rational", "random", "auto_diff")):
            raise NotImplementedError(f"The method selected [{method}] is not valid.")
        
        # Building the matrices with the selected algorithm
        if(not method in self._lumping_matr):
            if(method == "polynomial"):
                self._lumping_matr[method] = self._construct_matrices_from_polys()
            elif(method == "rational"):
                self._lumping_matr[method] = self._construct_matrices_from_rational_functions()
            elif(method == "random"):
                self._lumping_matr[method] = self._construct_matrices_evaluation_random()
            else: # case of "auto_diff"
                self._lumping_matr[method] = self._construct_matrices_AD_random()
        return self._lumping_matr[method]

    def _construct_matrices_from_polys(self):
        """
        Constructs matrices J_1^T, ..., J_N^T (see Step (2) of Algorithm 1 in the paper)
        Input
            - polys - the right-hand side of the system of ODEs (f_1, ..., f_n)
                    represented by SparsePolynomial
        Output
            a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
        """
        logger.debug("Starting constructing matrices (SparsePolynomial)")
        polys = self.equations
        variables = self.variables
        field = self.field

        jacobians = dict()
        for p_ind, poly in enumerate(polys):
            logger.debug("Processing polynomial number %d", p_ind)
            for monom, coef in poly.dataiter():
                for i in range(len(monom)):
                    var, exp = monom[i]
                    if exp == 1:
                        m_der = tuple(list(monom[:i]) + list(monom[(i + 1):]))
                    else:
                        m_der = tuple(list(monom[:i]) + [(var, exp - 1)] + list(monom[(i + 1):]))
                    entry = field.convert(coef) * exp
                    if m_der not in jacobians:
                        jacobians[m_der] = SparseRowMatrix(len(variables), field)
                    jacobians[m_der].increment(var, p_ind, entry)

        result = jacobians.values()
        return list(result)

    def _construct_matrices_from_rational_functions(self):
        """
        Computes Jacobian, pulls out common denominator, and constructs matrices
        J_1^T, ..., J_N^T from the remaining polynomial matrix
        Input
            - rational_functions - the right-hand side of the system of ODEs (f_1, ..., f_n)
                                represented by RationalFunction
        Output
            a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
        """
        logger.debug("Starting constructing matrices (RationalFunction)")

        rational_functions = self.equations
        variables = self.variables
        field = self.field

        # Compute Jacobian
        J = [[rf.derivative(v) for rf in rational_functions] for v in variables]

        def lcm_rec(arr, l, u):
            if u - l == 1:
                return arr[l]
            mid = (u + l) // 2
            res = SparsePolynomial.lcm([lcm_rec(arr, l, mid), lcm_rec(arr, mid, u)])
            return res

        denoms = [rf.denom for rf in rational_functions]
        d = list(filter((lambda x: x != SparsePolynomial.from_string("1",[])),denoms))
        lcm = lcm_rec(d, 0, len(d))
        lcm = lcm*lcm

        p = [lcm // (denom*denom) for denom in denoms]

        # Pull out the common denominator 
        poly_J = []
        for i in range(len(J)):
            poly_J_row = []
            for j in range(len(J[i])):
                poly_J_row.append(J[i][j].numer * p[j])
            poly_J.append(poly_J_row)

        # Work with remaining polynomial matrix as in construct_matrices_from_polys
        jacobians = dict()
        for row_ind, poly_row in enumerate(poly_J):
            for col_ind, poly in enumerate(poly_row):
                p_ind = row_ind * len(poly_row) + col_ind
                logger.debug("Processing numerator polynomial number %d", p_ind)
                for m, coef in poly.dataiter():
                    if m not in jacobians:
                        jacobians[m] = SparseRowMatrix(len(variables), field)
                    jacobians[m].increment(row_ind, col_ind, coef)

        return list(jacobians.values())

    def _construct_matrices_evaluation_random(self, prob_err=0.01):
        logger.debug("Starting constructing random matrices (RationalFunction)")

        rational_functions = self.equations
        variables = self.variables
        field = self.field

        # Compute Jacobian
        J = [[rf.derivative(v) for rf in rational_functions] for v in variables]

        # we create the matrices by evaluating the jacobian
        subspace = Subspace(field)
        pivot_index = subspace.absorb_new_vector(FODESystem.build_random_evaluation_matrix(J).to_vector())
        n = sum(sum(1 for el in row if el != 0) for row in J) # number of non-zero entries 
        m = 1 # number of random generated matrices
        start = time.time()
        finished = False
        while(not finished):
            while(pivot_index >= 0):
                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_matrix(J).to_vector()
                )
                if(pivot_index >= 0):
                    m += 1
                if(m % 10 == 0):
                    logger.debug(f"Generated {m} random matrices...")
            ## We had a linearly dependant matrix: we check the probability of this being complete
            logger.debug(f"Found a linearly dependant matrix after {m} attempts.")
            if(m >= n): # we grew too much, reached the maximal
                logger.debug(f"We found the maximal amount of linearly independent matrices")
                finished = True
            else: # we checked (probabilistic) if we have finished
                logger.debug(f"We compute the maximal bound for the random coefficients to have \
                    less than {prob_err} probability to get an element in the current space.")
                Dn, Dd = self.bounds
                # Value for the size of coefficients (see paper ``Exact linear reduction for rational dynamics``)
                N = int(math.ceil((Dn + 2*m*Dd)/prob_err)) + self.size*Dd

                logger.debug(f"Bound for the coefficients: {N}")

                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_matrix(J, max=N).to_vector()
                )
                if(pivot_index < 0): # we are finished
                    logger.debug("The new matrix is in the vector space: we are done")
                    finished = True
                else: # we add the matrix to the list
                    logger.debug("The new matrix is NOT in the vector space: we continue")
                
        logger.debug(f"-> I created {m} linearly independent matrices in {time.time()-start}s")
        # We return the basis obtained
        return [el.as_matrix(self.size) for el in subspace.basis()]
    
    def _construct_matrices_AD_random(self, prob_err=0.01):
        r'''
            Method to build evaluations of the jacobian of ``funcs`` by automatic differentiation.

            This method computes evaluations of the Jacobian matrix of ``funcs`` by 
            using automatic differentiation (i.e., without actually computing the symbolic 
            derivatives of the functions in ``funcs``).

            This method relies on method :func:`build_random_evaluation_jacobian` which can work
            with :class:`clue.rational_function.SparsePolynomial`, :class:`clue.rational_function.RationalFunction`
            and sympy expressions.

            The computation of the actual error bound depends on the type of input in ``funcs``.
        '''
        logger.debug("Starting constructing random matrices (AD -- RationalFunction)")
        funcs = self.equations
        varnames = self.variables
        field = self.field

        subspace = Subspace(field)

        # computing number of non-zero entries in the jacobian
        if(isinstance(funcs[0], (SparsePolynomial, RationalFunction))):
            n = sum(len(func.variables()) for func in funcs)
        else:
            n = sum(len([el for el in func.free_symbols if str(el) in self.variables]) for func in funcs)
        logger.debug(":_construct_AD: bound for dimension: %d" %n)
        m = 0 # number of generated matrices

        start_global = time.time()

        # We first create some sparse evaluations
        ## Computing invalid singleton evaluations
        start = time.time()
        sparse_eval_points = self._sparse_evaluation_points()
        end = time.time()
        logger.debug(f":_construct_AD: Created {len(sparse_eval_points)} sparse evaluation points in {end-start}s")
        pivot_index = None
        for point in sparse_eval_points:
            start = time.time()
            new_matr = FODESystem.evaluate_jacobian(funcs, varnames, field, point)
            pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
            logger.debug(f":_construct_AD: Densities for now {subspace.densities()}")
            if(pivot_index >= 0): # new matrix added
                logger.debug(f":_construct_AD: New matrix added with density: {new_matr.density()}")
                m += 1
            if(m % 10 == 0):
                logger.debug(f":_construct_AD: Generated {m} random matrices...")
            end = time.time()
            logger.debug(f":_construct_AD: Matrix created and checked in {end - start}")
        ## Getting some sparse evaluations
        # for i in range(len(varnames)):
        #     start = time.time()
        #     new_matr = FODESystem.build_random_evaluation_jacobian(funcs, varnames, field, index=i)
        #     if new_matr is None:
        #         logger.debug(f"None matrix for coordinate {varnames[i]}")
        #         continue
        #     pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
        #     logger.debug(f"Densities for now {subspace.densities()}")
        #     if(pivot_index >= 0):
        #         logger.debug(f"New matrix density: {new_matr.density()}")
        #         m += 1
        #     if(m % 10 == 0):
        #         logger.debug(f"Generated {m} random matrices...")
        #     end = time.time()
        #     logger.debug(f"Matrix for {self.variables[i]} in {end - start}")
        
        if(m == 0): 
            logger.debug(f":_construct_AD: No sparse evaluation was done. Creating one starting evaluation...")
            start = time.time()
            pivot_index = subspace.absorb_new_vector(
                FODESystem.build_random_evaluation_jacobian(funcs, varnames, field).to_vector()
            )
            end = time.time()
            logger.debug(f":_construct_AD: Matrix created and checked in {end - start}")
            m = 1

        finished = (m >= n)

        while(not finished):
            while(pivot_index >= 0):
                start = time.time()
                new_matr = FODESystem.build_random_evaluation_jacobian(funcs, varnames, field)
                pivot_index = subspace.absorb_new_vector(new_matr.to_vector())
                logger.debug(f":_construct_AD: Densities for now {subspace.densities()}")
                if(pivot_index >= 0):
                    logger.debug(f":_construct_AD: New matrix density: {new_matr.density()}")
                    m += 1
                if(m % 10 == 0):
                    logger.debug(f":_construct_AD: Generated {m} random matrices...")
                end = time.time()
                logger.debug(f":_construct_AD: Matrix in {end - start}")
            ## We had a linearly dependant matrix: we check the probability of this being complete
            logger.debug(f":_construct_AD: Found a linearly dependant matrix after {m} attempts.")
            if(m >= n): # we grew too much, reached the maximal
                logger.debug(f":_construct_AD: We found the maximal amount of linearly independent matrices")
                finished = True
            else: # we checked (probabilistic) if we have finished
                logger.debug(f":_construct_AD: We compute the maximal bound for the random coefficients to have less than {prob_err} probability \
                to get an element in the current space.")
                Dn, Dd = self.bounds
                # Value for the size of coefficients (see paper ``Exact linear reduction for rational dynamics``)
                N = int(math.ceil((Dn + 2*m*Dd)/prob_err)) + self.size*Dd

                logger.debug(f":_construct_AD: Bound for the (prob.) coefficients: {N}")

                pivot_index = subspace.absorb_new_vector(
                    FODESystem.build_random_evaluation_jacobian(funcs, varnames, field, max=N).to_vector()
                )
                if(pivot_index < 0): # we are finished
                    logger.debug(":_construct_AD: The new matrix is in the vector space: we are done")
                    finished = True
                else: # we add the matrix to the list
                    logger.debug(":_construct_AD: The new matrix is NOT in the vector space: we continue")
                
        logger.debug(f":_construct_AD: -> I created {m} linearly independent matrices in {time.time()-start_global}s")
        # We return the basis obtained
        return [el.as_matrix(self.size) for el in subspace.basis()]
    
    def _sparse_evaluation_points(self):
        base_sparse = [i*[0] + [1] + (self.size - i - 1)*[0] for i in range(self.size)]
        if(isinstance(self.equations[0], SparsePolynomial)):
            result = base_sparse
        elif(isinstance(self.equations[0], RationalFunction)):
            denoms = [el.denom for el in self.equations]
            result = []
            for point in base_sparse:
                current = [el for el in denoms if el.eval(**{self.variables[i]: point[i] for i in range(self.size)}) == 0]
                while(len(current) > 0):
                    for v in current[0].variables():
                        if(point[self.variables.index(v)] == 0):
                            point[self.variables.index(v)] = 1
                            break
                    current = [el for el in denoms if el.eval(**{self.variables[i]: point[i] for i in range(self.size)}) == 0]
                result.append(point)
        else: # sympy expression case
            result = FODESystem.sparse_evaluation_points_sympy(self.equations, self.variables, base_sparse)
        return result

    ##############################################################################################################
    ### Static and private methods for building matrices
    @staticmethod
    def evaluate_matrix(matrix, values):
        r'''
            Method to evaluate a Matrix at a particular position

            This method evaluates a list of lists (i.e., a matrix) of rational functions or polynomials
            in a particular place. This method only works if all variables are provided for the evaluation.

            This method assumes that all the information (concerning the variables) can be obtained from the 
            first element of the matrix (the element ``matrix[0][0]``).

            Input
                ``matrix`` - a list of lists with either :class:`~clue.rational_function.SparsePolynomial`
                or :class:`~clue.rational_function.RationalFunction`. In general, any class that 
                provide a method ``eval`` could work.
                ``values`` - a list of values of the same length as ``matrix[0][0].gens``, indicating the 
                evaluation point.

            Output
                a :class:`SparseRowMatrix` with the evaluation of ``matrix`` at ``values``.

            TODO: add examples and tests
        '''
        varnames = matrix[0][0].gens
        domain = matrix[0][0].domain

        if(len(values) != len(varnames)):
            raise ValueError("Evaluation this matrix requires exactly %d values (%d given)" %(len(varnames), len(values)))

        values = {varnames[i] : values[i] for i in range(len(values))}
        result = SparseRowMatrix(len(matrix), domain)
        for i in range(len(matrix)):
            for j in range(len(matrix[i])):
                if(matrix[i][j]!=0):
                    evaluation = matrix[i][j].eval(**values).get_constant()
                    if(evaluation != 0):
                        result.increment(i,j,evaluation)
        return result

    @staticmethod
    def build_random_evaluation_matrix(matrix, min=0, max=100, attempts=1000):
        r'''
            Evaluates a matrix (as a list of lists) in a random vector of integer coordinates.

            This method generates a vector of integers (depending in the amount of variables)
            and build a SparseRowMatrix with the evaluations of the entries in ``matrix`` in
            such vector.

            If any error occur during the evaluation (for example, we find a pole of a rational function)
            this method will start over until we find a valid evaluation.

            The coordinates will be generated between the values provided by ``min`` and ``max``.

            Input
                ``matrix`` - a list of lists with either :class:`~clue.rational_function.SparsePolynomial`
                or :class:`~clue.rational_function.RationalFunction`. In general, any class that 
                provide a method ``eval`` could work.
                ``min`` - the minimal integer value for the coordinates in the evaluation vector.
                ``max`` - the maximal integer value for the coordinates in the evaluation vector.

            Output
                a :class:`SparseRowMatrix` with the evaluation of ``matrix`` at a random place.
        '''
        varnames  = matrix[0][0].gens

        for _ in range(attempts):
            values = tuple([randint(min, max) for _ in range(len(varnames))])
            try:
                return FODESystem.evaluate_matrix(matrix, values)
            except KeyboardInterrupt as e:
                raise e
            except ZeroDivisionError:
                pass

        raise ValueError("After %d attempts, we did not find a valid random evaluation. Consider changing the bounds." %attempts)

    @staticmethod
    def evaluate_jacobian(funcs, varnames, domain, values):
        r'''
            Method to evaluate the jacobian of some functions at a particular position

            Input
                ``funcs`` - a list of functions formed out of the variables in ``varnames``.
                They can be :class:`clue.rational_function.SparsePolynomial`, :class:`RationalFunction`
                of Sympy expressions
                ``varnames`` - list of names of the variables involved in the function.
                ``domain`` - sympy structure for the coefficients to be taken
                ``values`` - vector of values defining the point of evaluation

            Output
                a :class:`SparseRowMatrix` with the evaluation of the Jacobian of ``funcs`` at ``values``.

            TODO: add examples and tests
        '''
        nrows = len(funcs)
        ncols = len(varnames)

        matrix = [_automated_differentiation(func, varnames, domain, values)[1:] for func in funcs] # this needs to be transposed
        result = SparseRowMatrix(len(matrix[0]), domain)
        for i in range(nrows):
            for j in range(ncols):
                if(matrix[i][j] != 0):
                    result.increment(j,i,matrix[i][j]) # indices are transposed
        return result

    @staticmethod
    def build_random_evaluation_jacobian(funcs, varnames, domain, min=0, max=20, attempts=1000, index=None):
        r'''
            Computes the evaluation of the Jacobian of some rational functions via automatic differentiation.

            This method generates a vector of integers (depending in the amount of variables)
            and build a SparseRowMatrix with the evaluations of the Jacobian of the rational functions
            given in the input at the point given by the vector.

            If any error occur during the evaluation (for example, we find a pole of a rational function)
            this method will start over until we find a valid evaluation.

            The coordinates will be generated between the values provided by ``min`` and ``max``.

            Input
                ``funcs`` - a list of functions formed out of the variables in ``varnames``.
                They can be :class:`clue.rational_function.SparsePolynomial`, :class:`RationalFunction`
                of Sympy expressions
                ``varnames`` - list of names of the variables involved in the function.
                ``domain`` - sympy structure for the coefficients to be taken
                ``min`` - the minimal integer value for the coordinates in the evaluation vector.
                ``max`` - the maximal integer value for the coordinates in the evaluation vector.

            Output
                a :class:`SparseRowMatrix` with the evaluation of ``matrix`` at a random place.
        '''
        for _ in range(attempts):
            if index is None:
                values = [randint(min, max) for v in varnames]
            else:
                values = [0] * len(varnames)
                values[index] = randint(min, max)
            try:
                return FODESystem.evaluate_jacobian(funcs, varnames, domain, values)
            except KeyboardInterrupt as e:
                raise e
            except ZeroDivisionError:
                pass
    
    @staticmethod
    def bound_degree_expr(expr: sympy.core, varnames=None):
        r'''
            Static method to compute a degree bound for a sympy expression
            
            This method computes a degree bound for the numerator and denominator of a 
            sympy rational expression without expanding it.

            Input
                - ``exp`` - a sympy expression
                - ``varnames`` - list of names for the symbols that will counted for degree. Other symbols will 
                  be ignored. If ``None`` is given, then all symbols will be taken into consideration.
            Output
                - ``(num_bound, denom_bound)`` - ``num_bound`` is the upper bound for the degree of
                the numerator and ``denom_bound`` is the upper bound for the degree of the denominator.

            Examples::

                >>> from sympy import Symbol
                >>> from clue import FODESystem
                >>> a = sympy.Symbol("a")
                >>> b = sympy.Symbol("b")
                >>> c = sympy.Symbol("c")
                >>> d = sympy.Symbol("d")
                >>> FODESystem.bound_degree_expr(a/b)
                (1, 1)
                >>> FODESystem.bound_degree_expr(a + b)
                (1, 0)
                >>> FODESystem.bound_degree_expr(a/b + c/d)
                (2, 2)
                >>> FODESystem.bound_degree_expr((a**2)/1)
                (2, 0)
                >>> FODESystem.bound_degree_expr((a**2)/b)
                (2, 1)
                >>> FODESystem.bound_degree_expr(a/(b**42))
                (1, 42)
                >>> FODESystem.bound_degree_expr((a+b)**2/1)
                (2, 0)
                >>> FODESystem.bound_degree_expr((a*b*(1+b)) / (42 - a)**2)
                (3, 2)
                >>> FODESystem.bound_degree_expr(1/(b/(a + b) + 1))
                (1, 1)
                >>> FODESystem.bound_degree_expr((1 + a**3 / b**2) / (1 + b / (a + b)))
                (4, 3)
                >>> FODESystem.bound_degree_expr((a**2 + b**2*c**2) / d**3)
                (4, 3)
        '''
        if isinstance(expr, sympy.core.mul.Mul):
            arg_bounds = [FODESystem.bound_degree_expr(arg, varnames) for arg in expr._args]
            num_bound = sum([bound[0] for bound in arg_bounds]) 
            denom_bound = sum([bound[1] for bound in arg_bounds])
        elif isinstance(expr, sympy.core.add.Add):
            arg_bounds = [FODESystem.bound_degree_expr(arg, varnames) for arg in expr._args]
            denom_bound = sum([bound[1] for bound in arg_bounds])
            if denom_bound == 0:
                num_bound = max([bound[0] for bound in arg_bounds])
            else:
                num_bound = max([bound[0] + denom_bound - bound[1] for bound in arg_bounds])
        elif isinstance(expr, sympy.core.power.Pow):
            arg_bounds = FODESystem.bound_degree_expr(expr._args[0], varnames)
            power = expr._args[1]
            if power >= 0:
                num_bound = arg_bounds[0]*power
                denom_bound = arg_bounds[1]*power
            else:
                num_bound = arg_bounds[1]*(-power)
                denom_bound = arg_bounds[0]*(-power)
        elif isinstance(expr, sympy.core.symbol.Symbol):
            num_bound = 1 if (varnames is None or str(expr) in varnames) else 0
            denom_bound = 0
        elif isinstance(expr, sympy.core.numbers.Number):
            num_bound = 0
            denom_bound = 0
        else:
            raise NotImplementedError

        return (num_bound, denom_bound)

    @staticmethod
    def sparse_evaluation_points_sympy(funcs, varnames, base_sparse, attempts = 5):
        r'''
            Method to get a set of sparse evaluation points for sympy expressions

            This method tries to build a set of points where the evaluation of some
            sympy expressions can be computed while having as many zeros in the input 
            as possible.

            This method acts recursively from bottom to top of the expression tree
            of the functions. This method works both for one expression or a list of
            expressions, where we simply call iteratively to this method with the following
            points.

            Input
                - ``funcs`` - either a list of sympy expressions or a sympy expression
                - ``varnames`` - list of variables to be considered to evaluate
                - ``base_sparse`` - a base set of "sparse" evaluation points.

            Output
            
            A new list of points "as sparse as possible" (i.e., having as many zeros as possible)
            such that any expression in funcs can be evaluated.

            Examples::

                >>> from clue import FODESystem
                >>> import sympy
                >>> a = sympy.Symbol("a")
                >>> b = sympy.Symbol("b")
                >>> c = sympy.Symbol("c")
                >>> d = sympy.Symbol("d")
                >>> FODESystem.sparse_evaluation_points_sympy(a/b, varnames=['a', 'b'], base_sparse=[[1,0],[0,1]])
                [[0, 1], [1, 1]]
        '''
        if(isinstance(funcs, (list, tuple))):
            if(len(funcs) == 0):
                return base_sparse
            result = FODESystem.sparse_evaluation_points_sympy(funcs[0], varnames, base_sparse, attempts)
            return FODESystem.sparse_evaluation_points_sympy(funcs[1:], varnames, result, attempts)
        
        ## The case of simply one expression
        expr = funcs
        if isinstance(expr, sympy.core.mul.Mul):
            ## we need to evaluate all the operands
            result = FODESystem.sparse_evaluation_points_sympy(expr.args, varnames, base_sparse, attempts)
        elif isinstance(expr, sympy.core.add.Add):
            ## we need to evaluate all the operands
            result = FODESystem.sparse_evaluation_points_sympy(expr.args, varnames, base_sparse, attempts)
        elif isinstance(expr, sympy.core.power.Pow):
            ## we need to evaluate the base
            partial = FODESystem.sparse_evaluation_points_sympy(expr.args[0], varnames, base_sparse, attempts)
            try:
                power = int(expr.args[1])
                if(power < 0): # we need to avoid the evaluation to zero of this denominator
                    base_expr = expr.args[0]
                    result = []
                    for point in partial:
                        evaluation = [(symbols(varnames[i]), point[i]) for i in range(len(point))]
                        variables = [str(el) for el in base_expr.free_symbols if str(el) in varnames]
                        to_add = True
                        tries = 0
                        while(base_expr.subs(evaluation) == 0):
                            # if we have something nonzero, we set it up to 1
                            if(any(point[varnames.index(v)] == 0 for v in variables)):
                                for v in variables:
                                    if(point[varnames.index(v)] == 0):
                                        point[varnames.index(v)] = 1
                            else:
                                # if everything is non-zero, we mix them up randomly as many as
                                # ''attempts'' times
                                for v in variables:
                                    point[varnames.index(v)] = randint(1,10)
                                tries += 1
                                if(tries > attempts): 
                                    # if we repeated too many times, we quit and 
                                    # forget about this point
                                    to_add = False
                                    break
                            evaluation = ((symbols(varnames[i]), point[i]) for i in range(len(point)))
                        if(to_add): result.append(point)
                else:
                    result = partial                
            except TypeError:
                result = []
        elif isinstance(expr, sympy.core.symbol.Symbol):
            result = base_sparse
        elif isinstance(expr, sympy.core.numbers.Number):
            result = base_sparse
        else:
            raise NotImplementedError

        return [list(el) for el in set(tuple([tuple(el) for el in result]))]

    ##############################################################################################################
    ##############################################################################################################

    def lumping(self, observable,
                new_vars_name="y",
                print_system=False,
                print_reduction=True,
                out_format="sympy",
                loglevel=None,
                initial_conditions=None,
                method = "polynomial",
                file=sys.stdout,
    ):
        r'''
            Main function, performs a lumping of a polynomial ODE system
            Input
                - observable - a nonempty list of linear forms in state variables
                            that must be kept non-lumped
                - new_vars_name (optional) - the name for variables in the lumped polynomials
                - print_system and print_reduction (optional) - whether to print the original system and the result, respectively on the screen
                - out_format - "sympy" or "internal", the way the output polynomials should be represented
                the options are sympy polynomials and SparsePolynomial
                - loglevel - INFO (only essential information) or DEBUG (a lot of information about the computation process)
                - initial_conditions - Initial conditions for some elements on the system to be lumped
                - method - user decision about how to compute the internal matrices for lumping. See method 
                :func:`construct_matrices` for further information.
                - file - optional file descriptor to print the results (in case ``print_system`` or ``print_reduction`` are ``True``)

            Output
                a tuple (the right-hand side of an aggregated system, new_variables)

            Examples::

                >>> from clue import *
                >>> from sympy import QQ
                >>> from sympy.polys.rings import vring
                >>> R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
                >>> ## Example 1
                >>> system = FODESystem([x0**2 + x1 + x2, x2, x1], variables=['x0','x1','x2'])
                >>> lumping = system.lumping([x0], print_reduction=False,initial_conditions={'x0': 1, 'x1': 2, 'x2': 5})
                >>> lumping.ic
                {'y0': MPQ(1,1), 'y1': MPQ(7,1)}
                >>> lumping.old_vars
                [x0, x1 + x2]
                >>> lumping.is_consistent()
                True
                >>> ## Example 2
                >>> system = FODESystem([x1**2 + 4 * x1 * x2 + 4 * x2**2, 
                ...     x1 + 2 * x0**2, 
                ...     x2 - x0**2], variables=['x0','x1','x2'])
                >>> lumping = system.lumping([x0], print_reduction=False)
                >>> lumping.old_vars
                [x0, x1 + 2*x2]
                >>> lumping.is_consistent()
                True

            We can also lump system involving rational functions (see class 
            :class:`~clue.rational_function.RationalFunction`)::

                >>> varnames = ["x0", "x1", "x2"]
                >>> ## Example 1
                >>> rhs = [RationalFunction.from_string("(x0**2 + x1 + x2)/1", varnames),
                ...     RationalFunction.from_string("x2/1", varnames),
                ...     RationalFunction.from_string("x1/1", varnames)]
                >>> system = FODESystem(rhs, variables=varnames)
                >>> lumping = system.lumping([SparsePolynomial.from_string("x0", varnames)],
                ...       print_reduction=False,
                ...       initial_conditions={"x0" : 1, "x1" : 2, "x2" : 5})
                >>> lumping.ic
                {'y0': MPQ(1,1), 'y1': MPQ(7,1)}
                >>> lumping.old_vars
                [x0, x1 + x2]
                >>> lumping.is_consistent()
                True
                >>> ## Example 2
                >>> rhs = [RationalFunction.from_string("(x1**2 + 4 * x1 * x2 + 4 * x2**2)/1", varnames),
                ...     RationalFunction.from_string("(x1 + 2 * x0**2)/1", varnames),
                ...     RationalFunction.from_string("(x2 - x0**2)/1", varnames)]
                >>> system = FODESystem(rhs, variables=varnames)
                >>> lumping = system.lumping([SparsePolynomial.from_string("x0", varnames)],
                ...       print_reduction=False)
                >>> lumping.is_consistent()
                True

            The following example actually have rational functions involved::

                >>> varnames = ["x", "y"]
                >>> rhs = [RationalFunction.from_string("y/(x-y)", varnames),
                ...     RationalFunction.from_string("x/(x-y)", varnames)]
                >>> system = FODESystem(rhs, variables=varnames)
                >>> lumping = system.lumping([SparsePolynomial.from_string("x-y", varnames)],
                ...       print_reduction=False,
                ...       initial_conditions={"x" : 1, "y" : 2})
                >>> lumping.ic
                {'y0': MPQ(-1,1)}
                >>> lumping.old_vars
                [x + -y]
                >>> lumping.is_consistent()
                True

            We add now some tests using some external files from folder ``tests``::

                >>> ## Example 1
                >>> system = FODESystem(file="models/polynomial/ProteinPhosphorylation[2].ode") 
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("S0", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model ProteinPhosphorylation[2]: consistency"
                >>> assert lumping.size == 12, "Error in model ProteinPhosphorylation(2): size"
                >>> ## Example 2
                >>> system = FODESystem(file="models/polynomial/BIOMD0000000101.ode")
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("RI", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model BIOMD0000000101: consistency"
                >>> assert lumping.size == 14, "Error in model BIOMD0000000101: size"
                >>> ## Example 3
                >>> system = FODESystem(file="models/polynomial/MODEL1504160000.ode")
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("cd8_in_spleen", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model MODEL1504160000: consistency"
                >>> assert lumping.size == 8, "Error in model MODEL1504160000: size"
                >>> ## Example 4
                >>> system = FODESystem(file="models/polynomial/MODEL9085850385.ode")
                >>> lumping = system.lumping(
                ...     [SparsePolynomial.from_string("PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx", system.variables)], 
                ...     print_reduction=False)
                >>> assert lumping.is_consistent(), "Error in model MODEL9085850385: consistency"
                >>> assert lumping.size == 54, "Error in model MODEL9085850385: size"
        '''
        ## Putting the logger level active
        if(loglevel != None):
            old_level = logger.getEffectiveLevel()
            if(loglevel == "INFO"):
                logger.setLevel(logging.INFO)
            elif(loglevel == "DEBUG"):
                logger.setLevel(logging.DEBUG)
            elif(loglevel == "WARNING"):
                logger.setLevel(logging.WARNING)
            elif(loglevel == "ERROR"):
                logger.setLevel(logging.ERROR)
        
        logger.debug(":lumping: Starting aggregation")

        ## Normalizing input if needed
        self.normalize()

        if isinstance(observable[0], PolyElement):
            logger.debug(":lumping: observables in PolyElement format. Casting to SparsePolynomial")
            observable = [SparsePolynomial.from_sympy(el, self.variables).linear_part_as_vec() for el in observable]
        elif isinstance(observable[0], SparsePolynomial):
            observable = [p.linear_part_as_vec() for p in observable]
        else:
            logger.debug(":lumping: observables seem to be in SymPy expression format, converting")
            observable = [[self.field.convert(p.diff(sympy.Symbol(x))) for x in self.variables] for p in observable]

        result = self._lumping(observable,
                    new_vars_name,
                    print_system, 
                    print_reduction, 
                    initial_conditions, 
                    method,
                    file
                )

        if initial_conditions is not None:
            eval_point = [self.ic.get(v, initial_conditions.get(v, 0)) for v in self.variables]
            result["ic"] = {}
            for i in range(len(result["variables"])):
                vect = result["subspace"][i]
                v = result["variables"][i]
                result["ic"][v] = sum([p[0] * p[1] for p in zip(eval_point, vect)])

        if out_format == "sympy":
            ## Getting the method to transform
            if isinstance(result["equations"][0], SparsePolynomial):
                out_ring = result["equations"][0].get_sympy_ring()
                transform = lambda p : out_ring(p.get_sympy_dict())
            elif isinstance(result["equations"][0], RationalFunction):
                out_ring = result["equations"][0].get_sympy_ring()
                F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)
                transform = lambda p : F(out_ring(p.numer.get_sympy_dict()))/F(out_ring(p.denom.get_sympy_dict()))
            elif isinstance(result["equations"][0], (list,tuple)):
                if isinstance(result["equations"][0][0], SparsePolynomial):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    transform = lambda p : [out_ring(q.get_sympy_dict()) for q in p]
                elif isinstance(result["equations"][0][0], RationalFunction):
                    out_ring = result["equations"][0][0].get_sympy_ring()
                    F = sympy.FractionField(sympy.QQ, result["equations"][0].gens)
                    transform = lambda p : [F(out_ring(q.numer.get_sympy_dict()))/F(out_ring(q.denom.get_sympy_dict())) for q in p]
            result["equations"] = [transform(p) for p in result["equations"]]
        elif out_format == "internal":
            pass
        else:
            if(loglevel != None): logger.setLevel(old_level)
            raise ValueError(f"Unknown output format {out_format}")

        ## Fixing the level of the logger
        if(loglevel != None): logger.setLevel(old_level)
        return self._lumped_system_type(old_system = self, dic=result)

    def _lumping(self, observable, 
                new_vars_name='y', 
                print_system=True, 
                print_reduction=False, 
                ic=None, 
                method = "auto_diff",
                file=sys.stdout,
    ):
        """
        Performs a lumping of a polynomial ODE system represented by SparsePolynomial
        Input
            - observable - a nonempty list of linear forms in state variables
                        that must be kept non-lumped, linear forms represented as lists of coefficients
            - new_vars_name (optional) - the name for variables in the lumped polynomials
            - print_system and print_reduction (optional) - whether to print the original system and the result, respectively on the screen
            - ic - Initial conditions for some elements on the system to be lumped
            - method - user decision about how to compute the internal matrices for lumping. See method 
              :func:`construct_matrices` for further information.
            - file - optional file descriptor to print the results (in case ``print_system`` or ``print_reduction`` are ``True``)
        Output
            a dictionary with all the information so the method :func:`lumping`can build the Lumped 
            system (see class :class`LDESystem`)
        """
        logger.debug(":ilumping: Starting aggregation")

        vars_old = self.variables
        
        # Building the matrices for lumping
        start = time.time()
        logger.debug(":ilumping: Computing matrices for perform lumping...")
        matrices = self.construct_matrices(method)
        logger.debug(f"ilumping: -> Computed {len(matrices)} in {time.time()-start}s")

        # Find a lumping
        field = self.field
        vectors_to_include = []
        for linear_form in observable:
            vec = SparseVector.from_list(linear_form, field)
            vectors_to_include.append(vec)
        logger.debug(":ilumping: Computing the lumping subspace...")
        start = time.time()
        lumping_subspace = find_smallest_common_subspace(matrices, vectors_to_include)
        logger.debug(f":ilumping: -> Found the lumping subspace in {time.time()-start}s")

        lumped_rhs = self._lumped_system(lumping_subspace, vars_old, field, new_vars_name)

        new_ic = None
        if ic is not None:
            eval_point = [ic.get(v, 0) for v in vars_old]
            #eval_point = [ic.get(v, 0) for v in rhs[0].gens]
            new_ic = []
            for vect in lumping_subspace.basis():
                new_ic.append(sum([p[0] * p[1] for p in zip(eval_point, vect.to_list())]))

        ## Computing the new variables and their expression in term of old variables
        vars_new = ["%s%d" %(new_vars_name, i) for i in range(lumping_subspace.dim())]
        map_old_variables = []
        for i in range(lumping_subspace.dim()):
            new_var = SparsePolynomial(vars_old, field)
            for j in range(len(vars_old)):
                if lumping_subspace.basis()[i][j] != 0:
                    new_var += SparsePolynomial(vars_old, field, {((j, 1),) : lumping_subspace.basis()[i][j]})
            map_old_variables.append(new_var)

        ## Nice printing
        if print_system:
            print("Original system:", file=file)
            for i in range(len(self.equations)):
                print(f"{vars_old[i]}' = {self.equations[i]}", file=file)
            print("Outputs to fix:", file=file)
            print(", ".join(map(str, observable)), file=file)
        
        if print_reduction:
            print("New variables:", file=file)
            for i in range(lumping_subspace.dim()):
                print(f"{vars_new[i]} = {map_old_variables[i]}", file=file)
            if new_ic is not None:
                print("New initial conditions:", file=file)
                for v, val in zip(vars_new, new_ic):
                    print(f"{v}(0) = {float(val)}", file=file)
            print("Lumped system:", file=file)
            for i in range(lumping_subspace.dim()):
                print(f"{vars_new[i]}' = {lumped_rhs[i]}", file=file)

        return {"equations" : lumped_rhs, 
                "variables" : vars_new,
                "ic" : new_ic,
                "name": f"Lumped system [{observable}] ({self.name})",
                "old_vars" : map_old_variables,
                "subspace" : [v.to_list() for v in lumping_subspace.basis()]}

    def _lumped_system(self, lumping_subspace, vars_old, field, new_vars_name):
        return lumping_subspace.perform_change_of_variables(self.equations, vars_old, field, new_vars_name)

class LDESystem(FODESystem):
    r'''
        Extended class for a :class:`FODESystem` for lumped systems.

        This class is the natural extension of the class for representing a first order linear 
        system (see class :class:`FODESystem`) where we keep some information on the lumping used
        to obtain the variables of this new system.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic= None, name = None, 
                    old_vars = None, old_system = None, subspace=None,
                    dic=None, file = None, **kwds
    ):
        # Starting the base class data
        super().__init__(equations, observables, variables, ic, name, dic=dic, file=file, **kwds)

        # Adding the specific information for this extended class
        if(old_vars is None):
            if(dic is None or not "old_vars" in dic):
                raise ValueError("Needed a map from the new variables to the old variables.")
            old_vars = dic["old_vars"]
        
        if(old_system is None):
            if(dic is None or not "old_system" in dic):
                raise ValueError("Needed a map from the new variables to the old variables.")
            old_system = dic["old_system"]

        if(subspace is None):
            if (dic is None or not "subspace" in dic):
                raise ValueError("Needed a lumping subspace to define a Lumped System.")
            subspace = dic["subspace"]
        
        self._old_vars = old_vars
        self._old_system = old_system
        self._subspace = subspace

    @property
    def old_vars(self):
        return self._old_vars

    @property
    def old_system(self):
        return self._old_system

    def is_consistent(self, symbolic=False):
        return self.check_consistency(self.old_system, self.old_vars, symbolic)

class UncertainFODESystem(FODESystem):
    r'''
        Class to represent a Linear Uncertain Differential System (LUDS).

        A LUDS is defined by two constant matrices `m` and `M` with the property `m \leq M` (where the 
        inequality is interpreted entry-wise) and consider all possible Linear Differential Systems of 
        shape 

        .. MATH::

            x'(t) = A(t)x(t),

        where `A(t)` is a matrix of measurable functions such that:

        * `m \leq A(t) \leq M` for all `t \geq 0`.
        * If `x(t)` is a solution to the system defined by `A(t)` with `x(0) \leq 0`, then `x(t) \geq 0` for all the domain where `x(t)` is defined.

        This class allows to represent these uncertain systems and provide new methods to check specific properties from these systems.

        INPUT:

        * ``equations``: the set of equations for the uncertain system. This must be a list of pairs of equations: the first is the lower bound and 
          second is the upper bound for the uncertain system. The length must be the number of variables.
        * ``observables``: a list of possible observables for the system (see :class:`FODESystem`)
        * ``variables``: names for the variables of the system (see :class:`FODESystem`)
        * ``ic``: (optional) dictionary with initial conditions for some variables.
        * ``name``: (optional) string with a name for this system.
        * ``matrices``: the pair of matrices `m` and `M` defining the uncertain system.
        * ``dic``: dictionary with information to define the system.
        * ``file``: a file to read the system.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic={}, name = None, 
                matrices = None, 
                dic=None, file=None, **kwds
    ):
        equations = equations if equations != None else (dic.pop("equations", None) if dic != None else None)
        variables = variables if variables != None else (dic.pop("variables", None) if dic != None else None)
        if equations != None: # the equations are given as actual equations
            if len(equations) != len(variables):
                raise TypeError(f"Wrong number of equations ({len(equations)}) given (expected {len(variables)})")
            # we need to compute the matrices.
            lower_equations = [equ[0] for equ in equations]
            upper_equations = [equ[1] for equ in equations]
            if any(not isinstance(el, SparsePolynomial) for el in lower_equations + upper_equations):
                raise TypeError("The equations must be given as Sparse Polynomials")
            if any(not (all(equation.degree(v) in (1,0) for v in variables) and equation.ct == 0) for equation in lower_equations + upper_equations):
                raise TypeError("The equations must be homogeneous and linear equations")
            m = SparseRowMatrix(len(variables), lower_equations[0].domain)
            M = SparseRowMatrix(len(variables), lower_equations[0].domain)
            for i in range(len(variables)):
                for j in range(len(variables)):
                    m.increment(i,j, lower_equations[i].derivative(variables[j]).ct)
                    M.increment(i,j, upper_equations[i].derivative(variables[j]).ct)
        elif matrices != None:
            m, M = matrices
            if not isinstance(m, SparseRowMatrix):
                if not isinstance(m, (list,tuple)) or not all(isinstance(row, (list,tuple)) for row in m):
                    raise TypeError("The lower matrix must be a matrix")
                if len(m) != len(variables) or any(len(row) != len(variables) for row in m):
                    raise TypeError(f"The lower matrix must have {len(variables)} rows and columns")
                om = m
                m = SparseRowMatrix(len(m), QQ)
                for i in range(len(om)):
                    for j in range(len(om)):
                        m.increment(i,j, om[i][j])
            if not isinstance(M, SparseRowMatrix):
                if not isinstance(M, (list,tuple)) or not all(isinstance(row, (list,tuple)) for row in M):
                    raise TypeError("The lower matrix must be a matrix")
                if len(M) != len(variables) or any(len(row) != len(variables) for row in M):
                    raise TypeError(f"The lower matrix must have {len(variables)} rows and columns")
                oM = M
                M = SparseRowMatrix(len(M), QQ)
                for i in range(len(oM)):
                    for j in range(len(oM)):
                        M.increment(i,j, oM[i][j])

            if any(el != len(variables) for el in (*m.dim, *M.dim)):
                raise ValueError(f"The given matrices must be square and with size exactly {len(variables)}")

            ## Building the equations
            symb_vars = [SparsePolynomial.from_string(v, variables) for v in variables]
            lower_equations = [sum(m[i,j]*symb_vars[j] for j in range(len(variables))) for i in range(len(variables))]
            upper_equations = [sum(M[i,j]*symb_vars[j] for j in range(len(variables))) for i in range(len(variables))]

            equations = [tuple([lower_equations[i], upper_equations[i]]) for i in range(len(variables))]

        super().__init__(equations, observables, variables, ic, name, dic=dic, file=file)
        self._lumped_system_type = UncertainFODESystem
        self._lumping_matr["polynomial"] = [m,M]

    @property
    def lower_equations(self):
        return tuple([self.equations[i][0] for i in range(self.size)])
    @property
    def upper_equations(self):
        return tuple([self.equations[i][1] for i in range(self.size)])

    @cached_property
    def bounds(self): 
        r'''
            Bounds of the degrees for the right hand side.

            Since the :class:`UncertainFODESystem` only represent linear systems, then the system has always degree 1 in the numerator and 
            it has no denominator, then the bounds are `(1,0)`.
        '''
        return (1,0)

    @cached_property
    def species(self):
        r'''
            Return the names of the species of a system.

            A specie is a variable that is not constant, i.e., its equation is not 0.
        '''
        return [self.variables[i] for i in range(self.size) if any(equ != 0 for equ in self.equations[i])]

    @cached_property
    def pars(self):
        r'''
            Return the names of the parameter of a system.

            A parameter is a variable that is constant, i.e., its equation is 0.
        '''
        return [self.variables[i] for i in range(self.size) if all(equ == 0 for equ in self.equations[i])]

    @cached_property
    def type(self):
        self.normalize()
        return type(self.equations[0][0])

    def all_equations(self):
        for equation in self.equations:
            yield equation[0]
            yield equation[1]

    def check_consistency(self, *_): ## TODO
        r'''
            This method was removed for Uncertain systems
        '''
        raise NotImplementedError(f"Method 'check_consistency' not valid for {self.__class__}")

    def evaluate_parameters(self, _):
        r'''
            This method was removed for Uncertain systems
        '''
        raise NotImplementedError(f"Method 'evaluate_parameters' not valid for {self.__class__}")
       
    def scale_model(self, _):
        r'''
            This method was removed for Uncertain systems
        '''
        raise NotImplementedError(f"Method 'scale_model' not valid for {self.__class__}")

    ##############################################################################################################
    ### Lumping methods
    ##############################################################################################################
    def lumping(self, observable, new_vars_name="y", print_system=False, print_reduction=True, loglevel=None, initial_conditions=None, method="polynomial", file=sys.stdout):
        r'''
            Method for lumping a system (see :func:`FODESystem.lumping`).

            In this case we have removes the argument "out_format" because we require objects to be SparsePolynomials always.
        '''
        return super().lumping(observable, new_vars_name, print_system, print_reduction, "internal", loglevel, initial_conditions, method, file)

    def _lumped_system(self, lumping_subspace, vars_old, field, new_vars_name):
        lower_equs = lumping_subspace.perform_change_of_variables(self.lower_equations, vars_old, field, new_vars_name)
        upper_equs = lumping_subspace.perform_change_of_variables(self.upper_equations, vars_old, field, new_vars_name)
        return [tuple([lower_equs[i], upper_equs[i]]) for i in range(len(lower_equs))]

    ##############################################################################################################
    ### Some special creation methods
    ##############################################################################################################
    @staticmethod
    def from_FODESystem(system : FODESystem, delta = 2.5e-4, min_val = -oo, max_val = oo):
        r'''
            Method to create an uncertain system from a :class:`FODESystem` by altering all the coefficients with a given value `\delta`.

            Examples::

                >>> from clue import *
                >>> from sympy import QQ
                >>> from sympy.polys.rings import vring
                >>> R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
                >>> ## Example 1
                >>> system = FODESystem([2*x0 + 3*x1 + 2*x2, x0+2*x1+x2, 2*x0 + 4*x1 + 2*x2], variables=['x0','x1','x2'])
                >>> usystem = UncertainFODESystem.from_FODESystem(system, 1)
        '''
        from .rational_function import to_rational
        delta = to_rational(str(delta))
        min_val = to_rational(str(min_val)) if min_val != -oo else -oo
        max_val = to_rational(str(max_val)) if max_val != oo else oo
        if not system.is_linear_system():
            raise TypeError("We need a linear system to create an Uncertain system")

        if isinstance(system, UncertainFODESystem):
            m,M = system._lumping_matr
        else:
            m = [[equation.derivative(v).ct for v in system.variables] for equation in system.equations]
            M = [[c for c in row] for row in m]

        m = [[max(c - delta, min_val) for c in row] for row in m]
        M = [[min(c + delta, max_val) for c in row] for row in M]

        new_name = None if system.name is None else system.name + f"[altered by +-{delta}]"
        return UncertainFODESystem(None, system.observables, system.variables, system.ic, new_name,(m,M))

class UncertainLDESystem(LDESystem,UncertainFODESystem):
    r'''
        Class for lumped Uncertain linear Differential systems.
    '''
    def __init__(self, equations=None, observables=None, variables = None, ic= None, name = None, 
                    matrices = None, old_vars = None, old_system = None,
                    dic=None, **kwds):
        super().__init__(equations, observables, variables, ic, name, old_vars = old_vars, old_system = old_system, dic=dic, matrices = matrices, **kwds)
#------------------------------------------------------------------------------
