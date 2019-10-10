from bisect import bisect
import logging
import math

from sympy import vring, QQ, Rational, mod_inverse, gcd, nextprime
from sympy.ntheory.modular import crt

##########################################################################

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
        return Rational(0, 1)
    if m < 0:
        m = -m
    if a < 0:
        a = m-a
    if a == 1:
        return Rational(1, 1)
    u = m
    v = a
    bnd = math.sqrt(m / 2)
    U = (1, 0, u)
    V = (0, 1, v)
    while abs(V[2]) > bnd:
        q = U[2] / V[2]
        T = (U[0] - q * V[0], U[1] - q * V[1], U[2] - q * V[2])
        U = V
        V = T
    x = abs(V[1])
    y = V[2]
    if V[1] < 0:
        y *= -1
    if x <= bnd and gcd(x, y) == 1:
        return Rational(y, x)
    raise ValueError, "Rational reconstruction of %s (mod %s) does not exist."%(a, m)

##########################################################################

class SparseVector(object):
    """
    A class for sparce vectors. Contains the following fields:
      dim - the dimension of the ambient space
      nonzero - sorted list of the indiced of the nonzero coordinates
      data - dictionary containing nonzero coordinates in the form index_of_the_coordinate : value
      modulus - either the prime number for the modular computation, or zero (i.e., over Q)
    """
    def __init__(self, dim, modulus=0):
        self.dim = dim
        self.data = dict()
        self.nonzero = []
        self.modulus = modulus

    ## Basic arithmetic of the ground field
    def __plus__(self, a, b):
        """
        Addition of elements of the ground field
        """
        if self.modulus == 0:
            return a + b
        return (a + b) % self.modulus

    def __mult__(self, a, b):
        """
        Multiplication of elements of the ground field
        """
        if self.modulus == 0:
            return a * b
        return (a * b) % self.modulus

    def __inv__(self, a):
        """
        Inverse of an element of the ground field
        """
        if self.modulus == 0:
            return 1 / a
        return mod_inverse(a, self.modulus)

    def __zero__(self, a):
        """
        Zero test for the gound field
        """
        return (self.modulus == 0 and a == 0) or (self.modulus != 0 and (a % self.modulus == 0))

    def reduce(self, coef, vect):
        """
        self = self + c * v
        """
        if (self.modulus == 0 and coef == 0) or (self.modulus != 0  and coef % self.modulus == 0):
            return

        new_nonzero = []
        left = 0
        right = 0
        while (left < len(self.nonzero) or right < len(vect.nonzero)):
            if right == len(vect.nonzero):
                new_nonzero.extend(self.nonzero[left:])
                left = len(self.nonzero)
            elif left == len(self.nonzero):
                new_nonzero.extend(vect.nonzero[right:])
                for i in range(right, len(vect.nonzero)):
                    self.data[vect.nonzero[i]] = self.__mult__(coef, vect.data[vect.nonzero[i]])
                right = len(vect.nonzero)
            else:
                if self.nonzero[left] == vect.nonzero[right]:
                    result = self.__plus__(
                        self.data[self.nonzero[left]],
                        coef * vect.data[vect.nonzero[right]]
                    )
                    if result != 0:
                        self.data[self.nonzero[left]] = result
                        new_nonzero.append(self.nonzero[left])
                    else:
                        del self.data[self.nonzero[left]]
                    left += 1
                    right += 1
                elif self.nonzero[left] < vect.nonzero[right]:
                    new_nonzero.append(self.nonzero[left])
                    left += 1
                else:
                    new_nonzero.append(vect.nonzero[right])
                    self.data[vect.nonzero[right]] = self.__mult__(coef, vect.data[vect.nonzero[right]])
                    right += 1
        self.nonzero = new_nonzero

    def scale(self, coef):
        for i in self.nonzero:
            self.data[i] = self.__mult__(self.data[i], coef)

    def get(self, i):
        return self.data.get(i, 0)

    def set(self, i, value):
        if bisect(self.nonzero, i) == 0 or self.nonzero[bisect(self.nonzero, i) - 1] != i:
            self.nonzero.insert(bisect(self.nonzero, i), i)
        if self.modulus == 0:
            self.data[i] = value
        else:
            self.data[i] = value % self.modulus

    def inner_product(self, rhs):
        result = 0
        left = 0
        right = 0
        while (left < len(self.nonzero) and right < len(rhs.nonzero)):
            if self.nonzero[left] == rhs.nonzero[right]:
                result = self.__plus__(
                    result,
                    self.data[self.nonzero[left]] * rhs.data[rhs.nonzero[right]]
                )
                left += 1
                right += 1
            elif self.nonzero[left] < rhs.nonzero[right]:
                left += 1
            else:
                right += 1
        return result

    def __append__(self, i, value):
        """
        makes self[i] = value *given that* all the coordinates with the index r and more were zero
        """
        self.nonzero.append(i)
        self.data[i] = value

    def apply_matrix(self, matr):
        result = SparseVector(self.dim, self.modulus)
        for i in matr.nonzero:
            prod = self.inner_product(matr.row(i))
            if prod != 0:
                result.__append__(i, prod)
        return result

    def is_zero(self):
        return len(self.nonzero) == 0

    def first_nonzero(self):
        if self.nonzero:
            return self.nonzero[0]
        return -1

    def to_list(self):
        result = [0] * self.dim
        for i in range(len(self.nonzero)):
            result[self.nonzero[i]] = self.data[self.nonzero[i]]
        return result

    def density(self):
        return len(self.nonzero) * 1. / self.dim

    def mod_reduce(self, prime):
        """
        Returns the reduction modulo prime
        """
        result = SparseVector(self.dim, prime)
        for i in self.nonzero:
            if (self.data[i] % prime) != 0:
                result.__append__(i, self.data[i] % prime)
        return result

    @classmethod
    def from_list(cls, entries_list, modulus=0):
        result = cls(len(entries_list), modulus)
        for i, num in enumerate(entries_list):
            if modulus == 0 and num != 0:
                result.__append__(i, num)
            if modulus > 0 and (num % modulus) != 0:
                result.__append__(i, num % modulus)
        return result

