#Model generated from: Li, J., Wang, L., Hashimoto, Y., Tsao, C. Y., Wood, T. K., Valdes, J. J., ... & Bentley, W. E. (2006). A stochastic model of Escherichia coli AI‐2 quorum signal circuit reveals alternative synthesis pathways. Molecular systems biology, 2(1).
#Source: https://www.ebi.ac.uk/biomodels/MODEL8262229752
##
import sys
import sympy
from sympy import QQ, Rational

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")
import lumper

R = sympy.polys.rings.vring(["x" + str(i + 1) for i in range(47)], QQ)
#MODEL8262229752_curry

print("Example MODEL8262229752_curry")
pAI2_trans_r = Rational(1, 1)
pAI2_phos_r = Rational(1, 1)
pAI2_excret_r = Rational(1, 1)
pAI2_syn_r = Rational(1, 1)
pAdoMet_r = Rational(1, 1)
pDPD_deg_r = Rational(1, 1)
pLuxS_mRNA_d = Rational(1, 1)
pLuxS_prot_d = Rational(1, 1)
pLuxS_transc = Rational(1, 1)
pLuxS_transl = Rational(1, 1)
pMTR_e = Rational(1, 1)
pMTR_syn_r = Rational(1, 1)
pMet_recov = Rational(1, 1)
pMethy_trans = Rational(1, 1)
pPfs_prot_d = Rational(1, 1)
pPolyamine_uti = Rational(1, 1)
pSAH_Hydro_r = Rational(1, 1)
pSAM_Dec = Rational(1, 1)
pSRH_cleav = Rational(1, 1)
pSpeE_syn_r = Rational(1, 1)
pSpermi_uti = Rational(1, 1)
pb_reac_r = Rational(1, 1)
ppfs_mRNA_d = Rational(1, 1)
ppfs_transc = Rational(1, 1)
ppfs_transl = Rational(1, 1)

polys = [
-pb_reac_r*x1*x44,
pb_reac_r*x1*x44 + -pAdoMet_r*x2*x27 + pMet_recov*x16*x35,
pAdoMet_r*x2*x27 + -pMethy_trans*x3*x36 + -pSAM_Dec*x3*x40,
pMethy_trans*x3*x36 + -pSAH_Hydro_r*x4*x9*x39,
pSAM_Dec*x3*x40 + -pSpeE_syn_r*x5*x6*x42,
-pSpeE_syn_r*x5*x6*x42,
-ppfs_mRNA_d*x7*x45 + ppfs_transc*x8*x46,
R(0),
-pPfs_prot_d*x9*x37 + ppfs_transl*x7*x47,
pMTR_syn_r*x9*x17*x34 + -pPolyamine_uti*x10*x38 + pSAH_Hydro_r*x4*x9*x39,
pSAH_Hydro_r*x4*x9*x39 + -pSRH_cleav*x11*x14*x41,
R(0),
-pLuxS_mRNA_d*x13*x29 + pLuxS_transc*x12*x31,
-pLuxS_prot_d*x14*x30 + pLuxS_transl*x13*x32,
pSRH_cleav*x11*x14*x41 + -pDPD_deg_r*x15*x28 + -pAI2_syn_r*x15*x26,
pSRH_cleav*x11*x14*x41 + -pMet_recov*x16*x35,
pSpeE_syn_r*x5*x6*x42 + -pMTR_syn_r*x9*x17*x34,
pSpeE_syn_r*x5*x6*x42 + -pSpermi_uti*x18*x43,
pMTR_syn_r*x9*x17*x34 + -pMTR_e*x19*x33,
pAI2_syn_r*x15*x26 + -pAI2_excret_r*x20*x25 + pAI2_trans_r*x21*x23 + -pAI2_phos_r*x20*x24,
pAI2_excret_r*x20*x25 + -pAI2_trans_r*x21*x23,
pSpermi_uti*x18*x43 + pMTR_e*x19*x33 + pPolyamine_uti*x10*x38 + pPfs_prot_d*x9*x37 + ppfs_mRNA_d*x7*x45 + pDPD_deg_r*x15*x28 + pLuxS_prot_d*x14*x30 + pLuxS_mRNA_d*x13*x29 + pAI2_phos_r*x20*x24,
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

#Partition for that block [] which translates to:
result = lumper.do_lumping(polys, [x7,x13,x21])

print("Total for MODEL8262229752_curry is " + str(len(result["polynomials"])))
