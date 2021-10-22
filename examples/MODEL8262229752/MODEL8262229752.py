# Model generated from: 
# Li, J., Wang, L., Hashimoto, Y., Tsao, C. Y., Wood, T. K., Valdes, J. J., ... & Bentley, W. E.
# A stochastic model of Escherichia coli AI‐2 quorum signal circuit reveals alternative synthesis pathways. 
# Molecular systems biology, 2(1), 2006
# Source: https://www.ebi.ac.uk/biomodels/MODEL8262229752
##

import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file="MODEL8262229752.ode")
obs = [
    SparsePolynomial.from_string("Pfs_mRNA", system.variables),
    SparsePolynomial.from_string("LuxS_mRNA", system.variables),
    SparsePolynomial.from_string("AI2_intra", system.variables)
]

start = time.time()
lumped = system.lumping(obs)
end = time.time()

print(f"The size of the original model is {system.size}")
print(f"The size of the reduced model is {lumped.size}")
print(f"Computation took {end - start} seconds")
