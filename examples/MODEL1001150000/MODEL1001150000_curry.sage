load("aggregation.sage")
#MODEL1001150000_curry

R = PolynomialRing(QQ, 'x', 203)
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48, x49, x50, x51, x52, x53, x54, x55, x56, x57, x58, x59, x60, x61, x62, x63, x64, x65, x66, x67, x68, x69, x70, x71, x72, x73, x74, x75, x76, x77, x78, x79, x80, x81, x82, x83, x84, x85, x86, x87, x88, x89, x90, x91, x92, x93, x94, x95, x96, x97, x98, x99, x100, x101, x102, x103, x104, x105, x106, x107, x108, x109, x110, x111, x112, x113, x114, x115, x116, x117, x118, x119, x120, x121, x122, x123, x124, x125, x126, x127, x128, x129, x130, x131, x132, x133, x134, x135, x136, x137, x138, x139, x140, x141, x142, x143, x144, x145, x146, x147, x148, x149, x150, x151, x152, x153, x154, x155, x156, x157, x158, x159, x160, x161, x162, x163, x164, x165, x166, x167, x168, x169, x170, x171, x172, x173, x174, x175, x176, x177, x178, x179, x180, x181, x182, x183, x184, x185, x186, x187, x188, x189, x190, x191, x192, x193, x194, x195, x196, x197, x198, x199, x200, x201, x202, x203, = R.gens()
print("Example MODEL1001150000_curry")
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
-pk1Con*x1*x155*x156 + pk1Coff*x4*x157 + pk1Non*x153*x155*x160 + -pk1Noff*x1*x161 + -pk2Non*x1*x155*x162 + pk2Noff*x2*x163 + -pkCaM1Non*x1*x154*x184 + pkCaM1Noff*x10*x185,
-pk1Con*x2*x155*x156 + pk1Coff*x5*x157 + pk2Non*x1*x155*x162 + -pk2Noff*x2*x163 + -pkCaM2Non*x2*x154*x188 + pkCaM2Noff*x11*x189,
pk1Con*x153*x155*x156 + -pk1Coff*x3*x157 + -pk2Con*x3*x155*x158 + pk2Coff*x6*x159 + -pk1Non*x3*x155*x160 + pk1Noff*x4*x161 + -pkCaM1Con*x3*x154*x174 + pkCaM1Coff*x12*x175,
pk1Con*x1*x155*x156 + -pk1Coff*x4*x157 + -pk2Con*x4*x155*x158 + pk2Coff*x7*x159 + pk1Non*x3*x155*x160 + -pk1Noff*x4*x161 + -pk2Non*x4*x155*x162 + pk2Noff*x5*x163 + -pkCaM1C1Non*x4*x154*x180 + pkCaM1C1Noff*x13*x181,
pk1Con*x2*x155*x156 + -pk1Coff*x5*x157 + -pk2Con*x5*x155*x158 + pk2Coff*x8*x159 + pk2Non*x4*x155*x162 + -pk2Noff*x5*x163 + -pkCaM1C2Non*x5*x154*x186 + pkCaM1C2Noff*x14*x187,
pk2Con*x3*x155*x158 + -pk2Coff*x6*x159 + -pk1Non*x6*x155*x160 + pk1Noff*x7*x161 + -pkCaM2Con*x6*x154*x176 + pkCaM2Coff*x15*x177,
pk2Con*x4*x155*x158 + -pk2Coff*x7*x159 + pk1Non*x6*x155*x160 + -pk1Noff*x7*x161 + -pk2Non*x7*x155*x162 + pk2Noff*x8*x163 + -pkCaM2C1Non*x7*x154*x178 + pkCaM2C1Noff*x16*x179,
pk2Con*x5*x155*x158 + -pk2Coff*x8*x159 + pk2Non*x7*x155*x162 + -pk2Noff*x8*x163 + -pkCaM4on*x8*x154*x182 + pkCaM4off*x17*x183,
-pkK1Con*x9*x155*x164 + pkK1Coff*x12*x165 + -pkK1Non*x9*x155*x168 + pkK1Noff*x10*x169 + pkCaM0on*x153*x154*x172 + -pkCaM0off*x9*x173 + -pk2CaMKon*x9*x10*x190 + pk2CaMKoff*x18*x191 + -pk2CaMKon*x9*x11*x190 + pk2CaMKoff*x19*x191 + -pk2CaMKon*x9*x12*x190 + pk2CaMKoff*x20*x191 + -pk2CaMKon*x9*x13*x190 + pk2CaMKoff*x21*x191 + -pk2CaMKon*x9*x14*x190 + pk2CaMKoff*x22*x191 + -pk2CaMKon*x9*x15*x190 + pk2CaMKoff*x23*x191 + -pk2CaMKon*x9*x16*x190 + pk2CaMKoff*x24*x191 + -pk2CaMKon*x9*x17*x190 + pk2CaMKoff*x25*x191 + -2*(pk2CaMKon*x9*x9*x190) + 2*(pk2CaMKoff*x54*x191) + pkpCaM1N*x18*x198 + pkpCaM2N*x19*x200 + pkpCaM1C*x20*x193 + pkpCaM1C1N*x21*x196 + pkpCaM1C2N*x22*x199 + pkpCaM2C*x23*x194 + pkpCaM2C1N*x24*x195 + pkpCaM4*x25*x197 + pkpCaM0*x54*x192 + -pk2CaMKon*x9*x63*x190 + pk2CaMKoff*x72*x191 + -pk2CaMKon*x9*x64*x190 + pk2CaMKoff*x81*x191 + -pk2CaMKon*x9*x65*x190 + pk2CaMKoff*x90*x191 + -pk2CaMKon*x9*x66*x190 + pk2CaMKoff*x99*x191 + -pk2CaMKon*x9*x67*x190 + pk2CaMKoff*x108*x191 + -pk2CaMKon*x9*x68*x190 + pk2CaMKoff*x117*x191 + -pk2CaMKon*x9*x69*x190 + pk2CaMKoff*x126*x191 + -pk2CaMKon*x9*x70*x190 + pk2CaMKoff*x135*x191 + -pk2CaMKon*x9*x71*x190 + pk2CaMKoff*x144*x191,
-pkK1Con*x10*x155*x164 + pkK1Coff*x13*x165 + pkK1Non*x9*x155*x168 + -pkK1Noff*x10*x169 + -pkK2Non*x10*x155*x170 + pkK2Noff*x11*x171 + pkCaM1Non*x1*x154*x184 + -pkCaM1Noff*x10*x185 + -pk2CaMKon*x9*x10*x190 + pk2CaMKoff*x18*x191 + -pk2CaMKon*x10*x11*x190 + pk2CaMKoff*x26*x191 + -pk2CaMKon*x10*x12*x190 + pk2CaMKoff*x27*x191 + -pk2CaMKon*x10*x13*x190 + pk2CaMKoff*x28*x191 + -pk2CaMKon*x10*x14*x190 + pk2CaMKoff*x29*x191 + -pk2CaMKon*x10*x15*x190 + pk2CaMKoff*x30*x191 + -pk2CaMKon*x10*x16*x190 + pk2CaMKoff*x31*x191 + -pk2CaMKon*x10*x17*x190 + pk2CaMKoff*x32*x191 + -2*(pk2CaMKon*x10*x10*x190) + 2*(pk2CaMKoff*x55*x191) + pkpCaM0*x18*x192 + pkpCaM2N*x26*x200 + pkpCaM1C*x27*x193 + pkpCaM1C1N*x28*x196 + pkpCaM1C2N*x29*x199 + pkpCaM2C*x30*x194 + pkpCaM2C1N*x31*x195 + pkpCaM4*x32*x197 + pkpCaM1N*x55*x198 + -pk2CaMKon*x10*x63*x190 + pk2CaMKoff*x73*x191 + -pk2CaMKon*x10*x64*x190 + pk2CaMKoff*x82*x191 + -pk2CaMKon*x10*x65*x190 + pk2CaMKoff*x91*x191 + -pk2CaMKon*x10*x66*x190 + pk2CaMKoff*x100*x191 + -pk2CaMKon*x10*x67*x190 + pk2CaMKoff*x109*x191 + -pk2CaMKon*x10*x68*x190 + pk2CaMKoff*x118*x191 + -pk2CaMKon*x10*x69*x190 + pk2CaMKoff*x127*x191 + -pk2CaMKon*x10*x70*x190 + pk2CaMKoff*x136*x191 + -pk2CaMKon*x10*x71*x190 + pk2CaMKoff*x145*x191,
-pkK1Con*x11*x155*x164 + pkK1Coff*x14*x165 + pkK2Non*x10*x155*x170 + -pkK2Noff*x11*x171 + pkCaM2Non*x2*x154*x188 + -pkCaM2Noff*x11*x189 + -pk2CaMKon*x9*x11*x190 + pk2CaMKoff*x19*x191 + -pk2CaMKon*x10*x11*x190 + pk2CaMKoff*x26*x191 + -pk2CaMKon*x11*x12*x190 + pk2CaMKoff*x33*x191 + -pk2CaMKon*x11*x13*x190 + pk2CaMKoff*x34*x191 + -pk2CaMKon*x11*x14*x190 + pk2CaMKoff*x35*x191 + -pk2CaMKon*x11*x15*x190 + pk2CaMKoff*x36*x191 + -pk2CaMKon*x11*x16*x190 + pk2CaMKoff*x37*x191 + -pk2CaMKon*x11*x17*x190 + pk2CaMKoff*x38*x191 + -2*(pk2CaMKon*x11*x11*x190) + 2*(pk2CaMKoff*x56*x191) + pkpCaM0*x19*x192 + pkpCaM1N*x26*x198 + pkpCaM1C*x33*x193 + pkpCaM1C1N*x34*x196 + pkpCaM1C2N*x35*x199 + pkpCaM2C*x36*x194 + pkpCaM2C1N*x37*x195 + pkpCaM4*x38*x197 + pkpCaM2N*x56*x200 + -pk2CaMKon*x11*x63*x190 + pk2CaMKoff*x74*x191 + -pk2CaMKon*x11*x64*x190 + pk2CaMKoff*x83*x191 + -pk2CaMKon*x11*x65*x190 + pk2CaMKoff*x92*x191 + -pk2CaMKon*x11*x66*x190 + pk2CaMKoff*x101*x191 + -pk2CaMKon*x11*x67*x190 + pk2CaMKoff*x110*x191 + -pk2CaMKon*x11*x68*x190 + pk2CaMKoff*x119*x191 + -pk2CaMKon*x11*x69*x190 + pk2CaMKoff*x128*x191 + -pk2CaMKon*x11*x70*x190 + pk2CaMKoff*x137*x191 + -pk2CaMKon*x11*x71*x190 + pk2CaMKoff*x146*x191,
pkK1Con*x9*x155*x164 + -pkK1Coff*x12*x165 + -pkK2Con*x12*x155*x166 + pkK2Coff*x15*x167 + -pkK1Non*x12*x155*x168 + pkK1Noff*x13*x169 + pkCaM1Con*x3*x154*x174 + -pkCaM1Coff*x12*x175 + -pk2CaMKon*x9*x12*x190 + pk2CaMKoff*x20*x191 + -pk2CaMKon*x10*x12*x190 + pk2CaMKoff*x27*x191 + -pk2CaMKon*x11*x12*x190 + pk2CaMKoff*x33*x191 + -pk2CaMKon*x12*x13*x190 + pk2CaMKoff*x39*x191 + -pk2CaMKon*x12*x14*x190 + pk2CaMKoff*x40*x191 + -pk2CaMKon*x12*x15*x190 + pk2CaMKoff*x41*x191 + -pk2CaMKon*x12*x16*x190 + pk2CaMKoff*x42*x191 + -pk2CaMKon*x12*x17*x190 + pk2CaMKoff*x43*x191 + -2*(pk2CaMKon*x12*x12*x190) + 2*(pk2CaMKoff*x57*x191) + pkpCaM0*x20*x192 + pkpCaM1N*x27*x198 + pkpCaM2N*x33*x200 + pkpCaM1C1N*x39*x196 + pkpCaM1C2N*x40*x199 + pkpCaM2C*x41*x194 + pkpCaM2C1N*x42*x195 + pkpCaM4*x43*x197 + pkpCaM1C*x57*x193 + -pk2CaMKon*x12*x63*x190 + pk2CaMKoff*x75*x191 + -pk2CaMKon*x12*x64*x190 + pk2CaMKoff*x84*x191 + -pk2CaMKon*x12*x65*x190 + pk2CaMKoff*x93*x191 + -pk2CaMKon*x12*x66*x190 + pk2CaMKoff*x102*x191 + -pk2CaMKon*x12*x67*x190 + pk2CaMKoff*x111*x191 + -pk2CaMKon*x12*x68*x190 + pk2CaMKoff*x120*x191 + -pk2CaMKon*x12*x69*x190 + pk2CaMKoff*x129*x191 + -pk2CaMKon*x12*x70*x190 + pk2CaMKoff*x138*x191 + -pk2CaMKon*x12*x71*x190 + pk2CaMKoff*x147*x191,
pkK1Con*x10*x155*x164 + -pkK1Coff*x13*x165 + -pkK2Con*x13*x155*x166 + pkK2Coff*x16*x167 + pkK1Non*x12*x155*x168 + -pkK1Noff*x13*x169 + -pkK2Non*x13*x155*x170 + pkK2Noff*x14*x171 + pkCaM1C1Non*x4*x154*x180 + -pkCaM1C1Noff*x13*x181 + -pk2CaMKon*x9*x13*x190 + pk2CaMKoff*x21*x191 + -pk2CaMKon*x10*x13*x190 + pk2CaMKoff*x28*x191 + -pk2CaMKon*x11*x13*x190 + pk2CaMKoff*x34*x191 + -pk2CaMKon*x12*x13*x190 + pk2CaMKoff*x39*x191 + -pk2CaMKon*x13*x14*x190 + pk2CaMKoff*x44*x191 + -pk2CaMKon*x13*x15*x190 + pk2CaMKoff*x45*x191 + -pk2CaMKon*x13*x16*x190 + pk2CaMKoff*x46*x191 + -pk2CaMKon*x13*x17*x190 + pk2CaMKoff*x47*x191 + -2*(pk2CaMKon*x13*x13*x190) + 2*(pk2CaMKoff*x58*x191) + pkpCaM0*x21*x192 + pkpCaM1N*x28*x198 + pkpCaM2N*x34*x200 + pkpCaM1C*x39*x193 + pkpCaM1C2N*x44*x199 + pkpCaM2C*x45*x194 + pkpCaM2C1N*x46*x195 + pkpCaM4*x47*x197 + pkpCaM1C1N*x58*x196 + -pk2CaMKon*x13*x63*x190 + pk2CaMKoff*x76*x191 + -pk2CaMKon*x13*x64*x190 + pk2CaMKoff*x85*x191 + -pk2CaMKon*x13*x65*x190 + pk2CaMKoff*x94*x191 + -pk2CaMKon*x13*x66*x190 + pk2CaMKoff*x103*x191 + -pk2CaMKon*x13*x67*x190 + pk2CaMKoff*x112*x191 + -pk2CaMKon*x13*x68*x190 + pk2CaMKoff*x121*x191 + -pk2CaMKon*x13*x69*x190 + pk2CaMKoff*x130*x191 + -pk2CaMKon*x13*x70*x190 + pk2CaMKoff*x139*x191 + -pk2CaMKon*x13*x71*x190 + pk2CaMKoff*x148*x191,
pkK1Con*x11*x155*x164 + -pkK1Coff*x14*x165 + -pkK2Con*x14*x155*x166 + pkK2Coff*x17*x167 + pkK2Non*x13*x155*x170 + -pkK2Noff*x14*x171 + pkCaM1C2Non*x5*x154*x186 + -pkCaM1C2Noff*x14*x187 + -pk2CaMKon*x9*x14*x190 + pk2CaMKoff*x22*x191 + -pk2CaMKon*x10*x14*x190 + pk2CaMKoff*x29*x191 + -pk2CaMKon*x11*x14*x190 + pk2CaMKoff*x35*x191 + -pk2CaMKon*x12*x14*x190 + pk2CaMKoff*x40*x191 + -pk2CaMKon*x13*x14*x190 + pk2CaMKoff*x44*x191 + -pk2CaMKon*x14*x15*x190 + pk2CaMKoff*x48*x191 + -pk2CaMKon*x14*x16*x190 + pk2CaMKoff*x49*x191 + -pk2CaMKon*x14*x17*x190 + pk2CaMKoff*x50*x191 + -2*(pk2CaMKon*x14*x14*x190) + 2*(pk2CaMKoff*x59*x191) + pkpCaM0*x22*x192 + pkpCaM1N*x29*x198 + pkpCaM2N*x35*x200 + pkpCaM1C*x40*x193 + pkpCaM1C1N*x44*x196 + pkpCaM2C*x48*x194 + pkpCaM2C1N*x49*x195 + pkpCaM4*x50*x197 + pkpCaM1C2N*x59*x199 + -pk2CaMKon*x14*x63*x190 + pk2CaMKoff*x77*x191 + -pk2CaMKon*x14*x64*x190 + pk2CaMKoff*x86*x191 + -pk2CaMKon*x14*x65*x190 + pk2CaMKoff*x95*x191 + -pk2CaMKon*x14*x66*x190 + pk2CaMKoff*x104*x191 + -pk2CaMKon*x14*x67*x190 + pk2CaMKoff*x113*x191 + -pk2CaMKon*x14*x68*x190 + pk2CaMKoff*x122*x191 + -pk2CaMKon*x14*x69*x190 + pk2CaMKoff*x131*x191 + -pk2CaMKon*x14*x70*x190 + pk2CaMKoff*x140*x191 + -pk2CaMKon*x14*x71*x190 + pk2CaMKoff*x149*x191,
pkK2Con*x12*x155*x166 + -pkK2Coff*x15*x167 + -pkK1Non*x15*x155*x168 + pkK1Noff*x16*x169 + pkCaM2Con*x6*x154*x176 + -pkCaM2Coff*x15*x177 + -pk2CaMKon*x9*x15*x190 + pk2CaMKoff*x23*x191 + -pk2CaMKon*x10*x15*x190 + pk2CaMKoff*x30*x191 + -pk2CaMKon*x11*x15*x190 + pk2CaMKoff*x36*x191 + -pk2CaMKon*x12*x15*x190 + pk2CaMKoff*x41*x191 + -pk2CaMKon*x13*x15*x190 + pk2CaMKoff*x45*x191 + -pk2CaMKon*x14*x15*x190 + pk2CaMKoff*x48*x191 + -pk2CaMKon*x15*x16*x190 + pk2CaMKoff*x51*x191 + -pk2CaMKon*x15*x17*x190 + pk2CaMKoff*x52*x191 + -2*(pk2CaMKon*x15*x15*x190) + 2*(pk2CaMKoff*x60*x191) + pkpCaM0*x23*x192 + pkpCaM1N*x30*x198 + pkpCaM2N*x36*x200 + pkpCaM1C*x41*x193 + pkpCaM1C1N*x45*x196 + pkpCaM1C2N*x48*x199 + pkpCaM2C1N*x51*x195 + pkpCaM4*x52*x197 + pkpCaM2C*x60*x194 + -pk2CaMKon*x15*x63*x190 + pk2CaMKoff*x78*x191 + -pk2CaMKon*x15*x64*x190 + pk2CaMKoff*x87*x191 + -pk2CaMKon*x15*x65*x190 + pk2CaMKoff*x96*x191 + -pk2CaMKon*x15*x66*x190 + pk2CaMKoff*x105*x191 + -pk2CaMKon*x15*x67*x190 + pk2CaMKoff*x114*x191 + -pk2CaMKon*x15*x68*x190 + pk2CaMKoff*x123*x191 + -pk2CaMKon*x15*x69*x190 + pk2CaMKoff*x132*x191 + -pk2CaMKon*x15*x70*x190 + pk2CaMKoff*x141*x191 + -pk2CaMKon*x15*x71*x190 + pk2CaMKoff*x150*x191,
pkK2Con*x13*x155*x166 + -pkK2Coff*x16*x167 + pkK1Non*x15*x155*x168 + -pkK1Noff*x16*x169 + -pkK2Non*x16*x155*x170 + pkK2Noff*x17*x171 + pkCaM2C1Non*x7*x154*x178 + -pkCaM2C1Noff*x16*x179 + -pk2CaMKon*x9*x16*x190 + pk2CaMKoff*x24*x191 + -pk2CaMKon*x10*x16*x190 + pk2CaMKoff*x31*x191 + -pk2CaMKon*x11*x16*x190 + pk2CaMKoff*x37*x191 + -pk2CaMKon*x12*x16*x190 + pk2CaMKoff*x42*x191 + -pk2CaMKon*x13*x16*x190 + pk2CaMKoff*x46*x191 + -pk2CaMKon*x14*x16*x190 + pk2CaMKoff*x49*x191 + -pk2CaMKon*x15*x16*x190 + pk2CaMKoff*x51*x191 + -pk2CaMKon*x16*x17*x190 + pk2CaMKoff*x53*x191 + -2*(pk2CaMKon*x16*x16*x190) + 2*(pk2CaMKoff*x61*x191) + pkpCaM0*x24*x192 + pkpCaM1N*x31*x198 + pkpCaM2N*x37*x200 + pkpCaM1C*x42*x193 + pkpCaM1C1N*x46*x196 + pkpCaM1C2N*x49*x199 + pkpCaM2C*x51*x194 + pkpCaM4*x53*x197 + pkpCaM2C1N*x61*x195 + -pk2CaMKon*x16*x63*x190 + pk2CaMKoff*x79*x191 + -pk2CaMKon*x16*x64*x190 + pk2CaMKoff*x88*x191 + -pk2CaMKon*x16*x65*x190 + pk2CaMKoff*x97*x191 + -pk2CaMKon*x16*x66*x190 + pk2CaMKoff*x106*x191 + -pk2CaMKon*x16*x67*x190 + pk2CaMKoff*x115*x191 + -pk2CaMKon*x16*x68*x190 + pk2CaMKoff*x124*x191 + -pk2CaMKon*x16*x69*x190 + pk2CaMKoff*x133*x191 + -pk2CaMKon*x16*x70*x190 + pk2CaMKoff*x142*x191 + -pk2CaMKon*x16*x71*x190 + pk2CaMKoff*x151*x191,
pkK2Con*x14*x155*x166 + -pkK2Coff*x17*x167 + pkK2Non*x16*x155*x170 + -pkK2Noff*x17*x171 + pkCaM4on*x8*x154*x182 + -pkCaM4off*x17*x183 + -pk2CaMKon*x9*x17*x190 + pk2CaMKoff*x25*x191 + -pk2CaMKon*x10*x17*x190 + pk2CaMKoff*x32*x191 + -pk2CaMKon*x11*x17*x190 + pk2CaMKoff*x38*x191 + -pk2CaMKon*x12*x17*x190 + pk2CaMKoff*x43*x191 + -pk2CaMKon*x13*x17*x190 + pk2CaMKoff*x47*x191 + -pk2CaMKon*x14*x17*x190 + pk2CaMKoff*x50*x191 + -pk2CaMKon*x15*x17*x190 + pk2CaMKoff*x52*x191 + -pk2CaMKon*x16*x17*x190 + pk2CaMKoff*x53*x191 + -2*(pk2CaMKon*x17*x17*x190) + 2*(pk2CaMKoff*x62*x191) + pkpCaM0*x25*x192 + pkpCaM1N*x32*x198 + pkpCaM2N*x38*x200 + pkpCaM1C*x43*x193 + pkpCaM1C1N*x47*x196 + pkpCaM1C2N*x50*x199 + pkpCaM2C*x52*x194 + pkpCaM2C1N*x53*x195 + pkpCaM4*x62*x197 + -pk2CaMKon*x17*x63*x190 + pk2CaMKoff*x80*x191 + -pk2CaMKon*x17*x64*x190 + pk2CaMKoff*x89*x191 + -pk2CaMKon*x17*x65*x190 + pk2CaMKoff*x98*x191 + -pk2CaMKon*x17*x66*x190 + pk2CaMKoff*x107*x191 + -pk2CaMKon*x17*x67*x190 + pk2CaMKoff*x116*x191 + -pk2CaMKon*x17*x68*x190 + pk2CaMKoff*x125*x191 + -pk2CaMKon*x17*x69*x190 + pk2CaMKoff*x134*x191 + -pk2CaMKon*x17*x70*x190 + pk2CaMKoff*x143*x191 + -pk2CaMKon*x17*x71*x190 + pk2CaMKoff*x152*x191,
pk2CaMKon*x9*x10*x190 + -pk2CaMKoff*x18*x191 + -pkpCaM0*x18*x192 + -pkpCaM1N*x18*x198,
pk2CaMKon*x9*x11*x190 + -pk2CaMKoff*x19*x191 + -pkpCaM0*x19*x192 + -pkpCaM2N*x19*x200,
pk2CaMKon*x9*x12*x190 + -pk2CaMKoff*x20*x191 + -pkpCaM0*x20*x192 + -pkpCaM1C*x20*x193,
pk2CaMKon*x9*x13*x190 + -pk2CaMKoff*x21*x191 + -pkpCaM0*x21*x192 + -pkpCaM1C1N*x21*x196,
pk2CaMKon*x9*x14*x190 + -pk2CaMKoff*x22*x191 + -pkpCaM0*x22*x192 + -pkpCaM1C2N*x22*x199,
pk2CaMKon*x9*x15*x190 + -pk2CaMKoff*x23*x191 + -pkpCaM0*x23*x192 + -pkpCaM2C*x23*x194,
pk2CaMKon*x9*x16*x190 + -pk2CaMKoff*x24*x191 + -pkpCaM0*x24*x192 + -pkpCaM2C1N*x24*x195,
pk2CaMKon*x9*x17*x190 + -pk2CaMKoff*x25*x191 + -pkpCaM0*x25*x192 + -pkpCaM4*x25*x197,
pk2CaMKon*x10*x11*x190 + -pk2CaMKoff*x26*x191 + -pkpCaM1N*x26*x198 + -pkpCaM2N*x26*x200,
pk2CaMKon*x10*x12*x190 + -pk2CaMKoff*x27*x191 + -pkpCaM1N*x27*x198 + -pkpCaM1C*x27*x193,
pk2CaMKon*x10*x13*x190 + -pk2CaMKoff*x28*x191 + -pkpCaM1N*x28*x198 + -pkpCaM1C1N*x28*x196,
pk2CaMKon*x10*x14*x190 + -pk2CaMKoff*x29*x191 + -pkpCaM1N*x29*x198 + -pkpCaM1C2N*x29*x199,
pk2CaMKon*x10*x15*x190 + -pk2CaMKoff*x30*x191 + -pkpCaM1N*x30*x198 + -pkpCaM2C*x30*x194,
pk2CaMKon*x10*x16*x190 + -pk2CaMKoff*x31*x191 + -pkpCaM1N*x31*x198 + -pkpCaM2C1N*x31*x195,
pk2CaMKon*x10*x17*x190 + -pk2CaMKoff*x32*x191 + -pkpCaM1N*x32*x198 + -pkpCaM4*x32*x197,
pk2CaMKon*x11*x12*x190 + -pk2CaMKoff*x33*x191 + -pkpCaM2N*x33*x200 + -pkpCaM1C*x33*x193,
pk2CaMKon*x11*x13*x190 + -pk2CaMKoff*x34*x191 + -pkpCaM2N*x34*x200 + -pkpCaM1C1N*x34*x196,
pk2CaMKon*x11*x14*x190 + -pk2CaMKoff*x35*x191 + -pkpCaM2N*x35*x200 + -pkpCaM1C2N*x35*x199,
pk2CaMKon*x11*x15*x190 + -pk2CaMKoff*x36*x191 + -pkpCaM2N*x36*x200 + -pkpCaM2C*x36*x194,
pk2CaMKon*x11*x16*x190 + -pk2CaMKoff*x37*x191 + -pkpCaM2N*x37*x200 + -pkpCaM2C1N*x37*x195,
pk2CaMKon*x11*x17*x190 + -pk2CaMKoff*x38*x191 + -pkpCaM2N*x38*x200 + -pkpCaM4*x38*x197,
pk2CaMKon*x12*x13*x190 + -pk2CaMKoff*x39*x191 + -pkpCaM1C*x39*x193 + -pkpCaM1C1N*x39*x196,
pk2CaMKon*x12*x14*x190 + -pk2CaMKoff*x40*x191 + -pkpCaM1C*x40*x193 + -pkpCaM1C2N*x40*x199,
pk2CaMKon*x12*x15*x190 + -pk2CaMKoff*x41*x191 + -pkpCaM1C*x41*x193 + -pkpCaM2C*x41*x194,
pk2CaMKon*x12*x16*x190 + -pk2CaMKoff*x42*x191 + -pkpCaM1C*x42*x193 + -pkpCaM2C1N*x42*x195,
pk2CaMKon*x12*x17*x190 + -pk2CaMKoff*x43*x191 + -pkpCaM1C*x43*x193 + -pkpCaM4*x43*x197,
pk2CaMKon*x13*x14*x190 + -pk2CaMKoff*x44*x191 + -pkpCaM1C1N*x44*x196 + -pkpCaM1C2N*x44*x199,
pk2CaMKon*x13*x15*x190 + -pk2CaMKoff*x45*x191 + -pkpCaM1C1N*x45*x196 + -pkpCaM2C*x45*x194,
pk2CaMKon*x13*x16*x190 + -pk2CaMKoff*x46*x191 + -pkpCaM1C1N*x46*x196 + -pkpCaM2C1N*x46*x195,
pk2CaMKon*x13*x17*x190 + -pk2CaMKoff*x47*x191 + -pkpCaM1C1N*x47*x196 + -pkpCaM4*x47*x197,
pk2CaMKon*x14*x15*x190 + -pk2CaMKoff*x48*x191 + -pkpCaM1C2N*x48*x199 + -pkpCaM2C*x48*x194,
pk2CaMKon*x14*x16*x190 + -pk2CaMKoff*x49*x191 + -pkpCaM1C2N*x49*x199 + -pkpCaM2C1N*x49*x195,
pk2CaMKon*x14*x17*x190 + -pk2CaMKoff*x50*x191 + -pkpCaM1C2N*x50*x199 + -pkpCaM4*x50*x197,
pk2CaMKon*x15*x16*x190 + -pk2CaMKoff*x51*x191 + -pkpCaM2C*x51*x194 + -pkpCaM2C1N*x51*x195,
pk2CaMKon*x15*x17*x190 + -pk2CaMKoff*x52*x191 + -pkpCaM2C*x52*x194 + -pkpCaM4*x52*x197,
pk2CaMKon*x16*x17*x190 + -pk2CaMKoff*x53*x191 + -pkpCaM2C1N*x53*x195 + -pkpCaM4*x53*x197,
pk2CaMKon*x9*x9*x190 + -pk2CaMKoff*x54*x191 + -pkpCaM0*x54*x192,
pk2CaMKon*x10*x10*x190 + -pk2CaMKoff*x55*x191 + -pkpCaM1N*x55*x198,
pk2CaMKon*x11*x11*x190 + -pk2CaMKoff*x56*x191 + -pkpCaM2N*x56*x200,
pk2CaMKon*x12*x12*x190 + -pk2CaMKoff*x57*x191 + -pkpCaM1C*x57*x193,
pk2CaMKon*x13*x13*x190 + -pk2CaMKoff*x58*x191 + -pkpCaM1C1N*x58*x196,
pk2CaMKon*x14*x14*x190 + -pk2CaMKoff*x59*x191 + -pkpCaM1C2N*x59*x199,
pk2CaMKon*x15*x15*x190 + -pk2CaMKoff*x60*x191 + -pkpCaM2C*x60*x194,
pk2CaMKon*x16*x16*x190 + -pk2CaMKoff*x61*x191 + -pkpCaM2C1N*x61*x195,
pk2CaMKon*x17*x17*x190 + -pk2CaMKoff*x62*x191 + -pkpCaM4*x62*x197,
pkpCaM0*x18*x192 + pkpCaM0*x19*x192 + pkpCaM0*x20*x192 + pkpCaM0*x21*x192 + pkpCaM0*x22*x192 + pkpCaM0*x23*x192 + pkpCaM0*x24*x192 + pkpCaM0*x25*x192 + pkpCaM0*x54*x192 + -pk2CaMKon*x9*x63*x190 + pk2CaMKoff*x72*x191 + -pk2CaMKon*x10*x63*x190 + pk2CaMKoff*x73*x191 + -pk2CaMKon*x11*x63*x190 + pk2CaMKoff*x74*x191 + -pk2CaMKon*x12*x63*x190 + pk2CaMKoff*x75*x191 + -pk2CaMKon*x13*x63*x190 + pk2CaMKoff*x76*x191 + -pk2CaMKon*x14*x63*x190 + pk2CaMKoff*x77*x191 + -pk2CaMKon*x15*x63*x190 + pk2CaMKoff*x78*x191 + -pk2CaMKon*x16*x63*x190 + pk2CaMKoff*x79*x191 + -pk2CaMKon*x17*x63*x190 + pk2CaMKoff*x80*x191 + 2*(pkpCaM0*x72*x192) + pkpCaM1N*x73*x198 + pkpCaM2N*x74*x200 + pkpCaM1C*x75*x193 + pkpCaM1C1N*x76*x196 + pkpCaM1C2N*x77*x199 + pkpCaM2C*x78*x194 + pkpCaM2C1N*x79*x195 + pkpCaM4*x80*x197 + pkpCaM0*x81*x192 + pkpCaM0*x90*x192 + pkpCaM0*x99*x192 + pkpCaM0*x108*x192 + pkpCaM0*x117*x192 + pkpCaM0*x126*x192 + pkpCaM0*x135*x192 + pkpCaM0*x144*x192,
pkpCaM1N*x18*x198 + pkpCaM1N*x26*x198 + pkpCaM1N*x27*x198 + pkpCaM1N*x28*x198 + pkpCaM1N*x29*x198 + pkpCaM1N*x30*x198 + pkpCaM1N*x31*x198 + pkpCaM1N*x32*x198 + pkpCaM1N*x55*x198 + -pk2CaMKon*x9*x64*x190 + pk2CaMKoff*x81*x191 + -pk2CaMKon*x10*x64*x190 + pk2CaMKoff*x82*x191 + -pk2CaMKon*x11*x64*x190 + pk2CaMKoff*x83*x191 + -pk2CaMKon*x12*x64*x190 + pk2CaMKoff*x84*x191 + -pk2CaMKon*x13*x64*x190 + pk2CaMKoff*x85*x191 + -pk2CaMKon*x14*x64*x190 + pk2CaMKoff*x86*x191 + -pk2CaMKon*x15*x64*x190 + pk2CaMKoff*x87*x191 + -pk2CaMKon*x16*x64*x190 + pk2CaMKoff*x88*x191 + -pk2CaMKon*x17*x64*x190 + pk2CaMKoff*x89*x191 + pkpCaM1N*x73*x198 + pkpCaM0*x81*x192 + 2*(pkpCaM1N*x82*x198) + pkpCaM2N*x83*x200 + pkpCaM1C*x84*x193 + pkpCaM1C1N*x85*x196 + pkpCaM1C2N*x86*x199 + pkpCaM2C*x87*x194 + pkpCaM2C1N*x88*x195 + pkpCaM4*x89*x197 + pkpCaM1N*x91*x198 + pkpCaM1N*x100*x198 + pkpCaM1N*x109*x198 + pkpCaM1N*x118*x198 + pkpCaM1N*x127*x198 + pkpCaM1N*x136*x198 + pkpCaM1N*x145*x198,
pkpCaM2N*x19*x200 + pkpCaM2N*x26*x200 + pkpCaM2N*x33*x200 + pkpCaM2N*x34*x200 + pkpCaM2N*x35*x200 + pkpCaM2N*x36*x200 + pkpCaM2N*x37*x200 + pkpCaM2N*x38*x200 + pkpCaM2N*x56*x200 + -pk2CaMKon*x9*x65*x190 + pk2CaMKoff*x90*x191 + -pk2CaMKon*x10*x65*x190 + pk2CaMKoff*x91*x191 + -pk2CaMKon*x11*x65*x190 + pk2CaMKoff*x92*x191 + -pk2CaMKon*x12*x65*x190 + pk2CaMKoff*x93*x191 + -pk2CaMKon*x13*x65*x190 + pk2CaMKoff*x94*x191 + -pk2CaMKon*x14*x65*x190 + pk2CaMKoff*x95*x191 + -pk2CaMKon*x15*x65*x190 + pk2CaMKoff*x96*x191 + -pk2CaMKon*x16*x65*x190 + pk2CaMKoff*x97*x191 + -pk2CaMKon*x17*x65*x190 + pk2CaMKoff*x98*x191 + pkpCaM2N*x74*x200 + pkpCaM2N*x83*x200 + pkpCaM0*x90*x192 + pkpCaM1N*x91*x198 + 2*(pkpCaM2N*x92*x200) + pkpCaM1C*x93*x193 + pkpCaM1C1N*x94*x196 + pkpCaM1C2N*x95*x199 + pkpCaM2C*x96*x194 + pkpCaM2C1N*x97*x195 + pkpCaM4*x98*x197 + pkpCaM2N*x101*x200 + pkpCaM2N*x110*x200 + pkpCaM2N*x119*x200 + pkpCaM2N*x128*x200 + pkpCaM2N*x137*x200 + pkpCaM2N*x146*x200,
pkpCaM1C*x20*x193 + pkpCaM1C*x27*x193 + pkpCaM1C*x33*x193 + pkpCaM1C*x39*x193 + pkpCaM1C*x40*x193 + pkpCaM1C*x41*x193 + pkpCaM1C*x42*x193 + pkpCaM1C*x43*x193 + pkpCaM1C*x57*x193 + -pk2CaMKon*x9*x66*x190 + pk2CaMKoff*x99*x191 + -pk2CaMKon*x10*x66*x190 + pk2CaMKoff*x100*x191 + -pk2CaMKon*x11*x66*x190 + pk2CaMKoff*x101*x191 + -pk2CaMKon*x12*x66*x190 + pk2CaMKoff*x102*x191 + -pk2CaMKon*x13*x66*x190 + pk2CaMKoff*x103*x191 + -pk2CaMKon*x14*x66*x190 + pk2CaMKoff*x104*x191 + -pk2CaMKon*x15*x66*x190 + pk2CaMKoff*x105*x191 + -pk2CaMKon*x16*x66*x190 + pk2CaMKoff*x106*x191 + -pk2CaMKon*x17*x66*x190 + pk2CaMKoff*x107*x191 + pkpCaM1C*x75*x193 + pkpCaM1C*x84*x193 + pkpCaM1C*x93*x193 + pkpCaM0*x99*x192 + pkpCaM1N*x100*x198 + pkpCaM2N*x101*x200 + 2*(pkpCaM1C*x102*x193) + pkpCaM1C1N*x103*x196 + pkpCaM1C2N*x104*x199 + pkpCaM2C*x105*x194 + pkpCaM2C1N*x106*x195 + pkpCaM4*x107*x197 + pkpCaM1C*x111*x193 + pkpCaM1C*x120*x193 + pkpCaM1C*x129*x193 + pkpCaM1C*x138*x193 + pkpCaM1C*x147*x193,
pkpCaM1C1N*x21*x196 + pkpCaM1C1N*x28*x196 + pkpCaM1C1N*x34*x196 + pkpCaM1C1N*x39*x196 + pkpCaM1C1N*x44*x196 + pkpCaM1C1N*x45*x196 + pkpCaM1C1N*x46*x196 + pkpCaM1C1N*x47*x196 + pkpCaM1C1N*x58*x196 + -pk2CaMKon*x9*x67*x190 + pk2CaMKoff*x108*x191 + -pk2CaMKon*x10*x67*x190 + pk2CaMKoff*x109*x191 + -pk2CaMKon*x11*x67*x190 + pk2CaMKoff*x110*x191 + -pk2CaMKon*x12*x67*x190 + pk2CaMKoff*x111*x191 + -pk2CaMKon*x13*x67*x190 + pk2CaMKoff*x112*x191 + -pk2CaMKon*x14*x67*x190 + pk2CaMKoff*x113*x191 + -pk2CaMKon*x15*x67*x190 + pk2CaMKoff*x114*x191 + -pk2CaMKon*x16*x67*x190 + pk2CaMKoff*x115*x191 + -pk2CaMKon*x17*x67*x190 + pk2CaMKoff*x116*x191 + pkpCaM1C1N*x76*x196 + pkpCaM1C1N*x85*x196 + pkpCaM1C1N*x94*x196 + pkpCaM1C1N*x103*x196 + pkpCaM0*x108*x192 + pkpCaM1N*x109*x198 + pkpCaM2N*x110*x200 + pkpCaM1C*x111*x193 + 2*(pkpCaM1C1N*x112*x196) + pkpCaM1C2N*x113*x199 + pkpCaM2C*x114*x194 + pkpCaM2C1N*x115*x195 + pkpCaM4*x116*x197 + pkpCaM1C1N*x121*x196 + pkpCaM1C1N*x130*x196 + pkpCaM1C1N*x139*x196 + pkpCaM1C1N*x148*x196,
pkpCaM1C2N*x22*x199 + pkpCaM1C2N*x29*x199 + pkpCaM1C2N*x35*x199 + pkpCaM1C2N*x40*x199 + pkpCaM1C2N*x44*x199 + pkpCaM1C2N*x48*x199 + pkpCaM1C2N*x49*x199 + pkpCaM1C2N*x50*x199 + pkpCaM1C2N*x59*x199 + -pk2CaMKon*x9*x68*x190 + pk2CaMKoff*x117*x191 + -pk2CaMKon*x10*x68*x190 + pk2CaMKoff*x118*x191 + -pk2CaMKon*x11*x68*x190 + pk2CaMKoff*x119*x191 + -pk2CaMKon*x12*x68*x190 + pk2CaMKoff*x120*x191 + -pk2CaMKon*x13*x68*x190 + pk2CaMKoff*x121*x191 + -pk2CaMKon*x14*x68*x190 + pk2CaMKoff*x122*x191 + -pk2CaMKon*x15*x68*x190 + pk2CaMKoff*x123*x191 + -pk2CaMKon*x16*x68*x190 + pk2CaMKoff*x124*x191 + -pk2CaMKon*x17*x68*x190 + pk2CaMKoff*x125*x191 + pkpCaM1C2N*x77*x199 + pkpCaM1C2N*x86*x199 + pkpCaM1C2N*x95*x199 + pkpCaM1C2N*x104*x199 + pkpCaM1C2N*x113*x199 + pkpCaM0*x117*x192 + pkpCaM1N*x118*x198 + pkpCaM2N*x119*x200 + pkpCaM1C*x120*x193 + pkpCaM1C1N*x121*x196 + 2*(pkpCaM1C2N*x122*x199) + pkpCaM2C*x123*x194 + pkpCaM2C1N*x124*x195 + pkpCaM4*x125*x197 + pkpCaM1C2N*x131*x199 + pkpCaM1C2N*x140*x199 + pkpCaM1C2N*x149*x199,
pkpCaM2C*x23*x194 + pkpCaM2C*x30*x194 + pkpCaM2C*x36*x194 + pkpCaM2C*x41*x194 + pkpCaM2C*x45*x194 + pkpCaM2C*x48*x194 + pkpCaM2C*x51*x194 + pkpCaM2C*x52*x194 + pkpCaM2C*x60*x194 + -pk2CaMKon*x9*x69*x190 + pk2CaMKoff*x126*x191 + -pk2CaMKon*x10*x69*x190 + pk2CaMKoff*x127*x191 + -pk2CaMKon*x11*x69*x190 + pk2CaMKoff*x128*x191 + -pk2CaMKon*x12*x69*x190 + pk2CaMKoff*x129*x191 + -pk2CaMKon*x13*x69*x190 + pk2CaMKoff*x130*x191 + -pk2CaMKon*x14*x69*x190 + pk2CaMKoff*x131*x191 + -pk2CaMKon*x15*x69*x190 + pk2CaMKoff*x132*x191 + -pk2CaMKon*x16*x69*x190 + pk2CaMKoff*x133*x191 + -pk2CaMKon*x17*x69*x190 + pk2CaMKoff*x134*x191 + pkpCaM2C*x78*x194 + pkpCaM2C*x87*x194 + pkpCaM2C*x96*x194 + pkpCaM2C*x105*x194 + pkpCaM2C*x114*x194 + pkpCaM2C*x123*x194 + pkpCaM0*x126*x192 + pkpCaM1N*x127*x198 + pkpCaM2N*x128*x200 + pkpCaM1C*x129*x193 + pkpCaM1C1N*x130*x196 + pkpCaM1C2N*x131*x199 + 2*(pkpCaM2C*x132*x194) + pkpCaM2C1N*x133*x195 + pkpCaM4*x134*x197 + pkpCaM2C*x141*x194 + pkpCaM2C*x150*x194,
pkpCaM2C1N*x24*x195 + pkpCaM2C1N*x31*x195 + pkpCaM2C1N*x37*x195 + pkpCaM2C1N*x42*x195 + pkpCaM2C1N*x46*x195 + pkpCaM2C1N*x49*x195 + pkpCaM2C1N*x51*x195 + pkpCaM2C1N*x53*x195 + pkpCaM2C1N*x61*x195 + -pk2CaMKon*x9*x70*x190 + pk2CaMKoff*x135*x191 + -pk2CaMKon*x10*x70*x190 + pk2CaMKoff*x136*x191 + -pk2CaMKon*x11*x70*x190 + pk2CaMKoff*x137*x191 + -pk2CaMKon*x12*x70*x190 + pk2CaMKoff*x138*x191 + -pk2CaMKon*x13*x70*x190 + pk2CaMKoff*x139*x191 + -pk2CaMKon*x14*x70*x190 + pk2CaMKoff*x140*x191 + -pk2CaMKon*x15*x70*x190 + pk2CaMKoff*x141*x191 + -pk2CaMKon*x16*x70*x190 + pk2CaMKoff*x142*x191 + -pk2CaMKon*x17*x70*x190 + pk2CaMKoff*x143*x191 + pkpCaM2C1N*x79*x195 + pkpCaM2C1N*x88*x195 + pkpCaM2C1N*x97*x195 + pkpCaM2C1N*x106*x195 + pkpCaM2C1N*x115*x195 + pkpCaM2C1N*x124*x195 + pkpCaM2C1N*x133*x195 + pkpCaM0*x135*x192 + pkpCaM1N*x136*x198 + pkpCaM2N*x137*x200 + pkpCaM1C*x138*x193 + pkpCaM1C1N*x139*x196 + pkpCaM1C2N*x140*x199 + pkpCaM2C*x141*x194 + 2*(pkpCaM2C1N*x142*x195) + pkpCaM4*x143*x197 + pkpCaM2C1N*x151*x195,
pkpCaM4*x25*x197 + pkpCaM4*x32*x197 + pkpCaM4*x38*x197 + pkpCaM4*x43*x197 + pkpCaM4*x47*x197 + pkpCaM4*x50*x197 + pkpCaM4*x52*x197 + pkpCaM4*x53*x197 + pkpCaM4*x62*x197 + -pk2CaMKon*x9*x71*x190 + pk2CaMKoff*x144*x191 + -pk2CaMKon*x10*x71*x190 + pk2CaMKoff*x145*x191 + -pk2CaMKon*x11*x71*x190 + pk2CaMKoff*x146*x191 + -pk2CaMKon*x12*x71*x190 + pk2CaMKoff*x147*x191 + -pk2CaMKon*x13*x71*x190 + pk2CaMKoff*x148*x191 + -pk2CaMKon*x14*x71*x190 + pk2CaMKoff*x149*x191 + -pk2CaMKon*x15*x71*x190 + pk2CaMKoff*x150*x191 + -pk2CaMKon*x16*x71*x190 + pk2CaMKoff*x151*x191 + -pk2CaMKon*x17*x71*x190 + pk2CaMKoff*x152*x191 + pkpCaM4*x80*x197 + pkpCaM4*x89*x197 + pkpCaM4*x98*x197 + pkpCaM4*x107*x197 + pkpCaM4*x116*x197 + pkpCaM4*x125*x197 + pkpCaM4*x134*x197 + pkpCaM4*x143*x197 + pkpCaM0*x144*x192 + pkpCaM1N*x145*x198 + pkpCaM2N*x146*x200 + pkpCaM1C*x147*x193 + pkpCaM1C1N*x148*x196 + pkpCaM1C2N*x149*x199 + pkpCaM2C*x150*x194 + pkpCaM2C1N*x151*x195 + 2*(pkpCaM4*x152*x197),
pk2CaMKon*x9*x63*x190 + -pk2CaMKoff*x72*x191 + -pkpCaM0*x72*x192,
pk2CaMKon*x10*x63*x190 + -pk2CaMKoff*x73*x191 + -pkpCaM1N*x73*x198,
pk2CaMKon*x11*x63*x190 + -pk2CaMKoff*x74*x191 + -pkpCaM2N*x74*x200,
pk2CaMKon*x12*x63*x190 + -pk2CaMKoff*x75*x191 + -pkpCaM1C*x75*x193,
pk2CaMKon*x13*x63*x190 + -pk2CaMKoff*x76*x191 + -pkpCaM1C1N*x76*x196,
pk2CaMKon*x14*x63*x190 + -pk2CaMKoff*x77*x191 + -pkpCaM1C2N*x77*x199,
pk2CaMKon*x15*x63*x190 + -pk2CaMKoff*x78*x191 + -pkpCaM2C*x78*x194,
pk2CaMKon*x16*x63*x190 + -pk2CaMKoff*x79*x191 + -pkpCaM2C1N*x79*x195,
pk2CaMKon*x17*x63*x190 + -pk2CaMKoff*x80*x191 + -pkpCaM4*x80*x197,
pk2CaMKon*x9*x64*x190 + -pk2CaMKoff*x81*x191 + -pkpCaM0*x81*x192,
pk2CaMKon*x10*x64*x190 + -pk2CaMKoff*x82*x191 + -pkpCaM1N*x82*x198,
pk2CaMKon*x11*x64*x190 + -pk2CaMKoff*x83*x191 + -pkpCaM2N*x83*x200,
pk2CaMKon*x12*x64*x190 + -pk2CaMKoff*x84*x191 + -pkpCaM1C*x84*x193,
pk2CaMKon*x13*x64*x190 + -pk2CaMKoff*x85*x191 + -pkpCaM1C1N*x85*x196,
pk2CaMKon*x14*x64*x190 + -pk2CaMKoff*x86*x191 + -pkpCaM1C2N*x86*x199,
pk2CaMKon*x15*x64*x190 + -pk2CaMKoff*x87*x191 + -pkpCaM2C*x87*x194,
pk2CaMKon*x16*x64*x190 + -pk2CaMKoff*x88*x191 + -pkpCaM2C1N*x88*x195,
pk2CaMKon*x17*x64*x190 + -pk2CaMKoff*x89*x191 + -pkpCaM4*x89*x197,
pk2CaMKon*x9*x65*x190 + -pk2CaMKoff*x90*x191 + -pkpCaM0*x90*x192,
pk2CaMKon*x10*x65*x190 + -pk2CaMKoff*x91*x191 + -pkpCaM1N*x91*x198,
pk2CaMKon*x11*x65*x190 + -pk2CaMKoff*x92*x191 + -pkpCaM2N*x92*x200,
pk2CaMKon*x12*x65*x190 + -pk2CaMKoff*x93*x191 + -pkpCaM1C*x93*x193,
pk2CaMKon*x13*x65*x190 + -pk2CaMKoff*x94*x191 + -pkpCaM1C1N*x94*x196,
pk2CaMKon*x14*x65*x190 + -pk2CaMKoff*x95*x191 + -pkpCaM1C2N*x95*x199,
pk2CaMKon*x15*x65*x190 + -pk2CaMKoff*x96*x191 + -pkpCaM2C*x96*x194,
pk2CaMKon*x16*x65*x190 + -pk2CaMKoff*x97*x191 + -pkpCaM2C1N*x97*x195,
pk2CaMKon*x17*x65*x190 + -pk2CaMKoff*x98*x191 + -pkpCaM4*x98*x197,
pk2CaMKon*x9*x66*x190 + -pk2CaMKoff*x99*x191 + -pkpCaM0*x99*x192,
pk2CaMKon*x10*x66*x190 + -pk2CaMKoff*x100*x191 + -pkpCaM1N*x100*x198,
pk2CaMKon*x11*x66*x190 + -pk2CaMKoff*x101*x191 + -pkpCaM2N*x101*x200,
pk2CaMKon*x12*x66*x190 + -pk2CaMKoff*x102*x191 + -pkpCaM1C*x102*x193,
pk2CaMKon*x13*x66*x190 + -pk2CaMKoff*x103*x191 + -pkpCaM1C1N*x103*x196,
pk2CaMKon*x14*x66*x190 + -pk2CaMKoff*x104*x191 + -pkpCaM1C2N*x104*x199,
pk2CaMKon*x15*x66*x190 + -pk2CaMKoff*x105*x191 + -pkpCaM2C*x105*x194,
pk2CaMKon*x16*x66*x190 + -pk2CaMKoff*x106*x191 + -pkpCaM2C1N*x106*x195,
pk2CaMKon*x17*x66*x190 + -pk2CaMKoff*x107*x191 + -pkpCaM4*x107*x197,
pk2CaMKon*x9*x67*x190 + -pk2CaMKoff*x108*x191 + -pkpCaM0*x108*x192,
pk2CaMKon*x10*x67*x190 + -pk2CaMKoff*x109*x191 + -pkpCaM1N*x109*x198,
pk2CaMKon*x11*x67*x190 + -pk2CaMKoff*x110*x191 + -pkpCaM2N*x110*x200,
pk2CaMKon*x12*x67*x190 + -pk2CaMKoff*x111*x191 + -pkpCaM1C*x111*x193,
pk2CaMKon*x13*x67*x190 + -pk2CaMKoff*x112*x191 + -pkpCaM1C1N*x112*x196,
pk2CaMKon*x14*x67*x190 + -pk2CaMKoff*x113*x191 + -pkpCaM1C2N*x113*x199,
pk2CaMKon*x15*x67*x190 + -pk2CaMKoff*x114*x191 + -pkpCaM2C*x114*x194,
pk2CaMKon*x16*x67*x190 + -pk2CaMKoff*x115*x191 + -pkpCaM2C1N*x115*x195,
pk2CaMKon*x17*x67*x190 + -pk2CaMKoff*x116*x191 + -pkpCaM4*x116*x197,
pk2CaMKon*x9*x68*x190 + -pk2CaMKoff*x117*x191 + -pkpCaM0*x117*x192,
pk2CaMKon*x10*x68*x190 + -pk2CaMKoff*x118*x191 + -pkpCaM1N*x118*x198,
pk2CaMKon*x11*x68*x190 + -pk2CaMKoff*x119*x191 + -pkpCaM2N*x119*x200,
pk2CaMKon*x12*x68*x190 + -pk2CaMKoff*x120*x191 + -pkpCaM1C*x120*x193,
pk2CaMKon*x13*x68*x190 + -pk2CaMKoff*x121*x191 + -pkpCaM1C1N*x121*x196,
pk2CaMKon*x14*x68*x190 + -pk2CaMKoff*x122*x191 + -pkpCaM1C2N*x122*x199,
pk2CaMKon*x15*x68*x190 + -pk2CaMKoff*x123*x191 + -pkpCaM2C*x123*x194,
pk2CaMKon*x16*x68*x190 + -pk2CaMKoff*x124*x191 + -pkpCaM2C1N*x124*x195,
pk2CaMKon*x17*x68*x190 + -pk2CaMKoff*x125*x191 + -pkpCaM4*x125*x197,
pk2CaMKon*x9*x69*x190 + -pk2CaMKoff*x126*x191 + -pkpCaM0*x126*x192,
pk2CaMKon*x10*x69*x190 + -pk2CaMKoff*x127*x191 + -pkpCaM1N*x127*x198,
pk2CaMKon*x11*x69*x190 + -pk2CaMKoff*x128*x191 + -pkpCaM2N*x128*x200,
pk2CaMKon*x12*x69*x190 + -pk2CaMKoff*x129*x191 + -pkpCaM1C*x129*x193,
pk2CaMKon*x13*x69*x190 + -pk2CaMKoff*x130*x191 + -pkpCaM1C1N*x130*x196,
pk2CaMKon*x14*x69*x190 + -pk2CaMKoff*x131*x191 + -pkpCaM1C2N*x131*x199,
pk2CaMKon*x15*x69*x190 + -pk2CaMKoff*x132*x191 + -pkpCaM2C*x132*x194,
pk2CaMKon*x16*x69*x190 + -pk2CaMKoff*x133*x191 + -pkpCaM2C1N*x133*x195,
pk2CaMKon*x17*x69*x190 + -pk2CaMKoff*x134*x191 + -pkpCaM4*x134*x197,
pk2CaMKon*x9*x70*x190 + -pk2CaMKoff*x135*x191 + -pkpCaM0*x135*x192,
pk2CaMKon*x10*x70*x190 + -pk2CaMKoff*x136*x191 + -pkpCaM1N*x136*x198,
pk2CaMKon*x11*x70*x190 + -pk2CaMKoff*x137*x191 + -pkpCaM2N*x137*x200,
pk2CaMKon*x12*x70*x190 + -pk2CaMKoff*x138*x191 + -pkpCaM1C*x138*x193,
pk2CaMKon*x13*x70*x190 + -pk2CaMKoff*x139*x191 + -pkpCaM1C1N*x139*x196,
pk2CaMKon*x14*x70*x190 + -pk2CaMKoff*x140*x191 + -pkpCaM1C2N*x140*x199,
pk2CaMKon*x15*x70*x190 + -pk2CaMKoff*x141*x191 + -pkpCaM2C*x141*x194,
pk2CaMKon*x16*x70*x190 + -pk2CaMKoff*x142*x191 + -pkpCaM2C1N*x142*x195,
pk2CaMKon*x17*x70*x190 + -pk2CaMKoff*x143*x191 + -pkpCaM4*x143*x197,
pk2CaMKon*x9*x71*x190 + -pk2CaMKoff*x144*x191 + -pkpCaM0*x144*x192,
pk2CaMKon*x10*x71*x190 + -pk2CaMKoff*x145*x191 + -pkpCaM1N*x145*x198,
pk2CaMKon*x11*x71*x190 + -pk2CaMKoff*x146*x191 + -pkpCaM2N*x146*x200,
pk2CaMKon*x12*x71*x190 + -pk2CaMKoff*x147*x191 + -pkpCaM1C*x147*x193,
pk2CaMKon*x13*x71*x190 + -pk2CaMKoff*x148*x191 + -pkpCaM1C1N*x148*x196,
pk2CaMKon*x14*x71*x190 + -pk2CaMKoff*x149*x191 + -pkpCaM1C2N*x149*x199,
pk2CaMKon*x15*x71*x190 + -pk2CaMKoff*x150*x191 + -pkpCaM2C*x150*x194,
pk2CaMKon*x16*x71*x190 + -pk2CaMKoff*x151*x191 + -pkpCaM2C1N*x151*x195,
pk2CaMKon*x17*x71*x190 + -pk2CaMKoff*x152*x191 + -pkpCaM4*x152*x197,
-pk1Con*x153*x155*x156 + pk1Coff*x3*x157 + -pk1Non*x153*x155*x160 + pk1Noff*x1*x161 + -pkCaM0on*x153*x154*x172 + pkCaM0off*x9*x173,
-pkCaM0on*x153*x154*x172 + pkCaM0off*x9*x173 + -pkCaM1Non*x1*x154*x184 + pkCaM1Noff*x10*x185 + -pkCaM2Non*x2*x154*x188 + pkCaM2Noff*x11*x189 + -pkCaM1Con*x3*x154*x174 + pkCaM1Coff*x12*x175 + -pkCaM1C1Non*x4*x154*x180 + pkCaM1C1Noff*x13*x181 + -pkCaM1C2Non*x5*x154*x186 + pkCaM1C2Noff*x14*x187 + -pkCaM2Con*x6*x154*x176 + pkCaM2Coff*x15*x177 + -pkCaM2C1Non*x7*x154*x178 + pkCaM2C1Noff*x16*x179 + -pkCaM4on*x8*x154*x182 + pkCaM4off*x17*x183,
-pk1Con*x153*x155*x156 + pk1Coff*x3*x157 + -pk1Con*x1*x155*x156 + pk1Coff*x4*x157 + -pk1Con*x2*x155*x156 + pk1Coff*x5*x157 + -pk2Con*x3*x155*x158 + pk2Coff*x6*x159 + -pk2Con*x4*x155*x158 + pk2Coff*x7*x159 + -pk2Con*x5*x155*x158 + pk2Coff*x8*x159 + -pk1Non*x153*x155*x160 + pk1Noff*x1*x161 + -pk2Non*x1*x155*x162 + pk2Noff*x2*x163 + -pk1Non*x3*x155*x160 + pk1Noff*x4*x161 + -pk2Non*x4*x155*x162 + pk2Noff*x5*x163 + -pk1Non*x6*x155*x160 + pk1Noff*x7*x161 + -pk2Non*x7*x155*x162 + pk2Noff*x8*x163 + -pkK1Con*x9*x155*x164 + pkK1Coff*x12*x165 + -pkK1Con*x10*x155*x164 + pkK1Coff*x13*x165 + -pkK1Con*x11*x155*x164 + pkK1Coff*x14*x165 + -pkK2Con*x12*x155*x166 + pkK2Coff*x15*x167 + -pkK2Con*x13*x155*x166 + pkK2Coff*x16*x167 + -pkK2Con*x14*x155*x166 + pkK2Coff*x17*x167 + -pkK1Non*x9*x155*x168 + pkK1Noff*x10*x169 + -pkK2Non*x10*x155*x170 + pkK2Noff*x11*x171 + -pkK1Non*x12*x155*x168 + pkK1Noff*x13*x169 + -pkK2Non*x13*x155*x170 + pkK2Noff*x14*x171 + -pkK1Non*x15*x155*x168 + pkK1Noff*x16*x169 + -pkK2Non*x16*x155*x170 + pkK2Noff*x17*x171,
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

result = aggregate(polys, [x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x153])
print("Total for MODEL1001150000_FE_pKCaMcurry, preserving CaM block, is " + str(len(result)))

#result = aggregate(polys, [x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17])
#print("Total for MODEL1001150000_FE_pKCaMcurry, preserving KCaM block, is " + str(len(result)))

#result = aggregate(polys, [x63 + x64 + x65 + x66 + x67 + x68 + x69 + x70 + x71])
#print("Total for MODEL1001150000_FE_pKCaMcurry, preserving pKCaM block, is " + str(len(result)))

