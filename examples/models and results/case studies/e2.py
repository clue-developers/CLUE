# Model e2
import sys 
import sympy 
from sympy import QQ

sys.path.insert(0, "../") 
sys.path.insert(0, "./") 
import lumper

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(18)], QQ)
print ("Example e2")
Etot = QQ(300)
Ftot = QQ(300)
Stot = QQ(3000)
kOnE = QQ(0.7)
kOffE = QQ(3)
kCatE = QQ(5.0)
kOnF = QQ(0.7)
kOffF = QQ(3)
kCatF = QQ(5.1)

polys = [
-kOnE*x1*x3 + -kOnE*x1*x3 + -kOnE*x1*x5 + kOffE*x4 + kCatE*x4 + -kOnE*x1*x4 + kOffE*x5 + kCatE*x5 + -kOnE*x1*x8 + kOffE*x6 + kCatE*x6 + -kOnE*x1*x7 + kOffE*x6 + kCatE*x6 + -kOnE*x1*x12 + kOffE*x9 + kCatE*x9 + -kOnE*x1*x11 + kOffE*x10 + kCatE*x10 + kOffE*x13 + kCatE*x13 + kOffE*x15 + kCatE*x15,
-kOnF*x2*x7 + -kOnF*x2*x8 + -kOnF*x2*x10 + kOffF*x11 + kCatF*x11 + -kOnF*x2*x9 + kOffF*x12 + kCatF*x12 + -kOnF*x2*x14 + kOffF*x15 + kCatF*x15 + -kOnF*x2*x14 + kOffF*x13 + kCatF*x13 + -kOnF*x2*x16 + kOffF*x17 + kCatF*x17 + -kOnF*x2*x17 + kOffF*x16 + kCatF*x16 + kOffF*x18 + kCatF*x18 + kOffF*x18 + kCatF*x18,
-kOnE*x1*x3 + -kOnE*x1*x3 + kOffE*x4 + kOffE*x5 + kCatF*x11 + kCatF*x12,
kOnE*x1*x3 + -kOffE*x4 + -kCatE*x4 + -kOnE*x1*x4 + kOffE*x6 + kCatF*x13,
kOnE*x1*x3 + -kOnE*x1*x5 + -kOffE*x5 + -kCatE*x5 + kOffE*x6 + kCatF*x15,
kOnE*x1*x5 + kOnE*x1*x4 + -kOffE*x6 + -kCatE*x6 + -kOffE*x6 + -kCatE*x6,
kCatE*x4 + -kOnF*x2*x7 + -kOnE*x1*x7 + kOffF*x11 + kOffE*x10 + kCatF*x16,
kCatE*x5 + -kOnE*x1*x8 + -kOnF*x2*x8 + kOffE*x9 + kOffF*x12 + kCatF*x17,
kOnE*x1*x8 + kCatE*x6 + -kOffE*x9 + -kCatE*x9 + -kOnF*x2*x9 + kOffF*x13,
kCatE*x6 + kOnE*x1*x7 + -kOnF*x2*x10 + -kOffE*x10 + -kCatE*x10 + kOffF*x15,
kOnF*x2*x7 + -kOffF*x11 + -kCatF*x11 + -kOnE*x1*x11 + kOffE*x15 + kCatF*x18,
kOnF*x2*x8 + -kOnE*x1*x12 + -kOffF*x12 + -kCatF*x12 + kOffE*x13 + kCatF*x18,
kOnE*x1*x12 + kOnF*x2*x9 + -kOffE*x13 + -kCatE*x13 + -kOffF*x13 + -kCatF*x13,
kCatE*x9 + kCatE*x10 + -kOnF*x2*x14 + -kOnF*x2*x14 + kOffF*x17 + kOffF*x16,
kOnF*x2*x10 + kOnE*x1*x11 + -kOffF*x15 + -kCatF*x15 + -kOffE*x15 + -kCatE*x15,
kCatE*x13 + kOnF*x2*x14 + -kOnF*x2*x16 + -kOffF*x16 + -kCatF*x16 + kOffF*x18,
kOnF*x2*x14 + kCatE*x15 + -kOffF*x17 + -kCatF*x17 + -kOnF*x2*x17 + kOffF*x18,
kOnF*x2*x16 + kOnF*x2*x17 + -kOffF*x18 + -kCatF*x18 + -kOffF*x18 + -kCatF*x18,
]

#The observable partition is built using Block 0:
#{S0}
result = lumper.do_lumping(polys, [x1])
print("Total partitioning by Block 0  is " + str(len(result["polynomials"])))


#The observable partition is built using Block 1:
#{S1}
result = lumper.do_lumping(polys, [x2])
print("Total partitioning by Block 1  is " + str(len(result["polynomials"])))

#The observable partition is built using Block 1:
#{S2}
result = lumper.do_lumping(polys, [x3])
print("Total partitioning by Block 1  is " + str(len(result["polynomials"])))


#The observable partition is built using Block 2:
#{S2, S3, S4, S5, S7, S8, S11, S12}
#result = lumper.do_lumping(polys, [x3+x4+x5+x6+x8+x9+x12+x13])
#print("Total partitioning by Block 2  is " + str(len(result["polynomials"])))


#The observable partition is built using Block 3:
#{S17, S6, S9, S10, S13, S14, S15, S16}
#result = lumper.do_lumping(polys, [x18+x7+x1+x11+x13+x15+x16+x17])
#print("Total partitioning by Block 3  is " + str(len(result["polynomials"])))

