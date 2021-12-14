import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file="Barua.ode")

obs_sets = [
    ["aS000"],
    ["aS027"]
]

for obs_set in obs_sets:
    print("===============================================")
    obs_polys = [SparsePolynomial.from_string(s, system.variables) for s in obs_set]

    start = time.time()
    lumped = system.lumping(obs_polys)
    end = time.time()

    print(f"The size of the original model is {system.size}")
    print(f"The size of the reduced model is {lumped.size}")
    print(f"Computation took {end - start} seconds")
