import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file="fceri_ji.ode")

obs_sets = [
    ["S0"],
    ["S2", "S178", "S267", "S77"],
    ["S2 + S178 + S267 + S77"],
    ["S7"],
    ["S1"]
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
