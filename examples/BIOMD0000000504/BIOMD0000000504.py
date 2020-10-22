# Model generated from: 
# Proctor, C. J., Macdonald, C., Milner, J. M., Rowan, A. D., & Cawston, T. E. 
# A Computer Simulation Approach to Assessing Therapeutic Intervention Points for the Prevention of Cytokine‐Induced Cartilage Breakdown. 
# Arthritis & rheumatology, 66(4), 979-989, 2014
# Source: https://www.ebi.ac.uk/biomodels/BIOMD0000000504
##

import sys
import time

from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import parser
import clue
from sparse_polynomial import SparsePolynomial

system = parser.read_system("BIOMD0000000504.ode")

obs_sets = [
    ["cFos_P", "cJun_P"],
    ["MMP1_mRNA", "MMP13_mRNA", "TIMP1_mRNA"],
    ["MMP1", "MMP13", "ColFrag"],
    ["JAK1_P", "JNK_P", "cJun_P", "cJun_dimer", "STAT3_P_nuc", "STAT3_P_cyt"]
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
