# Model generated from: 
# Sneddon, M. W., Faeder, J. R., & Emonet, T. 
# Efficient modeling, simulation and coarse-graining of biological complexity with NFsim. 
# Nature methods, 8(2), 177, 2011.
# Models e2.bngl-e8.bngl from http://michaelsneddon.net/nfsim/pages/models/multisite_phos.zip

import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

# for n in range(2, 9):

system = FODESystem(file=f"{sys.argv[1]}.ode")

# print("===============================================")
obs = [
    SparsePolynomial.from_string("S0", system.variables),
    SparsePolynomial.from_string("S1", system.variables)
]

start = time.time()
lumped = system.lumping(obs)
end = time.time()

print(f"Model for {sys.argv[1]}")
print(f"The size of the original model is {system.size}")
print(f"The size of the reduced model is {lumped.size}")
print(f"Computation took {end - start} seconds")    
