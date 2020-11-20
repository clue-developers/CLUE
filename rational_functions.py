class RationalFunction:
    """
    Class for representing rational function with sparse polynomials
    Fields:
      - num - numerator SparsePolynomial
      - denom - denominator SparsePolynomial
    """
    def __init__(self, num, denom):
        assert num.domain = denom.domain
        self._domain = num.domain
        self._varnames = set(num.gens).union(set(denom.gens))
        self._num = num
        self._denom = denom

    @property
    def domain(self):
        return self._domain

    @property
    def gens(self):
        return self._varnames.copy()

    def derivative(self, var):
        """
        Compute the derivative with respect to a given variable
        """
        d_num = self._denom * self._num.derevative(var) - self._num * self._denom.derevative(var) # SparsePolynomial.derevative..
        d_denom = self._denom**2
        return RationalFunction(d_num,d_denom)

# ------------------------------------------------------------------------------

def extract_matrices(rational_functions):
    """
      Constructs matrices J_1^T, ..., J_N^T (see Step (2) of Algorithm 1 in the paper)
      Input
        - rational_functions - the right-hand side of the system of ODEs (f_1, ..., f_n)
                               represented by RationalFunction
      Output
        a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
    """

    # Compute Jacobian as for rational functions
    all_vars = set()
    for rf in rational_functions:
        all_vars = all_vars.union(rf.gens)

    jacobian = [[rf.derevative(v) for v in all_vars] for rf in rational_functions]

    # Pull out the common denominator

    # take product of all denominators and square it

    # Work with remaining polynomial matrix as usual

    














# def construct_matrices(polys):
#     """
#       Constructs matrices J_1^T, ..., J_N^T (see Step (2) of Algorithm 1 in the paper)
#       Input
#         - polys - the right-hand side of the system of ODEs (f_1, ..., f_n)
#                   represented by SparsePolynomial
#       Output
#         a list of matrices (SparseMatrix) J_1^T, ..., J_N^T
#     """
#     logging.debug("Starting constructing matrices")

#     variables = polys[0].gens
#     field = polys[0].domain
#     jacobians = dict()
#     for p_ind, poly in enumerate(polys):
#         logging.debug("Processing polynomial number %d", p_ind)
#         for monom, coef in poly.dataiter():
#             for i in range(len(monom)):
#                 var, exp = monom[i]
#                 if exp == 1:
#                     m_der = tuple(list(monom[:i]) + list(monom[(i + 1):]))
#                 else:
#                     m_der = tuple(list(monom[:i]) + [(var, exp - 1)] + list(monom[(i + 1):]))
#                 entry = field.convert(coef) * exp
#                 if m_der not in jacobians:
#                     jacobians[m_der] = SparseRowMatrix(len(variables), field)
#                 jacobians[m_der].increment(var, p_ind, entry)

#     result = jacobians.values()
#     return result