#########################################################################

class SparseRowMatrix(object):
    """
    A class for sparce matrices. Contains the following fields:
      dim - the dimension of the ambient space
      nonzero - sorted list of the indiced of the nonzero rows
      data - dictionary containing nonzero rows in the form index_of_the_row : SparseVector
    """
    def __init__(self, dim, modulus=0):
        self.dim = dim
        self.data = dict()
        self.nonzero = []
        self.modulus = modulus

    def set(self, i, j, value):
        if bisect(self.nonzero, i) == 0 or self.nonzero[bisect(self.nonzero, i) - 1] != i:
            self.nonzero.insert(bisect(self.nonzero, i), i)
            self.data[i] = SparseVector(self.dim, self.modulus)
        self.data[i].set(j, value)

    def get(self, i, j):
        if not i in self.data:
            return 0
        return self.data[i].get(j)

    def increment(self, i, j, extra):
        self.set(i, j, self.get(i, j) + extra)

    def row(self, i):
        if i in self.data:
            return self.data[i]
        return SparseVector(self.dim, self.modulus)

    def mod_reduce(self, prime):
        """
        Returns the reduction modulo prime
        """
        result = SparseRowMatrix(self.dim, prime)
        for i in self.nonzero:
            row_reduced = self.data[i].mod_reduce(prime)
            if not row_reduced.is_zero():
                result.nonzero.append(i)
                result.data[i] = row_reduced
        return result

#########################################################################

def absorb_new_vector(new_vector, echelon_form, modulus=0):
    """
    Input
      - new_vector - a SparseVector
      - echelon_form - a dictionary of the form number : SparseVector such that
                      the vectors constitute reduced row echelon form
                      and the corresponding number for each vector is the index of the pivot
                      Example (with dense vectors) : {0: [1, 0, 1], 1: [0, 1, 3]}
      - modulus - the modulus for the modular computation (0 for rationals)
    Output
      New echelon_form in the format described above that such that
      the vectors in it span the space spanned by the vecors of the
      original echclon form and new_vector
    """
    for piv, vect in echelon_form.iteritems():
        if new_vector.get(piv) != 0:
            new_vector.reduce(-new_vector.get(piv), vect)

    if new_vector.is_zero():
        return -1
    pivot = new_vector.first_nonzero()
    scaling = 1
    if modulus == 0:
        scaling = 1 / new_vector.get(pivot)
    else:
        scaling = mod_inverse(new_vector.get(pivot), modulus)
    new_vector.scale(scaling)
    for piv, vect in echelon_form.iteritems():
        if vect.get(pivot) != 0:
            echelon_form[piv].reduce(-vect.get(pivot), new_vector)

    echelon_form[pivot] = new_vector
    return pivot

