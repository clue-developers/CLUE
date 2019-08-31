import bisect
import logging

import sympy

##########################################################################

class SparseVector:
    def __init__(self, dim):
        self.dim = dim
        self.data = dict()
        self.nonzero = []

    def reduce(self, c, v):
        """
        self = self + c * v
        """
        new_nonzero = []
        l = 0
        r = 0
        while (l < len(self.nonzero) or r < len(v.nonzero)):
            if r == len(v.nonzero):
                new_nonzero.extend(self.nonzero[l:])
                l = len(self.nonzero)
            elif l == len(self.nonzero):
                new_nonzero.extend(v.nonzero[r:])
                for i in range(r, len(v.nonzero)):
                    self.data[v.nonzero[i]] = c * v.data[v.nonzero[i]]
                r = len(v.nonzero)
            else:
                if self.nonzero[l] == v.nonzero[r]:
                    result = self.data[self.nonzero[l]] + c * v.data[v.nonzero[r]]
                    if result != 0:
                        self.data[self.nonzero[l]] = result
                        new_nonzero.append(self.nonzero[l])
                    else:
                        del self.data[self.nonzero[l]]
                    l += 1
                    r += 1
                elif self.nonzero[l] < v.nonzero[r]:
                    new_nonzero.append(self.nonzero[l])
                    l += 1
                else:
                    new_nonzero.append(v.nonzero[r])
                    self.data[v.nonzero[r]] = c * v.data[v.nonzero[r]]
                    r += 1
        self.nonzero = new_nonzero

    def scale(self, c):
        for i in self.nonzero:
            self.data[i] = self.data[i] * c

    def get(self, i):
        return self.data.get(i, 0)

    def set(self, i, c):
        if bisect.bisect(self.nonzero, i) == 0 or self.nonzero[bisect.bisect(self.nonzero, i) - 1] != i:
            self.nonzero.insert(bisect.bisect(self.nonzero, i), i)
        self.data[i] = c

    def inner_product(self, rhs):
        result = 0
        l = 0
        r = 0
        while (l < len(self.nonzero) and r < len(rhs.nonzero)):
            if self.nonzero[l] == rhs.nonzero[r]:
                result += self.data[self.nonzero[l]] * rhs.data[rhs.nonzero[r]]
                l += 1
                r += 1
            elif self.nonzero[l] < rhs.nonzero[r]:
                l += 1
            else:
                r += 1
        return result

    def __append__(self, i, c):
        """
        makes self[i] = c given that all the coordinates with the index r and more were zero
        """
        self.nonzero.append(i)
        self.data[i] = c

    def apply_matrix(self, M):
        result = SparseVector(self.dim)
        for i in M.nonzero:
            prod = self.inner_product(M.row(i))
            if prod != 0:
                result.__append__(i, prod)
        return result

    def is_zero(self):
        return len(self.nonzero) == 0

    def first_nonzero(self):
        if len(self.nonzero) == 0:
            return -1
        else:
            return self.nonzero[0]

    def to_list(self):
        result = [0] * self.dim
        for i in range(len(self.nonzero)):
            result[self.nonzero[i]] = self.data[self.nonzero[i]]
        return result

    def density(self):
        return len(self.nonzero) * 1. / self.dim

    @classmethod
    def from_list(cls, l):
        result = cls(len(l))
        for i in range(len(l)):
            if l[i] != 0:
                result.__append__(i, l[i])
        return result

#########################################################################

class SparseRowMatrix:
    def __init__(self, dim):
        self.dim = dim
        self.data = dict()
        self.nonzero = []

    def set(self, i, j, c):
        if bisect.bisect(self.nonzero, i) == 0 or self.nonzero[bisect.bisect(self.nonzero, i) - 1] != i:
            self.nonzero.insert(bisect.bisect(self.nonzero, i), i)
            self.data[i] = SparseVector(self.dim)
        self.data[i].set(j, c)

    def get(self, i, j):
        if not i in self.data:
            return 0
        return self.data[i].get(j)

    def increment(self, i, j, c):
        self.set(i, j, self.get(i, j) + c)

    def row(self, i):
        if i in self.data:
            return self.data[i]
        else:
            return SparseVector(self.dim)

#########################################################################

def absorb_new_vector(new_vector, echelon_form):
    for p, v in echelon_form.iteritems():
        if new_vector.get(p) != 0:
            new_vector.reduce(-new_vector.get(p), v)
   
    if new_vector.is_zero():
        return -1
    pivot = new_vector.first_nonzero()
    new_vector.scale(1 / new_vector.get(pivot))
    for p, v in echelon_form.iteritems():
        if v.get(pivot) != 0:
            echelon_form[p].reduce(-v.get(pivot), new_vector)

    echelon_form[pivot] = new_vector
    return pivot

########################################################################

