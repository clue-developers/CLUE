import sys
import sympy
from sympy import QQ, Rational

sys.path.insert(0, "../")
sys.path.insert(0, "./")
import lumper, utils

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(4107)], QQ)


print("Example M4_curry")
subs_params = {
    "pEtot": "Rational(1, 1)",
    "pFtot": "Rational(1, 1)",
    "pStot": "Rational(1, 1)",
    "pkOnE": "Rational(1, 1)",
    "pkOffE": "Rational(1, 1)",
    "pkCatE": "Rational(1, 1)",
    "pkOnF": "Rational(1, 1)",
    "pkOffF": "Rational(1, 1)",
    "pkCatF": "Rational(1, 1)"
}

polys = utils.read_polys("M4_curry.poly", R, subs_params) 

#S0
result = lumper.do_lumping(polys, [x1])
print("Total for M4_curry, preserving S0 is " + str(len(result["polynomials"])))
