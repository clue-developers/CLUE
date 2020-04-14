# Model generated from: 
# Sneddon, M. W., Faeder, J. R., & Emonet, T. 
# Efficient modeling, simulation and coarse-graining of biological complexity with NFsim. 
# Nature methods, 8(2), 177, 2011.
# Model e2.bngl from http://michaelsneddon.net/nfsim/pages/models/multisite_phos.zip
##

import sys 
import sympy 
from sympy import QQ

sys.path.insert(0, "../../") 
sys.path.insert(0, "./") 
from clue import do_lumping

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(27)], QQ)
print ("Example of Protein phosphorylation for n = 2")
pEtot = QQ(1)
pFtot = QQ(1)
pStot = QQ(1)
pkOnE = QQ(1)
pkOffE = QQ(1)
pkCatE = QQ(1)
pkOnF = QQ(1)
pkOffF = QQ(1)
pkCatF = QQ(1)

polys = [
-pkOnE*x1*x3*x22 - pkOnE*x1*x3*x22 - pkOnE*x1*x5*x22 + pkOffE*x4*x23 + pkCatE*x4*x24 - pkOnE*x1*x4*x22 + pkOffE*x5*x23 + pkCatE*x5*x24 - pkOnE*x1*x8*x22 + pkOffE*x6*x23 + pkCatE*x6*x24 - pkOnE*x1*x7*x22 + pkOffE*x6*x23 + pkCatE*x6*x24 - pkOnE*x1*x12*x22 + pkOffE*x9*x23 + pkCatE*x9*x24 - pkOnE*x1*x11*x22 + pkOffE*x10*x23 + pkCatE*x10*x24 + pkOffE*x13*x23 + pkCatE*x13*x24 + pkOffE*x15*x23 + pkCatE*x15*x24,
-pkOnF*x2*x7*x25 - pkOnF*x2*x8*x25 - pkOnF*x2*x10*x25 + pkOffF*x11*x26 + pkCatF*x11*x27 - pkOnF*x2*x9*x25 + pkOffF*x12*x26 + pkCatF*x12*x27 - pkOnF*x2*x14*x25 + pkOffF*x15*x26 + pkCatF*x15*x27 - pkOnF*x2*x14*x25 + pkOffF*x13*x26 + pkCatF*x13*x27 - pkOnF*x2*x16*x25 + pkOffF*x17*x26 + pkCatF*x17*x27 - pkOnF*x2*x17*x25 + pkOffF*x16*x26 + pkCatF*x16*x27 + pkOffF*x18*x26 + pkCatF*x18*x27 + pkOffF*x18*x26 + pkCatF*x18*x27,
-pkOnE*x1*x3*x22 - pkOnE*x1*x3*x22 + pkOffE*x4*x23 + pkOffE*x5*x23 + pkCatF*x11*x27 + pkCatF*x12*x27,
pkOnE*x1*x3*x22 - pkOffE*x4*x23 - pkCatE*x4*x24 - pkOnE*x1*x4*x22 + pkOffE*x6*x23 + pkCatF*x13*x27,
pkOnE*x1*x3*x22 - pkOnE*x1*x5*x22 - pkOffE*x5*x23 - pkCatE*x5*x24 + pkOffE*x6*x23 + pkCatF*x15*x27,
pkOnE*x1*x5*x22 + pkOnE*x1*x4*x22 - pkOffE*x6*x23 - pkCatE*x6*x24 - pkOffE*x6*x23 - pkCatE*x6*x24,
pkCatE*x4*x24 - pkOnF*x2*x7*x25 - pkOnE*x1*x7*x22 + pkOffF*x11*x26 + pkOffE*x10*x23 + pkCatF*x16*x27,
pkCatE*x5*x24 - pkOnE*x1*x8*x22 - pkOnF*x2*x8*x25 + pkOffE*x9*x23 + pkOffF*x12*x26 + pkCatF*x17*x27,
pkOnE*x1*x8*x22 + pkCatE*x6*x24 - pkOffE*x9*x23 - pkCatE*x9*x24 - pkOnF*x2*x9*x25 + pkOffF*x13*x26,
pkCatE*x6*x24 + pkOnE*x1*x7*x22 - pkOnF*x2*x10*x25 - pkOffE*x10*x23 - pkCatE*x10*x24 + pkOffF*x15*x26,
pkOnF*x2*x7*x25 - pkOffF*x11*x26 - pkCatF*x11*x27 - pkOnE*x1*x11*x22 + pkOffE*x15*x23 + pkCatF*x18*x27,
pkOnF*x2*x8*x25 - pkOnE*x1*x12*x22 - pkOffF*x12*x26 - pkCatF*x12*x27 + pkOffE*x13*x23 + pkCatF*x18*x27,
pkOnE*x1*x12*x22 + pkOnF*x2*x9*x25 - pkOffE*x13*x23 - pkCatE*x13*x24 - pkOffF*x13*x26 - pkCatF*x13*x27,
pkCatE*x9*x24 + pkCatE*x10*x24 - pkOnF*x2*x14*x25 - pkOnF*x2*x14*x25 + pkOffF*x17*x26 + pkOffF*x16*x26,
pkOnF*x2*x10*x25 + pkOnE*x1*x11*x22 - pkOffF*x15*x26 - pkCatF*x15*x27 - pkOffE*x15*x23 - pkCatE*x15*x24,
pkCatE*x13*x24 + pkOnF*x2*x14*x25 - pkOnF*x2*x16*x25 - pkOffF*x16*x26 - pkCatF*x16*x27 + pkOffF*x18*x26,
pkOnF*x2*x14*x25 + pkCatE*x15*x24 - pkOffF*x17*x26 - pkCatF*x17*x27 - pkOnF*x2*x17*x25 + pkOffF*x18*x26,
pkOnF*x2*x16*x25 + pkOnF*x2*x17*x25 - pkOffF*x18*x26 - pkCatF*x18*x27 - pkOffF*x18*x26 - pkCatF*x18*x27,
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
]

#The observable partition is built using Block 0:
#{S0}
result = do_lumping(polys, [x1])
print("Total partitioning by S0 only  is " + str(len(result["polynomials"])))
