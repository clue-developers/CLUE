# Model generated from: 
# Sneddon, M. W., Faeder, J. R., & Emonet, T. 
# Efficient modeling, simulation and coarse-graining of biological complexity with NFsim. 
# Nature methods, 8(2), 177, 2011.
# Model e3.bngl from http://michaelsneddon.net/nfsim/pages/models/multisite_phos.zip
##

import sys
import sympy
from sympy import QQ

sys.path.insert(0, "../../")
sys.path.insert(0, "./")
from clue import do_lumping

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(72)], QQ)
print("Example of Protein phosphorylation for n = 4")
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
-pkOnE*x1*x3*x70 + -pkOnE*x1*x3*x70 + -pkOnE*x1*x3*x70 + -pkOnE*x1*x5*x70 + -pkOnE*x1*x6*x70 + pkOffE*x4*x71 + pkCatE*x4*x72 + -pkOnE*x1*x4*x70 + -pkOnE*x1*x6*x70 + pkOffE*x5*x71 + pkCatE*x5*x72 + -pkOnE*x1*x4*x70 + -pkOnE*x1*x5*x70 + pkOffE*x6*x71 + pkCatE*x6*x72 + -pkOnE*x1*x10*x70 + -pkOnE*x1*x11*x70 + -pkOnE*x1*x12*x70 + pkOffE*x7*x71 + pkOffE*x8*x71 + pkCatE*x7*x72 + pkCatE*x8*x72 + -pkOnE*x1*x8*x70 + -pkOnE*x1*x9*x70 + -pkOnE*x1*x12*x70 + pkOffE*x7*x71 + pkOffE*x10*x71 + pkCatE*x7*x72 + pkCatE*x10*x72 + -pkOnE*x1*x7*x70 + -pkOnE*x1*x9*x70 + -pkOnE*x1*x11*x70 + pkOffE*x8*x71 + pkOffE*x10*x71 + pkCatE*x8*x72 + pkCatE*x10*x72 + -pkOnE*x1*x19*x70 + -pkOnE*x1*x20*x70 + -pkOnE*x1*x21*x70 + -pkOnE*x1*x22*x70 + pkOffE*x13*x71 + pkOffE*x14*x71 + pkOffE*x15*x71 + pkCatE*x13*x72 + pkCatE*x14*x72 + pkCatE*x15*x72 + -pkOnE*x1*x15*x70 + -pkOnE*x1*x17*x70 + -pkOnE*x1*x18*x70 + -pkOnE*x1*x22*x70 + pkOffE*x13*x71 + pkOffE*x16*x71 + pkOffE*x19*x71 + pkCatE*x13*x72 + pkCatE*x16*x72 + pkCatE*x19*x72 + -pkOnE*x1*x14*x70 + -pkOnE*x1*x16*x70 + -pkOnE*x1*x18*x70 + -pkOnE*x1*x21*x70 + pkOffE*x13*x71 + pkOffE*x17*x71 + pkOffE*x20*x71 + pkCatE*x13*x72 + pkCatE*x17*x72 + pkCatE*x20*x72 + -pkOnE*x1*x32*x70 + -pkOnE*x1*x33*x70 + -pkOnE*x1*x34*x70 + pkOffE*x23*x71 + pkOffE*x24*x71 + pkOffE*x25*x71 + pkOffE*x26*x71 + pkCatE*x23*x72 + pkCatE*x24*x72 + pkCatE*x25*x72 + pkCatE*x26*x72 + -pkOnE*x1*x26*x70 + -pkOnE*x1*x29*x70 + -pkOnE*x1*x31*x70 + pkOffE*x23*x71 + pkOffE*x27*x71 + pkOffE*x30*x71 + pkOffE*x32*x71 + pkCatE*x23*x72 + pkCatE*x27*x72 + pkCatE*x30*x72 + pkCatE*x32*x72 + -pkOnE*x1*x25*x70 + -pkOnE*x1*x28*x70 + -pkOnE*x1*x30*x70 + pkOffE*x24*x71 + pkOffE*x27*x71 + pkOffE*x31*x71 + pkOffE*x34*x71 + pkCatE*x24*x72 + pkCatE*x27*x72 + pkCatE*x31*x72 + pkCatE*x34*x72 + -pkOnE*x1*x45*x70 + -pkOnE*x1*x46*x70 + pkOffE*x35*x71 + pkOffE*x36*x71 + pkOffE*x37*x71 + pkCatE*x35*x72 + pkCatE*x36*x72 + pkCatE*x37*x72 + -pkOnE*x1*x41*x70 + -pkOnE*x1*x44*x70 + pkOffE*x35*x71 + pkOffE*x38*x71 + pkOffE*x42*x71 + pkCatE*x35*x72 + pkCatE*x38*x72 + pkCatE*x42*x72 + -pkOnE*x1*x40*x70 + -pkOnE*x1*x43*x70 + pkOffE*x37*x71 + pkOffE*x39*x71 + pkOffE*x42*x71 + pkCatE*x37*x72 + pkCatE*x39*x72 + pkCatE*x42*x72 + -pkOnE*x1*x56*x70 + pkOffE*x47*x71 + pkOffE*x48*x71 + pkCatE*x47*x72 + pkCatE*x48*x72 + -pkOnE*x1*x55*x70 + pkOffE*x49*x71 + pkOffE*x52*x71 + pkCatE*x49*x72 + pkCatE*x52*x72 + -pkOnE*x1*x54*x70 + pkOffE*x51*x71 + pkOffE*x53*x71 + pkCatE*x51*x72 + pkCatE*x53*x72 + pkOffE*x57*x71 + pkCatE*x57*x72 + pkOffE*x60*x71 + pkCatE*x60*x72 + pkOffE*x62*x71 + pkCatE*x62*x72,
-pkOnF*x2*x9*x69 + -pkOnF*x2*x11*x69 + -pkOnF*x2*x12*x69 + -pkOnF*x2*x16*x69 + -pkOnF*x2*x17*x69 + pkOffF*x18*x68 + pkCatF*x18*x67 + -pkOnF*x2*x14*x69 + -pkOnF*x2*x20*x69 + pkOffF*x21*x68 + pkCatF*x21*x67 + -pkOnF*x2*x15*x69 + -pkOnF*x2*x19*x69 + pkOffF*x22*x68 + pkCatF*x22*x67 + -pkOnF*x2*x27*x69 + -pkOnF*x2*x28*x69 + -pkOnF*x2*x29*x69 + pkOffF*x30*x68 + pkOffF*x31*x68 + pkCatF*x30*x67 + pkCatF*x31*x67 + -pkOnF*x2*x24*x69 + -pkOnF*x2*x28*x69 + -pkOnF*x2*x33*x69 + pkOffF*x25*x68 + pkOffF*x34*x68 + pkCatF*x25*x67 + pkCatF*x34*x67 + -pkOnF*x2*x23*x69 + -pkOnF*x2*x29*x69 + -pkOnF*x2*x33*x69 + pkOffF*x26*x68 + pkOffF*x32*x68 + pkCatF*x26*x67 + pkCatF*x32*x67 + -pkOnF*x2*x38*x69 + -pkOnF*x2*x39*x69 + -pkOnF*x2*x40*x69 + -pkOnF*x2*x41*x69 + pkOffF*x42*x68 + pkOffF*x43*x68 + pkOffF*x44*x68 + pkCatF*x42*x67 + pkCatF*x43*x67 + pkCatF*x44*x67 + -pkOnF*x2*x36*x69 + -pkOnF*x2*x39*x69 + -pkOnF*x2*x43*x69 + -pkOnF*x2*x45*x69 + pkOffF*x37*x68 + pkOffF*x40*x68 + pkOffF*x46*x68 + pkCatF*x37*x67 + pkCatF*x40*x67 + pkCatF*x46*x67 + -pkOnF*x2*x36*x69 + -pkOnF*x2*x38*x69 + -pkOnF*x2*x44*x69 + -pkOnF*x2*x46*x69 + pkOffF*x35*x68 + pkOffF*x41*x68 + pkOffF*x45*x68 + pkCatF*x35*x67 + pkCatF*x41*x67 + pkCatF*x45*x67 + -pkOnF*x2*x49*x69 + -pkOnF*x2*x50*x69 + -pkOnF*x2*x51*x69 + pkOffF*x52*x68 + pkOffF*x53*x68 + pkOffF*x54*x68 + pkOffF*x55*x68 + pkCatF*x52*x67 + pkCatF*x53*x67 + pkCatF*x54*x67 + pkCatF*x55*x67 + -pkOnF*x2*x47*x69 + -pkOnF*x2*x50*x69 + -pkOnF*x2*x53*x69 + pkOffF*x48*x68 + pkOffF*x51*x68 + pkOffF*x54*x68 + pkOffF*x56*x68 + pkCatF*x48*x67 + pkCatF*x51*x67 + pkCatF*x54*x67 + pkCatF*x56*x67 + -pkOnF*x2*x48*x69 + -pkOnF*x2*x50*x69 + -pkOnF*x2*x52*x69 + pkOffF*x47*x68 + pkOffF*x49*x68 + pkOffF*x55*x68 + pkOffF*x56*x68 + pkCatF*x47*x67 + pkCatF*x49*x67 + pkCatF*x55*x67 + pkCatF*x56*x67 + -pkOnF*x2*x58*x69 + -pkOnF*x2*x59*x69 + pkOffF*x60*x68 + pkOffF*x61*x68 + pkOffF*x62*x68 + pkCatF*x60*x67 + pkCatF*x61*x67 + pkCatF*x62*x67 + -pkOnF*x2*x58*x69 + -pkOnF*x2*x61*x69 + pkOffF*x57*x68 + pkOffF*x59*x68 + pkOffF*x62*x68 + pkCatF*x57*x67 + pkCatF*x59*x67 + pkCatF*x62*x67 + -pkOnF*x2*x59*x69 + -pkOnF*x2*x61*x69 + pkOffF*x57*x68 + pkOffF*x58*x68 + pkOffF*x60*x68 + pkCatF*x57*x67 + pkCatF*x58*x67 + pkCatF*x60*x67 + -pkOnF*x2*x63*x69 + pkOffF*x64*x68 + pkOffF*x65*x68 + pkCatF*x64*x67 + pkCatF*x65*x67 + -pkOnF*x2*x64*x69 + pkOffF*x63*x68 + pkOffF*x65*x68 + pkCatF*x63*x67 + pkCatF*x65*x67 + -pkOnF*x2*x65*x69 + pkOffF*x63*x68 + pkOffF*x64*x68 + pkCatF*x63*x67 + pkCatF*x64*x67 + pkOffF*x66*x68 + pkCatF*x66*x67 + pkOffF*x66*x68 + pkCatF*x66*x67 + pkOffF*x66*x68 + pkCatF*x66*x67,
-pkOnE*x1*x3*x70 + -pkOnE*x1*x3*x70 + -pkOnE*x1*x3*x70 + pkOffE*x4*x71 + pkOffE*x5*x71 + pkOffE*x6*x71 + pkCatF*x18*x67 + pkCatF*x21*x67 + pkCatF*x22*x67,
pkOnE*x1*x3*x70 + -pkOffE*x4*x71 + -pkCatE*x4*x72 + -pkOnE*x1*x4*x70 + -pkOnE*x1*x4*x70 + pkOffE*x7*x71 + pkOffE*x8*x71 + pkCatF*x25*x67 + pkCatF*x26*x67,
pkOnE*x1*x3*x70 + -pkOnE*x1*x5*x70 + -pkOffE*x5*x71 + -pkCatE*x5*x72 + -pkOnE*x1*x5*x70 + pkOffE*x7*x71 + pkOffE*x10*x71 + pkCatF*x30*x67 + pkCatF*x32*x67,
pkOnE*x1*x3*x70 + -pkOnE*x1*x6*x70 + -pkOnE*x1*x6*x70 + -pkOffE*x6*x71 + -pkCatE*x6*x72 + pkOffE*x8*x71 + pkOffE*x10*x71 + pkCatF*x31*x67 + pkCatF*x34*x67,
pkOnE*x1*x5*x70 + pkOnE*x1*x4*x70 + -pkOffE*x7*x71 + -pkCatE*x7*x72 + -pkOffE*x7*x71 + -pkCatE*x7*x72 + -pkOnE*x1*x7*x70 + pkOffE*x13*x71 + pkCatF*x35*x67,
pkOnE*x1*x6*x70 + pkOnE*x1*x4*x70 + -pkOffE*x8*x71 + -pkCatE*x8*x72 + -pkOnE*x1*x8*x70 + -pkOffE*x8*x71 + -pkCatE*x8*x72 + pkOffE*x13*x71 + pkCatF*x37*x67,
pkCatE*x4*x72 + -pkOnF*x2*x9*x69 + -pkOnE*x1*x9*x70 + -pkOnE*x1*x9*x70 + pkOffF*x18*x68 + pkOffE*x16*x71 + pkOffE*x17*x71 + pkCatF*x40*x67 + pkCatF*x41*x67,
pkOnE*x1*x6*x70 + pkOnE*x1*x5*x70 + -pkOnE*x1*x10*x70 + -pkOffE*x10*x71 + -pkCatE*x10*x72 + -pkOffE*x10*x71 + -pkCatE*x10*x72 + pkOffE*x13*x71 + pkCatF*x42*x67,
pkCatE*x5*x72 + -pkOnE*x1*x11*x70 + -pkOnF*x2*x11*x69 + -pkOnE*x1*x11*x70 + pkOffE*x14*x71 + pkOffF*x21*x68 + pkOffE*x20*x71 + pkCatF*x43*x67 + pkCatF*x45*x67,
pkCatE*x6*x72 + -pkOnE*x1*x12*x70 + -pkOnE*x1*x12*x70 + -pkOnF*x2*x12*x69 + pkOffE*x15*x71 + pkOffE*x19*x71 + pkOffF*x22*x68 + pkCatF*x44*x67 + pkCatF*x46*x67,
pkOnE*x1*x10*x70 + pkOnE*x1*x8*x70 + pkOnE*x1*x7*x70 + -pkOffE*x13*x71 + -pkCatE*x13*x72 + -pkOffE*x13*x71 + -pkCatE*x13*x72 + -pkOffE*x13*x71 + -pkCatE*x13*x72,
pkOnE*x1*x11*x70 + pkCatE*x7*x72 + -pkOffE*x14*x71 + -pkCatE*x14*x72 + -pkOnF*x2*x14*x69 + -pkOnE*x1*x14*x70 + pkOffF*x25*x68 + pkOffE*x24*x71 + pkCatF*x47*x67,
pkOnE*x1*x12*x70 + pkCatE*x8*x72 + -pkOffE*x15*x71 + -pkCatE*x15*x72 + -pkOnE*x1*x15*x70 + -pkOnF*x2*x15*x69 + pkOffE*x23*x71 + pkOffF*x26*x68 + pkCatF*x48*x67,
pkCatE*x7*x72 + pkOnE*x1*x9*x70 + -pkOnF*x2*x16*x69 + -pkOffE*x16*x71 + -pkCatE*x16*x72 + -pkOnE*x1*x16*x70 + pkOffF*x30*x68 + pkOffE*x27*x71 + pkCatF*x49*x67,
pkCatE*x8*x72 + pkOnE*x1*x9*x70 + -pkOnF*x2*x17*x69 + -pkOnE*x1*x17*x70 + -pkOffE*x17*x71 + -pkCatE*x17*x72 + pkOffF*x31*x68 + pkOffE*x27*x71 + pkCatF*x51*x67,
pkOnF*x2*x9*x69 + -pkOffF*x18*x68 + -pkCatF*x18*x67 + -pkOnE*x1*x18*x70 + -pkOnE*x1*x18*x70 + pkOffE*x30*x71 + pkOffE*x31*x71 + pkCatF*x54*x67 + pkCatF*x55*x67,
pkOnE*x1*x12*x70 + pkCatE*x10*x72 + -pkOnE*x1*x19*x70 + -pkOffE*x19*x71 + -pkCatE*x19*x72 + -pkOnF*x2*x19*x69 + pkOffE*x23*x71 + pkOffF*x32*x68 + pkCatF*x52*x67,
pkCatE*x10*x72 + pkOnE*x1*x11*x70 + -pkOnE*x1*x20*x70 + -pkOnF*x2*x20*x69 + -pkOffE*x20*x71 + -pkCatE*x20*x72 + pkOffE*x24*x71 + pkOffF*x34*x68 + pkCatF*x53*x67,
pkOnF*x2*x11*x69 + -pkOnE*x1*x21*x70 + -pkOffF*x21*x68 + -pkCatF*x21*x67 + -pkOnE*x1*x21*x70 + pkOffE*x25*x71 + pkOffE*x34*x71 + pkCatF*x54*x67 + pkCatF*x56*x67,
pkOnF*x2*x12*x69 + -pkOnE*x1*x22*x70 + -pkOnE*x1*x22*x70 + -pkOffF*x22*x68 + -pkCatF*x22*x67 + pkOffE*x26*x71 + pkOffE*x32*x71 + pkCatF*x55*x67 + pkCatF*x56*x67,
pkOnE*x1*x19*x70 + pkOnE*x1*x15*x70 + pkCatE*x13*x72 + -pkOffE*x23*x71 + -pkCatE*x23*x72 + -pkOffE*x23*x71 + -pkCatE*x23*x72 + -pkOnF*x2*x23*x69 + pkOffF*x35*x68,
pkOnE*x1*x20*x70 + pkCatE*x13*x72 + pkOnE*x1*x14*x70 + -pkOffE*x24*x71 + -pkCatE*x24*x72 + -pkOnF*x2*x24*x69 + -pkOffE*x24*x71 + -pkCatE*x24*x72 + pkOffF*x37*x68,
pkOnE*x1*x21*x70 + pkOnF*x2*x14*x69 + -pkOffE*x25*x71 + -pkCatE*x25*x72 + -pkOffF*x25*x68 + -pkCatF*x25*x67 + -pkOnE*x1*x25*x70 + pkOffE*x37*x71 + pkCatF*x57*x67,
pkOnE*x1*x22*x70 + pkOnF*x2*x15*x69 + -pkOffE*x26*x71 + -pkCatE*x26*x72 + -pkOnE*x1*x26*x70 + -pkOffF*x26*x68 + -pkCatF*x26*x67 + pkOffE*x35*x71 + pkCatF*x57*x67,
pkCatE*x13*x72 + pkOnE*x1*x17*x70 + pkOnE*x1*x16*x70 + -pkOnF*x2*x27*x69 + -pkOffE*x27*x71 + -pkCatE*x27*x72 + -pkOffE*x27*x71 + -pkCatE*x27*x72 + pkOffF*x42*x68,
pkCatE*x14*x72 + pkCatE*x16*x72 + -pkOnF*x2*x28*x69 + -pkOnF*x2*x28*x69 + -pkOnE*x1*x28*x70 + pkOffF*x43*x68 + pkOffF*x40*x68 + pkOffE*x39*x71 + pkCatF*x58*x67,
pkCatE*x15*x72 + pkCatE*x17*x72 + -pkOnF*x2*x29*x69 + -pkOnE*x1*x29*x70 + -pkOnF*x2*x29*x69 + pkOffF*x44*x68 + pkOffE*x38*x71 + pkOffF*x41*x68 + pkCatF*x59*x67,
pkOnF*x2*x16*x69 + pkOnE*x1*x18*x70 + -pkOffF*x30*x68 + -pkCatF*x30*x67 + -pkOffE*x30*x71 + -pkCatE*x30*x72 + -pkOnE*x1*x30*x70 + pkOffE*x42*x71 + pkCatF*x60*x67,
pkOnF*x2*x17*x69 + pkOnE*x1*x18*x70 + -pkOffF*x31*x68 + -pkCatF*x31*x67 + -pkOnE*x1*x31*x70 + -pkOffE*x31*x71 + -pkCatE*x31*x72 + pkOffE*x42*x71 + pkCatF*x62*x67,
pkOnE*x1*x22*x70 + pkOnF*x2*x19*x69 + -pkOnE*x1*x32*x70 + -pkOffE*x32*x71 + -pkCatE*x32*x72 + -pkOffF*x32*x68 + -pkCatF*x32*x67 + pkOffE*x35*x71 + pkCatF*x60*x67,
pkCatE*x19*x72 + pkCatE*x20*x72 + -pkOnE*x1*x33*x70 + -pkOnF*x2*x33*x69 + -pkOnF*x2*x33*x69 + pkOffE*x36*x71 + pkOffF*x46*x68 + pkOffF*x45*x68 + pkCatF*x61*x67,
pkOnF*x2*x20*x69 + pkOnE*x1*x21*x70 + -pkOnE*x1*x34*x70 + -pkOffF*x34*x68 + -pkCatF*x34*x67 + -pkOffE*x34*x71 + -pkCatE*x34*x72 + pkOffE*x37*x71 + pkCatF*x62*x67,
pkOnE*x1*x32*x70 + pkOnE*x1*x26*x70 + pkOnF*x2*x23*x69 + -pkOffE*x35*x71 + -pkCatE*x35*x72 + -pkOffE*x35*x71 + -pkCatE*x35*x72 + -pkOffF*x35*x68 + -pkCatF*x35*x67,
pkOnE*x1*x33*x70 + pkCatE*x23*x72 + pkCatE*x24*x72 + -pkOffE*x36*x71 + -pkCatE*x36*x72 + -pkOnF*x2*x36*x69 + -pkOnF*x2*x36*x69 + pkOffF*x48*x68 + pkOffF*x47*x68,
pkOnE*x1*x34*x70 + pkOnF*x2*x24*x69 + pkOnE*x1*x25*x70 + -pkOffE*x37*x71 + -pkCatE*x37*x72 + -pkOffF*x37*x68 + -pkCatF*x37*x67 + -pkOffE*x37*x71 + -pkCatE*x37*x72,
pkCatE*x23*x72 + pkOnE*x1*x29*x70 + pkCatE*x27*x72 + -pkOnF*x2*x38*x69 + -pkOffE*x38*x71 + -pkCatE*x38*x72 + -pkOnF*x2*x38*x69 + pkOffF*x52*x68 + pkOffF*x49*x68,
pkCatE*x24*x72 + pkCatE*x27*x72 + pkOnE*x1*x28*x70 + -pkOnF*x2*x39*x69 + -pkOnF*x2*x39*x69 + -pkOffE*x39*x71 + -pkCatE*x39*x72 + pkOffF*x53*x68 + pkOffF*x51*x68,
pkCatE*x25*x72 + pkOnF*x2*x28*x69 + -pkOnF*x2*x40*x69 + -pkOffF*x40*x68 + -pkCatF*x40*x67 + -pkOnE*x1*x40*x70 + pkOffF*x54*x68 + pkOffE*x51*x71 + pkCatF*x63*x67,
pkCatE*x26*x72 + pkOnF*x2*x29*x69 + -pkOnF*x2*x41*x69 + -pkOnE*x1*x41*x70 + -pkOffF*x41*x68 + -pkCatF*x41*x67 + pkOffF*x55*x68 + pkOffE*x49*x71 + pkCatF*x63*x67,
pkOnF*x2*x27*x69 + pkOnE*x1*x31*x70 + pkOnE*x1*x30*x70 + -pkOffF*x42*x68 + -pkCatF*x42*x67 + -pkOffE*x42*x71 + -pkCatE*x42*x72 + -pkOffE*x42*x71 + -pkCatE*x42*x72,
pkOnF*x2*x28*x69 + pkCatE*x30*x72 + -pkOffF*x43*x68 + -pkCatF*x43*x67 + -pkOnF*x2*x43*x69 + -pkOnE*x1*x43*x70 + pkOffF*x54*x68 + pkOffE*x53*x71 + pkCatF*x64*x67,
pkOnF*x2*x29*x69 + pkCatE*x31*x72 + -pkOffF*x44*x68 + -pkCatF*x44*x67 + -pkOnE*x1*x44*x70 + -pkOnF*x2*x44*x69 + pkOffE*x52*x71 + pkOffF*x55*x68 + pkCatF*x65*x67,
pkCatE*x32*x72 + pkOnF*x2*x33*x69 + -pkOnE*x1*x45*x70 + -pkOnF*x2*x45*x69 + -pkOffF*x45*x68 + -pkCatF*x45*x67 + pkOffE*x47*x71 + pkOffF*x56*x68 + pkCatF*x64*x67,
pkOnF*x2*x33*x69 + pkCatE*x34*x72 + -pkOnE*x1*x46*x70 + -pkOffF*x46*x68 + -pkCatF*x46*x67 + -pkOnF*x2*x46*x69 + pkOffE*x48*x71 + pkOffF*x56*x68 + pkCatF*x65*x67,
pkOnE*x1*x45*x70 + pkCatE*x35*x72 + pkOnF*x2*x36*x69 + -pkOffE*x47*x71 + -pkCatE*x47*x72 + -pkOnF*x2*x47*x69 + -pkOffF*x47*x68 + -pkCatF*x47*x67 + pkOffF*x57*x68,
pkOnE*x1*x46*x70 + pkOnF*x2*x36*x69 + pkCatE*x37*x72 + -pkOffE*x48*x71 + -pkCatE*x48*x72 + -pkOffF*x48*x68 + -pkCatF*x48*x67 + -pkOnF*x2*x48*x69 + pkOffF*x57*x68,
pkCatE*x35*x72 + pkOnE*x1*x41*x70 + pkOnF*x2*x38*x69 + -pkOnF*x2*x49*x69 + -pkOffE*x49*x71 + -pkCatE*x49*x72 + -pkOffF*x49*x68 + -pkCatF*x49*x67 + pkOffF*x60*x68,
pkCatE*x36*x72 + pkCatE*x38*x72 + pkCatE*x39*x72 + -pkOnF*x2*x50*x69 + -pkOnF*x2*x50*x69 + -pkOnF*x2*x50*x69 + pkOffF*x61*x68 + pkOffF*x59*x68 + pkOffF*x58*x68,
pkCatE*x37*x72 + pkOnF*x2*x39*x69 + pkOnE*x1*x40*x70 + -pkOnF*x2*x51*x69 + -pkOffF*x51*x68 + -pkCatF*x51*x67 + -pkOffE*x51*x71 + -pkCatE*x51*x72 + pkOffF*x62*x68,
pkOnF*x2*x38*x69 + pkOnE*x1*x44*x70 + pkCatE*x42*x72 + -pkOffF*x52*x68 + -pkCatF*x52*x67 + -pkOffE*x52*x71 + -pkCatE*x52*x72 + -pkOnF*x2*x52*x69 + pkOffF*x60*x68,
pkOnF*x2*x39*x69 + pkCatE*x42*x72 + pkOnE*x1*x43*x70 + -pkOffF*x53*x68 + -pkCatF*x53*x67 + -pkOnF*x2*x53*x69 + -pkOffE*x53*x71 + -pkCatE*x53*x72 + pkOffF*x62*x68,
pkOnF*x2*x40*x69 + pkOnF*x2*x43*x69 + -pkOffF*x54*x68 + -pkCatF*x54*x67 + -pkOffF*x54*x68 + -pkCatF*x54*x67 + -pkOnE*x1*x54*x70 + pkOffE*x62*x71 + pkCatF*x66*x67,
pkOnF*x2*x41*x69 + pkOnF*x2*x44*x69 + -pkOffF*x55*x68 + -pkCatF*x55*x67 + -pkOnE*x1*x55*x70 + -pkOffF*x55*x68 + -pkCatF*x55*x67 + pkOffE*x60*x71 + pkCatF*x66*x67,
pkOnF*x2*x45*x69 + pkOnF*x2*x46*x69 + -pkOnE*x1*x56*x70 + -pkOffF*x56*x68 + -pkCatF*x56*x67 + -pkOffF*x56*x68 + -pkCatF*x56*x67 + pkOffE*x57*x71 + pkCatF*x66*x67,
pkOnE*x1*x56*x70 + pkOnF*x2*x47*x69 + pkOnF*x2*x48*x69 + -pkOffE*x57*x71 + -pkCatE*x57*x72 + -pkOffF*x57*x68 + -pkCatF*x57*x67 + -pkOffF*x57*x68 + -pkCatF*x57*x67,
pkCatE*x47*x72 + pkCatE*x49*x72 + pkOnF*x2*x50*x69 + -pkOnF*x2*x58*x69 + -pkOnF*x2*x58*x69 + -pkOffF*x58*x68 + -pkCatF*x58*x67 + pkOffF*x64*x68 + pkOffF*x63*x68,
pkCatE*x48*x72 + pkOnF*x2*x50*x69 + pkCatE*x51*x72 + -pkOnF*x2*x59*x69 + -pkOffF*x59*x68 + -pkCatF*x59*x67 + -pkOnF*x2*x59*x69 + pkOffF*x65*x68 + pkOffF*x63*x68,
pkOnF*x2*x49*x69 + pkOnE*x1*x55*x70 + pkOnF*x2*x52*x69 + -pkOffF*x60*x68 + -pkCatF*x60*x67 + -pkOffE*x60*x71 + -pkCatE*x60*x72 + -pkOffF*x60*x68 + -pkCatF*x60*x67,
pkOnF*x2*x50*x69 + pkCatE*x52*x72 + pkCatE*x53*x72 + -pkOffF*x61*x68 + -pkCatF*x61*x67 + -pkOnF*x2*x61*x69 + -pkOnF*x2*x61*x69 + pkOffF*x65*x68 + pkOffF*x64*x68,
pkOnF*x2*x51*x69 + pkOnF*x2*x53*x69 + pkOnE*x1*x54*x70 + -pkOffF*x62*x68 + -pkCatF*x62*x67 + -pkOffF*x62*x68 + -pkCatF*x62*x67 + -pkOffE*x62*x71 + -pkCatE*x62*x72,
pkCatE*x57*x72 + pkOnF*x2*x58*x69 + pkOnF*x2*x59*x69 + -pkOnF*x2*x63*x69 + -pkOffF*x63*x68 + -pkCatF*x63*x67 + -pkOffF*x63*x68 + -pkCatF*x63*x67 + pkOffF*x66*x68,
pkOnF*x2*x58*x69 + pkCatE*x60*x72 + pkOnF*x2*x61*x69 + -pkOffF*x64*x68 + -pkCatF*x64*x67 + -pkOnF*x2*x64*x69 + -pkOffF*x64*x68 + -pkCatF*x64*x67 + pkOffF*x66*x68,
pkOnF*x2*x59*x69 + pkOnF*x2*x61*x69 + pkCatE*x62*x72 + -pkOffF*x65*x68 + -pkCatF*x65*x67 + -pkOffF*x65*x68 + -pkCatF*x65*x67 + -pkOnF*x2*x65*x69 + pkOffF*x66*x68,
pkOnF*x2*x63*x69 + pkOnF*x2*x64*x69 + pkOnF*x2*x65*x69 + -pkOffF*x66*x68 + -pkCatF*x66*x67 + -pkOffF*x66*x68 + -pkCatF*x66*x67 + -pkOffF*x66*x68 + -pkCatF*x66*x67,
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
]

