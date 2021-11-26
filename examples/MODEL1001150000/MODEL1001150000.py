# Generated from http://www.ebi.ac.uk/biomodels-main/MODEL1001150000



import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file="MODEL1001150000.ode")

obs_sets = [
    ["CaM_0_0 + CaM_1_0 + CaM_0_1 + CaM_1_1 + CaM_2_2 + CaM_2_0 + CaM_0_2 + CaM_2_1 + CaM_1_2"],
]

lumped = []
for obs_set in obs_sets:
    print("===============================================")
    obs_polys = [SparsePolynomial.from_string(s, system.variables) for s in obs_set]

    start = time.time()
    lumped.append(system.lumping(obs_polys))
    end = time.time()

    print(f"The size of the original model is {system.size}")
    print(f"The size of the reduced model is {lumped[-1].size}")
    print(f"Computation took {end - start} seconds")
