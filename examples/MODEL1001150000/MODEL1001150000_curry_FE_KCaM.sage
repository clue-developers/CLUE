load("aggregation.sage")
#MODEL1001150000_FE_KCaMcurry

R = PolynomialRing(QQ, 'x', 121)
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48, x49, x50, x51, x52, x53, x54, x55, x56, x57, x58, x59, x60, x61, x62, x63, x64, x65, x66, x67, x68, x69, x70, x71, x72, x73, x74, x75, x76, x77, x78, x79, x80, x81, x82, x83, x84, x85, x86, x87, x88, x89, x90, x91, x92, x93, x94, x95, x96, x97, x98, x99, x100, x101, x102, x103, x104, x105, x106, x107, x108, x109, x110, x111, x112, x113, x114, x115, x116, x117, x118, x119, x120, x121, = R.gens()
print("Example MODEL1001150000_FE_KCaMcurry")
pk1Con = QQ(1.0)
pk1Coff = QQ(1.0)
pk2Con = QQ(1.0)
pk2Coff = QQ(1.0)
pk1Non = QQ(1.0)
pk1Noff = QQ(1.0)
pk2Non = QQ(1.0)
pk2Noff = QQ(1.0)
pkK1Con = QQ(1.0)
pkK1Coff = QQ(1.0)
pkK2Con = QQ(1.0)
pkK2Coff = QQ(1.0)
pkK1Non = QQ(1.0)
pkK1Noff = QQ(1.0)
pkK2Non = QQ(1.0)
pkK2Noff = QQ(1.0)
pkCaM0on = QQ(1.0)
pkCaM0off = QQ(1.0)
pkCaM1Con = QQ(1.0)
pkCaM1Coff = QQ(1.0)
pkCaM2Con = QQ(1.0)
pkCaM2Coff = QQ(1.0)
pkCaM2C1Non = QQ(1.0)
pkCaM2C1Noff = QQ(1.0)
pkCaM1C1Non = QQ(1.0)
pkCaM1C1Noff = QQ(1.0)
pkCaM4on = QQ(1.0)
pkCaM4off = QQ(1.0)
pkCaM1Non = QQ(1.0)
pkCaM1Noff = QQ(1.0)
pkCaM1C2Non = QQ(1.0)
pkCaM1C2Noff = QQ(1.0)
pkCaM2Non = QQ(1.0)
pkCaM2Noff = QQ(1.0)
pk2CaMKon = QQ(1.0)
pk2CaMKoff = QQ(1.0)
pkpCaM0 = QQ(1.0)
pkpCaM1C = QQ(1.0)
pkpCaM2C = QQ(1.0)
pkpCaM2C1N = QQ(1.0)
pkpCaM1C1N = QQ(1.0)
pkpCaM4 = QQ(1.0)
pkpCaM1N = QQ(1.0)
pkpCaM1C2N = QQ(1.0)
pkpCaM2N = QQ(1.0)
pcaminit = QQ(1.0)
pckinit = QQ(1.0)
pcainit = QQ(1.0)

