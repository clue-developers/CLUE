# Generated from http://www.ebi.ac.uk/biomodels-main/MODEL1001150000



import sys
import time

from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import parser
import clue
from sparse_polynomial import SparsePolynomial

system = parser.read_system("MODEL1001150000.ode")

obs_sets = [
    ["CaM_0_0 + CaM_1_0 + CaM_0_1 + CaM_1_1 + CaM_2_2 + CaM_2_0 + CaM_0_2 + CaM_2_1 + CaM_1_2"],
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