########################################################################

def find_smallest_common_subspace_modular(matrices, vectors_to_include, modulus=0):
    """
      Input
        - matrices - a list of matrices (SparseMatrix)
        - vectors_to_include - a list of vectors (SparseVector)
        - modulus - the modulus for the modular computation (0 for rationals)
      Output
        an echelon_form (as described in the function absorb_new_vector)
        with vectors spanning the minimal invariant subspace for the matrices
        that contains all vectors_to_include
    """
    echelon_form = dict()
    new_pivots = set()
    for vec in vectors_to_include:
        pivot = absorb_new_vector(vec, echelon_form, modulus)
        if pivot != -1:
            new_pivots.add(pivot)

    while new_pivots:
        pivots_to_process = new_pivots.copy()
        new_pivots = set()
        for pivot in pivots_to_process:
            for m_index, matr in enumerate(matrices):
                if m_index % 10 == 0:
                    logging.debug("  Multiply by matrix %d", m_index)
                m_index += 1
                prod = echelon_form[pivot].apply_matrix(matr)
                if not prod.is_zero():
                    new_pivot = absorb_new_vector(prod, echelon_form, modulus)
                    if new_pivot != -1:
                        new_pivots.add(new_pivot)

    return echelon_form

#########################################################################

def check_invariance(matrices, echelon_form):
    """
      Input
        - matrices - a list of matrices (SparseMatrix)
        - echelon_form - a basis of a vector space stored in the echclon_form
                         structure as described in absorb_new_vector
      Output
         whether the vector space is invariant under the matrices
    """
    for matr in matrices:
        for vec in echelon_form.values():
            prod = vec.apply_matrix(matr)
            if absorb_new_vector(prod, echelon_form) != -1:
                return False
    return True

#########################################################################

def reconstruct_vector(modular_results):
    """
      Input
        modular_result - a list of pairs (modulus, SparceVector)
      Output
        a SparceVector over rationals with given reductions
    """
    nonzeros = set()
    mods = [pair[0] for pair in modular_results]
    mod_prod = reduce((lambda x, y: x * y), mods)
    for pair in modular_results:
        nonzeros = nonzeros | set(pair[1].nonzero)
    nonzeros = sorted(nonzeros)
    result = SparseVector(modular_results[0][1].dim)
    for ind in nonzeros:
        residues = [pair[1].get(ind) for pair in modular_results]
        total_residue = crt(mods, residues)[0]
        try:
            result.__append__(ind, rational_reconstruction_sage(total_residue, mod_prod))
        except ValueError:
            logging.debug("Rational reconstruction problems: %d, %d", total_residue, mod_prod)
    return result


#########################################################################

def reconstruct_subspace(modular_results):
    """
      Input
        modular_results - a list of pairs (modulus, echelon_form),
        where echelon_form structure is decribed in absorb_new_vector
      Output
        a subspace with this set of reductions modulo primes
    """
    dim = max([len(red[1]) for red in modular_results])
    max_dim_reductions = [red for red in modular_results if len(red[1]) == dim]
    result = dict()
    for pivot in max_dim_reductions[0][1].keys():
        result[pivot] = reconstruct_vector([
            (pair[0], pair[1][pivot])
            for pair in max_dim_reductions
            if pivot in pair[1]
        ])
    return result

#########################################################################

def find_smallest_common_subspace(matrices, vectors_to_include):
    """
      Input
        - matrices - a list of matrices (SparseMatrix)
        - vectors_to_include - a list of vectors (SparseVector)
      Output
        an echelon_form (as described in the function absorb_new_vector)
        with vectors spanning the minimal invariant subspace for the matrices
        that contains all vectors_to_include
    """
    modulus = 2**31 - 1
    modular_results = []
    while True:
        logging.debug("Working modulo: %d", modulus)
        matrices_reduced = [matr.mod_reduce(modulus) for matr in matrices]
        vectors_reduced = [vec.mod_reduce(modulus) for vec in vectors_to_include]
        subspace = find_smallest_common_subspace_modular(matrices_reduced, vectors_reduced, modulus)
        modular_results.append((modulus, subspace))
        reconstruction = reconstruct_subspace(modular_results)
        if check_invariance(matrices, reconstruction):
            logging.debug("We used %d primes", len(modular_results))
            return reconstruction
        modulus = nextprime(modulus)


