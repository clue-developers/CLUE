# Model e5_curry
import sys 
import sympy 
from sympy import QQ

sys.path.insert(0, "../../") 
sys.path.insert(0, "./") 
import clue

vars_ode = ["x" + str(i + 1) for i in range(1032)]
print("Example of Protein phosphorylation for n = 5")

subs_params = {
    "pEtot" : 1,
    "pFtot" : 1,
    "pStot" : 1,
    "pkOnE" : 1,
    "pkOffE" : 1,
    "pkCatE" : 1,
    "pkOnF" : 1,
    "pkOffF" : 1,
    "pkCatF" : 1
}

polys = clue.SparsePolynomial.read_polys("PP_n_5.poly", vars_ode, subs_params)
# {((0, 1),) : QQ(1, 1)} = x1
result = clue.do_lumping(polys, [clue.SparsePolynomial(vars_ode, QQ, {((0, 1),) : QQ(1, 1)})])
print("Total for n = 5, preserving S0 is " + str(len(result["polynomials"])))
