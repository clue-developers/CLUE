# Model generated from: 
# Sneddon, M. W., Faeder, J. R., & Emonet, T. 
# Efficient modeling, simulation and coarse-graining of biological complexity with NFsim. 
# Nature methods, 8(2), 177, 2011.
# Models e2.bngl-e8.bngl from http://michaelsneddon.net/nfsim/pages/models/multisite_phos.zip

import sys
import time

from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import parser
import clue
from sparse_polynomial import SparsePolynomial

for n in range(2, 9):

    system = parser.read_system(f"e{n}.ode")

    print("===============================================")
    obs = [
        clue.SparsePolynomial.from_string("S0", system['variables']),
        clue.SparsePolynomial.from_string("S1", system['variables'])
    ]

    start = time.time()
    lumped = clue.do_lumping(system['equations'], obs)
    end = time.time()

    print(f"Model for n = {n}")
    print(f"The size of the original model is {len(system['equations'])}")
    print(f"The size of the reduced model is {len(lumped['polynomials'])}")
