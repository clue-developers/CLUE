# Model generated from: 
# Borisov, N. M., Chistopolsky, A. S., Faeder, J. R., & Kholodenko, B. N.
# Domain-oriented reduction of rule-based network models. IET systems biology, 2(5), 342-351, 2008.
# Source: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2628550/bin/NIHMS80246-supplement-Supplement_4.doc
##
import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file="OrderedPhosphorylation.ode")
obs = SparsePolynomial.from_string("s0", system.variables)

start = time.time()
lumped = system.lumping([obs])
end = time.time()

print(f"The size of the original model is {system.size}")
print(f"The size of the reduced model is {lumped.size}")
print(f"Computation took {end - start} seconds")
