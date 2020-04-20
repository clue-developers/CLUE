from bisect import bisect
import logging
import math

import sympy
from sympy import vring, GF, QQ, mod_inverse, gcd, nextprime, sympify
from sympy.ntheory.modular import crt, isprime

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
    while abs(V[2]) > bnd:
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

##########################################################################

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

    def scale(self, coef):
        if not coef:
            self._nonzero = []
            self._data = dict()
        else:
            for i in self._nonzero:
                self._data[i] = self._data[i] * coef

    def __getitem__(self, i):
        return self._data.get(i, 0)

    def __setitem__(self, i, value):
        if bisect(self._nonzero, i) == 0 or self._nonzero[bisect(self._nonzero, i) - 1] != i:
            self._nonzero.insert(bisect(self._nonzero, i), i)
        self._data[i] = value

    def inner_product(self, rhs):
        result = self.field(0)
        left, right = 0, 0
        while (left < len(self._nonzero) and right < len(rhs._nonzero)):
            if self._nonzero[left] == rhs._nonzero[right]:
                result += self._data[self._nonzero[left]] * rhs._data[rhs._nonzero[right]]
                left += 1
                right += 1
            elif self._nonzero[left] < rhs._nonzero[right]:
                left += 1
            else:
                right += 1
        return result

    def __append__(self, i, value):
        """
        makes self[i] = value *given that* all the coordinates with the index r and more were zero
        """
        self._nonzero.append(i)
        self._data[i] = value

    def apply_matrix(self, matr):
        result = SparseVector(self.dim, self.field)
        for i in matr.nonzero_iter():
            prod = self.inner_product(matr.row(i))
            if prod:
                result.__append__(i, prod)
        return result

    def is_zero(self):
        return len(self._nonzero) == 0

    def first_nonzero(self):
        if self._nonzero:
            return self._nonzero[0]
        return -1

    def to_list(self):
        result = [0] * self.dim
        for i in range(len(self._nonzero)):
            result[self._nonzero[i]] = self._data[self._nonzero[i]]
        return result

    def density(self):
        return len(self._nonzero) * 1. / self.dim

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
            if mod_field.convert(entry.q) == 0:
                raise ZeroDivisionError(f"Division by zero while taking modulo {modulus}")
            entry_mod = mod_field.convert(entry.p) / mod_field.convert(entry.q)
            if entry_mod:
                result.__append__(i, entry_mod)
        return result

    @classmethod
    def from_list(cls, entries_list, field):
        result = cls(len(entries_list), field)
        for i, num in enumerate(entries_list):
            to_insert = field.convert(num)
            if to_insert:
                result.__append__(i, to_insert)
        return result

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

##########################################################################

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

    def nonzero_iter(self):
        return iter(self._nonzero)

    def __setitem__(self, cell, value):
        i, j = cell
        if bisect(self._nonzero, i) == 0 or self._nonzero[bisect(self._nonzero, i) - 1] != i:
            self._nonzero.insert(bisect(self._nonzero, i), i)
            self._data[i] = SparseVector(self.dim, self.field)
        self._data[i][j] = value

    def __getitem__(self, cell):
        if not cell[0] in self._data:
            return self.field.convert(0)
        return self._data[cell[0]][cell[1]]

    def increment(self, i, j, extra):
        self[i, j] = self[i, j] + extra

    def row(self, i):
        if i in self._data:
            return self._data[i]
        return SparseVector(self.dim, self.field)

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

##########################################################################

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

    def absorb_new_vector(self, new_vector):
        """
        Input
          - new_vector - a SparseVector
        Output
          the index of the pivot of the new basis vecor if such emerges, -1 otherwise
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

    def apply_matrices_inplace(self, matrices):
        """
          Input
            - matrices - a list of matrices (SparseMatrix)
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

    def basis(self):
        return [self._echelon_form[piv] for piv in sorted(self._echelon_form.keys())]

    def parametrizing_coordinates(self):
        """
        A list of self.dim coordiantes such that the projection onto these coordinates is surjective
        """
        return sorted(self._echelon_form.keys())

    def perform_change_of_variables(self, polys, new_vars_name='y'):
        """
          Restrict a polynomial system of ODEs with the rhs given by 
          polys (SparsePolynomial) to the subspace
          new_vars_name (optional) - the name for variables in the lumped polynomials
        """
        old_vars = polys[0].gens
        domain = polys[0].domain
        new_vars = [new_vars_name + str(i) for i in range(self.dim())]
        pivots = set(self.parametrizing_coordinates())
        lpivots = sorted(pivots)
        basis = self.basis()

        # plugging all nonpivot variables with zeroes
        logging.debug("Plugging zero to nonpivot coordinates")
        shrinked_polys = []
        for p in polys:
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

