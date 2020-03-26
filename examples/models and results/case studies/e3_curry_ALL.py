import sys
import sympy
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")
import lumper

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(75)], QQ)
print("Example e3_curry")
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
-pkOnF*x2*x9*x73 + -pkOnF*x2*x11*x73 + -pkOnF*x2*x12*x73 + -pkOnF*x2*x16*x73 + -pkOnF*x2*x17*x73 + pkOffF*x18*x74 + pkCatF*x18*x75 + -pkOnF*x2*x14*x73 + -pkOnF*x2*x20*x73 + pkOffF*x21*x74 + pkCatF*x21*x75 + -pkOnF*x2*x15*x73 + -pkOnF*x2*x19*x73 + pkOffF*x22*x74 + pkCatF*x22*x75 + -pkOnF*x2*x27*x73 + -pkOnF*x2*x28*x73 + -pkOnF*x2*x29*x73 + pkOffF*x30*x74 + pkOffF*x31*x74 + pkCatF*x30*x75 + pkCatF*x31*x75 + -pkOnF*x2*x24*x73 + -pkOnF*x2*x28*x73 + -pkOnF*x2*x33*x73 + pkOffF*x25*x74 + pkOffF*x34*x74 + pkCatF*x25*x75 + pkCatF*x34*x75 + -pkOnF*x2*x23*x73 + -pkOnF*x2*x29*x73 + -pkOnF*x2*x33*x73 + pkOffF*x26*x74 + pkOffF*x32*x74 + pkCatF*x26*x75 + pkCatF*x32*x75 + -pkOnF*x2*x38*x73 + -pkOnF*x2*x39*x73 + -pkOnF*x2*x40*x73 + -pkOnF*x2*x41*x73 + pkOffF*x42*x74 + pkOffF*x43*x74 + pkOffF*x44*x74 + pkCatF*x42*x75 + pkCatF*x43*x75 + pkCatF*x44*x75 + -pkOnF*x2*x36*x73 + -pkOnF*x2*x39*x73 + -pkOnF*x2*x43*x73 + -pkOnF*x2*x45*x73 + pkOffF*x37*x74 + pkOffF*x40*x74 + pkOffF*x46*x74 + pkCatF*x37*x75 + pkCatF*x40*x75 + pkCatF*x46*x75 + -pkOnF*x2*x36*x73 + -pkOnF*x2*x38*x73 + -pkOnF*x2*x44*x73 + -pkOnF*x2*x46*x73 + pkOffF*x35*x74 + pkOffF*x41*x74 + pkOffF*x45*x74 + pkCatF*x35*x75 + pkCatF*x41*x75 + pkCatF*x45*x75 + -pkOnF*x2*x49*x73 + -pkOnF*x2*x50*x73 + -pkOnF*x2*x51*x73 + pkOffF*x52*x74 + pkOffF*x53*x74 + pkOffF*x54*x74 + pkOffF*x55*x74 + pkCatF*x52*x75 + pkCatF*x53*x75 + pkCatF*x54*x75 + pkCatF*x55*x75 + -pkOnF*x2*x47*x73 + -pkOnF*x2*x50*x73 + -pkOnF*x2*x53*x73 + pkOffF*x48*x74 + pkOffF*x51*x74 + pkOffF*x54*x74 + pkOffF*x56*x74 + pkCatF*x48*x75 + pkCatF*x51*x75 + pkCatF*x54*x75 + pkCatF*x56*x75 + -pkOnF*x2*x48*x73 + -pkOnF*x2*x50*x73 + -pkOnF*x2*x52*x73 + pkOffF*x47*x74 + pkOffF*x49*x74 + pkOffF*x55*x74 + pkOffF*x56*x74 + pkCatF*x47*x75 + pkCatF*x49*x75 + pkCatF*x55*x75 + pkCatF*x56*x75 + -pkOnF*x2*x58*x73 + -pkOnF*x2*x59*x73 + pkOffF*x60*x74 + pkOffF*x61*x74 + pkOffF*x62*x74 + pkCatF*x60*x75 + pkCatF*x61*x75 + pkCatF*x62*x75 + -pkOnF*x2*x58*x73 + -pkOnF*x2*x61*x73 + pkOffF*x57*x74 + pkOffF*x59*x74 + pkOffF*x62*x74 + pkCatF*x57*x75 + pkCatF*x59*x75 + pkCatF*x62*x75 + -pkOnF*x2*x59*x73 + -pkOnF*x2*x61*x73 + pkOffF*x57*x74 + pkOffF*x58*x74 + pkOffF*x60*x74 + pkCatF*x57*x75 + pkCatF*x58*x75 + pkCatF*x60*x75 + -pkOnF*x2*x63*x73 + pkOffF*x64*x74 + pkOffF*x65*x74 + pkCatF*x64*x75 + pkCatF*x65*x75 + -pkOnF*x2*x64*x73 + pkOffF*x63*x74 + pkOffF*x65*x74 + pkCatF*x63*x75 + pkCatF*x65*x75 + -pkOnF*x2*x65*x73 + pkOffF*x63*x74 + pkOffF*x64*x74 + pkCatF*x63*x75 + pkCatF*x64*x75 + pkOffF*x66*x74 + pkCatF*x66*x75 + pkOffF*x66*x74 + pkCatF*x66*x75 + pkOffF*x66*x74 + pkCatF*x66*x75,
-pkOnE*x1*x3*x70 + -pkOnE*x1*x3*x70 + -pkOnE*x1*x3*x70 + pkOffE*x4*x71 + pkOffE*x5*x71 + pkOffE*x6*x71 + pkCatF*x18*x75 + pkCatF*x21*x75 + pkCatF*x22*x75,
pkOnE*x1*x3*x70 + -pkOffE*x4*x71 + -pkCatE*x4*x72 + -pkOnE*x1*x4*x70 + -pkOnE*x1*x4*x70 + pkOffE*x7*x71 + pkOffE*x8*x71 + pkCatF*x25*x75 + pkCatF*x26*x75,
pkOnE*x1*x3*x70 + -pkOnE*x1*x5*x70 + -pkOffE*x5*x71 + -pkCatE*x5*x72 + -pkOnE*x1*x5*x70 + pkOffE*x7*x71 + pkOffE*x10*x71 + pkCatF*x30*x75 + pkCatF*x32*x75,
pkOnE*x1*x3*x70 + -pkOnE*x1*x6*x70 + -pkOnE*x1*x6*x70 + -pkOffE*x6*x71 + -pkCatE*x6*x72 + pkOffE*x8*x71 + pkOffE*x10*x71 + pkCatF*x31*x75 + pkCatF*x34*x75,
pkOnE*x1*x5*x70 + pkOnE*x1*x4*x70 + -pkOffE*x7*x71 + -pkCatE*x7*x72 + -pkOffE*x7*x71 + -pkCatE*x7*x72 + -pkOnE*x1*x7*x70 + pkOffE*x13*x71 + pkCatF*x35*x75,
pkOnE*x1*x6*x70 + pkOnE*x1*x4*x70 + -pkOffE*x8*x71 + -pkCatE*x8*x72 + -pkOnE*x1*x8*x70 + -pkOffE*x8*x71 + -pkCatE*x8*x72 + pkOffE*x13*x71 + pkCatF*x37*x75,
pkCatE*x4*x72 + -pkOnF*x2*x9*x73 + -pkOnE*x1*x9*x70 + -pkOnE*x1*x9*x70 + pkOffF*x18*x74 + pkOffE*x16*x71 + pkOffE*x17*x71 + pkCatF*x40*x75 + pkCatF*x41*x75,
pkOnE*x1*x6*x70 + pkOnE*x1*x5*x70 + -pkOnE*x1*x10*x70 + -pkOffE*x10*x71 + -pkCatE*x10*x72 + -pkOffE*x10*x71 + -pkCatE*x10*x72 + pkOffE*x13*x71 + pkCatF*x42*x75,
pkCatE*x5*x72 + -pkOnE*x1*x11*x70 + -pkOnF*x2*x11*x73 + -pkOnE*x1*x11*x70 + pkOffE*x14*x71 + pkOffF*x21*x74 + pkOffE*x20*x71 + pkCatF*x43*x75 + pkCatF*x45*x75,
pkCatE*x6*x72 + -pkOnE*x1*x12*x70 + -pkOnE*x1*x12*x70 + -pkOnF*x2*x12*x73 + pkOffE*x15*x71 + pkOffE*x19*x71 + pkOffF*x22*x74 + pkCatF*x44*x75 + pkCatF*x46*x75,
pkOnE*x1*x10*x70 + pkOnE*x1*x8*x70 + pkOnE*x1*x7*x70 + -pkOffE*x13*x71 + -pkCatE*x13*x72 + -pkOffE*x13*x71 + -pkCatE*x13*x72 + -pkOffE*x13*x71 + -pkCatE*x13*x72,
pkOnE*x1*x11*x70 + pkCatE*x7*x72 + -pkOffE*x14*x71 + -pkCatE*x14*x72 + -pkOnF*x2*x14*x73 + -pkOnE*x1*x14*x70 + pkOffF*x25*x74 + pkOffE*x24*x71 + pkCatF*x47*x75,
pkOnE*x1*x12*x70 + pkCatE*x8*x72 + -pkOffE*x15*x71 + -pkCatE*x15*x72 + -pkOnE*x1*x15*x70 + -pkOnF*x2*x15*x73 + pkOffE*x23*x71 + pkOffF*x26*x74 + pkCatF*x48*x75,
pkCatE*x7*x72 + pkOnE*x1*x9*x70 + -pkOnF*x2*x16*x73 + -pkOffE*x16*x71 + -pkCatE*x16*x72 + -pkOnE*x1*x16*x70 + pkOffF*x30*x74 + pkOffE*x27*x71 + pkCatF*x49*x75,
pkCatE*x8*x72 + pkOnE*x1*x9*x70 + -pkOnF*x2*x17*x73 + -pkOnE*x1*x17*x70 + -pkOffE*x17*x71 + -pkCatE*x17*x72 + pkOffF*x31*x74 + pkOffE*x27*x71 + pkCatF*x51*x75,
pkOnF*x2*x9*x73 + -pkOffF*x18*x74 + -pkCatF*x18*x75 + -pkOnE*x1*x18*x70 + -pkOnE*x1*x18*x70 + pkOffE*x30*x71 + pkOffE*x31*x71 + pkCatF*x54*x75 + pkCatF*x55*x75,
pkOnE*x1*x12*x70 + pkCatE*x10*x72 + -pkOnE*x1*x19*x70 + -pkOffE*x19*x71 + -pkCatE*x19*x72 + -pkOnF*x2*x19*x73 + pkOffE*x23*x71 + pkOffF*x32*x74 + pkCatF*x52*x75,
pkCatE*x10*x72 + pkOnE*x1*x11*x70 + -pkOnE*x1*x20*x70 + -pkOnF*x2*x20*x73 + -pkOffE*x20*x71 + -pkCatE*x20*x72 + pkOffE*x24*x71 + pkOffF*x34*x74 + pkCatF*x53*x75,
pkOnF*x2*x11*x73 + -pkOnE*x1*x21*x70 + -pkOffF*x21*x74 + -pkCatF*x21*x75 + -pkOnE*x1*x21*x70 + pkOffE*x25*x71 + pkOffE*x34*x71 + pkCatF*x54*x75 + pkCatF*x56*x75,
pkOnF*x2*x12*x73 + -pkOnE*x1*x22*x70 + -pkOnE*x1*x22*x70 + -pkOffF*x22*x74 + -pkCatF*x22*x75 + pkOffE*x26*x71 + pkOffE*x32*x71 + pkCatF*x55*x75 + pkCatF*x56*x75,
pkOnE*x1*x19*x70 + pkOnE*x1*x15*x70 + pkCatE*x13*x72 + -pkOffE*x23*x71 + -pkCatE*x23*x72 + -pkOffE*x23*x71 + -pkCatE*x23*x72 + -pkOnF*x2*x23*x73 + pkOffF*x35*x74,
pkOnE*x1*x20*x70 + pkCatE*x13*x72 + pkOnE*x1*x14*x70 + -pkOffE*x24*x71 + -pkCatE*x24*x72 + -pkOnF*x2*x24*x73 + -pkOffE*x24*x71 + -pkCatE*x24*x72 + pkOffF*x37*x74,
pkOnE*x1*x21*x70 + pkOnF*x2*x14*x73 + -pkOffE*x25*x71 + -pkCatE*x25*x72 + -pkOffF*x25*x74 + -pkCatF*x25*x75 + -pkOnE*x1*x25*x70 + pkOffE*x37*x71 + pkCatF*x57*x75,
pkOnE*x1*x22*x70 + pkOnF*x2*x15*x73 + -pkOffE*x26*x71 + -pkCatE*x26*x72 + -pkOnE*x1*x26*x70 + -pkOffF*x26*x74 + -pkCatF*x26*x75 + pkOffE*x35*x71 + pkCatF*x57*x75,
pkCatE*x13*x72 + pkOnE*x1*x17*x70 + pkOnE*x1*x16*x70 + -pkOnF*x2*x27*x73 + -pkOffE*x27*x71 + -pkCatE*x27*x72 + -pkOffE*x27*x71 + -pkCatE*x27*x72 + pkOffF*x42*x74,
pkCatE*x14*x72 + pkCatE*x16*x72 + -pkOnF*x2*x28*x73 + -pkOnF*x2*x28*x73 + -pkOnE*x1*x28*x70 + pkOffF*x43*x74 + pkOffF*x40*x74 + pkOffE*x39*x71 + pkCatF*x58*x75,
pkCatE*x15*x72 + pkCatE*x17*x72 + -pkOnF*x2*x29*x73 + -pkOnE*x1*x29*x70 + -pkOnF*x2*x29*x73 + pkOffF*x44*x74 + pkOffE*x38*x71 + pkOffF*x41*x74 + pkCatF*x59*x75,
pkOnF*x2*x16*x73 + pkOnE*x1*x18*x70 + -pkOffF*x30*x74 + -pkCatF*x30*x75 + -pkOffE*x30*x71 + -pkCatE*x30*x72 + -pkOnE*x1*x30*x70 + pkOffE*x42*x71 + pkCatF*x60*x75,
pkOnF*x2*x17*x73 + pkOnE*x1*x18*x70 + -pkOffF*x31*x74 + -pkCatF*x31*x75 + -pkOnE*x1*x31*x70 + -pkOffE*x31*x71 + -pkCatE*x31*x72 + pkOffE*x42*x71 + pkCatF*x62*x75,
pkOnE*x1*x22*x70 + pkOnF*x2*x19*x73 + -pkOnE*x1*x32*x70 + -pkOffE*x32*x71 + -pkCatE*x32*x72 + -pkOffF*x32*x74 + -pkCatF*x32*x75 + pkOffE*x35*x71 + pkCatF*x60*x75,
pkCatE*x19*x72 + pkCatE*x20*x72 + -pkOnE*x1*x33*x70 + -pkOnF*x2*x33*x73 + -pkOnF*x2*x33*x73 + pkOffE*x36*x71 + pkOffF*x46*x74 + pkOffF*x45*x74 + pkCatF*x61*x75,
pkOnF*x2*x20*x73 + pkOnE*x1*x21*x70 + -pkOnE*x1*x34*x70 + -pkOffF*x34*x74 + -pkCatF*x34*x75 + -pkOffE*x34*x71 + -pkCatE*x34*x72 + pkOffE*x37*x71 + pkCatF*x62*x75,
pkOnE*x1*x32*x70 + pkOnE*x1*x26*x70 + pkOnF*x2*x23*x73 + -pkOffE*x35*x71 + -pkCatE*x35*x72 + -pkOffE*x35*x71 + -pkCatE*x35*x72 + -pkOffF*x35*x74 + -pkCatF*x35*x75,
pkOnE*x1*x33*x70 + pkCatE*x23*x72 + pkCatE*x24*x72 + -pkOffE*x36*x71 + -pkCatE*x36*x72 + -pkOnF*x2*x36*x73 + -pkOnF*x2*x36*x73 + pkOffF*x48*x74 + pkOffF*x47*x74,
pkOnE*x1*x34*x70 + pkOnF*x2*x24*x73 + pkOnE*x1*x25*x70 + -pkOffE*x37*x71 + -pkCatE*x37*x72 + -pkOffF*x37*x74 + -pkCatF*x37*x75 + -pkOffE*x37*x71 + -pkCatE*x37*x72,
pkCatE*x23*x72 + pkOnE*x1*x29*x70 + pkCatE*x27*x72 + -pkOnF*x2*x38*x73 + -pkOffE*x38*x71 + -pkCatE*x38*x72 + -pkOnF*x2*x38*x73 + pkOffF*x52*x74 + pkOffF*x49*x74,
pkCatE*x24*x72 + pkCatE*x27*x72 + pkOnE*x1*x28*x70 + -pkOnF*x2*x39*x73 + -pkOnF*x2*x39*x73 + -pkOffE*x39*x71 + -pkCatE*x39*x72 + pkOffF*x53*x74 + pkOffF*x51*x74,
pkCatE*x25*x72 + pkOnF*x2*x28*x73 + -pkOnF*x2*x40*x73 + -pkOffF*x40*x74 + -pkCatF*x40*x75 + -pkOnE*x1*x40*x70 + pkOffF*x54*x74 + pkOffE*x51*x71 + pkCatF*x63*x75,
pkCatE*x26*x72 + pkOnF*x2*x29*x73 + -pkOnF*x2*x41*x73 + -pkOnE*x1*x41*x70 + -pkOffF*x41*x74 + -pkCatF*x41*x75 + pkOffF*x55*x74 + pkOffE*x49*x71 + pkCatF*x63*x75,
pkOnF*x2*x27*x73 + pkOnE*x1*x31*x70 + pkOnE*x1*x30*x70 + -pkOffF*x42*x74 + -pkCatF*x42*x75 + -pkOffE*x42*x71 + -pkCatE*x42*x72 + -pkOffE*x42*x71 + -pkCatE*x42*x72,
pkOnF*x2*x28*x73 + pkCatE*x30*x72 + -pkOffF*x43*x74 + -pkCatF*x43*x75 + -pkOnF*x2*x43*x73 + -pkOnE*x1*x43*x70 + pkOffF*x54*x74 + pkOffE*x53*x71 + pkCatF*x64*x75,
pkOnF*x2*x29*x73 + pkCatE*x31*x72 + -pkOffF*x44*x74 + -pkCatF*x44*x75 + -pkOnE*x1*x44*x70 + -pkOnF*x2*x44*x73 + pkOffE*x52*x71 + pkOffF*x55*x74 + pkCatF*x65*x75,
pkCatE*x32*x72 + pkOnF*x2*x33*x73 + -pkOnE*x1*x45*x70 + -pkOnF*x2*x45*x73 + -pkOffF*x45*x74 + -pkCatF*x45*x75 + pkOffE*x47*x71 + pkOffF*x56*x74 + pkCatF*x64*x75,
pkOnF*x2*x33*x73 + pkCatE*x34*x72 + -pkOnE*x1*x46*x70 + -pkOffF*x46*x74 + -pkCatF*x46*x75 + -pkOnF*x2*x46*x73 + pkOffE*x48*x71 + pkOffF*x56*x74 + pkCatF*x65*x75,
pkOnE*x1*x45*x70 + pkCatE*x35*x72 + pkOnF*x2*x36*x73 + -pkOffE*x47*x71 + -pkCatE*x47*x72 + -pkOnF*x2*x47*x73 + -pkOffF*x47*x74 + -pkCatF*x47*x75 + pkOffF*x57*x74,
pkOnE*x1*x46*x70 + pkOnF*x2*x36*x73 + pkCatE*x37*x72 + -pkOffE*x48*x71 + -pkCatE*x48*x72 + -pkOffF*x48*x74 + -pkCatF*x48*x75 + -pkOnF*x2*x48*x73 + pkOffF*x57*x74,
pkCatE*x35*x72 + pkOnE*x1*x41*x70 + pkOnF*x2*x38*x73 + -pkOnF*x2*x49*x73 + -pkOffE*x49*x71 + -pkCatE*x49*x72 + -pkOffF*x49*x74 + -pkCatF*x49*x75 + pkOffF*x60*x74,
pkCatE*x36*x72 + pkCatE*x38*x72 + pkCatE*x39*x72 + -pkOnF*x2*x50*x73 + -pkOnF*x2*x50*x73 + -pkOnF*x2*x50*x73 + pkOffF*x61*x74 + pkOffF*x59*x74 + pkOffF*x58*x74,
pkCatE*x37*x72 + pkOnF*x2*x39*x73 + pkOnE*x1*x40*x70 + -pkOnF*x2*x51*x73 + -pkOffF*x51*x74 + -pkCatF*x51*x75 + -pkOffE*x51*x71 + -pkCatE*x51*x72 + pkOffF*x62*x74,
pkOnF*x2*x38*x73 + pkOnE*x1*x44*x70 + pkCatE*x42*x72 + -pkOffF*x52*x74 + -pkCatF*x52*x75 + -pkOffE*x52*x71 + -pkCatE*x52*x72 + -pkOnF*x2*x52*x73 + pkOffF*x60*x74,
pkOnF*x2*x39*x73 + pkCatE*x42*x72 + pkOnE*x1*x43*x70 + -pkOffF*x53*x74 + -pkCatF*x53*x75 + -pkOnF*x2*x53*x73 + -pkOffE*x53*x71 + -pkCatE*x53*x72 + pkOffF*x62*x74,
pkOnF*x2*x40*x73 + pkOnF*x2*x43*x73 + -pkOffF*x54*x74 + -pkCatF*x54*x75 + -pkOffF*x54*x74 + -pkCatF*x54*x75 + -pkOnE*x1*x54*x70 + pkOffE*x62*x71 + pkCatF*x66*x75,
pkOnF*x2*x41*x73 + pkOnF*x2*x44*x73 + -pkOffF*x55*x74 + -pkCatF*x55*x75 + -pkOnE*x1*x55*x70 + -pkOffF*x55*x74 + -pkCatF*x55*x75 + pkOffE*x60*x71 + pkCatF*x66*x75,
pkOnF*x2*x45*x73 + pkOnF*x2*x46*x73 + -pkOnE*x1*x56*x70 + -pkOffF*x56*x74 + -pkCatF*x56*x75 + -pkOffF*x56*x74 + -pkCatF*x56*x75 + pkOffE*x57*x71 + pkCatF*x66*x75,
pkOnE*x1*x56*x70 + pkOnF*x2*x47*x73 + pkOnF*x2*x48*x73 + -pkOffE*x57*x71 + -pkCatE*x57*x72 + -pkOffF*x57*x74 + -pkCatF*x57*x75 + -pkOffF*x57*x74 + -pkCatF*x57*x75,
pkCatE*x47*x72 + pkCatE*x49*x72 + pkOnF*x2*x50*x73 + -pkOnF*x2*x58*x73 + -pkOnF*x2*x58*x73 + -pkOffF*x58*x74 + -pkCatF*x58*x75 + pkOffF*x64*x74 + pkOffF*x63*x74,
pkCatE*x48*x72 + pkOnF*x2*x50*x73 + pkCatE*x51*x72 + -pkOnF*x2*x59*x73 + -pkOffF*x59*x74 + -pkCatF*x59*x75 + -pkOnF*x2*x59*x73 + pkOffF*x65*x74 + pkOffF*x63*x74,
pkOnF*x2*x49*x73 + pkOnE*x1*x55*x70 + pkOnF*x2*x52*x73 + -pkOffF*x60*x74 + -pkCatF*x60*x75 + -pkOffE*x60*x71 + -pkCatE*x60*x72 + -pkOffF*x60*x74 + -pkCatF*x60*x75,
pkOnF*x2*x50*x73 + pkCatE*x52*x72 + pkCatE*x53*x72 + -pkOffF*x61*x74 + -pkCatF*x61*x75 + -pkOnF*x2*x61*x73 + -pkOnF*x2*x61*x73 + pkOffF*x65*x74 + pkOffF*x64*x74,
pkOnF*x2*x51*x73 + pkOnF*x2*x53*x73 + pkOnE*x1*x54*x70 + -pkOffF*x62*x74 + -pkCatF*x62*x75 + -pkOffF*x62*x74 + -pkCatF*x62*x75 + -pkOffE*x62*x71 + -pkCatE*x62*x72,
pkCatE*x57*x72 + pkOnF*x2*x58*x73 + pkOnF*x2*x59*x73 + -pkOnF*x2*x63*x73 + -pkOffF*x63*x74 + -pkCatF*x63*x75 + -pkOffF*x63*x74 + -pkCatF*x63*x75 + pkOffF*x66*x74,
pkOnF*x2*x58*x73 + pkCatE*x60*x72 + pkOnF*x2*x61*x73 + -pkOffF*x64*x74 + -pkCatF*x64*x75 + -pkOnF*x2*x64*x73 + -pkOffF*x64*x74 + -pkCatF*x64*x75 + pkOffF*x66*x74,
pkOnF*x2*x59*x73 + pkOnF*x2*x61*x73 + pkCatE*x62*x72 + -pkOffF*x65*x74 + -pkCatF*x65*x75 + -pkOffF*x65*x74 + -pkCatF*x65*x75 + -pkOnF*x2*x65*x73 + pkOffF*x66*x74,
pkOnF*x2*x63*x73 + pkOnF*x2*x64*x73 + pkOnF*x2*x65*x73 + -pkOffF*x66*x74 + -pkCatF*x66*x75 + -pkOffF*x66*x74 + -pkCatF*x66*x75 + -pkOffF*x66*x74 + -pkCatF*x66*x75,
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

