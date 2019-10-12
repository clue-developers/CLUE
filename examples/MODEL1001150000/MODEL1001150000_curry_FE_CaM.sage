load("aggregation.sage")
#MODEL1001150000_FE_CaMcurry

R = PolynomialRing(QQ, 'x', 121)
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48, x49, x50, x51, x52, x53, x54, x55, x56, x57, x58, x59, x60, x61, x62, x63, x64, x65, x66, x67, x68, x69, x70, x71, x72, x73, x74, x75, x76, x77, x78, x79, x80, x81, x82, x83, x84, x85, x86, x87, x88, x89, x90, x91, x92, x93, x94, x95, x96, x97, x98, x99, x100, x101, x102, x103, x104, x105, x106, x107, x108, x109, x110, x111, x112, x113, x114, x115, x116, x117, x118, x119, x120, x121, = R.gens()
print("Example MODEL1001150000_FE_CaMcurry")
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
-pk1Con*x2*x12*x77 + -pk1Non*x2*x12*x81 + -pkCaM0on*x2*x85*x86 + pk1Noff*x3*x82 + pk1Coff*x5*x78 + pkCaM0off*x11*x87,
pk1Non*x2*x12*x81 + -pk1Con*x3*x12*x77 + -pk2Non*x3*x12*x83 + -pk1Noff*x3*x82 + -pkCaM1Non*x3*x85*x88 + pk2Noff*x4*x84 + pk1Coff*x6*x78 + pkCaM1Noff*x17*x89,
pk2Non*x3*x12*x83 + -pk1Con*x4*x12*x77 + -pk2Noff*x4*x84 + -pkCaM2Non*x4*x85*x90 + pk1Coff*x7*x78 + pkCaM2Noff*x22*x91,
pk1Con*x2*x12*x77 + -pk2Con*x5*x12*x79 + -pk1Non*x5*x12*x81 + -pk1Coff*x5*x78 + -pkCaM1Con*x5*x85*x92 + pk1Noff*x6*x82 + pk2Coff*x8*x80 + pkCaM1Coff*x14*x93,
pk1Con*x3*x12*x77 + pk1Non*x5*x12*x81 + -pk2Con*x6*x12*x79 + -pk2Non*x6*x12*x83 + -pk1Coff*x6*x78 + -pk1Noff*x6*x82 + -pkCaM1C1Non*x6*x85*x94 + pk2Noff*x7*x84 + pk2Coff*x9*x80 + pkCaM1C1Noff*x25*x95,
pk1Con*x4*x12*x77 + pk2Non*x6*x12*x83 + -pk2Con*x7*x12*x79 + -pk1Coff*x7*x78 + -pk2Noff*x7*x84 + -pkCaM1C2Non*x7*x85*x96 + pk2Coff*x10*x80 + pkCaM1C2Noff*x27*x97,
pk2Con*x5*x12*x79 + -pk1Non*x8*x12*x81 + -pk2Coff*x8*x80 + -pkCaM2Con*x8*x85*x98 + pk1Noff*x9*x82 + pkCaM2Coff*x29*x99,
pk2Con*x6*x12*x79 + pk1Non*x8*x12*x81 + -pk2Non*x9*x12*x83 + -pk2Coff*x9*x80 + -pk1Noff*x9*x82 + -pkCaM2C1Non*x9*x85*x100 + pk2Noff*x10*x84 + pkCaM2C1Noff*x31*x101,
pk2Con*x7*x12*x79 + pk2Non*x9*x12*x83 + -pk2Coff*x10*x80 + -pk2Noff*x10*x84 + -pkCaM4on*x10*x85*x102 + pkCaM4off*x33*x103,
pkCaM0on*x2*x85*x86 + -pkK1Con*x11*x12*x13 + -pkK1Non*x11*x12*x16 + -pk2CaMKon*x11*x14*x19 + -pk2CaMKon*x11*x17*x19 + -pk2CaMKon*x11*x19*x22 + -pk2CaMKon*x11*x19*x25 + -pk2CaMKon*x11*x19*x27 + -pk2CaMKon*x11*x19*x29 + -pk2CaMKon*x11*x19*x31 + -pk2CaMKon*x11*x19*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x11*x19*x44) + -pkCaM0off*x11*x87 + -2*(pk2CaMKon*x11*x11*x19) + pkK1Coff*x14*x15 + pkK1Noff*x17*x18 + pk2CaMKoff*x20*x21 + pkpCaM1N*x20*x35 + pk2CaMKoff*x21*x23 + pk2CaMKoff*x21*x24 + pk2CaMKoff*x21*x26 + pk2CaMKoff*x21*x28 + pk2CaMKoff*x21*x30 + pk2CaMKoff*x21*x32 + pk2CaMKoff*x21*x34 + 2*(pk2CaMKoff*x21*x104) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x105 + pkpCaM2N*x23*x36 + pkpCaM1C*x24*x37 + pkpCaM1C1N*x26*x38 + pkpCaM1C2N*x28*x39 + pkpCaM2C*x30*x40 + pkpCaM2C1N*x32*x41 + pkpCaM4*x34*x42 + pkpCaM0*x43*x104,
-pk1Con*x2*x12*x77 + -pk1Non*x2*x12*x81 + -pk1Con*x3*x12*x77 + -pk2Non*x3*x12*x83 + pk1Noff*x3*x82 + -pk1Con*x4*x12*x77 + pk2Noff*x4*x84 + -pk2Con*x5*x12*x79 + -pk1Non*x5*x12*x81 + pk1Coff*x5*x78 + -pk2Con*x6*x12*x79 + -pk2Non*x6*x12*x83 + pk1Coff*x6*x78 + pk1Noff*x6*x82 + -pk2Con*x7*x12*x79 + pk1Coff*x7*x78 + pk2Noff*x7*x84 + -pk1Non*x8*x12*x81 + pk2Coff*x8*x80 + -pk2Non*x9*x12*x83 + pk2Coff*x9*x80 + pk1Noff*x9*x82 + pk2Coff*x10*x80 + pk2Noff*x10*x84 + -pkK1Con*x11*x12*x13 + -pkK1Non*x11*x12*x16 + -pkK1Con*x12*x13*x17 + -pkK1Con*x12*x13*x22 + -pkK1Non*x12*x14*x16 + -pkK2Con*x12*x14*x60 + -pkK1Non*x12*x16*x29 + -pkK2Non*x12*x17*x45 + -pkK2Non*x12*x25*x45 + -pkK2Con*x12*x25*x60 + -pkK2Con*x12*x27*x60 + -pkK2Non*x12*x31*x45 + pkK1Coff*x14*x15 + pkK1Coff*x15*x25 + pkK1Coff*x15*x27 + pkK1Noff*x17*x18 + pkK1Noff*x18*x25 + pkK1Noff*x18*x31 + pkK2Noff*x22*x46 + pkK2Noff*x27*x46 + pkK2Coff*x29*x61 + pkK2Coff*x31*x61 + pkK2Noff*x33*x46 + pkK2Coff*x33*x61,
R(0),
pkCaM1Con*x5*x85*x92 + pkK1Con*x11*x12*x13 + -pk2CaMKon*x11*x14*x19 + -pkK1Non*x12*x14*x16 + -pkK2Con*x12*x14*x60 + -pkK1Coff*x14*x15 + -pk2CaMKon*x14*x17*x19 + -pk2CaMKon*x14*x19*x22 + -pk2CaMKon*x14*x19*x25 + -pk2CaMKon*x14*x19*x27 + -pk2CaMKon*x14*x19*x29 + -pk2CaMKon*x14*x19*x31 + -pk2CaMKon*x14*x19*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x14*x19*x44) + -pkCaM1Coff*x14*x93 + -2*(pk2CaMKon*x14*x14*x19) + pkK1Noff*x18*x25 + pk2CaMKoff*x21*x24 + pk2CaMKoff*x21*x48 + pk2CaMKoff*x21*x54 + pk2CaMKoff*x21*x62 + pk2CaMKoff*x21*x63 + pk2CaMKoff*x21*x64 + pk2CaMKoff*x21*x65 + pk2CaMKoff*x21*x66 + 2*(pk2CaMKoff*x21*x106) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x107 + pkpCaM0*x24*x43 + pkK2Coff*x29*x61 + pkpCaM1N*x35*x48 + pkpCaM2N*x36*x54 + pkpCaM1C*x37*x106 + pkpCaM1C1N*x38*x62 + pkpCaM1C2N*x39*x63 + pkpCaM2C*x40*x64 + pkpCaM2C1N*x41*x65 + pkpCaM4*x42*x66,
R(0),
R(0),
pkCaM1Non*x3*x85*x88 + pkK1Non*x11*x12*x16 + -pk2CaMKon*x11*x17*x19 + -pkK1Con*x12*x13*x17 + -pkK2Non*x12*x17*x45 + -pk2CaMKon*x14*x17*x19 + pkK1Coff*x15*x25 + -pkK1Noff*x17*x18 + -pk2CaMKon*x17*x19*x22 + -pk2CaMKon*x17*x19*x25 + -pk2CaMKon*x17*x19*x27 + -pk2CaMKon*x17*x19*x29 + -pk2CaMKon*x17*x19*x31 + -pk2CaMKon*x17*x19*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x17*x19*x44) + -pkCaM1Noff*x17*x89 + -2*(pk2CaMKon*x17*x17*x19) + pk2CaMKoff*x20*x21 + pkpCaM0*x20*x43 + pk2CaMKoff*x21*x47 + pk2CaMKoff*x21*x48 + pk2CaMKoff*x21*x49 + pk2CaMKoff*x21*x50 + pk2CaMKoff*x21*x51 + pk2CaMKoff*x21*x52 + pk2CaMKoff*x21*x53 + 2*(pk2CaMKoff*x21*x108) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x109 + pkK2Noff*x22*x46 + pkpCaM1N*x35*x108 + pkpCaM2N*x36*x47 + pkpCaM1C*x37*x48 + pkpCaM1C1N*x38*x49 + pkpCaM1C2N*x39*x50 + pkpCaM2C*x40*x51 + pkpCaM2C1N*x41*x52 + pkpCaM4*x42*x53,
R(0),
R(0),
pk2CaMKon*x11*x17*x19 + -pk2CaMKoff*x20*x21 + -pkpCaM1N*x20*x35 + -pkpCaM0*x20*x43,
R(0),
pkCaM2Non*x4*x85*x90 + -pk2CaMKon*x11*x19*x22 + -pkK1Con*x12*x13*x22 + pkK2Non*x12*x17*x45 + -pk2CaMKon*x14*x19*x22 + pkK1Coff*x15*x27 + -pk2CaMKon*x17*x19*x22 + -pk2CaMKon*x19*x22*x25 + -pk2CaMKon*x19*x22*x27 + -pk2CaMKon*x19*x22*x29 + -pk2CaMKon*x19*x22*x31 + -pk2CaMKon*x19*x22*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x22*x44) + -2*(pk2CaMKon*x19*x22*x22) + pk2CaMKoff*x21*x23 + pk2CaMKoff*x21*x47 + pk2CaMKoff*x21*x54 + pk2CaMKoff*x21*x55 + pk2CaMKoff*x21*x56 + pk2CaMKoff*x21*x57 + pk2CaMKoff*x21*x58 + pk2CaMKoff*x21*x59 + 2*(pk2CaMKoff*x21*x110) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x111 + -pkK2Noff*x22*x46 + -pkCaM2Noff*x22*x91 + pkpCaM0*x23*x43 + pkpCaM1N*x35*x47 + pkpCaM2N*x36*x110 + pkpCaM1C*x37*x54 + pkpCaM1C1N*x38*x55 + pkpCaM1C2N*x39*x56 + pkpCaM2C*x40*x57 + pkpCaM2C1N*x41*x58 + pkpCaM4*x42*x59,
pk2CaMKon*x11*x19*x22 + -pk2CaMKoff*x21*x23 + -pkpCaM2N*x23*x36 + -pkpCaM0*x23*x43,
pk2CaMKon*x11*x14*x19 + -pk2CaMKoff*x21*x24 + -pkpCaM1C*x24*x37 + -pkpCaM0*x24*x43,
pkCaM1C1Non*x6*x85*x94 + -pk2CaMKon*x11*x19*x25 + pkK1Con*x12*x13*x17 + pkK1Non*x12*x14*x16 + -pkK2Non*x12*x25*x45 + -pkK2Con*x12*x25*x60 + -pk2CaMKon*x14*x19*x25 + -pkK1Coff*x15*x25 + -pk2CaMKon*x17*x19*x25 + -pkK1Noff*x18*x25 + -pk2CaMKon*x19*x22*x25 + -pk2CaMKon*x19*x25*x27 + -pk2CaMKon*x19*x25*x29 + -pk2CaMKon*x19*x25*x31 + -pk2CaMKon*x19*x25*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x25*x44) + -2*(pk2CaMKon*x19*x25*x25) + pk2CaMKoff*x21*x26 + pk2CaMKoff*x21*x49 + pk2CaMKoff*x21*x55 + pk2CaMKoff*x21*x62 + pk2CaMKoff*x21*x67 + pk2CaMKoff*x21*x68 + pk2CaMKoff*x21*x69 + pk2CaMKoff*x21*x70 + 2*(pk2CaMKoff*x21*x112) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x113 + -pkCaM1C1Noff*x25*x95 + pkpCaM0*x26*x43 + pkK2Noff*x27*x46 + pkK2Coff*x31*x61 + pkpCaM1N*x35*x49 + pkpCaM2N*x36*x55 + pkpCaM1C*x37*x62 + pkpCaM1C1N*x38*x112 + pkpCaM1C2N*x39*x67 + pkpCaM2C*x40*x68 + pkpCaM2C1N*x41*x69 + pkpCaM4*x42*x70,
pk2CaMKon*x11*x19*x25 + -pk2CaMKoff*x21*x26 + -pkpCaM1C1N*x26*x38 + -pkpCaM0*x26*x43,
pkCaM1C2Non*x7*x85*x96 + -pk2CaMKon*x11*x19*x27 + pkK1Con*x12*x13*x22 + pkK2Non*x12*x25*x45 + -pkK2Con*x12*x27*x60 + -pk2CaMKon*x14*x19*x27 + -pkK1Coff*x15*x27 + -pk2CaMKon*x17*x19*x27 + -pk2CaMKon*x19*x22*x27 + -pk2CaMKon*x19*x25*x27 + -pk2CaMKon*x19*x27*x29 + -pk2CaMKon*x19*x27*x31 + -pk2CaMKon*x19*x27*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x27*x44) + -2*(pk2CaMKon*x19*x27*x27) + pk2CaMKoff*x21*x28 + pk2CaMKoff*x21*x50 + pk2CaMKoff*x21*x56 + pk2CaMKoff*x21*x63 + pk2CaMKoff*x21*x67 + pk2CaMKoff*x21*x71 + pk2CaMKoff*x21*x72 + pk2CaMKoff*x21*x73 + 2*(pk2CaMKoff*x21*x114) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x115 + -pkK2Noff*x27*x46 + -pkCaM1C2Noff*x27*x97 + pkpCaM0*x28*x43 + pkK2Coff*x33*x61 + pkpCaM1N*x35*x50 + pkpCaM2N*x36*x56 + pkpCaM1C*x37*x63 + pkpCaM1C1N*x38*x67 + pkpCaM1C2N*x39*x114 + pkpCaM2C*x40*x71 + pkpCaM2C1N*x41*x72 + pkpCaM4*x42*x73,
pk2CaMKon*x11*x19*x27 + -pk2CaMKoff*x21*x28 + -pkpCaM1C2N*x28*x39 + -pkpCaM0*x28*x43,
pkCaM2Con*x8*x85*x98 + -pk2CaMKon*x11*x19*x29 + pkK2Con*x12*x14*x60 + -pkK1Non*x12*x16*x29 + -pk2CaMKon*x14*x19*x29 + -pk2CaMKon*x17*x19*x29 + pkK1Noff*x18*x31 + -pk2CaMKon*x19*x22*x29 + -pk2CaMKon*x19*x25*x29 + -pk2CaMKon*x19*x27*x29 + -pk2CaMKon*x19*x29*x31 + -pk2CaMKon*x19*x29*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x29*x44) + -2*(pk2CaMKon*x19*x29*x29) + pk2CaMKoff*x21*x30 + pk2CaMKoff*x21*x51 + pk2CaMKoff*x21*x57 + pk2CaMKoff*x21*x64 + pk2CaMKoff*x21*x68 + pk2CaMKoff*x21*x71 + pk2CaMKoff*x21*x74 + pk2CaMKoff*x21*x75 + 2*(pk2CaMKoff*x21*x116) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x117 + -pkK2Coff*x29*x61 + -pkCaM2Coff*x29*x99 + pkpCaM0*x30*x43 + pkpCaM1N*x35*x51 + pkpCaM2N*x36*x57 + pkpCaM1C*x37*x64 + pkpCaM1C1N*x38*x68 + pkpCaM1C2N*x39*x71 + pkpCaM2C*x40*x116 + pkpCaM2C1N*x41*x74 + pkpCaM4*x42*x75,
pk2CaMKon*x11*x19*x29 + -pk2CaMKoff*x21*x30 + -pkpCaM2C*x30*x40 + -pkpCaM0*x30*x43,
pkCaM2C1Non*x9*x85*x100 + -pk2CaMKon*x11*x19*x31 + pkK1Non*x12*x16*x29 + pkK2Con*x12*x25*x60 + -pkK2Non*x12*x31*x45 + -pk2CaMKon*x14*x19*x31 + -pk2CaMKon*x17*x19*x31 + -pkK1Noff*x18*x31 + -pk2CaMKon*x19*x22*x31 + -pk2CaMKon*x19*x25*x31 + -pk2CaMKon*x19*x27*x31 + -pk2CaMKon*x19*x29*x31 + -pk2CaMKon*x19*x31*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x31*x44) + -2*(pk2CaMKon*x19*x31*x31) + pk2CaMKoff*x21*x32 + pk2CaMKoff*x21*x52 + pk2CaMKoff*x21*x58 + pk2CaMKoff*x21*x65 + pk2CaMKoff*x21*x69 + pk2CaMKoff*x21*x72 + pk2CaMKoff*x21*x74 + pk2CaMKoff*x21*x76 + 2*(pk2CaMKoff*x21*x118) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x119 + -pkK2Coff*x31*x61 + -pkCaM2C1Noff*x31*x101 + pkpCaM0*x32*x43 + pkK2Noff*x33*x46 + pkpCaM1N*x35*x52 + pkpCaM2N*x36*x58 + pkpCaM1C*x37*x65 + pkpCaM1C1N*x38*x69 + pkpCaM1C2N*x39*x72 + pkpCaM2C*x40*x74 + pkpCaM2C1N*x41*x118 + pkpCaM4*x42*x76,
pk2CaMKon*x11*x19*x31 + -pk2CaMKoff*x21*x32 + -pkpCaM2C1N*x32*x41 + -pkpCaM0*x32*x43,
pkCaM4on*x10*x85*x102 + -pk2CaMKon*x11*x19*x33 + pkK2Con*x12*x27*x60 + pkK2Non*x12*x31*x45 + -pk2CaMKon*x14*x19*x33 + -pk2CaMKon*x17*x19*x33 + -pk2CaMKon*x19*x22*x33 + -pk2CaMKon*x19*x25*x33 + -pk2CaMKon*x19*x27*x33 + -pk2CaMKon*x19*x29*x33 + -pk2CaMKon*x19*x31*x33 + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x33*x44) + -2*(pk2CaMKon*x19*x33*x33) + pk2CaMKoff*x21*x34 + pk2CaMKoff*x21*x53 + pk2CaMKoff*x21*x59 + pk2CaMKoff*x21*x66 + pk2CaMKoff*x21*x70 + pk2CaMKoff*x21*x73 + pk2CaMKoff*x21*x75 + pk2CaMKoff*x21*x76 + 2*(pk2CaMKoff*x21*x120) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x121 + -pkK2Noff*x33*x46 + -pkK2Coff*x33*x61 + -pkCaM4off*x33*x103 + pkpCaM0*x34*x43 + pkpCaM1N*x35*x53 + pkpCaM2N*x36*x59 + pkpCaM1C*x37*x66 + pkpCaM1C1N*x38*x70 + pkpCaM1C2N*x39*x73 + pkpCaM2C*x40*x75 + pkpCaM2C1N*x41*x76 + pkpCaM4*x42*x120,
pk2CaMKon*x11*x19*x33 + -pk2CaMKoff*x21*x34 + -pkpCaM4*x34*x42 + -pkpCaM0*x34*x43,
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
-((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x11*x19*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x14*x19*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x17*x19*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x22*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x25*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x27*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x29*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x31*x44) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x33*x44) + pkpCaM1N*x20*x35 + pkpCaM0*x20*x43 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x105 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x107 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x109 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x111 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x113 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x115 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x117 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x119 + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x121 + pkpCaM2N*x23*x36 + pkpCaM0*x23*x43 + pkpCaM1C*x24*x37 + pkpCaM0*x24*x43 + pkpCaM1C1N*x26*x38 + pkpCaM0*x26*x43 + pkpCaM1C2N*x28*x39 + pkpCaM0*x28*x43 + pkpCaM2C*x30*x40 + pkpCaM0*x30*x43 + pkpCaM2C1N*x32*x41 + pkpCaM0*x32*x43 + pkpCaM4*x34*x42 + pkpCaM0*x34*x43 + pkpCaM1N*x35*x47 + pkpCaM1N*x35*x48 + pkpCaM1N*x35*x49 + pkpCaM1N*x35*x50 + pkpCaM1N*x35*x51 + pkpCaM1N*x35*x52 + pkpCaM1N*x35*x53 + pkpCaM1N*x35*x108 + 2*((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*x35*x109) + pkpCaM2N*x36*x47 + pkpCaM2N*x36*x54 + pkpCaM2N*x36*x55 + pkpCaM2N*x36*x56 + pkpCaM2N*x36*x57 + pkpCaM2N*x36*x58 + pkpCaM2N*x36*x59 + pkpCaM2N*x36*x110 + 2*((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*x36*x111) + pkpCaM1C*x37*x48 + pkpCaM1C*x37*x54 + pkpCaM1C*x37*x62 + pkpCaM1C*x37*x63 + pkpCaM1C*x37*x64 + pkpCaM1C*x37*x65 + pkpCaM1C*x37*x66 + pkpCaM1C*x37*x106 + 2*((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*x37*x107) + pkpCaM1C1N*x38*x49 + pkpCaM1C1N*x38*x55 + pkpCaM1C1N*x38*x62 + pkpCaM1C1N*x38*x67 + pkpCaM1C1N*x38*x68 + pkpCaM1C1N*x38*x69 + pkpCaM1C1N*x38*x70 + pkpCaM1C1N*x38*x112 + 2*((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*x38*x113) + pkpCaM1C2N*x39*x50 + pkpCaM1C2N*x39*x56 + pkpCaM1C2N*x39*x63 + pkpCaM1C2N*x39*x67 + pkpCaM1C2N*x39*x71 + pkpCaM1C2N*x39*x72 + pkpCaM1C2N*x39*x73 + pkpCaM1C2N*x39*x114 + 2*((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*x39*x115) + pkpCaM2C*x40*x51 + pkpCaM2C*x40*x57 + pkpCaM2C*x40*x64 + pkpCaM2C*x40*x68 + pkpCaM2C*x40*x71 + pkpCaM2C*x40*x74 + pkpCaM2C*x40*x75 + pkpCaM2C*x40*x116 + 2*((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*x40*x117) + pkpCaM2C1N*x41*x52 + pkpCaM2C1N*x41*x58 + pkpCaM2C1N*x41*x65 + pkpCaM2C1N*x41*x69 + pkpCaM2C1N*x41*x72 + pkpCaM2C1N*x41*x74 + pkpCaM2C1N*x41*x76 + pkpCaM2C1N*x41*x118 + 2*((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*x41*x119) + pkpCaM4*x42*x53 + pkpCaM4*x42*x59 + pkpCaM4*x42*x66 + pkpCaM4*x42*x70 + pkpCaM4*x42*x73 + pkpCaM4*x42*x75 + pkpCaM4*x42*x76 + pkpCaM4*x42*x120 + 2*((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*x42*x121) + pkpCaM0*x43*x104 + 2*((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*x43*x105),
R(0),
R(0),
pk2CaMKon*x17*x19*x22 + -pk2CaMKoff*x21*x47 + -pkpCaM1N*x35*x47 + -pkpCaM2N*x36*x47,
pk2CaMKon*x14*x17*x19 + -pk2CaMKoff*x21*x48 + -pkpCaM1N*x35*x48 + -pkpCaM1C*x37*x48,
pk2CaMKon*x17*x19*x25 + -pk2CaMKoff*x21*x49 + -pkpCaM1N*x35*x49 + -pkpCaM1C1N*x38*x49,
pk2CaMKon*x17*x19*x27 + -pk2CaMKoff*x21*x50 + -pkpCaM1N*x35*x50 + -pkpCaM1C2N*x39*x50,
pk2CaMKon*x17*x19*x29 + -pk2CaMKoff*x21*x51 + -pkpCaM1N*x35*x51 + -pkpCaM2C*x40*x51,
pk2CaMKon*x17*x19*x31 + -pk2CaMKoff*x21*x52 + -pkpCaM1N*x35*x52 + -pkpCaM2C1N*x41*x52,
pk2CaMKon*x17*x19*x33 + -pk2CaMKoff*x21*x53 + -pkpCaM1N*x35*x53 + -pkpCaM4*x42*x53,
pk2CaMKon*x14*x19*x22 + -pk2CaMKoff*x21*x54 + -pkpCaM2N*x36*x54 + -pkpCaM1C*x37*x54,
pk2CaMKon*x19*x22*x25 + -pk2CaMKoff*x21*x55 + -pkpCaM2N*x36*x55 + -pkpCaM1C1N*x38*x55,
pk2CaMKon*x19*x22*x27 + -pk2CaMKoff*x21*x56 + -pkpCaM2N*x36*x56 + -pkpCaM1C2N*x39*x56,
pk2CaMKon*x19*x22*x29 + -pk2CaMKoff*x21*x57 + -pkpCaM2N*x36*x57 + -pkpCaM2C*x40*x57,
pk2CaMKon*x19*x22*x31 + -pk2CaMKoff*x21*x58 + -pkpCaM2N*x36*x58 + -pkpCaM2C1N*x41*x58,
pk2CaMKon*x19*x22*x33 + -pk2CaMKoff*x21*x59 + -pkpCaM2N*x36*x59 + -pkpCaM4*x42*x59,
R(0),
R(0),
pk2CaMKon*x14*x19*x25 + -pk2CaMKoff*x21*x62 + -pkpCaM1C*x37*x62 + -pkpCaM1C1N*x38*x62,
pk2CaMKon*x14*x19*x27 + -pk2CaMKoff*x21*x63 + -pkpCaM1C*x37*x63 + -pkpCaM1C2N*x39*x63,
pk2CaMKon*x14*x19*x29 + -pk2CaMKoff*x21*x64 + -pkpCaM1C*x37*x64 + -pkpCaM2C*x40*x64,
pk2CaMKon*x14*x19*x31 + -pk2CaMKoff*x21*x65 + -pkpCaM1C*x37*x65 + -pkpCaM2C1N*x41*x65,
pk2CaMKon*x14*x19*x33 + -pk2CaMKoff*x21*x66 + -pkpCaM1C*x37*x66 + -pkpCaM4*x42*x66,
pk2CaMKon*x19*x25*x27 + -pk2CaMKoff*x21*x67 + -pkpCaM1C1N*x38*x67 + -pkpCaM1C2N*x39*x67,
pk2CaMKon*x19*x25*x29 + -pk2CaMKoff*x21*x68 + -pkpCaM1C1N*x38*x68 + -pkpCaM2C*x40*x68,
pk2CaMKon*x19*x25*x31 + -pk2CaMKoff*x21*x69 + -pkpCaM1C1N*x38*x69 + -pkpCaM2C1N*x41*x69,
pk2CaMKon*x19*x25*x33 + -pk2CaMKoff*x21*x70 + -pkpCaM1C1N*x38*x70 + -pkpCaM4*x42*x70,
pk2CaMKon*x19*x27*x29 + -pk2CaMKoff*x21*x71 + -pkpCaM1C2N*x39*x71 + -pkpCaM2C*x40*x71,
pk2CaMKon*x19*x27*x31 + -pk2CaMKoff*x21*x72 + -pkpCaM1C2N*x39*x72 + -pkpCaM2C1N*x41*x72,
pk2CaMKon*x19*x27*x33 + -pk2CaMKoff*x21*x73 + -pkpCaM1C2N*x39*x73 + -pkpCaM4*x42*x73,
pk2CaMKon*x19*x29*x31 + -pk2CaMKoff*x21*x74 + -pkpCaM2C*x40*x74 + -pkpCaM2C1N*x41*x74,
pk2CaMKon*x19*x29*x33 + -pk2CaMKoff*x21*x75 + -pkpCaM2C*x40*x75 + -pkpCaM4*x42*x75,
pk2CaMKon*x19*x31*x33 + -pk2CaMKoff*x21*x76 + -pkpCaM2C1N*x41*x76 + -pkpCaM4*x42*x76,
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
R(0),
-pkCaM0on*x2*x85*x86 + -pkCaM1Non*x3*x85*x88 + -pkCaM2Non*x4*x85*x90 + -pkCaM1Con*x5*x85*x92 + -pkCaM1C1Non*x6*x85*x94 + -pkCaM1C2Non*x7*x85*x96 + -pkCaM2Con*x8*x85*x98 + -pkCaM2C1Non*x9*x85*x100 + -pkCaM4on*x10*x85*x102 + pkCaM0off*x11*x87 + pkCaM1Coff*x14*x93 + pkCaM1Noff*x17*x89 + pkCaM2Noff*x22*x91 + pkCaM1C1Noff*x25*x95 + pkCaM1C2Noff*x27*x97 + pkCaM2Coff*x29*x99 + pkCaM2C1Noff*x31*x101 + pkCaM4off*x33*x103,
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
pk2CaMKon*x11*x11*x19 + -pk2CaMKoff*x21*x104 + -pkpCaM0*x43*x104,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x11*x19*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x105) + -((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*x43*x105),
pk2CaMKon*x14*x14*x19 + -pk2CaMKoff*x21*x106 + -pkpCaM1C*x37*x106,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x14*x19*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x107) + -((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*x37*x107),
pk2CaMKon*x17*x17*x19 + -pk2CaMKoff*x21*x108 + -pkpCaM1N*x35*x108,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x17*x19*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x109) + -((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*x35*x109),
pk2CaMKon*x19*x22*x22 + -pk2CaMKoff*x21*x110 + -pkpCaM2N*x36*x110,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x22*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x111) + -((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*x36*x111),
pk2CaMKon*x19*x25*x25 + -pk2CaMKoff*x21*x112 + -pkpCaM1C1N*x38*x112,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x25*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x113) + -((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*x38*x113),
pk2CaMKon*x19*x27*x27 + -pk2CaMKoff*x21*x114 + -pkpCaM1C2N*x39*x114,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x27*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x115) + -((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*x39*x115),
pk2CaMKon*x19*x29*x29 + -pk2CaMKoff*x21*x116 + -pkpCaM2C*x40*x116,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x29*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x117) + -((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*x40*x117),
pk2CaMKon*x19*x31*x31 + -pk2CaMKoff*x21*x118 + -pkpCaM2C1N*x41*x118,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x31*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x119) + -((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*x41*x119),
pk2CaMKon*x19*x33*x33 + -pk2CaMKoff*x21*x120 + -pkpCaM4*x42*x120,
(((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*x19*x33*x44 + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*x21*x121) + -((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*x42*x121),
]

result = aggregate(polys, [x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10])
print("Total for MODEL1001150000_FE_pKCaMcurry, preserving CaM block, is " + str(len(result)))