#########################################################################

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
        modulus = nextprime(modulus)
        primes_used += 1

##########################################################################

class SparsePolynomial(object):
    """
    Simplictic class for representing polynomials with sparse exponent vectors
    Fields:
      - domain - coefficient domain
      - var_names - a list of names of variables
      - data - dictionary from monomials to coefficients. Monomials are encoded as
               tuples of pairs (index_of_variable, exponent) with only
               nonzero exponents stored
    """

    def __init__(self, varnames, domain=QQ, data=None):
        self._varnames = varnames
        self._domain = domain
        self._data = dict() if data is None else data

    def dataiter(self):
        return self._data.items()

    @property
    def domain(self):
        return self._domain

    @property
    def gens(self):
        return self._varnames.copy()

    def __add__(self, other):
        result = SparsePolynomial(self._varnames, self._domain)
        resdata = dict()
        for m, c in self._data.items():
            sum_coef = c + other._data.get(m, self._domain(0))
            if sum_coef != 0:
                resdata[m] = sum_coef
        for m, c in other._data.items():
            if m not in self._data:
                resdata[m] = c
        result._data = resdata
        return result

    def __iadd__(self, other):
        for m, c in other._data.items():
            sum_coef = c + self._data.get(m, self._domain(0))
            if sum_coef != 0:
                self._data[m] = sum_coef
            else:
                if m in self._data:
                    del self._data[m]
        return self

    def __mul__(self, num):
        """
        Multiplication by a scalar
        """
        result = SparsePolynomial(self._varnames, self._domain)
        if num != 0:
            for m, c in self._data.items():
                result._data[m] = c * num
        return result

    def _pair_to_str(self, pair):
        if pair[1] == 1:
            return self._varnames[pair[0]]
        else:
            return f"{self._varnames[pair[0]]}**{pair[1]}"

    def __str__(self):
        if not self._data:
            return "0"
        monomials = []
        for m, c in self._data.items():
            monomials.append(str(sympify(c).as_expr()) + "*" + "*".join(map(lambda p: self._pair_to_str(p), m)))
        return " + ".join(monomials)

    def linear_part_as_vec(self):
        return [self._data.get(((i, 1), ), self._domain(0)) for i in range(len(self._varnames))]

    def get_sympy_dict(self):
        result = dict()
        for monom, coef in self._data.items():
            new_monom = [0] * len(self.gens)
            for var, exp in monom:
                new_monom[var] = exp
            result[tuple(new_monom)] = coef
        return result

    def get_sympy_ring(self):
        return sympy.polys.rings.ring(self.gens, self.domain)[0]

    @staticmethod
    def from_sympy(sympy_poly):
        domain = sympy_poly.ring.domain
        varnames = list(map(str, sympy_poly.ring.gens))
        data = dict()
        sympy_dict = sympy_poly.to_dict()
        for monom, coef in sympy_dict.items():
            new_monom = []
            for i in range(len(monom)):
                if monom[i]:
                    new_monom.append((i, monom[i]))
            data[tuple(new_monom)] = coef
        return SparsePolynomial(varnames, domain, data)

    @staticmethod
    def from_string(s, varnames, subs_params=None):
        """
        an ad hoc parser for polynomials over QQ
        """
        subs_params = dict() if subs_params is None else subs_params
        var_ind = {varnames[i] : i for i in range(len(varnames))}
        result = dict()
        cur_monom = dict()
        cur_coef = QQ(1, 1)
        for m_str in s.split("+"):
            monom = dict()
            coef = QQ(1, 1)
            for term in m_str.split("*"):
                term = term.strip()
                if term[0] == "-":
                    coef = -coef
                    term = term[1:]
                if term in var_ind:
                    if term in monom:
                        monom[var_ind[term]] += 1
                    else:
                        monom[var_ind[term]] = 1
                elif term in subs_params:
                    coef = coef * subs_params[term]
                else:
                    coef = coef * QQ.convert(term)
            monom = tuple([(var, exp) for var, exp in sorted(monom.items())])
            if coef != 0:
                if monom not in result:
                    result[monom] = coef
                else:
                    if coef + result[monom] != 0:
                        result[monom] += coef
                    else:
                        del result[monom]
        return SparsePolynomial(varnames, QQ, result)

    @staticmethod
    def read_polys(filename, varnames, subs_params=None):
        """
        Reads a list of polynomials from ring from a file called filename
        """
        subs_params = dict() if subs_params is None else subs_params
        polys = []
        with open(filename) as f:
            for line in f:
                polys.append(SparsePolynomial.from_string(line, varnames, subs_params))
        return polys

