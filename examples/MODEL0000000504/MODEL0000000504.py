# Model generated from: 
# Proctor, C. J., Macdonald, C., Milner, J. M., Rowan, A. D., & Cawston, T. E. 
# A Computer Simulation Approach to Assessing Therapeutic Intervention Points for the Prevention of Cytokine‐Induced Cartilage Breakdown. 
# Arthritis & rheumatology, 66(4), 979-989, 2014
# Source: https://www.ebi.ac.uk/biomodels/BIOMD0000000504
##
import sys
import sympy
from sympy import QQ, QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import lumper

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(207)], QQ)
print("Example BIOMD0000000504")
pkactMMP13mmp3 = QQ(1, 1)
pkactMMP1mat = QQ(1, 1)
pkactMMP1mmp3 = QQ(1, 1)
pkactMMP3mat = QQ(1, 1)
pkAP1activity = QQ(1, 1)
pkbincFoscJun = QQ(1, 1)
pkbinIL1IL1R = QQ(1, 1)
pkbinIL1IL1Ra = QQ(1, 1)
pkbinIRAK2 = QQ(1, 1)
pkbinOSMOSMR = QQ(1, 1)
pkbinOSMOSMRa = QQ(1, 1)
pkbinSOCS3OSMR = QQ(1, 1)
pkbinSP1TIMP1DNA = QQ(1, 1)
pkbinTRAF6 = QQ(1, 1)
pkcyt2nucSTAT3 = QQ(1, 1)
pkdedimercJun = QQ(1, 1)
pkdegADAMTS4 = QQ(1, 1)
pkdegADAMTS4mRNA = QQ(1, 1)
pkdegAggrecan = QQ(1, 1)
pkdegcFos = QQ(1, 1)
pkdegcFosmRNA = QQ(1, 1)
pkdegcJun = QQ(1, 1)
pkdegcJunmRNA = QQ(1, 1)
pkdegCollagen2mmp1 = QQ(1, 1)
pkdegCollagen2mmp13 = QQ(1, 1)
pkdegDUSP16 = QQ(1, 1)
pkdegIL1 = QQ(1, 1)
pkdegMatriptase = QQ(1, 1)
pkdegMKP1 = QQ(1, 1)
pkdegMMP1 = QQ(1, 1)
pkdegMMP13 = QQ(1, 1)
pkdegMMP13mRNA = QQ(1, 1)
pkdegMMP1mRNA = QQ(1, 1)
pkdegMMP3 = QQ(1, 1)
pkdegMMP3mRNA = QQ(1, 1)
pkdegOSM = QQ(1, 1)
pkdegPP4 = QQ(1, 1)
pkdegPTPRT = QQ(1, 1)
pkdegSOCS3 = QQ(1, 1)
pkdegSOCS3mRNA = QQ(1, 1)
pkdegSP1 = QQ(1, 1)
pkdegTIMP1 = QQ(1, 1)
pkdegTIMP1mRNA = QQ(1, 1)
pkdegTIMP3 = QQ(1, 1)
pkdegTIMP3mRNA = QQ(1, 1)
pkdephoscFos = QQ(1, 1)
pkdephoscFosDUSP16 = QQ(1, 1)
pkdephoscJun = QQ(1, 1)
pkdephosJAK1 = QQ(1, 1)
pkdephosJAK1PTPRT = QQ(1, 1)
pkdephosJNK = QQ(1, 1)
pkdephosJNKDUSP16 = QQ(1, 1)
pkdephosp38 = QQ(1, 1)
pkdephosp38MKP1 = QQ(1, 1)
pkdephosSTAT3 = QQ(1, 1)
pkdephosSTAT3nuc = QQ(1, 1)
pkdephosSTAT3nucPTPRT = QQ(1, 1)
pkdephosSTAT3PTPRT = QQ(1, 1)
pkdimercJun = QQ(1, 1)
pkinhibADAMTS4TIMP1 = QQ(1, 1)
pkinhibADAMTS4TIMP3 = QQ(1, 1)
pkinhibMMP13TIMP1 = QQ(1, 1)
pkinhibMMP13TIMP3 = QQ(1, 1)
pkinhibMMP1TIMP1 = QQ(1, 1)
pkinhibMMP1TIMP3 = QQ(1, 1)
pkinhibMMP3TIMP1 = QQ(1, 1)
pkinhibMMP3TIMP3 = QQ(1, 1)
pkinhibTRAF6 = QQ(1, 1)
pknuc2cytSTAT3 = QQ(1, 1)
pkphoscFos = QQ(1, 1)
pkphoscJun = QQ(1, 1)
pkphosJAK1 = QQ(1, 1)
pkphosJNK = QQ(1, 1)
pkphosp38 = QQ(1, 1)
pkphosSTAT3 = QQ(1, 1)
pkrelADAMTS4TIMP1 = QQ(1, 1)
pkrelADAMTS4TIMP3 = QQ(1, 1)
pkrelcFoscJun = QQ(1, 1)
pkrelIL1IL1R = QQ(1, 1)
pkrelIL1IL1Ra = QQ(1, 1)
pkrelIRAK2 = QQ(1, 1)
pkrelMMP1 = QQ(1, 1)
pkrelMMP13 = QQ(1, 1)
pkrelMMP13TIMP3 = QQ(1, 1)
pkrelMMP1TIMP3 = QQ(1, 1)
pkrelMMP3 = QQ(1, 1)
pkrelMMP3TIMP3 = QQ(1, 1)
pkrelOSMOSMR = QQ(1, 1)
pkrelOSMOSMRa = QQ(1, 1)
pkrelSOCS3OSMR = QQ(1, 1)
pkrelSP1TIMP1DNA = QQ(1, 1)
pkrelTRAF6 = QQ(1, 1)
pkrelTRAF6PP4 = QQ(1, 1)
pksynADAMTS4 = QQ(1, 1)
pksynADAMTS4mRNA = QQ(1, 1)
pksynADAMTS4mRNAcJun = QQ(1, 1)
pksynbasalcJunmRNA = QQ(1, 1)
pksynbasalTIMP1mRNA = QQ(1, 1)
pksynbasalTIMP3mRNA = QQ(1, 1)
pksyncFos = QQ(1, 1)
pksyncFosmRNA = QQ(1, 1)
pksyncFosmRNAStat3 = QQ(1, 1)
pksyncJun = QQ(1, 1)
pksyncJunmRNA = QQ(1, 1)
pksyncJunmRNAcJun = QQ(1, 1)
pksynDUSP16 = QQ(1, 1)
pksynDUSP16cJun = QQ(1, 1)
pksynMatriptase = QQ(1, 1)
pksynMKP1 = QQ(1, 1)
pksynMKP1cJun = QQ(1, 1)
pksynMMP1 = QQ(1, 1)
pksynMMP13 = QQ(1, 1)
pksynMMP13mRNA = QQ(1, 1)
pksynMMP13mRNAcJun = QQ(1, 1)
pksynMMP1mRNA = QQ(1, 1)
pksynMMP1mRNAcJun = QQ(1, 1)
pksynMMP3 = QQ(1, 1)
pksynMMP3mRNA = QQ(1, 1)
pksynMMP3mRNAcJun = QQ(1, 1)
pksynPP4 = QQ(1, 1)
pksynPP4cJun = QQ(1, 1)
pksynPTPRT = QQ(1, 1)
pksynSOCS3 = QQ(1, 1)
pksynSOCS3mRNA = QQ(1, 1)
pksynSP1 = QQ(1, 1)
pksynTIMP1 = QQ(1, 1)
pksynTIMP1mRNA = QQ(1, 1)
pksynTIMP1mRNAStat3 = QQ(1, 1)
pksynTIMP3 = QQ(1, 1)
pksynTIMP3mRNA = QQ(1, 1)
pksynTIMP3mRNAStat3 = QQ(1, 1)
ptempDimer = QQ(1, 1)

