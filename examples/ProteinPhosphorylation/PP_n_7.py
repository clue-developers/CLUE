# Model generated from: 
# Sneddon, M. W., Faeder, J. R., & Emonet, T. 
# Efficient modeling, simulation and coarse-graining of biological complexity with NFsim. 
# Nature methods, 8(2), 177, 2011.
# Model e7.bngl from http://michaelsneddon.net/nfsim/pages/models/multisite_phos.zip
##

import sys 
import sympy 
from sympy import QQ

sys.path.insert(0, "../../") 
sys.path.insert(0, "./") 

from clue import do_lumping
import clue

vars_ode = ["x" + str(i + 1) for i in range(16386)] + ["kOnE", "kOffE", "kCatE", "kOnF", "kOffF", "kCatF"]
print ("Example of Protein phosphorylation for n = 7")

polys = clue.SparsePolynomial.read_polys("PP_n_7.poly", vars_ode, dict())
#S0
result = do_lumping(polys, [clue.SparsePolynomial(vars_ode, QQ, {((0, 1),) : QQ(1, 1)})])
print("Total partitioning by S0 only  is " + str(len(result["polynomials"])))