#########################################################################

def perform_change_of_variables(polys, echelon_form, new_vars_name='y'):
    """
      Applies a given lumping to a given list of polynomials
      Input
        - polys - a nonempty list of polynomials to lump
        - echelon_form - new variables represented in the basis of the old variables
                         stored in the echelon_form structure as described in
                         the function absorb_new_vector
        - new_vars_name (optional) - the name for variables in the lumped polynomials

      Output
        the result of the lumping
    """
    new_ring = vring([new_vars_name + str(i) for i in range(len(echelon_form))], QQ)
    pivots = sorted(echelon_form.keys())

    logging.debug("Constructing new polys")
    new_polys = [0] * len(echelon_form)
    for i, piv in enumerate(pivots):
        logging.debug("    Polynomial number %d", i)
        vect = echelon_form[piv]
        for j in vect.nonzero:
            new_polys[i] += vect.data[j] * polys[j]

    logging.debug("Making the result")
    result = []
    for poly in new_polys:
        monomials = poly.to_dict()
        filtered_dict = dict()
        for monom, coef in monomials.iteritems():
            new_monom = []
            skip = False
            for i in range(len(monom)):
                if i not in echelon_form:
                    if monom[i] != 0:
                        skip = True
                        break
                else:
                    new_monom.append(monom[i])
            if not skip:
                new_monom = tuple(new_monom)
                filtered_dict[new_monom] = coef
        result.append(new_ring(filtered_dict))

    return result

#########################################################################

def construct_matrices(polys):
    """
      Constructs matrices J_1^T, ..., J_N^T (see Proposition ???)
      Input
        - polys - the right-hand side of the system of ODEs (f_1, ..., f_n)
      Output
        a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
    """
    logging.debug("Starting constructing matrices")
    variables = polys[0].ring.gens
    jacobians = dict()
    for p_ind, poly in enumerate(polys):
        logging.debug("Processing polynomial number %d", p_ind)
        for term in zip(poly.monoms(), poly.coeffs()):
            monom = term[0]
            coef = term[1]
            for var in range(len(monom)):
                if monom[var] > 0:
                    m_der = tuple(list(monom[:var]) + [monom[var] - 1] + list(monom[(var + 1):]))
                    entry = Rational(coef) * monom[var]
                    if m_der not in jacobians:
                        jacobians[m_der] = SparseRowMatrix(len(variables))
                    jacobians[m_der].increment(var, p_ind, entry)

    result = jacobians.values()

    return result

###############################################################################

def do_lumping(polys, observable, new_vars_name='y', verbose=True):
    """
      Main function, performs a lumping of a polynomial ODE system
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
    vars_old = polys[0].ring.gens
    matrices = construct_matrices(polys)

    # Find a lumping
    vectors_to_include = []
    for linear_form in observable:
        vec = SparseVector.from_list([Rational(linear_form.coeff(v)) for v in vars_old])
        vectors_to_include.append(vec)
    lumping_echelon = find_smallest_common_subspace(matrices, vectors_to_include)

    lumped_polys = perform_change_of_variables(polys, lumping_echelon, new_vars_name)

    # Nice printing
    if verbose:
        vars_new = lumped_polys[0].ring.gens
        print "Original system:"
        for i in range(len(polys)):
            print str(vars_old[i]) + "' = " + str(polys[i])
        print "Outputs to fix:"
        print observable
        print "New variables:"
        for i in range(len(lumping_echelon)):
            new_var_string = str(sum(
                [lumping_echelon.values()[i].get(j) * vars_old[j] for j in range(len(vars_old))]
            ))
            print str(vars_new[i]) + " = " + new_var_string

        print "Lumped system:"
        for i in range(len(lumping_echelon)):
            print str(vars_new[i]) + "' = " + str(lumped_polys[i])

    return (lumped_polys, [v.to_list() for v in lumping_echelon.values()])


###############################################################################