def find_smallest_common_subspace_constrained(matrices, vectors_to_include):
    """
      Input:
        matrices - a list of matrices
        vectors_to_include - a list of vectors
      Output: a basis of a common nonzero invariant subspace of the matrices 
        containing the given vectors of the smallest possible dimension
    """ 
    echelon_form = dict()
    new_pivots = set()
    for v in vectors_to_include:
        pivot = absorb_new_vector(v, echelon_form)
        if pivot != -1:
            new_pivots.add(pivot)

    while len(new_pivots) > 0:
        pivots_to_process = new_pivots.copy()
        new_pivots = set()
        for pivot in pivots_to_process:
            logging.info("Processing vecor with a pivot " + str(pivot))
            logging.info("Its density is " + str(echelon_form[pivot].density()))
            M_index = 0
            for M in matrices:
                if M_index % 10 == 0:
                    logging.info("  Multiply by matrix " + str(M_index))
                M_index += 1
                prod = echelon_form[pivot].apply_matrix(M)
                if not prod.is_zero():
                    new_pivot = absorb_new_vector(prod, echelon_form)
                    if new_pivot != -1:
                        new_pivots.add(new_pivot)
        
    return echelon_form


#########################################################################

def perform_change_of_variables(polys, echelon_form, new_vars_name = 'y'):
    """
      Applies a give aggregation to a given list of polynomials
      Input:
      -- polys - a nonempty list of polynomials to aggregate
      -- echelon_form - ????
      the length of each vector in the aggregation must be equal to the length of polys

      Output: the result of the aggregation
    """
    vars_old = polys[0].ring.gens
    new_ring = sympy.polys.rings.vring([new_vars_name + str(i) for i in range(len(echelon_form))], sympy.polys.domains.QQ)
    vars_new = new_ring.gens
    pivots = sorted(echelon_form.keys())

    new_polys = [0] * len(echelon_form)
    for i in range(len(pivots)):
        p, v = pivots[i], echelon_form[pivots[i]]
        for j in v.nonzero:
            new_polys[i] += v.data[j] * polys[j]

    for i in range(len(vars_old)):
        if not (i in pivots):
            for p_ind in range(len(new_polys)):
                new_polys[p_ind] = new_polys[p_ind].subs(vars_old[i], 0)

    result = []
    for p in new_polys:
        monomials = p.to_dict()
        filtered_dict = dict()
        for m, c in monomials.iteritems():
            new_m = tuple([m[i] for i in pivots])
            filtered_dict[new_m] = c
        result.append(new_ring(filtered_dict))

    return result
 
#########################################################################

def construct_matrices(polys):
    """
      Constructs matrices J_1^T, ..., J_N^T (see Proposition 1 in pdf)
      Input: the right-hand side of the system of ODEs (f_1, ..., f_n)
      Output: a list of matrices J_1^T, ..., J_N^T
    """
    logging.info("Starting constructing matrices")
    variables = polys[0].ring.gens
    jacobians = dict()
    for p_ind in range(len(polys)):
       logging.info("Processing polynomial number " + str(p_ind))
       for term in zip(polys[p_ind].monoms(), polys[p_ind].coeffs()):
           monomial = term[0]
           c = term[1]
           for var in range(len(monomial)):
               if monomial[var] > 0:
                   m_der = tuple(list(monomial[:var]) + [monomial[var] - 1] + list(monomial[(var + 1):]))
                   entry = c * monomial[var]
                   if not (m_der in jacobians):
                       jacobians[m_der] = SparseRowMatrix(len(variables))
                   jacobians[m_der].increment(var, p_ind, entry)

    result = jacobians.values()

    return result

###############################################################################

def do_lumping(polys, observable, new_vars_name = 'y'):
    """
      Main function, performs an aggregation of a polynomial ODE system
      Input:
      -- polys - the right-hand side of the system
      -- observable - a list of linear forms in state variables that must be kept nonaggregated
      Output: the right-hand side of an aggregated system
    """    

    logging.basicConfig(
        format = '%(asctime)s %(levelname)-8s %(message)s', 
        level = logging.INFO, 
        datefmt = '%Y-%m-%d %H:%M:%S', 
        filename = "loglog"
    )
    logging.info("Starting aggregation")

    # Reduce the problem to the common invariant subspace problem
    vars_old = polys[0].ring.gens
    matrices = construct_matrices(polys)
    
    # Find a lumping
    vectors_to_include = []
    for linear_form in observable:
        vec = SparseVector.from_list([linear_form.coeff(v) for v in vars_old])
        vectors_to_include.append(vec)
    lumping_echelon = find_smallest_common_subspace_constrained(matrices, vectors_to_include)

    lumped_polys = perform_change_of_variables(polys, lumping_echelon, new_vars_name)

    # Nice printing
    vars_new = lumped_polys[0].ring.gens
    print("Original system:")
    for i in range(len(polys)):
        print(str(vars_old[i]) + "' = " + str(polys[i]))
    print("Outputs to fix:")
    print(observable)
    print("New variables:")
    for i in range(len(lumping_echelon)):
        print(
	    str(vars_new[i]) + 
	    " = " + 
	    str(sum([lumping_echelon.values()[i].get(j) * vars_old[j] for j in range(len(vars_old))]))
	)
    print("Lumped system:")
    for i in range(len(lumping_echelon)):
        print(str(vars_new[i]) + "' = " + str(lumped_polys[i]))

    return lumped_polys


###############################################################################
 