#{S0}
result = do_lumping(polys, [x1])
print("Total for n = 3 is " + str(len(result["polynomials"])))

# The sets of observable below has not been discussed in the paper
#{S1}
#result = do_lumping(polys, [x2])
#print("Total for n = 3 with observed S1 is " + str(len(result["polynomials"])))

#{S33,S34,S35,S36,S44,S45,S46,S47,S55,S56,S2,S3,S4,S5,S6,S7,S9,S10,S11,S12,S13,S14,S18,S19,S20,S21,S22,S23,S24,S25,S31,S32}
#result = do_lumping(polys, [x34 + x35 + x36 + x37 + x45 + x46 + x47 + x48 + x56 + x57 + x3 + x4 + x5 + x6 + x7 + x8 + x10 + x11 + x12 + x13 + x14 + x15 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26 + x32 + x33])
#print("Total for n = 3 with observed SUM of Block 3 is " + str(len(result["polynomials"])))

#{S37,S38,S39,S40,S41,S42,S43,S48,S49,S50,S51,S52,S53,S54,S57,S58,S59,S60,S61,S62,S63,S64,S65,S8,S15,S16,S17,S26,S27,S28,S29,S30}
#result = do_lumping(polys, [x38 + x39 + x40 + x41 + x42 + x43 + x49 + x50 + x51 + x52 + x53 + x54 + x55 + x58 + x59 + x60 + x61 + x62 + x63 + x64 + x65 + x66 + x9 + x16 + x17 + x18 + x27 + x28 + x29 + x30 + x31])
#print("Total for n = 3 with observed SUM of block 4 is " + str(len(result["polynomials"])))
