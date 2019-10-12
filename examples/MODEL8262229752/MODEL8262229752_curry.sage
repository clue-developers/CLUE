load("aggregation.sage")
#MODEL8262229752_curry

R = PolynomialRing(QQ, 'x', 47)
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, = R.gens()
print("Example MODEL8262229752_curry")
pAI2_trans_r = QQ(1.0)
pAI2_phos_r = QQ(1.0)
pAI2_excret_r = QQ(1.0)
pAI2_syn_r = QQ(1.0)
pAdoMet_r = QQ(1.0)
pDPD_deg_r = QQ(1.0)
pLuxS_mRNA_d = QQ(1.0)
pLuxS_prot_d = QQ(1.0)
pLuxS_transc = QQ(1.0)
pLuxS_transl = QQ(1.0)
pMTR_e = QQ(1.0)
pMTR_syn_r = QQ(1.0)
pMet_recov = QQ(1.0)
pMethy_trans = QQ(1.0)
pPfs_prot_d = QQ(1.0)
pPolyamine_uti = QQ(1.0)
pSAH_Hydro_r = QQ(1.0)
pSAM_Dec = QQ(1.0)
pSRH_cleav = QQ(1.0)
pSpeE_syn_r = QQ(1.0)
pSpermi_uti = QQ(1.0)
pb_reac_r = QQ(1.0)
ppfs_mRNA_d = QQ(1.0)
ppfs_transc = QQ(1.0)
ppfs_transl = QQ(1.0)

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
result = aggregate(polys, [x7,x13,x21])

print("Total for MODEL8262229752_curry is " + str(len(result)))