polys = [
pksynADAMTS4mRNA * pkAP1activity*x65*x65*x80*x170 + pksynADAMTS4mRNAcJun*x68*x68*x171 + -pkdegADAMTS4mRNA*x1*x1*x75*x93,
pksyncFos*x3*x3*x175 + -pkdegcFos*x2*x2*x75*x95 + -pkphoscFos*x2*x2*x20*x20*x145 + pkdephoscFos*x66*x66*x121 + pkdephoscFosDUSP16*x6*x6*x66*x66*x122,
pksyncFosmRNA * pkAP1activity*x65*x65*x80*x176 + -pkdegcFosmRNA*x3*x3*x75*x96 + pksyncFosmRNAStat3*x72*x72*x177,
-pkphoscJun*x4*x4*x13*x13*x146 + pkdephoscJun*x67*x67*x123 + pksyncJun*x5*x5*x178 + -pkdegcJun*x4*x4*x75*x97,
pksyncJunmRNA * pkAP1activity*x65*x65*x80*x179 + pksyncJunmRNAcJun*x68*x68*x180 + pksynbasalcJunmRNA*x74*x74*x172 + -pkdegcJunmRNA*x5*x5*x75*x98,
pksynDUSP16 * pkAP1activity*x65*x65*x80*x181 + pksynDUSP16cJun*x68*x68*x182 + -pkdegDUSP16*x6*x6*x75*x101,
-pkbinIRAK2*x7*x7*x55*x55*x84 + pkrelIRAK2*x57*x57*x156 + pkrelTRAF6*x8*x8*x167,
pkbinTRAF6*x32*x32*x57*x57*x89 + -pkrelTRAF6*x8*x8*x167 + -pkinhibTRAF6*x8*x8*x21*x21*x143 + pkrelTRAF6PP4*x9*x9*x168,
pkinhibTRAF6*x8*x8*x21*x21*x143 + -pkrelTRAF6PP4*x9*x9*x168,
-pkphosJAK1*x10*x10*x60*x60*x147 + pkdephosJAK1*x11*x11*x124 + pkdephosJAK1PTPRT*x11*x11*x25*x25*x125,
pkphosJAK1*x10*x10*x60*x60*x147 + -pkdephosJAK1*x11*x11*x124 + -pkdephosJAK1PTPRT*x11*x11*x25*x25*x125,
-pkphosJNK*x8*x8*x12*x12*x148 + pkdephosJNK*x13*x13*x126 + pkdephosJNKDUSP16*x6*x6*x13*x13*x127,
pkphosJNK*x8*x8*x12*x12*x148 + -pkdephosJNK*x13*x13*x126 + -pkdephosJNKDUSP16*x6*x6*x13*x13*x127,
pksynMatriptase * pkAP1activity*x65*x65*x80*x183 + -pkdegMatriptase*x14*x14*x75*x103,
pksynMKP1 * pkAP1activity*x65*x65*x80*x184 + pksynMKP1cJun*x68*x68*x185 + -pkdegMKP1*x15*x15*x75*x104,
pksynMMP1mRNA * pkAP1activity*x65*x65*x80*x190 + pksynMMP1mRNAcJun*x68*x68*x191 + -pkdegMMP1mRNA*x16*x16*x75*x108,
pksynMMP3mRNA * pkAP1activity*x65*x65*x80*x193 + pksynMMP3mRNAcJun*x68*x68*x194 + -pkdegMMP3mRNA*x17*x17*x75*x110,
pksynMMP13mRNA * pkAP1activity*x65*x65*x80*x188 + pksynMMP13mRNAcJun*x68*x68*x189 + -pkdegMMP13mRNA*x18*x18*x75*x107,
-pkphosp38*x8*x8*x19*x19*x149 + pkdephosp38*x20*x20*x128 + pkdephosp38MKP1*x15*x15*x20*x20*x129,
pkphosp38*x8*x8*x19*x19*x149 + -pkdephosp38*x20*x20*x128 + -pkdephosp38MKP1*x15*x15*x20*x20*x129,
pksynPP4 * pkAP1activity*x65*x65*x80*x195 + pksynPP4cJun*x68*x68*x196 + -pkdegPP4*x21*x21*x75*x112 + -pkinhibTRAF6*x21*x21*x32*x32*x143 + -pkinhibTRAF6*x8*x8*x21*x21*x143 + pkrelTRAF6PP4*x33*x33*x168 + pkrelTRAF6PP4*x9*x9*x168,
pksynMMP1*x16*x16*x186 + -pkactMMP1mat*x14*x14*x22*x22*x77 + -pkactMMP1mmp3*x22*x22*x46*x46*x78,
pksynMMP3*x17*x17*x192 + -pkactMMP3mat*x14*x14*x23*x23*x79,
pksynMMP13*x18*x18*x187 + -pkactMMP13mmp3*x24*x24*x46*x46*x76,
pksynPTPRT*x72*x72*x197 + -pkdegPTPRT*x25*x25*x75*x113,
pksynSOCS3*x27*x27*x198 + -pkdegSOCS3*x26*x26*x75*x114 + -pkbinSOCS3OSMR*x26*x26*x63*x63*x87 + pkrelSOCS3OSMR*x62*x62*x165,
pksynSOCS3mRNA*x72*x72*x199 + -pkdegSOCS3mRNA*x27*x27*x75*x115,
-pkphosSTAT3*x11*x11*x28*x28*x150 + pkdephosSTAT3*x29*x29*x130 + pkdephosSTAT3PTPRT*x25*x25*x29*x29*x133 + pknuc2cytSTAT3*x71*x71*x144,
pkphosSTAT3*x11*x11*x28*x28*x150 + -pkdephosSTAT3*x29*x29*x130 + -pkdephosSTAT3PTPRT*x25*x25*x29*x29*x133 + -pkcyt2nucSTAT3*x29*x29*x90,
-pkdegTIMP1mRNA*x30*x30*x75*x118 + pksynTIMP1mRNAStat3*x72*x72*x73*x73*x203 + pksynbasalTIMP1mRNA*x73*x73*x173 + pksynTIMP1mRNA * pkAP1activity*x65*x65*x73*x73*x80*x202,
pksynbasalTIMP3mRNA*x74*x74*x174 + pksynTIMP3mRNA * pkAP1activity*x65*x65*x80*x205 + pksynTIMP3mRNAStat3 * pkAP1activity*x72*x72*x80*x206 + -pkdegTIMP3mRNA*x31*x31*x75*x120,
-pkbinTRAF6*x32*x32*x57*x57*x89 + pkrelTRAF6*x8*x8*x167 + -pkinhibTRAF6*x21*x21*x32*x32*x143 + pkrelTRAF6PP4*x33*x33*x168,
pkinhibTRAF6*x21*x21*x32*x32*x143 + -pkrelTRAF6PP4*x33*x33*x168,
pksynADAMTS4*x1*x1*x169 + -pkdegADAMTS4*x34*x34*x75*x92 + -pkinhibADAMTS4TIMP1*x34*x34*x53*x53*x135 + pkrelADAMTS4TIMP1*x35*x35*x151 + -pkinhibADAMTS4TIMP3*x34*x34*x54*x54*x136 + pkrelADAMTS4TIMP3*x36*x36*x152,
pkinhibADAMTS4TIMP1*x34*x34*x53*x53*x135 + -pkrelADAMTS4TIMP1*x35*x35*x151,
pkinhibADAMTS4TIMP3*x34*x34*x54*x54*x136 + -pkrelADAMTS4TIMP3*x36*x36*x152,
R(0),
-pkdegAggrecan*x34*x34*x38*x38*x94,
pkdegAggrecan*x34*x34*x38*x38*x94,
pkdegCollagen2mmp1*x41*x41*x43*x43*x99 + pkdegCollagen2mmp13*x41*x41*x49*x49*x100,
-pkdegCollagen2mmp1*x41*x41*x43*x43*x99 + -pkdegCollagen2mmp13*x41*x41*x49*x49*x100 + pkdegAggrecan*x34*x34*x38*x38*x94,
-pkbinIL1IL1R*x42*x42*x58*x58*x82 + pkrelIL1IL1R*x55*x55*x154 + -pkbinIL1IL1Ra*x42*x42*x59*x59*x83 + pkrelIL1IL1Ra*x56*x56*x155 + -pkdegIL1*x42*x42*x75*x102,
pkactMMP1mat*x14*x14*x22*x22*x77 + pkactMMP1mmp3*x22*x22*x46*x46*x78 + -pkdegMMP1*x43*x43*x75*x105 + -pkinhibMMP1TIMP1*x43*x43*x53*x53*x139 + pkrelMMP1*x44*x44*x157 + -pkinhibMMP1TIMP3*x43*x43*x54*x54*x140 + pkrelMMP1TIMP3*x45*x45*x160,
pkinhibMMP1TIMP1*x43*x43*x53*x53*x139 + -pkrelMMP1*x44*x44*x157,
pkinhibMMP1TIMP3*x43*x43*x54*x54*x140 + -pkrelMMP1TIMP3*x45*x45*x160,
pkactMMP3mat*x14*x14*x23*x23*x79 + -pkdegMMP3*x46*x46*x75*x109 + -pkinhibMMP3TIMP1*x46*x46*x53*x53*x141 + pkrelMMP3*x47*x47*x161 + -pkinhibMMP3TIMP3*x46*x46*x54*x54*x142 + pkrelMMP3TIMP3*x48*x48*x162,
pkinhibMMP3TIMP1*x46*x46*x53*x53*x141 + -pkrelMMP3*x47*x47*x161,
pkinhibMMP3TIMP3*x46*x46*x54*x54*x142 + -pkrelMMP3TIMP3*x48*x48*x162,
pkactMMP13mmp3*x24*x24*x46*x46*x76 + -pkdegMMP13*x49*x49*x75*x106 + -pkinhibMMP13TIMP1*x49*x49*x53*x53*x137 + pkrelMMP13*x50*x50*x158 + -pkinhibMMP13TIMP3*x49*x49*x54*x54*x138 + pkrelMMP13TIMP3*x51*x51*x159,
pkinhibMMP13TIMP1*x49*x49*x53*x53*x137 + -pkrelMMP13*x50*x50*x158,
pkinhibMMP13TIMP3*x49*x49*x54*x54*x138 + -pkrelMMP13TIMP3*x51*x51*x159,
-pkbinOSMOSMR*x52*x52*x63*x63*x85 + pkrelOSMOSMR*x60*x60*x163 + -pkbinOSMOSMRa*x52*x52*x64*x64*x86 + pkrelOSMOSMRa*x61*x61*x164 + -pkdegOSM*x52*x52*x75*x111,
pksynTIMP1*x30*x30*x201 + -pkdegTIMP1*x53*x53*x75*x117 + -pkinhibMMP1TIMP1*x43*x43*x53*x53*x139 + pkrelMMP1*x44*x44*x157 + -pkinhibMMP3TIMP1*x46*x46*x53*x53*x141 + pkrelMMP3*x47*x47*x161 + -pkinhibMMP13TIMP1*x49*x49*x53*x53*x137 + pkrelMMP13*x50*x50*x158 + -pkinhibADAMTS4TIMP1*x34*x34*x53*x53*x135 + pkrelADAMTS4TIMP1*x35*x35*x151,
pksynTIMP3*x31*x31*x204 + -pkdegTIMP3*x54*x54*x75*x119 + -pkinhibADAMTS4TIMP3*x34*x34*x54*x54*x136 + pkrelADAMTS4TIMP3*x36*x36*x152 + -pkinhibMMP1TIMP3*x43*x43*x54*x54*x140 + pkrelMMP1TIMP3*x45*x45*x160 + -pkinhibMMP3TIMP3*x46*x46*x54*x54*x142 + pkrelMMP3TIMP3*x48*x48*x162 + -pkinhibMMP13TIMP3*x49*x49*x54*x54*x138 + pkrelMMP13TIMP3*x51*x51*x159,
pkbinIL1IL1R*x42*x42*x58*x58*x82 + -pkrelIL1IL1R*x55*x55*x154 + -pkbinIRAK2*x7*x7*x55*x55*x84 + pkrelIRAK2*x57*x57*x156 + pkbinTRAF6*x32*x32*x57*x57*x89,
pkbinIL1IL1Ra*x42*x42*x59*x59*x83 + -pkrelIL1IL1Ra*x56*x56*x155,
pkbinIRAK2*x7*x7*x55*x55*x84 + -pkrelIRAK2*x57*x57*x156 + -pkbinTRAF6*x32*x32*x57*x57*x89,
-pkbinIL1IL1R*x42*x42*x58*x58*x82 + pkrelIL1IL1R*x55*x55*x154,
-pkbinIL1IL1Ra*x42*x42*x59*x59*x83 + pkrelIL1IL1Ra*x56*x56*x155,
pkbinOSMOSMR*x52*x52*x63*x63*x85 + -pkrelOSMOSMR*x60*x60*x163,
pkbinOSMOSMRa*x52*x52*x64*x64*x86 + -pkrelOSMOSMRa*x61*x61*x164,
pkbinSOCS3OSMR*x26*x26*x63*x63*x87 + -pkrelSOCS3OSMR*x62*x62*x165,
-pkbinOSMOSMR*x52*x52*x63*x63*x85 + pkrelOSMOSMR*x60*x60*x163 + -pkbinSOCS3OSMR*x26*x26*x63*x63*x87 + pkrelSOCS3OSMR*x62*x62*x165,
-pkbinOSMOSMRa*x52*x52*x64*x64*x86 + pkrelOSMOSMRa*x61*x61*x164,
pkbincFoscJun*x66*x66*x67*x67*x81 + -pkrelcFoscJun*x65*x65*x153,
pkphoscFos*x2*x2*x20*x20*x145 + -pkdephoscFos*x66*x66*x121 + -pkdephoscFosDUSP16*x6*x6*x66*x66*x122 + -pkbincFoscJun*x66*x66*x67*x67*x81 + pkrelcFoscJun*x65*x65*x153,
pkphoscJun*x4*x4*x13*x13*x146 + -pkdephoscJun*x67*x67*x123 + -2*(pkdimercJun*x67*x67*x67*x134) + 2*(ptempDimer*x67*x68*x207) + 2*(pkdedimercJun*x68*x68*x91) + -pkbincFoscJun*x66*x66*x67*x67*x81 + pkrelcFoscJun*x65*x65*x153,
pkdimercJun*x67*x67*x67*x134 + -ptempDimer*x67*x68*x207 + -pkdedimercJun*x68*x68*x91,
pksynSP1 * pkAP1activity*x65*x65*x80*x200 + -pkdegSP1*x69*x69*x75*x116 + -pkbinSP1TIMP1DNA*x69*x69*x73*x73*x88 + pkrelSP1TIMP1DNA*x70*x70*x166,
pkbinSP1TIMP1DNA*x69*x69*x73*x73*x88 + -pkrelSP1TIMP1DNA*x70*x70*x166,
pkdephosSTAT3nuc*x72*x72*x131 + pkdephosSTAT3nucPTPRT*x25*x25*x72*x72*x132 + -pknuc2cytSTAT3*x71*x71*x144,
-pkdephosSTAT3nuc*x72*x72*x131 + -pkdephosSTAT3nucPTPRT*x25*x25*x72*x72*x132 + pkcyt2nucSTAT3*x29*x29*x90,
-pkbinSP1TIMP1DNA*x69*x69*x73*x73*x88 + pkrelSP1TIMP1DNA*x70*x70*x166,
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
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


#Partition preserving cFos_P, cJun_P
result = lumper.do_lumping(polys, [x66, x67])
print("Total for BIOMD0000000504, preserving cFos_P, cJun_P, is " + str(len(result["polynomials"])))

#Partition preserving MMP1_mRNA, MMP13_mRNA, TIMP1_mRNA
result = lumper.do_lumping(polys, [x16, x18, x30])
print("Total for BIOMD0000000504 is " + str(len(result["polynomials"])))

#Partition preserving MMP1, MMP13, ColFrag
result = lumper.do_lumping(polys, [x40, x43, x49])
print("Total for BIOMD0000000504 is " + str(len(result["polynomials"])))

#Partition preserving JAK1_P, JNK_P, cJun_P, cJun_dimer, STAT3_P_nuc, STAT3_P_cyt
result = lumper.do_lumping(polys, [x11, x13, x67, x68, x72, x29])
print("Total for BIOMD0000000504 is " + str(len(result["polynomials"])))
