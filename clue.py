from bisect import bisect
from functools import reduce
import copy
import logging
import math

import sympy
from sympy import vring, GF, QQ, mod_inverse, gcd, nextprime, sympify
from sympy.ntheory.modular import crt, isprime

from sparse_polynomial import SparsePolynomial
from rational_function import RationalFunction

#------------------------------------------------------------------------------

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
    A class for sparce vectors. Contains the following fields:
      dim - the dimension of the ambient space
      nonzero - sorted list of the indiced of the nonzero coordinates
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

    #--------------------------------------------------------------------------

    def reduce(self, coef, vect):
        """
        self = self + c * v
        """
        if not coef:
            return

        new_nonzero = []
        left, right = 0, 0
        while (left < len(self._nonzero) or right < len(vect._nonzero)):
            if right == len(vect._nonzero):
                new_nonzero.extend(self._nonzero[left:])
                left = len(self._nonzero)
            elif left == len(self._nonzero):
                new_nonzero.extend(vect._nonzero[right:])
                for i in range(right, len(vect._nonzero)):
                    self._data[vect._nonzero[i]] = coef * vect._data[vect._nonzero[i]]
                right = len(vect._nonzero)
            else:
                if self._nonzero[left] == vect._nonzero[right]:
                    result = self._data[self._nonzero[left]] + coef * vect._data[vect._nonzero[right]]
                    if result:
                        self._data[self._nonzero[left]] = result
                        new_nonzero.append(self._nonzero[left])
                    else:
                        del self._data[self._nonzero[left]]
                    left += 1
                    right += 1
                elif self._nonzero[left] < vect._nonzero[right]:
                    new_nonzero.append(self._nonzero[left])
                    left += 1
                else:
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
        return self._data.get(i, 0)

    def __setitem__(self, i, value):
        if bisect(self._nonzero, i) == 0 or self._nonzero[bisect(self._nonzero, i) - 1] != i:
            self._nonzero.insert(bisect(self._nonzero, i), i)
        self._data[i] = value

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
            raise ValueError(f"Reducion can be done only for a vector over rationals but the field is {self.field}")
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
            a SparceVector over rationals with given reductions
          Works only over fields of the form GF(p), where p is a prime number
        """
        if (not self.field.is_FiniteField) or (not isprime(self.field.characteristic())):
            raise ValueError(f"Rational reconstruction is not available over {self.field}")
        result = SparseVector(self.dim, QQ)
        for ind in self._nonzero:
            try:
                result.__append__(ind, rational_reconstruction_sage(self[ind].to_int(), self.field.characteristic()))
            except ValueError:
                logging.debug("Rational reconstruction problems: %d, %d", self[ind], self.field.characteristic())
        return result

#------------------------------------------------------------------------------

class SparseRowMatrix(object):
    """
    A class for sparce matrices. Contains the following fields:
      dim - the dimension of the ambient space
      _nonzero - sorted list of the indiced of the nonzero rows
      _data - dictionary containing nonzero rows in the form index_of_the_row : SparseVector
      field - the field of entries (of type sympy.polys.domains.domain.Domain)
    """
    def __init__(self, dim, field):
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

    #--------------------------------------------------------------------------

    def nonzero_iter(self):
        return iter(self._nonzero)

    def nonzero_count(self):
        return sum([v.nonzero_count() for v in self._data.values()])

    #--------------------------------------------------------------------------

    def __setitem__(self, cell, value):
        i, j = cell
        if bisect(self._nonzero, i) == 0 or self._nonzero[bisect(self._nonzero, i) - 1] != i:
            self._nonzero.insert(bisect(self._nonzero, i), i)
            self._data[i] = SparseVector(self.dim, self.field)
        self._data[i][j] = value

    #--------------------------------------------------------------------------

    def __getitem__(self, cell):
        if not cell[0] in self._data:
            return self.field.convert(0)
        return self._data[cell[0]][cell[1]]

    #--------------------------------------------------------------------------

    def increment(self, i, j, extra):
        self[i, j] = self[i, j] + extra

    #--------------------------------------------------------------------------

    def row(self, i):
        if i in self._data:
            return self._data[i]
        return SparseVector(self.dim, self.field)

    #--------------------------------------------------------------------------

    def reduce_mod(self, modulus):
        """
        Returns the reduction modulo modulus
        Works only if field == QQ
        """
        if self.field != QQ:
            raise ValueError(f"Reducion can be done only for a vector over rationals but the field is {self.field}")
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
        Returns SparseVector representation of matrix

        a b -> a
        c d    b
               c
               d
        """
        result = SparseVector(self._dim**2)
        for i in self.nonzero_iter():
            ith_column = self._data[i]
            for j in ith_column.nonzero_iter():
                result[self._dim*i + j] = ith_column[j]
        return result

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

    #--------------------------------------------------------------------------

    def absorb_new_vector(self, new_vector):
        """
        Input
          - new_vector - a SparseVector
        Output
          the index of the pivot of the new basis vector if such emerges, -1 otherwise
        """
        for piv, vect in self._echelon_form.items():
            if new_vector[piv]:
                new_vector.reduce(-new_vector[piv], vect)

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
            - monitor_length - if set True, the ExpressionSwell expception will be raised
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
                        logging.debug("  Multiply by matrix %d", m_index)
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
            raise ValueError(f"Reducion can be done only for a vector over rationals but the field is {self.field}")
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
        A list of self.dim coordiantes such that the projection onto these coordinates is surjective
        """
        return sorted(self._echelon_form.keys())

    #--------------------------------------------------------------------------

    def perform_change_of_variables(self, rhs, new_vars_name='y'):
        """
          Restrict a system of ODEs with the rhs given by 
          rhs (SparsePolynomial or RationalFunction) to the subspace
          new_vars_name (optional) - the name for variables in the lumped polynomials
        """
        old_vars = rhs[0].gens
        domain = rhs[0].domain
        new_vars = [new_vars_name + str(i) for i in range(self.dim())]
        pivots = set(self.parametrizing_coordinates())
        lpivots = sorted(pivots)
        basis = self.basis()

        logging.debug("Plugging zero to nonpivot coordinates")

        # SparsePolynomial
        if isinstance(rhs[0], SparsePolynomial):
            # plugging all nonpivot variables with zeroes
            shrinked_polys = []
            for p in rhs:
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

                shrinked_polys.append(SparsePolynomial(new_vars, domain, filtered_dict))
    
            logging.debug("Constructing new polys")
            new_polys = [SparsePolynomial(new_vars, domain) for _ in range(self.dim())]
            for i, vec in enumerate(basis):
                logging.debug(f"    Polynomial number {i}")
                for j in vec.nonzero_iter():
                    # ordering is important due to the implementation of
                    # multiplication for SparsePolynomial
                    new_polys[i] += shrinked_polys[j] * vec._data[j]
        
            return new_polys

        # RationalFunction
        elif isinstance(rhs[0], RationalFunction):
            # plugging all nonpivot variables with zeroes
            shrinked_rfs = []
            for rf in rhs:
                num_filtered_dict = dict()
                for monom, coef in rf.num.dataiter():
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

                shrinked_rfs.append(RationalFunction(
                    SparsePolynomial(new_vars, domain, num_filtered_dict),
                    SparsePolynomial(new_vars, domain, denom_filtered_dict)
                ))


            logging.debug("Constructing new rfs")
            new_rfs = [RationalFunction(SparsePolynomial(new_vars, domain),SparsePolynomial.from_string("1", new_vars)) for _ in range(self.dim())]
            for i, vec in enumerate(basis):
                logging.debug(f"    Rational Function number {i}")
                for j in vec.nonzero_iter():
                    # ordering is important due to the implementation of
                    # multiplication for SparsePolynomial
                    new_rfs[i] += shrinked_rfs[j] * vec._data[j]

            return new_rfs

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
        logging.debug("Rationals are getting too long, switching to the modular algorithm")
        modulus = 2**31 - 1
        primes_used = 1
        while True:
            logging.debug("Working modulo: %d", modulus)
            try:
                matrices_reduced = [matr.reduce_mod(modulus) for matr in matrices]
                subspace_reduced = original_subspace.reduce_mod(modulus)
                subspace_reduced.apply_matrices_inplace(matrices_reduced)
                reconstruction = subspace_reduced.rational_reconstruction()
                if reconstruction.check_invariance(matrices):
                    if reconstruction.check_inclusion(original_subspace):
                        logging.debug("We used %d primes", primes_used)
                        return reconstruction
                    else:
                        logging.debug("Didn't pass the inclusion check")
                else:
                    logging.debug("Didn't pass the invariance check")
            except ValueError:
                pass
            except ZeroDivisionError:
                logging.debug(f"{modulus} was a bad prime for reduction, going for the next one")
            modulus = nextprime(modulus**2)
            primes_used += 1
    
#------------------------------------------------------------------------------

def construct_matrices(rhs):
    if isinstance(rhs[0], SparsePolynomial):
        return construct_matrices_from_polys(rhs)
    elif isinstance(rhs[0], RationalFunction):
        return construct_matrices_from_rational_functions(rhs)

#------------------------------------------------------------------------------

def construct_matrices_from_rational_functions(rational_functions):
    """
      Computes Jacobian, pulls out common denominator, and constructs matrices
      J_1^T, ..., J_N^T from the remaining polynomial matrix
      Input
        - rational_functions - the right-hand side of the system of ODEs (f_1, ..., f_n)
                               represented by RationalFunction
      Output
        a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
    """
    logging.debug("Starting constructing matrices (RationalFunction)")

    variables = rational_functions[0].gens
    field = rational_functions[0].domain

    # Compute Jacobian
    J = [[rf.derivative(v) for rf in rational_functions] for v in variables]

    print(f"-> I computed the Jacobian. It is of size {len(J)}x{len(J)}.")
    
    # def print_m(matrix):
    #     s = [[str(e) for e in row] for row in matrix]
    #     lens = [max(map(len, col)) for col in zip(*s)]
    #     fmt = '\t'.join('{{:{}}}'.format(x) for x in lens)
    #     table = [fmt.format(*row) for row in s]
    #     print('\n'.join(table))

    # print_m(J)
    # print()

    denoms = [[row[i].denom for row in J][0] for i in range(len(J[0]))]

    print("-> I got all the denominators.")

    lcm = denoms[0]
    d = list(filter((lambda x: x != SparsePolynomial.from_string("1",[])),denoms))
    for i in range(1, len(d)):
        print(f"--> I am finding LCM with polynomial {i+1} of {len(d)}")
        lcm = SparsePolynomial.lcm([lcm, denoms[i]])

    # filtered_denoms = list(filter((lambda x: x != SparsePolynomial.from_string("1",[])),denoms))
    # print(f"I am finding the LCM of {len(filtered_denoms)} denominators.")
    # lcm = SparsePolynomial.lcm(filtered_denoms)

    print("-> I found the LCM.")

    p = [lcm//denom for denom in denoms]

    print("-> For each column, I have divided the LCM by the denominator and stored the value.")

    # Pull out the common denominator 
    poly_J = []
    for i in range(len(J)):
        # print(f"--> I am computing new numerators for the row J[{i}].")
        poly_J_row = []
        for j in range(len(J[i])):
            # NEW METHOD 
            poly_J_row.append(J[i][j].num * p[j])
            # # OLD METHOD (SUPER SUPER SLOW)
            # other_denoms = denoms[:]
            # other_denoms.pop(j)
            # other_denoms = list(filter(lambda x: x != SparsePolynomial.from_string("1",[]), other_denoms))
            # if len(other_denoms) > 0 and not J[i][j].num.is_zero():
            #     # print(f"\t -> Finding the product of {len(other_denoms) + 1} polynomials for J[{i}][{j}]:")
            #     # p = reduce((lambda x,y: x * y), other_denoms)
            #     p = other_denoms[0]
            #     for denom_i in range(1,len(other_denoms)):
            #         # print("\t MULTIPLYING ",other_denoms[denom_i])
            #         # print(f"Finished multiplying polynomial {denom_i}.")
            #         p *= other_denoms[denom_i]
            #     poly_J_row.append(J[i][j].num * p)
            # else:
            #     # print(f"Skppied some complicated computations for J[{i}][{j}].")
            #     poly_J_row.append(J[i][j].num)
        poly_J.append(poly_J_row)

    print("-> I pulled out the common denominator.")

    # print_m(poly_J)

    # Work with remaining polynomial matrix as in construct_matrices_from_polys
    jacobians = dict()
    for row_ind, poly_row in enumerate(poly_J):
        for col_ind, poly in enumerate(poly_row):
            p_ind = row_ind*len(poly_row) + col_ind
            logging.debug("Processing numerator polynomial number %d", p_ind)
            for m, coef in poly.dataiter():
                if m not in jacobians:
                    jacobians[m] = SparseRowMatrix(len(variables), field)
                jacobians[m].increment(row_ind, col_ind, coef)

    print("-> I constructed matrices.")

    return jacobians.values()

#------------------------------------------------------------------------------

def construct_matrices_from_polys(polys):
    """
      Constructs matrices J_1^T, ..., J_N^T (see Step (2) of Algorithm 1 in the paper)
      Input
        - polys - the right-hand side of the system of ODEs (f_1, ..., f_n)
                  represented by SparsePolynomial
      Output
        a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
    """
    logging.debug("Starting constructing matrices (SparsePolynomial)")

    variables = polys[0].gens
    field = polys[0].domain
    jacobians = dict()
    for p_ind, poly in enumerate(polys):
        logging.debug("Processing polynomial number %d", p_ind)
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
    return result

#------------------------------------------------------------------------------

def do_lumping_internal(rhs, observable, new_vars_name='y', print_system=True, print_reduction=False, ic=None, discard_useless_matrices=True):
    """
      Performs a lumping of a polynomial ODE system represented by SparsePolynomial
      Input
        - polys - the right-hand side of the system
        - observable - a nonempty list of linear forms in state variables
                       that must be kept nonlumped
        - new_vars_name (optional) - the name for variables in the lumped polynomials
        - verbose (optional) - whether to report the result on the screen or not
      Output
        a tuple (the right-hand side of an aggregated system, new_variables)
    """

    logging.basicConfig(
        format='%(asctime)s %(levelname)-8s %(message)s',
        level=logging.DEBUG,
        datefmt='%Y-%m-%d %H:%M:%S',
        filename="lumper_debug.log"
    )
    logging.debug("Starting aggregation")

    # Reduce the problem to the common invariant subspace problem
    vars_old = rhs[0].gens
    field = rhs[0].domain
    matrices = sorted(construct_matrices(rhs), key=lambda m: m.nonzero_count())

    if discard_useless_matrices:
        # Proceed only with matrices that are linearly independant
        vectors_of_matrices = [m.to_vector() for m in matrices]
        assert len(matrices) == len(vectors_of_matrices)
        subspace = Subspace(field)
        deleted = 0
        for i in range(len(vectors_of_matrices)):
            pivot_index = subspace.absorb_new_vector(vectors_of_matrices[i])
            if pivot_index < 0:
                del matrices[i - deleted]
                deleted +=1
        logging.debug(f"Discarded {deleted} linearly dependant matrices")

    print(f"-> I discarded {deleted} linearly dependant matrices.")

    # Find a lumping
    vectors_to_include = []
    for linear_form in observable:
        vec = SparseVector.from_list(linear_form.linear_part_as_vec(), field)
        vectors_to_include.append(vec)
    lumping_subspace = find_smallest_common_subspace(matrices, vectors_to_include)

    lumped_rhs = lumping_subspace.perform_change_of_variables(rhs, new_vars_name)

    new_ic = None
    if ic is not None:
        eval_point = [ic.get(v, 0) for v in rhs[0].gens]
        new_ic = []
        for vect in lumping_subspace.basis():
            new_ic.append(sum([p[0] * p[1] for p in zip(eval_point, vect.to_list())]))


    # Nice printing
    # TODO: Adapt for rational functions
    vars_new = lumped_rhs[0].gens
    if print_system:
        print("Original system:")
        for i in range(len(rhs)):
            print(f"{vars_old[i]}' = {rhs[i]}")
        print("Outputs to fix:")
        print(", ".join(map(str, observable)))
    if print_reduction:
        print("New variables:")
        for i in range(lumping_subspace.dim()):
            new_var = SparsePolynomial(vars_old, field)
            for j in range(len(vars_old)):
                if lumping_subspace.basis()[i][j] != 0:
                    new_var += SparsePolynomial(vars_old, field, {((j, 1),) : lumping_subspace.basis()[i][j]})
            print(f"{vars_new[i]} = {new_var}")
        if new_ic is not None:
            print("New initial conditions:")
            for v, val in zip(vars_new, new_ic):
                print(f"{v}(0) = {float(val)}")

        print("Lumped system:")
        for i in range(lumping_subspace.dim()):
            print(f"{vars_new[i]}' = {lumped_rhs[i]}")

    return {"rhs" : lumped_rhs, "subspace" : [v.to_list() for v in lumping_subspace.basis()], "new_ic" : new_ic}

#------------------------------------------------------------------------------

def do_lumping(
        rhs, observable, 
        new_vars_name='y', 
        print_system=False, 
        print_reduction=True, 
        out_format="sympy", 
        loglevel="INFO",
        initial_conditions=None,
        discard_useless_matrices=True
    ):
    """
      Main function, performs a lumping of a polynomial ODE system
      Input
        - rhs - the right-hand side of the system
        - observable - a nonempty list of linear forms in state variables
                       that must be kept nonlumped
        - new_vars_name (optional) - the name for variables in the lumped polynomials
        - print_system and print_reduction (optional) - whether to print the original system and the result, respectively on the screen
        - out_format - "sympy" or "internal", the way the output polynomials should be represeted
          the options are sympy polynomials and SparsePolynomial
        - loglevel - INFO (only essential information) or DEBUG (a lot of infromation about the computation process)
      Output
        a tuple (the right-hand side of an aggregated system, new_variables)
    """

    logging.basicConfig(
        format='%(asctime)s %(levelname)-8s %(message)s',
        level= logging.INFO if loglevel == "INFO" else logging.DEBUG,
        datefmt='%Y-%m-%d %H:%M:%S',
        filename="lumper_debug.log"
    )
    logging.debug("Starting aggregation")

    if isinstance(rhs[0], SparsePolynomial):
        logging.debug("Input is in the SparsePolynomial format")
    elif isinstance(rhs[0], RationalFunction):
        logging.debug("Input is in the RationalFunction format")
    else:
        logging.debug("Input is expected to be in SymPy format")
        rhs = [SparsePolynomial.from_sympy(p) for p in rhs]
        observable = [SparsePolynomial.from_sympy(ob) for ob in observable]

    result = do_lumping_internal(rhs, observable, new_vars_name, print_system, print_reduction, initial_conditions, discard_useless_matrices=discard_useless_matrices)

    if initial_conditions is not None:
        eval_point = [initial_conditions.get(v, 0) for v in rhs[0].gens]
        result["new_ic"] = []
        for vect in result["subspace"]:
            result["new_ic"].append(sum([p[0] * p[1] for p in zip(eval_point, vect)]))

    if out_format == "sympy":
        out_ring = result["rhs"][0].get_sympy_ring()
        if isinstance(result["rhs"][0], SparsePolynomial):
            result["rhs"] = [out_ring(p.get_sympy_dict()) for p in result["rhs"]]
        elif isinstance(result["rhs"][0], RationalFunction):
            # F = sympy.FractionField(sympy.QQ, result["rhs"][0].gens)
            # result["rhs"] = [F(out_ring(p.num.get_sympy_dict()))/F(out_ring(p.denom.get_sympy_dict())) for p in result["rhs"]]
            pass
    elif out_format == "internal":
        pass
    else:
        raise ValueError(f"Unknown output format {out_format}")
    return result

#------------------------------------------------------------------------------