polys = [
R(0),
-pk2CaMKon*x2*x3*x46 + -pk2CaMKon*x2*x4*x46 + -pk2CaMKon*x2*x5*x46 + -pk2CaMKon*x2*x6*x46 + -pk2CaMKon*x2*x7*x46 + -pk2CaMKon*x2*x8*x46 + -pk2CaMKon*x2*x9*x46 + -pk2CaMKon*x2*x10*x46 + -pkK1Con*x2*x12*x68 + -pkK1Non*x2*x12*x72 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x2*x46*x85) + -pkCaM0off*x2*x67 + -2*(pk2CaMKon*x2*x2*x46) + pkK1Noff*x3*x73 + pkK1Coff*x5*x69 + pkCaM0on*x16*x22*x66 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x57 + pk2CaMKoff*x47*x76 + pk2CaMKoff*x47*x77 + pk2CaMKoff*x47*x78 + pk2CaMKoff*x47*x79 + pk2CaMKoff*x47*x80 + pk2CaMKoff*x47*x81 + pk2CaMKoff*x47*x82 + pk2CaMKoff*x47*x83 + 2*(pk2CaMKoff*x47*x84) + pkpCaM0*x48*x84 + pkpCaM1N*x49*x76 + pkpCaM2N*x50*x77 + pkpCaM1C*x51*x78 + pkpCaM1C1N*x52*x79 + pkpCaM1C2N*x53*x80 + pkpCaM2C*x54*x81 + pkpCaM2C1N*x55*x82 + pkpCaM4*x56*x83,
-pk2CaMKon*x2*x3*x46 + pkK1Non*x2*x12*x72 + -pk2CaMKon*x3*x4*x46 + -pk2CaMKon*x3*x5*x46 + -pk2CaMKon*x3*x6*x46 + -pk2CaMKon*x3*x7*x46 + -pk2CaMKon*x3*x8*x46 + -pk2CaMKon*x3*x9*x46 + -pk2CaMKon*x3*x10*x46 + -pkK1Con*x3*x12*x68 + -pkK2Non*x3*x12*x74 + -pkCaM1Noff*x3*x24 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x3*x46*x85) + -pkK1Noff*x3*x73 + -2*(pk2CaMKon*x3*x3*x46) + pkK2Noff*x4*x75 + pkK1Coff*x6*x69 + pkCaM1Non*x11*x22*x23 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x58 + pk2CaMKoff*x47*x76 + pk2CaMKoff*x47*x86 + pk2CaMKoff*x47*x87 + pk2CaMKoff*x47*x88 + pk2CaMKoff*x47*x89 + pk2CaMKoff*x47*x90 + pk2CaMKoff*x47*x91 + pk2CaMKoff*x47*x92 + 2*(pk2CaMKoff*x47*x93) + pkpCaM0*x48*x76 + pkpCaM1N*x49*x93 + pkpCaM2N*x50*x86 + pkpCaM1C*x51*x87 + pkpCaM1C1N*x52*x88 + pkpCaM1C2N*x53*x89 + pkpCaM2C*x54*x90 + pkpCaM2C1N*x55*x91 + pkpCaM4*x56*x92,
-pk2CaMKon*x2*x4*x46 + -pk2CaMKon*x3*x4*x46 + pkK2Non*x3*x12*x74 + -pk2CaMKon*x4*x5*x46 + -pk2CaMKon*x4*x6*x46 + -pk2CaMKon*x4*x7*x46 + -pk2CaMKon*x4*x8*x46 + -pk2CaMKon*x4*x9*x46 + -pk2CaMKon*x4*x10*x46 + -pkK1Con*x4*x12*x68 + -pkCaM2Noff*x4*x27 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x4*x46*x85) + -pkK2Noff*x4*x75 + -2*(pk2CaMKon*x4*x4*x46) + pkK1Coff*x7*x69 + pkCaM2Non*x20*x22*x26 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x59 + pk2CaMKoff*x47*x77 + pk2CaMKoff*x47*x86 + pk2CaMKoff*x47*x94 + pk2CaMKoff*x47*x95 + pk2CaMKoff*x47*x96 + pk2CaMKoff*x47*x97 + pk2CaMKoff*x47*x98 + pk2CaMKoff*x47*x99 + 2*(pk2CaMKoff*x47*x100) + pkpCaM0*x48*x77 + pkpCaM1N*x49*x86 + pkpCaM2N*x50*x100 + pkpCaM1C*x51*x94 + pkpCaM1C1N*x52*x95 + pkpCaM1C2N*x53*x96 + pkpCaM2C*x54*x97 + pkpCaM2C1N*x55*x98 + pkpCaM4*x56*x99,
-pk2CaMKon*x2*x5*x46 + pkK1Con*x2*x12*x68 + -pk2CaMKon*x3*x5*x46 + -pk2CaMKon*x4*x5*x46 + -pk2CaMKon*x5*x6*x46 + -pk2CaMKon*x5*x7*x46 + -pk2CaMKon*x5*x8*x46 + -pk2CaMKon*x5*x9*x46 + -pk2CaMKon*x5*x10*x46 + -pkK2Con*x5*x12*x70 + -pkK1Non*x5*x12*x72 + -pkCaM1Coff*x5*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x5*x46*x85) + -pkK1Coff*x5*x69 + -2*(pk2CaMKon*x5*x5*x46) + pkK1Noff*x6*x73 + pkK2Coff*x8*x71 + pkCaM1Con*x22*x28*x32 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x60 + pk2CaMKoff*x47*x78 + pk2CaMKoff*x47*x87 + pk2CaMKoff*x47*x94 + pk2CaMKoff*x47*x101 + pk2CaMKoff*x47*x102 + pk2CaMKoff*x47*x103 + pk2CaMKoff*x47*x104 + pk2CaMKoff*x47*x105 + 2*(pk2CaMKoff*x47*x106) + pkpCaM0*x48*x78 + pkpCaM1N*x49*x87 + pkpCaM2N*x50*x94 + pkpCaM1C*x51*x106 + pkpCaM1C1N*x52*x101 + pkpCaM1C2N*x53*x102 + pkpCaM2C*x54*x103 + pkpCaM2C1N*x55*x104 + pkpCaM4*x56*x105,
-pk2CaMKon*x2*x6*x46 + -pk2CaMKon*x3*x6*x46 + pkK1Con*x3*x12*x68 + -pk2CaMKon*x4*x6*x46 + -pk2CaMKon*x5*x6*x46 + pkK1Non*x5*x12*x72 + -pk2CaMKon*x6*x7*x46 + -pk2CaMKon*x6*x8*x46 + -pk2CaMKon*x6*x9*x46 + -pk2CaMKon*x6*x10*x46 + -pkK2Con*x6*x12*x70 + -pkK2Non*x6*x12*x74 + -pkCaM1C1Noff*x6*x36 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x6*x46*x85) + -pkK1Coff*x6*x69 + -pkK1Noff*x6*x73 + -2*(pk2CaMKon*x6*x6*x46) + pkK2Noff*x7*x75 + pkK2Coff*x9*x71 + pkCaM1C1Non*x14*x22*x35 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x61 + pk2CaMKoff*x47*x79 + pk2CaMKoff*x47*x88 + pk2CaMKoff*x47*x95 + pk2CaMKoff*x47*x101 + pk2CaMKoff*x47*x107 + pk2CaMKoff*x47*x108 + pk2CaMKoff*x47*x109 + pk2CaMKoff*x47*x110 + 2*(pk2CaMKoff*x47*x111) + pkpCaM0*x48*x79 + pkpCaM1N*x49*x88 + pkpCaM2N*x50*x95 + pkpCaM1C*x51*x101 + pkpCaM1C1N*x52*x111 + pkpCaM1C2N*x53*x107 + pkpCaM2C*x54*x108 + pkpCaM2C1N*x55*x109 + pkpCaM4*x56*x110,
-pk2CaMKon*x2*x7*x46 + -pk2CaMKon*x3*x7*x46 + -pk2CaMKon*x4*x7*x46 + pkK1Con*x4*x12*x68 + -pk2CaMKon*x5*x7*x46 + -pk2CaMKon*x6*x7*x46 + pkK2Non*x6*x12*x74 + -pk2CaMKon*x7*x8*x46 + -pk2CaMKon*x7*x9*x46 + -pk2CaMKon*x7*x10*x46 + -pkK2Con*x7*x12*x70 + -pkCaM1C2Noff*x7*x39 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x7*x46*x85) + -pkK1Coff*x7*x69 + -pkK2Noff*x7*x75 + -2*(pk2CaMKon*x7*x7*x46) + pkK2Coff*x10*x71 + pkCaM1C2Non*x22*x25*x38 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x62 + pk2CaMKoff*x47*x80 + pk2CaMKoff*x47*x89 + pk2CaMKoff*x47*x96 + pk2CaMKoff*x47*x102 + pk2CaMKoff*x47*x107 + pk2CaMKoff*x47*x112 + pk2CaMKoff*x47*x113 + pk2CaMKoff*x47*x114 + 2*(pk2CaMKoff*x47*x115) + pkpCaM0*x48*x80 + pkpCaM1N*x49*x89 + pkpCaM2N*x50*x96 + pkpCaM1C*x51*x102 + pkpCaM1C1N*x52*x107 + pkpCaM1C2N*x53*x115 + pkpCaM2C*x54*x112 + pkpCaM2C1N*x55*x113 + pkpCaM4*x56*x114,
-pk2CaMKon*x2*x8*x46 + -pk2CaMKon*x3*x8*x46 + -pk2CaMKon*x4*x8*x46 + -pk2CaMKon*x5*x8*x46 + pkK2Con*x5*x12*x70 + -pk2CaMKon*x6*x8*x46 + -pk2CaMKon*x7*x8*x46 + -pk2CaMKon*x8*x9*x46 + -pk2CaMKon*x8*x10*x46 + -pkK1Non*x8*x12*x72 + -pkCaM2Coff*x8*x41 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x8*x46*x85) + -pkK2Coff*x8*x71 + -2*(pk2CaMKon*x8*x8*x46) + pkK1Noff*x9*x73 + pkCaM2Con*x22*x30*x40 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x63 + pk2CaMKoff*x47*x81 + pk2CaMKoff*x47*x90 + pk2CaMKoff*x47*x97 + pk2CaMKoff*x47*x103 + pk2CaMKoff*x47*x108 + pk2CaMKoff*x47*x112 + pk2CaMKoff*x47*x116 + pk2CaMKoff*x47*x117 + 2*(pk2CaMKoff*x47*x118) + pkpCaM0*x48*x81 + pkpCaM1N*x49*x90 + pkpCaM2N*x50*x97 + pkpCaM1C*x51*x103 + pkpCaM1C1N*x52*x108 + pkpCaM1C2N*x53*x112 + pkpCaM2C*x54*x118 + pkpCaM2C1N*x55*x116 + pkpCaM4*x56*x117,
-pk2CaMKon*x2*x9*x46 + -pk2CaMKon*x3*x9*x46 + -pk2CaMKon*x4*x9*x46 + -pk2CaMKon*x5*x9*x46 + -pk2CaMKon*x6*x9*x46 + pkK2Con*x6*x12*x70 + -pk2CaMKon*x7*x9*x46 + -pk2CaMKon*x8*x9*x46 + pkK1Non*x8*x12*x72 + -pk2CaMKon*x9*x10*x46 + -pkK2Non*x9*x12*x74 + -pkCaM2C1Noff*x9*x43 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x9*x46*x85) + -pkK2Coff*x9*x71 + -pkK1Noff*x9*x73 + -2*(pk2CaMKon*x9*x9*x46) + pkK2Noff*x10*x75 + pkCaM2C1Non*x22*x34*x42 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x64 + pk2CaMKoff*x47*x82 + pk2CaMKoff*x47*x91 + pk2CaMKoff*x47*x98 + pk2CaMKoff*x47*x104 + pk2CaMKoff*x47*x109 + pk2CaMKoff*x47*x113 + pk2CaMKoff*x47*x116 + pk2CaMKoff*x47*x119 + 2*(pk2CaMKoff*x47*x120) + pkpCaM0*x48*x82 + pkpCaM1N*x49*x91 + pkpCaM2N*x50*x98 + pkpCaM1C*x51*x104 + pkpCaM1C1N*x52*x109 + pkpCaM1C2N*x53*x113 + pkpCaM2C*x54*x116 + pkpCaM2C1N*x55*x120 + pkpCaM4*x56*x119,
-pk2CaMKon*x2*x10*x46 + -pk2CaMKon*x3*x10*x46 + -pk2CaMKon*x4*x10*x46 + -pk2CaMKon*x5*x10*x46 + -pk2CaMKon*x6*x10*x46 + -pk2CaMKon*x7*x10*x46 + pkK2Con*x7*x12*x70 + -pk2CaMKon*x8*x10*x46 + -pk2CaMKon*x9*x10*x46 + pkK2Non*x9*x12*x74 + -pkCaM4off*x10*x45 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x10*x46*x85) + -pkK2Coff*x10*x71 + -pkK2Noff*x10*x75 + -2*(pk2CaMKon*x10*x10*x46) + pkCaM4on*x22*x37*x44 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x65 + pk2CaMKoff*x47*x83 + pk2CaMKoff*x47*x92 + pk2CaMKoff*x47*x99 + pk2CaMKoff*x47*x105 + pk2CaMKoff*x47*x110 + pk2CaMKoff*x47*x114 + pk2CaMKoff*x47*x117 + pk2CaMKoff*x47*x119 + 2*(pk2CaMKoff*x47*x121) + pkpCaM0*x48*x83 + pkpCaM1N*x49*x92 + pkpCaM2N*x50*x99 + pkpCaM1C*x51*x105 + pkpCaM1C1N*x52*x110 + pkpCaM1C2N*x53*x114 + pkpCaM2C*x54*x117 + pkpCaM2C1N*x55*x119 + pkpCaM4*x56*x121,
pkCaM1Noff*x3*x24 + -pk1Con*x11*x12*x13 + -pk2Non*x11*x12*x19 + -pk1Noff*x11*x18 + -pkCaM1Non*x11*x22*x23 + pk1Non*x12*x16*x17 + pk1Coff*x14*x15 + pk2Noff*x20*x21,
-pkK1Con*x2*x12*x68 + -pkK1Non*x2*x12*x72 + -pkK1Con*x3*x12*x68 + -pkK2Non*x3*x12*x74 + pkK1Noff*x3*x73 + -pkK1Con*x4*x12*x68 + pkK2Noff*x4*x75 + -pkK2Con*x5*x12*x70 + -pkK1Non*x5*x12*x72 + pkK1Coff*x5*x69 + -pkK2Con*x6*x12*x70 + -pkK2Non*x6*x12*x74 + pkK1Coff*x6*x69 + pkK1Noff*x6*x73 + -pkK2Con*x7*x12*x70 + pkK1Coff*x7*x69 + pkK2Noff*x7*x75 + -pkK1Non*x8*x12*x72 + pkK2Coff*x8*x71 + -pkK2Non*x9*x12*x74 + pkK2Coff*x9*x71 + pkK1Noff*x9*x73 + pkK2Coff*x10*x71 + pkK2Noff*x10*x75 + -pk1Con*x11*x12*x13 + -pk2Non*x11*x12*x19 + pk1Noff*x11*x18 + -pk1Con*x12*x13*x16 + -pk1Con*x12*x13*x20 + -pk2Non*x12*x14*x19 + -pk2Con*x12*x14*x29 + -pk1Non*x12*x16*x17 + -pk1Non*x12*x17*x28 + -pk1Non*x12*x17*x30 + -pk2Non*x12*x19*x34 + -pk2Con*x12*x25*x29 + -pk2Con*x12*x28*x29 + pk1Coff*x14*x15 + pk1Noff*x14*x18 + pk1Coff*x15*x25 + pk1Coff*x15*x28 + pk1Noff*x18*x34 + pk2Noff*x20*x21 + pk2Noff*x21*x25 + pk2Noff*x21*x37 + pk2Coff*x30*x31 + pk2Coff*x31*x34 + pk2Coff*x31*x37,
R(0),
pkCaM1C1Noff*x6*x36 + pk1Con*x11*x12*x13 + -pk2Non*x12*x14*x19 + -pk2Con*x12*x14*x29 + pk1Non*x12*x17*x28 + -pk1Coff*x14*x15 + -pk1Noff*x14*x18 + -pkCaM1C1Non*x14*x22*x35 + pk2Noff*x21*x25 + pk2Coff*x31*x34,
R(0),
pkCaM0off*x2*x67 + pk1Noff*x11*x18 + -pk1Con*x12*x13*x16 + -pk1Non*x12*x16*x17 + pk1Coff*x15*x28 + -pkCaM0on*x16*x22*x66,
R(0),
R(0),
R(0),
pkCaM2Noff*x4*x27 + pk2Non*x11*x12*x19 + -pk1Con*x12*x13*x20 + pk1Coff*x15*x25 + -pk2Noff*x20*x21 + -pkCaM2Non*x20*x22*x26,
R(0),
pkCaM0off*x2*x67 + pkCaM1Noff*x3*x24 + pkCaM2Noff*x4*x27 + pkCaM1Coff*x5*x33 + pkCaM1C1Noff*x6*x36 + pkCaM1C2Noff*x7*x39 + pkCaM2Coff*x8*x41 + pkCaM2C1Noff*x9*x43 + pkCaM4off*x10*x45 + -pkCaM1Non*x11*x22*x23 + -pkCaM1C1Non*x14*x22*x35 + -pkCaM0on*x16*x22*x66 + -pkCaM2Non*x20*x22*x26 + -pkCaM1C2Non*x22*x25*x38 + -pkCaM1Con*x22*x28*x32 + -pkCaM2Con*x22*x30*x40 + -pkCaM2C1Non*x22*x34*x42 + -pkCaM4on*x22*x37*x44,
R(0),
R(0),
pkCaM1C2Noff*x7*x39 + pk1Con*x12*x13*x20 + pk2Non*x12*x14*x19 + -pk2Con*x12*x25*x29 + -pk1Coff*x15*x25 + -pk2Noff*x21*x25 + -pkCaM1C2Non*x22*x25*x38 + pk2Coff*x31*x37,
R(0),
R(0),
pkCaM1Coff*x5*x33 + pk1Con*x12*x13*x16 + -pk1Non*x12*x17*x28 + -pk2Con*x12*x28*x29 + pk1Noff*x14*x18 + -pk1Coff*x15*x28 + -pkCaM1Con*x22*x28*x32 + pk2Coff*x30*x31,
R(0),
pkCaM2Coff*x8*x41 + -pk1Non*x12*x17*x30 + pk2Con*x12*x28*x29 + pk1Noff*x18*x34 + -pkCaM2Con*x22*x30*x40 + -pk2Coff*x30*x31,
R(0),
R(0),
R(0),
pkCaM2C1Noff*x9*x43 + pk2Con*x12*x14*x29 + pk1Non*x12*x17*x30 + -pk2Non*x12*x19*x34 + -pk1Noff*x18*x34 + pk2Noff*x21*x37 + -pkCaM2C1Non*x22*x34*x42 + -pk2Coff*x31*x34,
R(0),
R(0),
pkCaM4off*x10*x45 + pk2Non*x12*x19*x34 + pk2Con*x12*x25*x29 + -pk2Noff*x21*x37 + -pkCaM4on*x22*x37*x44 + -pk2Coff*x31*x37,
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
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x2*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x57) + -((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*x48*x57),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x3*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x58) + -((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*x49*x58),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x4*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x59) + -((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*x50*x59),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x5*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x60) + -((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*x51*x60),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x6*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x61) + -((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*x52*x61),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x7*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x62) + -((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*x53*x62),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x8*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x63) + -((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*x54*x63),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x9*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x64) + -((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*x55*x64),
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x10*x46*x85 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x65) + -((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*x56*x65),
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
pk2CaMKon*x2*x3*x46 + -pk2CaMKoff*x47*x76 + -pkpCaM0*x48*x76 + -pkpCaM1N*x49*x76,
pk2CaMKon*x2*x4*x46 + -pk2CaMKoff*x47*x77 + -pkpCaM0*x48*x77 + -pkpCaM2N*x50*x77,
pk2CaMKon*x2*x5*x46 + -pk2CaMKoff*x47*x78 + -pkpCaM0*x48*x78 + -pkpCaM1C*x51*x78,
pk2CaMKon*x2*x6*x46 + -pk2CaMKoff*x47*x79 + -pkpCaM0*x48*x79 + -pkpCaM1C1N*x52*x79,
pk2CaMKon*x2*x7*x46 + -pk2CaMKoff*x47*x80 + -pkpCaM0*x48*x80 + -pkpCaM1C2N*x53*x80,
pk2CaMKon*x2*x8*x46 + -pk2CaMKoff*x47*x81 + -pkpCaM0*x48*x81 + -pkpCaM2C*x54*x81,
pk2CaMKon*x2*x9*x46 + -pk2CaMKoff*x47*x82 + -pkpCaM0*x48*x82 + -pkpCaM2C1N*x55*x82,
pk2CaMKon*x2*x10*x46 + -pk2CaMKoff*x47*x83 + -pkpCaM0*x48*x83 + -pkpCaM4*x56*x83,
pk2CaMKon*x2*x2*x46 + -pk2CaMKoff*x47*x84 + -pkpCaM0*x48*x84,
-((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x2*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x3*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x4*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x5*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x6*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x7*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x8*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x9*x46*x85) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x10*x46*x85) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x57 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x58 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x59 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x60 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x61 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x62 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x63 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x64 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x47*x65 + 2*((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*x48*x57) + pkpCaM0*x48*x76 + pkpCaM0*x48*x77 + pkpCaM0*x48*x78 + pkpCaM0*x48*x79 + pkpCaM0*x48*x80 + pkpCaM0*x48*x81 + pkpCaM0*x48*x82 + pkpCaM0*x48*x83 + pkpCaM0*x48*x84 + 2*((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*x49*x58) + pkpCaM1N*x49*x76 + pkpCaM1N*x49*x86 + pkpCaM1N*x49*x87 + pkpCaM1N*x49*x88 + pkpCaM1N*x49*x89 + pkpCaM1N*x49*x90 + pkpCaM1N*x49*x91 + pkpCaM1N*x49*x92 + pkpCaM1N*x49*x93 + 2*((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*x50*x59) + pkpCaM2N*x50*x77 + pkpCaM2N*x50*x86 + pkpCaM2N*x50*x94 + pkpCaM2N*x50*x95 + pkpCaM2N*x50*x96 + pkpCaM2N*x50*x97 + pkpCaM2N*x50*x98 + pkpCaM2N*x50*x99 + pkpCaM2N*x50*x100 + 2*((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*x51*x60) + pkpCaM1C*x51*x78 + pkpCaM1C*x51*x87 + pkpCaM1C*x51*x94 + pkpCaM1C*x51*x101 + pkpCaM1C*x51*x102 + pkpCaM1C*x51*x103 + pkpCaM1C*x51*x104 + pkpCaM1C*x51*x105 + pkpCaM1C*x51*x106 + 2*((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*x52*x61) + pkpCaM1C1N*x52*x79 + pkpCaM1C1N*x52*x88 + pkpCaM1C1N*x52*x95 + pkpCaM1C1N*x52*x101 + pkpCaM1C1N*x52*x107 + pkpCaM1C1N*x52*x108 + pkpCaM1C1N*x52*x109 + pkpCaM1C1N*x52*x110 + pkpCaM1C1N*x52*x111 + 2*((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*x53*x62) + pkpCaM1C2N*x53*x80 + pkpCaM1C2N*x53*x89 + pkpCaM1C2N*x53*x96 + pkpCaM1C2N*x53*x102 + pkpCaM1C2N*x53*x107 + pkpCaM1C2N*x53*x112 + pkpCaM1C2N*x53*x113 + pkpCaM1C2N*x53*x114 + pkpCaM1C2N*x53*x115 + 2*((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*x54*x63) + pkpCaM2C*x54*x81 + pkpCaM2C*x54*x90 + pkpCaM2C*x54*x97 + pkpCaM2C*x54*x103 + pkpCaM2C*x54*x108 + pkpCaM2C*x54*x112 + pkpCaM2C*x54*x116 + pkpCaM2C*x54*x117 + pkpCaM2C*x54*x118 + 2*((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*x55*x64) + pkpCaM2C1N*x55*x82 + pkpCaM2C1N*x55*x91 + pkpCaM2C1N*x55*x98 + pkpCaM2C1N*x55*x104 + pkpCaM2C1N*x55*x109 + pkpCaM2C1N*x55*x113 + pkpCaM2C1N*x55*x116 + pkpCaM2C1N*x55*x119 + pkpCaM2C1N*x55*x120 + 2*((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*x56*x65) + pkpCaM4*x56*x83 + pkpCaM4*x56*x92 + pkpCaM4*x56*x99 + pkpCaM4*x56*x105 + pkpCaM4*x56*x110 + pkpCaM4*x56*x114 + pkpCaM4*x56*x117 + pkpCaM4*x56*x119 + pkpCaM4*x56*x121,
pk2CaMKon*x3*x4*x46 + -pk2CaMKoff*x47*x86 + -pkpCaM1N*x49*x86 + -pkpCaM2N*x50*x86,
pk2CaMKon*x3*x5*x46 + -pk2CaMKoff*x47*x87 + -pkpCaM1N*x49*x87 + -pkpCaM1C*x51*x87,
pk2CaMKon*x3*x6*x46 + -pk2CaMKoff*x47*x88 + -pkpCaM1N*x49*x88 + -pkpCaM1C1N*x52*x88,
pk2CaMKon*x3*x7*x46 + -pk2CaMKoff*x47*x89 + -pkpCaM1N*x49*x89 + -pkpCaM1C2N*x53*x89,
pk2CaMKon*x3*x8*x46 + -pk2CaMKoff*x47*x90 + -pkpCaM1N*x49*x90 + -pkpCaM2C*x54*x90,
pk2CaMKon*x3*x9*x46 + -pk2CaMKoff*x47*x91 + -pkpCaM1N*x49*x91 + -pkpCaM2C1N*x55*x91,
pk2CaMKon*x3*x10*x46 + -pk2CaMKoff*x47*x92 + -pkpCaM1N*x49*x92 + -pkpCaM4*x56*x92,
pk2CaMKon*x3*x3*x46 + -pk2CaMKoff*x47*x93 + -pkpCaM1N*x49*x93,
pk2CaMKon*x4*x5*x46 + -pk2CaMKoff*x47*x94 + -pkpCaM2N*x50*x94 + -pkpCaM1C*x51*x94,
pk2CaMKon*x4*x6*x46 + -pk2CaMKoff*x47*x95 + -pkpCaM2N*x50*x95 + -pkpCaM1C1N*x52*x95,
pk2CaMKon*x4*x7*x46 + -pk2CaMKoff*x47*x96 + -pkpCaM2N*x50*x96 + -pkpCaM1C2N*x53*x96,
pk2CaMKon*x4*x8*x46 + -pk2CaMKoff*x47*x97 + -pkpCaM2N*x50*x97 + -pkpCaM2C*x54*x97,
pk2CaMKon*x4*x9*x46 + -pk2CaMKoff*x47*x98 + -pkpCaM2N*x50*x98 + -pkpCaM2C1N*x55*x98,
pk2CaMKon*x4*x10*x46 + -pk2CaMKoff*x47*x99 + -pkpCaM2N*x50*x99 + -pkpCaM4*x56*x99,
pk2CaMKon*x4*x4*x46 + -pk2CaMKoff*x47*x100 + -pkpCaM2N*x50*x100,
pk2CaMKon*x5*x6*x46 + -pk2CaMKoff*x47*x101 + -pkpCaM1C*x51*x101 + -pkpCaM1C1N*x52*x101,
pk2CaMKon*x5*x7*x46 + -pk2CaMKoff*x47*x102 + -pkpCaM1C*x51*x102 + -pkpCaM1C2N*x53*x102,
pk2CaMKon*x5*x8*x46 + -pk2CaMKoff*x47*x103 + -pkpCaM1C*x51*x103 + -pkpCaM2C*x54*x103,
pk2CaMKon*x5*x9*x46 + -pk2CaMKoff*x47*x104 + -pkpCaM1C*x51*x104 + -pkpCaM2C1N*x55*x104,
pk2CaMKon*x5*x10*x46 + -pk2CaMKoff*x47*x105 + -pkpCaM1C*x51*x105 + -pkpCaM4*x56*x105,
pk2CaMKon*x5*x5*x46 + -pk2CaMKoff*x47*x106 + -pkpCaM1C*x51*x106,
pk2CaMKon*x6*x7*x46 + -pk2CaMKoff*x47*x107 + -pkpCaM1C1N*x52*x107 + -pkpCaM1C2N*x53*x107,
pk2CaMKon*x6*x8*x46 + -pk2CaMKoff*x47*x108 + -pkpCaM1C1N*x52*x108 + -pkpCaM2C*x54*x108,
pk2CaMKon*x6*x9*x46 + -pk2CaMKoff*x47*x109 + -pkpCaM1C1N*x52*x109 + -pkpCaM2C1N*x55*x109,
pk2CaMKon*x6*x10*x46 + -pk2CaMKoff*x47*x110 + -pkpCaM1C1N*x52*x110 + -pkpCaM4*x56*x110,
pk2CaMKon*x6*x6*x46 + -pk2CaMKoff*x47*x111 + -pkpCaM1C1N*x52*x111,
pk2CaMKon*x7*x8*x46 + -pk2CaMKoff*x47*x112 + -pkpCaM1C2N*x53*x112 + -pkpCaM2C*x54*x112,
pk2CaMKon*x7*x9*x46 + -pk2CaMKoff*x47*x113 + -pkpCaM1C2N*x53*x113 + -pkpCaM2C1N*x55*x113,
pk2CaMKon*x7*x10*x46 + -pk2CaMKoff*x47*x114 + -pkpCaM1C2N*x53*x114 + -pkpCaM4*x56*x114,
pk2CaMKon*x7*x7*x46 + -pk2CaMKoff*x47*x115 + -pkpCaM1C2N*x53*x115,
pk2CaMKon*x8*x9*x46 + -pk2CaMKoff*x47*x116 + -pkpCaM2C*x54*x116 + -pkpCaM2C1N*x55*x116,
pk2CaMKon*x8*x10*x46 + -pk2CaMKoff*x47*x117 + -pkpCaM2C*x54*x117 + -pkpCaM4*x56*x117,
pk2CaMKon*x8*x8*x46 + -pk2CaMKoff*x47*x118 + -pkpCaM2C*x54*x118,
pk2CaMKon*x9*x10*x46 + -pk2CaMKoff*x47*x119 + -pkpCaM2C1N*x55*x119 + -pkpCaM4*x56*x119,
pk2CaMKon*x9*x9*x46 + -pk2CaMKoff*x47*x120 + -pkpCaM2C1N*x55*x120,
pk2CaMKon*x10*x10*x46 + -pk2CaMKoff*x47*x121 + -pkpCaM4*x56*x121,
]

#result = aggregate(polys, [x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10])
#print("Total for MODEL1001150000_FE_pKCaMcurry, preserving KCaM block, is " + str(len(result)))
