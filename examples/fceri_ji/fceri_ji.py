import sys
import time

from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import parser
import clue
from sparse_polynomial import SparsePolynomial

system = parser.read_system("fceri_ji.ode")

obs_sets = [
    ["S0"],
    ["S2", "S178", "S267", "S77"],
    ["S2 + S178 + S267 + S77"],
    ["S7"],
    ["S1"]
]

for obs_set in obs_sets:
    print("===============================================")
    obs_polys = [SparsePolynomial.from_string(s, system['variables']) for s in obs_set]

    start = time.time()
    lumped = clue.do_lumping(system['equations'], obs_polys)
    end = time.time()

    print(f"The size of the original model is {len(system['equations'])}")
    print(f"The size of the reduced model is {len(lumped['polynomials'])}")
    print(f"Computation took {end - start} seconds")
