# Model generated from: 
# Borisov, N. M., Chistopolsky, A. S., Faeder, J. R., & Kholodenko, B. N.
# Domain-oriented reduction of rule-based network models. IET systems biology, 2(5), 342-351, 2008.
# Source: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2628550/bin/NIHMS80246-supplement-Supplement_4.doc
##
import sys
import time

from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import parser
import clue
from sparse_polynomial import SparsePolynomial

system = parser.read_system("OrderedPhosphorylation.ode")
obs = SparsePolynomial.from_string("s0", system['variables'])

start = time.time()
lumped = clue.do_lumping(system['equations'], [obs])
end = time.time()

print(f"The size of the original model is {len(system['equations'])}")
print(f"The size of the reduced model is {len(lumped['polynomials'])}")
print(f"Computation took {end - start} seconds")