##########################################################################

def construct_matrices(polys):
    """
      Constructs matrices J_1^T, ..., J_N^T (see Proposition ???)
      Input
        - polys - the right-hand side of the system of ODEs (f_1, ..., f_n)
                  represented by SparsePolynomial
      Output
        a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
    """
    logging.debug("Starting constructing matrices")

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

###############################################################################

def do_lumping_internal(polys, observable, new_vars_name='y', verbose=True):
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
    vars_old = polys[0].gens
    field = polys[0].domain
    matrices = construct_matrices(polys)

    # Find a lumping
    vectors_to_include = []
    for linear_form in observable:
        vec = SparseVector.from_list(linear_form.linear_part_as_vec(), field)
        vectors_to_include.append(vec)
    lumping_subspace = find_smallest_common_subspace(matrices, vectors_to_include)

    lumped_polys = lumping_subspace.perform_change_of_variables(polys, new_vars_name)

    # Nice printing
    if verbose:
        vars_new = lumped_polys[0].gens
        print("Original system:")
        for i in range(len(polys)):
            print(f"{vars_old[i]}' = {polys[i]}")
        print("Outputs to fix:")
        print(", ".join(map(str, observable)))
        print("New variables:")
        for i in range(lumping_subspace.dim()):
            summands = []
            for j in range(len(vars_old)):
                if lumping_subspace.basis()[i][j] != 0:
                    summands.append(f"{sympify(lumping_subspace.basis()[i][j]).as_expr()}*{vars_old[j]}")
            new_var_string = " + ".join(summands)
            print(f"{vars_new[i]} = {new_var_string}")

        print("Lumped system:")
        for i in range(lumping_subspace.dim()):
            print(f"{vars_new[i]}' = {lumped_polys[i]}")

    return {"polynomials" : lumped_polys, "subspace" : [v.to_list() for v in lumping_subspace.basis()]}

def do_lumping(polys, observable, new_vars_name='y', verbose=True, out_format="sympy"):
    """
      Main function, performs a lumping of a polynomial ODE system
      Input
        - polys - the right-hand side of the system
        - observable - a nonempty list of linear forms in state variables
                       that must be kept nonlumped
        - new_vars_name (optional) - the name for variables in the lumped polynomials
        - verbose (optional) - whether to report the result on the screen or not
        - out_format - "sympy" or "internal", the way the output polynomials should be represeted
          the options are sympy polynomials and SparsePolynomial
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

    if isinstance(polys[0], SparsePolynomial):
        logging.debug("Input is in the SparsePolynomial format")
    else:
        logging.debug("Input is expected to be in SymPy format")
        polys = [SparsePolynomial.from_sympy(p) for p in polys]
        observable = [SparsePolynomial.from_sympy(ob) for ob in observable]

    result = do_lumping_internal(polys, observable, new_vars_name, verbose)

    if out_format == "sympy":
        out_ring = result["polynomials"][0].get_sympy_ring()
        result["polynomials"] = [out_ring(p.get_sympy_dict()) for p in result["polynomials"]]
    elif out_format == "internal":
        pass
    else:
        raise ValueError(f"Unknown output format {out_format}")
    return result

###############################################################################