#{S0}
result = lumper.do_lumping(polys, [x1])
print("Total for e3_curry S0 is " + str(len(result["polynomials"])))

#{S1}
result = lumper.do_lumping(polys, [x2])
print("Total for e3_curry S1 is " + str(len(result["polynomials"])))

#{S33,S34,S35,S36,S44,S45,S46,S47,S55,S56,S2,S3,S4,S5,S6,S7,S9,S10,S11,S12,S13,S14,S18,S19,S20,S21,S22,S23,S24,S25,S31,S32}
result = lumper.do_lumping(polys, [x34 + x35 + x36 + x37 + x45 + x46 + x47 + x48 + x56 + x57 + x3 + x4 + x5 + x6 + x7 + x8 + x10 + x11 + x12 + x13 + x14 + x15 + x19 + x20 + x21 + x22 + x23 + x24 + x25 + x26 + x32 + x33])
print("Total for e3_curry fr the SUM of Block 3 is " + str(len(result["polynomials"])))

#{S37,S38,S39,S40,S41,S42,S43,S48,S49,S50,S51,S52,S53,S54,S57,S58,S59,S60,S61,S62,S63,S64,S65,S8,S15,S16,S17,S26,S27,S28,S29,S30}
result = lumper.do_lumping(polys, [x38 + x39 + x40 + x41 + x42 + x43 + x49 + x50 + x51 + x52 + x53 + x54 + x55 + x58 + x59 + x60 + x61 + x62 + x63 + x64 + x65 + x66 + x9 + x16 + x17 + x18 + x27 + x28 + x29 + x30 + x31])
print("Total for e3_curry for the SUM of block 4 is " + str(len(result["polynomials"])))
