

% Automatically generated from fceri_ji_curryFE_B3.
% Original number of species: 121.
% Original number of reactions: 732.

% Correspondence with original names:
%     y(1) = Lig_tot
%     y(2) = S7
%     y(3) = S0
%     y(4) = S3
%     y(5) = kp1
%     y(6) = S5
%     y(7) = S4
%     y(8) = km1
%     y(9) = S6
%     y(10) = S13
%     y(11) = S15
%     y(12) = S12
%     y(13) = S14
%     y(14) = S26
%     y(15) = S28
%     y(16) = S30
%     y(17) = S32
%     y(18) = S25
%     y(19) = S27
%     y(20) = S29
%     y(21) = S31
%     y(22) = S60
%     y(23) = S62
%     y(24) = S64
%     y(25) = S59
%     y(26) = S61
%     y(27) = S63
%     y(28) = S114
%     y(29) = S113
%     y(30) = S1
%     y(31) = kpL
%     y(32) = kmL
%     y(33) = S8
%     y(34) = S11
%     y(35) = S9
%     y(36) = S10
%     y(37) = kpLs
%     y(38) = S17
%     y(39) = S18
%     y(40) = S21
%     y(41) = S16
%     y(42) = S43
%     y(43) = S20
%     y(44) = kmLs
%     y(45) = S23
%     y(46) = S24
%     y(47) = S36
%     y(48) = S37
%     y(49) = S34
%     y(50) = S78
%     y(51) = S39
%     y(52) = S41
%     y(53) = S22
%     y(54) = S46
%     y(55) = S47
%     y(56) = S48
%     y(57) = S49
%     y(58) = S50
%     y(59) = S52
%     y(60) = S55
%     y(61) = S57
%     y(62) = S58
%     y(63) = S51
%     y(64) = S73
%     y(65) = S74
%     y(66) = S76
%     y(67) = S44
%     y(68) = S45
%     y(69) = S53
%     y(70) = S54
%     y(71) = S56
%     y(72) = S84
%     y(73) = S95
%     y(74) = S96
%     y(75) = S97
%     y(76) = S88
%     y(77) = S99
%     y(78) = S100
%     y(79) = S101
%     y(80) = S79
%     y(81) = S89
%     y(82) = S90
%     y(83) = S92
%     y(84) = S103
%     y(85) = S104
%     y(86) = S93
%     y(87) = S106
%     y(88) = S147
%     y(89) = S150
%     y(90) = S154
%     y(91) = S145
%     y(92) = S157
%     y(93) = S170
%     y(94) = S2
%     y(95) = kpS
%     y(96) = kmS
%     y(97) = kp2
%     y(98) = km2
%     y(99) = dm
%     y(100) = S33
%     y(101) = S35
%     y(102) = S67
%     y(103) = S69
%     y(104) = S70
%     y(105) = S117
%     y(106) = S19
%     y(107) = S38
%     y(108) = S40
%     y(109) = S75
%     y(110) = S80
%     y(111) = S139
%     y(112) = S82
%     y(113) = S83
%     y(114) = S141
%     y(115) = S86
%     y(116) = S120
%     y(117) = S143
%     y(118) = pLg
%     y(119) = pLb
%     y(120) = pLgs
%     y(121) = pLbs


function fceri_ji_curryB3
[T,Y]=ode45(@ode,[0 100.0],[  7278.1900000000005 0.0 6000.0 400.0 1.32845238E-7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 28.0 0.05 20.0 0.0 0.0 0.0 0.0 0.05 0.0 0.0 0.0 0.0 0.0 0.0 0.12 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 400.0 0.06 0.13 0.25 0.0 20.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 30.0 3.0 100.0]);
 function array =  getSpecies(y)
array =  Y(:,y);
end

% Output is restricted to Views.
pLig_tot = 1.0;
pRec_tot = 1.0;
pLyn_tot = 1.0;
pSyk_tot = 1.0;
pkp1 = 1.0;
pkm1 = 1.0;
pkp2 = 1.0;
pkm2 = 1.0;
pkpL = 1.0;
pkmL = 1.0;
pkpLs = 1.0;
pkmLs = 1.0;
pkpS = 1.0;
pkmS = 1.0;
pkpSs = 1.0;
pkmSs = 1.0;
ppLb = 1.0;
ppLbs = 1.0;
ppLg = 1.0;
ppLgs = 1.0;
ppLS = 1.0;
ppLSs = 1.0;
ppSS = 1.0;
ppSSs = 1.0;
pdm = 1.0;
pdc = 1.0;
view= getSpecies(28)/4;
plot(T,view);
hold on;
view= getSpecies(70)/1;
plot(T,view);
hold on;
view= getSpecies(116)/4;
plot(T,view);
hold on;
view= getSpecies(51)/1;
plot(T,view);
hold on;
view= getSpecies(59)/4;
plot(T,view);
hold on;
view= getSpecies(31)/1;
plot(T,view);
hold on;
view= getSpecies(80)/4;
plot(T,view);
hold on;
view= getSpecies(29)/4;
plot(T,view);
hold on;
view= getSpecies(49)/4;
plot(T,view);
hold on;
view= getSpecies(104)/1;
plot(T,view);
hold on;
view= getSpecies(1)/11;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
view= getSpecies(60)/4;
plot(T,view);
hold on;
view= getSpecies(101)/1;
plot(T,view);
hold on;
view= getSpecies(83)/4;
plot(T,view);
hold on;
view= getSpecies(115)/4;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(27)/1;
plot(T,view);
hold on;
view= getSpecies(111)/4;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(110)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(38)/1;
plot(T,view);
hold on;
view= getSpecies(84)/10;
plot(T,view);
hold on;
view= getSpecies(117)/4;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(56)/1;
plot(T,view);
hold on;
view= getSpecies(74)/16;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(65)/1;
plot(T,view);
hold on;
view= getSpecies(96)/1;
plot(T,view);
hold on;
view= getSpecies(53)/1;
plot(T,view);
hold on;
view= getSpecies(25)/4;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(50)/4;
plot(T,view);
hold on;
view= getSpecies(62)/10;
plot(T,view);
hold on;
view= getSpecies(102)/4;
plot(T,view);
hold on;
view= getSpecies(99)/1;
plot(T,view);
hold on;
view= getSpecies(113)/4;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(95)/1;
plot(T,view);
hold on;
view= getSpecies(54)/4;
plot(T,view);
hold on;
view= getSpecies(89)/16;
plot(T,view);
hold on;
view= getSpecies(71)/1;
plot(T,view);
hold on;
view= getSpecies(63)/1;
plot(T,view);
hold on;
view= getSpecies(118)/1;
plot(T,view);
hold on;
view= getSpecies(36)/1;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(44)/1;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(22)/4;
plot(T,view);
hold on;
view= getSpecies(108)/1;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(20)/1;
plot(T,view);
hold on;
view= getSpecies(120)/1;
plot(T,view);
hold on;
view= getSpecies(30)/1;
plot(T,view);
hold on;
view= getSpecies(81)/4;
plot(T,view);
hold on;
view= getSpecies(19)/1;
plot(T,view);
hold on;
view= getSpecies(72)/1;
plot(T,view);
hold on;
view= getSpecies(86)/1;
plot(T,view);
hold on;
view= getSpecies(107)/4;
plot(T,view);
hold on;
view= getSpecies(61)/4;
plot(T,view);
hold on;
view= getSpecies(68)/1;
plot(T,view);
hold on;
view= getSpecies(103)/4;
plot(T,view);
hold on;
view= getSpecies(78)/16;
plot(T,view);
hold on;
view= getSpecies(100)/1;
plot(T,view);
hold on;
view= getSpecies(105)/4;
plot(T,view);
hold on;
view= getSpecies(93)/10;
plot(T,view);
hold on;
view= getSpecies(45)/1;
plot(T,view);
hold on;
view= getSpecies(57)/1;
plot(T,view);
hold on;
view= getSpecies(52)/1;
plot(T,view);
hold on;
view= getSpecies(23)/4;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(75)/4;
plot(T,view);
hold on;
view= getSpecies(85)/4;
plot(T,view);
hold on;
view= getSpecies(55)/1;
plot(T,view);
hold on;
view= getSpecies(64)/4;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(69)/1;
plot(T,view);
hold on;
view= getSpecies(109)/4;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(91)/4;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(21)/4;
plot(T,view);
hold on;
view= getSpecies(90)/16;
plot(T,view);
hold on;
view= getSpecies(119)/1;
plot(T,view);
hold on;
view= getSpecies(66)/4;
plot(T,view);
hold on;
view= getSpecies(92)/4;
plot(T,view);
hold on;
view= getSpecies(79)/4;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(35)/1;
plot(T,view);
hold on;
view= getSpecies(98)/1;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(77)/10;
plot(T,view);
hold on;
view= getSpecies(97)/1;
plot(T,view);
hold on;
view= getSpecies(112)/4;
plot(T,view);
hold on;
view= getSpecies(121)/1;
plot(T,view);
hold on;
view= getSpecies(48)/4;
plot(T,view);
hold on;
view= getSpecies(40)/4;
plot(T,view);
hold on;
view= getSpecies(76)/4;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(114)/4;
plot(T,view);
hold on;
view= getSpecies(73)/16;
plot(T,view);
hold on;
view= getSpecies(87)/1;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(82)/1;
plot(T,view);
hold on;
view= getSpecies(17)/4;
plot(T,view);
hold on;
view= getSpecies(32)/1;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(94)/4;
plot(T,view);
hold on;
view= getSpecies(88)/16;
plot(T,view);
hold on;
view= getSpecies(106)/1;
plot(T,view);
hold on;
view= getSpecies(67)/1;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(26)/4;
plot(T,view);
hold on;
view= getSpecies(58)/4;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vS114','vS54','vS120','vS39','vS52','vkpL','vS79','vS113','vS34','vS70','vLig_tot','vS6','vS55','vS35','vS92','vS86','vS4','vS63','vS139','vS14','vS80','vS43','vS17','vS103','vS143','vS18','vS48','vS96','vS3','vS74','vkmS','vS22','vS59','vS24','vS16','vS78','vS58','vS67','vdm','vS83','vS7','vkpS','vS46','vS150','vS56','vS51','vpLg','vS10','vkp1','vkpLs','vkmLs','vS15','vS60','vS40','vS30','vS29','vpLgs','vS1','vS89','vS27','vS84','vS93','vS38','vS57','vS45','vS69','vS100','vS33','vS117','vS170','vS23','vS49','vS41','vS62','vS28','vS97','vS104','vS47','vS73','vS20','vS0','vS53','vS75','vS25','vS145','vS5','vS31','vS154','vpLb','vS76','vS157','vS101','vS13','vS9','vkm2','vS8','vS99','vkp2','vS82','vpLbs','vS37','vS21','vS88','vS36','vS141','vS95','vS106','vS64','vS90','vS32','vkmL','vS26','vS2','vS147','vS19','vS44','vS12','vS11','vkm1','vS61','vS50');
end

function dy =  ode(t,y) 
  pLig_tot = 1.0;
  pRec_tot = 1.0;
  pLyn_tot = 1.0;
  pSyk_tot = 1.0;
  pkp1 = 1.0;
  pkm1 = 1.0;
  pkp2 = 1.0;
  pkm2 = 1.0;
  pkpL = 1.0;
  pkmL = 1.0;
  pkpLs = 1.0;
  pkmLs = 1.0;
  pkpS = 1.0;
  pkmS = 1.0;
  pkpSs = 1.0;
  pkmSs = 1.0;
  ppLb = 1.0;
  ppLbs = 1.0;
  ppLg = 1.0;
  ppLgs = 1.0;
  ppLS = 1.0;
  ppLSs = 1.0;
  ppSS = 1.0;
  ppSSs = 1.0;
  pdm = 1.0;
  pdc = 1.0;

  dy=zeros(121,1);

  dy(1) = 0;
  dy(2) = -2.0 * pkpL*y(2)*y(30)*y(31) + -2.0 * pkm2*y(2)*y(98) + pkp2*y(4)*y(7)*y(97) + pkmL*y(32)*y(33) + pdm*y(38)*y(99) + pdm*y(39)*y(99);
  dy(3) = -2.0 * pkp1*y(3)*y(4)*y(5) + -2.0 * pkp1*y(3)*y(5)*y(6) + -2.0 * pkp1*y(3)*y(5)*y(10) + -2.0 * pkp1*y(3)*y(5)*y(11) + -2.0 * pkp1*y(3)*y(5)*y(14) + -2.0 * pkp1*y(3)*y(5)*y(15) + -2.0 * pkp1*y(3)*y(5)*y(16) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(17)) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(22)) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(23)) + -2.0 * pkp1*y(3)*y(5)*y(24) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(28)) + pkm1*y(7)*y(8) + pkm1*y(8)*y(9) + pkm1*y(8)*y(12) + pkm1*y(8)*y(13) + pkm1*y(8)*y(18) + pkm1*y(8)*y(19) + pkm1*y(8)*y(20) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(21) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(25) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(26) + pkm1*y(8)*y(27) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(29);
  dy(4) = 2.0 * pkm2*y(2)*y(98) + -2.0 * pkp1*y(3)*y(4)*y(5) + -pkp2*y(4)*y(7)*y(97) + -pkp2*y(4)*y(9)*y(97) + -pkp2*y(4)*y(12)*y(97) + -pkp2*y(4)*y(13)*y(97) + -pkp2*y(4)*y(18)*y(97) + -pkp2*y(4)*y(19)*y(97) + -pkp2*y(4)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(26)*y(97)) + -pkp2*y(4)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(97)) + -pkpL*y(4)*y(30)*y(31) + pkmL*y(6)*y(32) + pkm1*y(7)*y(8) + pdm*y(10)*y(99) + pdm*y(11)*y(99) + pkm2*y(33)*y(98) + pkm2*y(38)*y(98) + pkm2*y(39)*y(98) + pkm2*y(47)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(98) + pkm2*y(98)*y(100) + pkm2*y(98)*y(101) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(103) + pkm2*y(98)*y(104) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(105);
  dy(5) = 0;
  dy(6) = -2.0 * pkp1*y(3)*y(5)*y(6) + pkpL*y(4)*y(30)*y(31) + -pkp2*y(6)*y(7)*y(97) + -pkp2*y(6)*y(9)*y(97) + -pkp2*y(6)*y(12)*y(97) + -pkp2*y(6)*y(13)*y(97) + -pkp2*y(6)*y(18)*y(97) + -pkp2*y(6)*y(19)*y(97) + -pkp2*y(6)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(26)*y(97)) + -pkp2*y(6)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(97)) + -pkmL*y(6)*y(32) + pkm1*y(8)*y(9) + pdm*y(14)*y(99) + pkm2*y(33)*y(98) + pkm2*y(34)*y(98) + 2.0 * pkm2*y(35)*y(98) + pkm2*y(36)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(40)*y(98) + pkm2*y(41)*y(98) + pkm2*y(43)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(98) + pkm2*y(98)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(107) + pkm2*y(98)*y(108) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(109);
  dy(7) = 2.0 * pkm2*y(2)*y(98) + 2.0 * pkp1*y(3)*y(4)*y(5) + -pkp2*y(4)*y(7)*y(97) + -pkp2*y(6)*y(7)*y(97) + -pkm1*y(7)*y(8) + -pkp2*y(7)*y(10)*y(97) + -pkp2*y(7)*y(11)*y(97) + -pkp2*y(7)*y(14)*y(97) + -pkp2*y(7)*y(15)*y(97) + -pkp2*y(7)*y(16)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(17)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(23)*y(97)) + -pkp2*y(7)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(28)*y(97)) + -pkpL*y(7)*y(30)*y(31) + pkmL*y(9)*y(32) + pdm*y(12)*y(99) + pdm*y(13)*y(99) + pkm2*y(33)*y(98) + pkm2*y(38)*y(98) + pkm2*y(39)*y(98) + pkm2*y(47)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(98) + pkm2*y(98)*y(100) + pkm2*y(98)*y(101) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(103) + pkm2*y(98)*y(104) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(105);
  dy(8) = 0;
  dy(9) = 2.0 * pkp1*y(3)*y(5)*y(6) + -pkp2*y(4)*y(9)*y(97) + -pkp2*y(6)*y(9)*y(97) + pkpL*y(7)*y(30)*y(31) + -pkm1*y(8)*y(9) + -pkp2*y(9)*y(10)*y(97) + -pkp2*y(9)*y(11)*y(97) + -pkp2*y(9)*y(14)*y(97) + -pkp2*y(9)*y(15)*y(97) + -pkp2*y(9)*y(16)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(17)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(23)*y(97)) + -pkp2*y(9)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(28)*y(97)) + -pkmL*y(9)*y(32) + pdm*y(18)*y(99) + pkm2*y(33)*y(98) + pkm2*y(34)*y(98) + 2.0 * pkm2*y(35)*y(98) + pkm2*y(36)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(40)*y(98) + pkm2*y(41)*y(98) + pkm2*y(43)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(98) + pkm2*y(98)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(107) + pkm2*y(98)*y(108) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(109);
  dy(10) = -2.0 * pkp1*y(3)*y(5)*y(10) + -pkp2*y(7)*y(10)*y(97) + pkm1*y(8)*y(12) + -pkp2*y(9)*y(10)*y(97) + -pkp2*y(10)*y(12)*y(97) + -pkp2*y(10)*y(13)*y(97) + -pkp2*y(10)*y(18)*y(97) + -pkp2*y(10)*y(19)*y(97) + -pkp2*y(10)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(26)*y(97)) + -pkp2*y(10)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(97)) + -pkpLs*y(10)*y(30)*y(37) + -pdm*y(10)*y(99) + pdm*y(15)*y(99) + pkmLs*y(16)*y(44) + pkm2*y(36)*y(98) + pkm2*y(38)*y(98) + pkm2*y(42)*y(98) + pkm2*y(45)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(98) + 2.0 * pkm2*y(53)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(54)*y(98) + pkm2*y(67)*y(98) + pkm2*y(68)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(80)*y(98) + pkm2*y(98)*y(110) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(111);
  dy(11) = -2.0 * pkp1*y(3)*y(5)*y(11) + -pkp2*y(7)*y(11)*y(97) + pkm1*y(8)*y(13) + -pkp2*y(9)*y(11)*y(97) + -pkp2*y(11)*y(12)*y(97) + -pkp2*y(11)*y(13)*y(97) + -pkp2*y(11)*y(18)*y(97) + -pkp2*y(11)*y(19)*y(97) + -pkp2*y(11)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(26)*y(97)) + -pkp2*y(11)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(97)) + -pkpL*y(11)*y(30)*y(31) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(11)*y(94)*y(95)) + -pdm*y(11)*y(99) + pkmL*y(14)*y(32) + pdm*y(15)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(17)*y(96) + pkm2*y(34)*y(98) + pkm2*y(39)*y(98) + pkm2*y(45)*y(98) + 2.0 * pkm2*y(46)*y(98) + pkm2*y(55)*y(98) + pkm2*y(56)*y(98) + pkm2*y(57)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(98) + pkm2*y(72)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(112) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(114);
  dy(12) = 2.0 * pkp1*y(3)*y(5)*y(10) + -pkp2*y(4)*y(12)*y(97) + -pkp2*y(6)*y(12)*y(97) + -pkm1*y(8)*y(12) + -pkp2*y(10)*y(12)*y(97) + -pkp2*y(11)*y(12)*y(97) + -pkp2*y(12)*y(14)*y(97) + -pkp2*y(12)*y(15)*y(97) + -pkp2*y(12)*y(16)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(17)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(23)*y(97)) + -pkp2*y(12)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(28)*y(97)) + -pkpLs*y(12)*y(30)*y(37) + -pdm*y(12)*y(99) + pdm*y(19)*y(99) + pkmLs*y(20)*y(44) + pkm2*y(36)*y(98) + pkm2*y(38)*y(98) + pkm2*y(42)*y(98) + pkm2*y(45)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(98) + 2.0 * pkm2*y(53)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(54)*y(98) + pkm2*y(67)*y(98) + pkm2*y(68)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(80)*y(98) + pkm2*y(98)*y(110) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(111);
  dy(13) = 2.0 * pkp1*y(3)*y(5)*y(11) + -pkp2*y(4)*y(13)*y(97) + -pkp2*y(6)*y(13)*y(97) + -pkm1*y(8)*y(13) + -pkp2*y(10)*y(13)*y(97) + -pkp2*y(11)*y(13)*y(97) + -pkp2*y(13)*y(14)*y(97) + -pkp2*y(13)*y(15)*y(97) + -pkp2*y(13)*y(16)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(17)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(23)*y(97)) + -pkp2*y(13)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(28)*y(97)) + -pkpL*y(13)*y(30)*y(31) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(13)*y(94)*y(95)) + -pdm*y(13)*y(99) + pkmL*y(18)*y(32) + pdm*y(19)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(21)*y(96) + pkm2*y(34)*y(98) + pkm2*y(39)*y(98) + pkm2*y(45)*y(98) + 2.0 * pkm2*y(46)*y(98) + pkm2*y(55)*y(98) + pkm2*y(56)*y(98) + pkm2*y(57)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(98) + pkm2*y(72)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(112) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(114);
  dy(14) = -2.0 * pkp1*y(3)*y(5)*y(14) + -pkp2*y(7)*y(14)*y(97) + pkm1*y(8)*y(18) + -pkp2*y(9)*y(14)*y(97) + pkpL*y(11)*y(30)*y(31) + -pkp2*y(12)*y(14)*y(97) + -pkp2*y(13)*y(14)*y(97) + -pkp2*y(14)*y(18)*y(97) + -pkp2*y(14)*y(19)*y(97) + -pkp2*y(14)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(26)*y(97)) + -pkp2*y(14)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(29)*y(97)) + -pkmL*y(14)*y(32) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(14)*y(94)*y(95)) + -pdm*y(14)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(22)*y(96) + pkm2*y(41)*y(98) + pkm2*y(42)*y(98) + 2.0 * pkm2*y(51)*y(98) + pkm2*y(52)*y(98) + pkm2*y(55)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(59)*y(98) + pkm2*y(63)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(64)*y(98) + pkm2*y(65)*y(98) + pkm2*y(98)*y(100) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(115) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(116);
  dy(15) = -2.0 * pkp1*y(3)*y(5)*y(15) + -pkp2*y(7)*y(15)*y(97) + pkm1*y(8)*y(19) + -pkp2*y(9)*y(15)*y(97) + -pkp2*y(12)*y(15)*y(97) + -pkp2*y(13)*y(15)*y(97) + -pkp2*y(15)*y(18)*y(97) + -pkp2*y(15)*y(19)*y(97) + -pkp2*y(15)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(26)*y(97)) + -pkp2*y(15)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(29)*y(97)) + -pkpLs*y(15)*y(30)*y(37) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(15)*y(94)*y(95)) + -pdm*y(15)*y(99) + -pdm*y(15)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(23)*y(96) + pkmLs*y(24)*y(44) + pkm2*y(56)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(60)*y(98) + pkm2*y(63)*y(98) + pkm2*y(67)*y(98) + 2.0 * pkm2*y(69)*y(98) + pkm2*y(70)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(98) + pkm2*y(82)*y(98) + pkm2*y(98)*y(101) + pkm2*y(98)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(117);
  dy(16) = -2.0 * pkp1*y(3)*y(5)*y(16) + -pkp2*y(7)*y(16)*y(97) + pkm1*y(8)*y(20) + -pkp2*y(9)*y(16)*y(97) + pkpLs*y(10)*y(30)*y(37) + -pkp2*y(12)*y(16)*y(97) + -pkp2*y(13)*y(16)*y(97) + -pkp2*y(16)*y(18)*y(97) + -pkp2*y(16)*y(19)*y(97) + -pkp2*y(16)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(26)*y(97)) + -pkp2*y(16)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(29)*y(97)) + -pkmLs*y(16)*y(44) + pdm*y(24)*y(99) + pkm2*y(43)*y(98) + pkm2*y(47)*y(98) + pkm2*y(52)*y(98) + pkm2*y(57)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(61)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(66)*y(98) + pkm2*y(68)*y(98) + pkm2*y(70)*y(98) + 2.0 * pkm2*y(71)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(83)*y(98) + pkm2*y(86)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(91)*y(98);
  dy(17) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(17)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(17)*y(97)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(21) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(17)*y(97)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(11)*y(94)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(17)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(17)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(18)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(19)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(20)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(21)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(25)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(27)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(29)*y(97)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(17)*y(30)*y(31)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(17)*y(96)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(22)*y(32) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(23)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(40)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(54)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(59)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(60)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(61)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(62)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(73)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(98);
  dy(18) = 2.0 * pkp1*y(3)*y(5)*y(14) + -pkp2*y(4)*y(18)*y(97) + -pkp2*y(6)*y(18)*y(97) + -pkm1*y(8)*y(18) + -pkp2*y(10)*y(18)*y(97) + -pkp2*y(11)*y(18)*y(97) + pkpL*y(13)*y(30)*y(31) + -pkp2*y(14)*y(18)*y(97) + -pkp2*y(15)*y(18)*y(97) + -pkp2*y(16)*y(18)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(18)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(23)*y(97)) + -pkp2*y(18)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(28)*y(97)) + -pkmL*y(18)*y(32) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(18)*y(94)*y(95)) + -pdm*y(18)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(25)*y(96) + pkm2*y(41)*y(98) + pkm2*y(42)*y(98) + 2.0 * pkm2*y(51)*y(98) + pkm2*y(52)*y(98) + pkm2*y(55)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(59)*y(98) + pkm2*y(63)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(64)*y(98) + pkm2*y(65)*y(98) + pkm2*y(98)*y(100) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(115) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(116);
  dy(19) = 2.0 * pkp1*y(3)*y(5)*y(15) + -pkp2*y(4)*y(19)*y(97) + -pkp2*y(6)*y(19)*y(97) + -pkm1*y(8)*y(19) + -pkp2*y(10)*y(19)*y(97) + -pkp2*y(11)*y(19)*y(97) + -pkp2*y(14)*y(19)*y(97) + -pkp2*y(15)*y(19)*y(97) + -pkp2*y(16)*y(19)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(19)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(23)*y(97)) + -pkp2*y(19)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(28)*y(97)) + -pkpLs*y(19)*y(30)*y(37) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(19)*y(94)*y(95)) + -pdm*y(19)*y(99) + -pdm*y(19)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(26)*y(96) + pkmLs*y(27)*y(44) + pkm2*y(56)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(60)*y(98) + pkm2*y(63)*y(98) + pkm2*y(67)*y(98) + 2.0 * pkm2*y(69)*y(98) + pkm2*y(70)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(98) + pkm2*y(82)*y(98) + pkm2*y(98)*y(101) + pkm2*y(98)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(117);
  dy(20) = 2.0 * pkp1*y(3)*y(5)*y(16) + -pkp2*y(4)*y(20)*y(97) + -pkp2*y(6)*y(20)*y(97) + -pkm1*y(8)*y(20) + -pkp2*y(10)*y(20)*y(97) + -pkp2*y(11)*y(20)*y(97) + pkpLs*y(12)*y(30)*y(37) + -pkp2*y(14)*y(20)*y(97) + -pkp2*y(15)*y(20)*y(97) + -pkp2*y(16)*y(20)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(20)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(23)*y(97)) + -pkp2*y(20)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(28)*y(97)) + -pkmLs*y(20)*y(44) + pdm*y(27)*y(99) + pkm2*y(43)*y(98) + pkm2*y(47)*y(98) + pkm2*y(52)*y(98) + pkm2*y(57)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(61)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(66)*y(98) + pkm2*y(68)*y(98) + pkm2*y(70)*y(98) + 2.0 * pkm2*y(71)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(83)*y(98) + pkm2*y(86)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(91)*y(98);
  dy(21) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(17) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(21)*y(97)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(21)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(21)*y(97)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(13)*y(94)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(21)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(21)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(21)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(22)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(23)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(21)*y(24)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(28)*y(97)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(21)*y(30)*y(31)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(21)*y(96)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(25)*y(32) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(26)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(40)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(54)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(59)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(60)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(61)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(62)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(73)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(98);
  dy(22) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(22)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(22)*y(97)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(25) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(22)*y(97)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(14)*y(94)*y(95) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(17)*y(30)*y(31) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(22)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(22)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(22)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(25)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(22)*y(27)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(29)*y(97)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(22)*y(32)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(22)*y(96)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(64)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(66)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(73)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(77)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(78)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(89)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(112);
  dy(23) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(23)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(23)*y(97)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(26) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(23)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(23)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(23)*y(97)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(15)*y(94)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(23)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(23)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(23)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(23)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(25)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(23)*y(27)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(29)*y(97)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(23)*y(30)*y(37)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(23)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(23)*y(99)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(28)*y(44) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(78)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(80)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(83)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(84)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(85)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(90)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(103) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(107) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(115);
  dy(24) = -2.0 * pkp1*y(3)*y(5)*y(24) + -pkp2*y(7)*y(24)*y(97) + pkm1*y(8)*y(27) + -pkp2*y(9)*y(24)*y(97) + -pkp2*y(12)*y(24)*y(97) + -pkp2*y(13)*y(24)*y(97) + pkpLs*y(15)*y(30)*y(37) + -pkp2*y(18)*y(24)*y(97) + -pkp2*y(19)*y(24)*y(97) + -pkp2*y(20)*y(24)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(21)*y(24)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(26)*y(97)) + -pkp2*y(24)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(29)*y(97)) + -pkmLs*y(24)*y(44) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(24)*y(94)*y(95)) + -pdm*y(24)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(28)*y(96) + pkm2*y(65)*y(98) + pkm2*y(72)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(98) + pkm2*y(82)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(85)*y(98) + pkm2*y(86)*y(98) + 2.0 * pkm2*y(87)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(92)*y(98) + pkm2*y(98)*y(104) + pkm2*y(98)*y(108) + pkm2*y(98)*y(110);
  dy(25) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(22) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(25)*y(97)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(25)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(25)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(25)*y(97)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(18)*y(94)*y(95) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(21)*y(30)*y(31) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(25)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(25)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(25)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(25)*y(28)*y(97)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(25)*y(32)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(25)*y(96)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(64)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(66)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(73)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(77)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(78)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(89)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(112);
  dy(26) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(23) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(26)*y(97)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(26)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(26)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(26)*y(97)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(19)*y(94)*y(95) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(26)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(26)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(26)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(26)*y(28)*y(97)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(26)*y(30)*y(37)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(26)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(26)*y(99)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(29)*y(44) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(78)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(80)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(83)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(84)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(85)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(90)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(103) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(107) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(115);
  dy(27) = 2.0 * pkp1*y(3)*y(5)*y(24) + -pkp2*y(4)*y(27)*y(97) + -pkp2*y(6)*y(27)*y(97) + -pkm1*y(8)*y(27) + -pkp2*y(10)*y(27)*y(97) + -pkp2*y(11)*y(27)*y(97) + -pkp2*y(14)*y(27)*y(97) + -pkp2*y(15)*y(27)*y(97) + -pkp2*y(16)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(27)*y(97)) + pkpLs*y(19)*y(30)*y(37) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(22)*y(27)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(23)*y(27)*y(97)) + -pkp2*y(24)*y(27)*y(97) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(27)*y(28)*y(97)) + -pkmLs*y(27)*y(44) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(27)*y(94)*y(95)) + -pdm*y(27)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(29)*y(96) + pkm2*y(65)*y(98) + pkm2*y(72)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(98) + pkm2*y(82)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(85)*y(98) + pkm2*y(86)*y(98) + 2.0 * pkm2*y(87)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(92)*y(98) + pkm2*y(98)*y(104) + pkm2*y(98)*y(108) + pkm2*y(98)*y(110);
  dy(28) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(28)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(28)*y(97)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(29) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(28)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(28)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(28)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(28)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(28)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(28)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(28)*y(97)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(23)*y(30)*y(37) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(24)*y(94)*y(95) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(25)*y(28)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(26)*y(28)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(27)*y(28)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(28)*y(29)*y(97)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(28)*y(44)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(28)*y(96)) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(89)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(90)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(91)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(92)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(93)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(105) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(109) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(111) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(114) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(116) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(117);
  dy(29) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(28) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(97)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(29)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(29)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(29)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(29)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(29)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(29)*y(97)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(29)*y(97)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(29)*y(97)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(26)*y(30)*y(37) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(27)*y(94)*y(95) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(28)*y(29)*y(97)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(29)*y(44)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(29)*y(96)) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(89)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(90)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(91)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(92)*y(98) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(93)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(105) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(109) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(111) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(114) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(116) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(117);
  dy(30) = -2.0 * pkpL*y(2)*y(30)*y(31) + -pkpL*y(4)*y(30)*y(31) + pkmL*y(6)*y(32) + -pkpL*y(7)*y(30)*y(31) + pkmL*y(9)*y(32) + -pkpLs*y(10)*y(30)*y(37) + -pkpL*y(11)*y(30)*y(31) + -pkpLs*y(12)*y(30)*y(37) + -pkpL*y(13)*y(30)*y(31) + pkmL*y(14)*y(32) + -pkpLs*y(15)*y(30)*y(37) + pkmLs*y(16)*y(44) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(17)*y(30)*y(31)) + pkmL*y(18)*y(32) + -pkpLs*y(19)*y(30)*y(37) + pkmLs*y(20)*y(44) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(21)*y(30)*y(31)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(22)*y(32) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(23)*y(30)*y(37)) + pkmLs*y(24)*y(44) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(25)*y(32) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(26)*y(30)*y(37)) + pkmLs*y(27)*y(44) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(28)*y(44) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(29)*y(44) + -pkpL*y(30)*y(31)*y(33) + -pkpL*y(30)*y(31)*y(34) + -pkpL*y(30)*y(31)*y(38) + -pkpL*y(30)*y(31)*y(39) + -pkpL*y(30)*y(31)*y(39) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(40)) + -pkpL*y(30)*y(31)*y(45) + -2.0 * pkpL*y(30)*y(31)*y(46) + -pkpL*y(30)*y(31)*y(47) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(54)) + -pkpL*y(30)*y(31)*y(55) + -pkpL*y(30)*y(31)*y(56) + -pkpL*y(30)*y(31)*y(57) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(58)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(58)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(59)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(60)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(61)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(30)*y(31)*y(62)) + -pkpL*y(30)*y(31)*y(72) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(73)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(74)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(75)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(88)) + -pkpL*y(30)*y(31)*y(100) + -pkpL*y(30)*y(31)*y(101) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(102)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(103)) + -pkpL*y(30)*y(31)*y(104) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(105)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(112)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(113)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(114)) + -pkpLs*y(30)*y(36)*y(37) + -pkpLs*y(30)*y(37)*y(38) + -pkpLs*y(30)*y(37)*y(42) + -pkpLs*y(30)*y(37)*y(45) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(50)) + -2.0 * pkpLs*y(30)*y(37)*y(53) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(54)) + -pkpLs*y(30)*y(37)*y(56) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(60)) + -pkpLs*y(30)*y(37)*y(63) + -pkpLs*y(30)*y(37)*y(67) + -pkpLs*y(30)*y(37)*y(67) + -pkpLs*y(30)*y(37)*y(68) + -2.0 * pkpLs*y(30)*y(37)*y(69) + -pkpLs*y(30)*y(37)*y(70) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(74)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(76)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(78)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(80)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(80)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(81)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(81)) + -pkpLs*y(30)*y(37)*y(82) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(83)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(30)*y(37)*y(84)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(85)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(90)) + -pkpLs*y(30)*y(37)*y(101) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(103)) + -pkpLs*y(30)*y(37)*y(106) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(107)) + -pkpLs*y(30)*y(37)*y(110) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(111)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(113)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(115)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(117)) + pkmL*y(32)*y(33) + pkmL*y(32)*y(34) + 2.0 * pkmL*y(32)*y(35) + pkmL*y(32)*y(36) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(40) + pkmL*y(32)*y(41) + pkmL*y(32)*y(41) + pkmL*y(32)*y(42) + pkmL*y(32)*y(43) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(49) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(49) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(50) + 2.0 * pkmL*y(32)*y(51) + pkmL*y(32)*y(52) + pkmL*y(32)*y(55) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(59) + pkmL*y(32)*y(63) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(64) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(64) + pkmL*y(32)*y(65) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(66) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(73) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(76) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(32)*y(77) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(78) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(79) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(89) + pkmL*y(32)*y(100) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(102) + pkmL*y(32)*y(106) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(107) + pkmL*y(32)*y(108) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(109) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(112) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(115) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(116) + pkmLs*y(43)*y(44) + pkmLs*y(44)*y(47) + pkmLs*y(44)*y(52) + pkmLs*y(44)*y(57) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(61) + pkmLs*y(44)*y(65) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(66) + pkmLs*y(44)*y(68) + pkmLs*y(44)*y(70) + 2.0 * pkmLs*y(44)*y(71) + pkmLs*y(44)*y(72) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(75) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(79) + pkmLs*y(44)*y(82) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(83) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(85) + pkmLs*y(44)*y(86) + pkmLs*y(44)*y(86) + 2.0 * pkmLs*y(44)*y(87) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(88) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(89) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(90) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(91) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(91) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(92) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(92) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(44)*y(93) + pkmLs*y(44)*y(104) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(105) + pkmLs*y(44)*y(108) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(109) + pkmLs*y(44)*y(110) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(111) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(114) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(116) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(117);
  dy(31) = 0;
  dy(32) = 0;
  dy(33) = 2.0 * pkpL*y(2)*y(30)*y(31) + pkp2*y(4)*y(9)*y(97) + pkp2*y(6)*y(7)*y(97) + -pkpL*y(30)*y(31)*y(33) + -pkmL*y(32)*y(33) + 2.0 * pkmL*y(32)*y(35) + -pkm2*y(33)*y(98) + -pkm2*y(33)*y(98) + -ppLg*y(33)*y(118) + -ppLb*y(33)*y(119) + pdm*y(34)*y(99) + pdm*y(36)*y(99) + pdm*y(99)*y(100);
  dy(34) = pkp2*y(6)*y(13)*y(97) + pkp2*y(9)*y(11)*y(97) + -pkpL*y(30)*y(31)*y(34) + pkpL*y(30)*y(31)*y(39) + -pkmL*y(32)*y(34) + pkmL*y(32)*y(41) + ppLg*y(33)*y(118) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(34)*y(94)*y(95)) + -pkm2*y(34)*y(98) + -pkm2*y(34)*y(98) + -pdm*y(34)*y(99) + -ppLb*y(34)*y(119) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(40)*y(96) + pdm*y(55)*y(99) + pdm*y(99)*y(106);
  dy(35) = pkp2*y(6)*y(9)*y(97) + pkpL*y(30)*y(31)*y(33) + -2.0 * pkmL*y(32)*y(35) + -2.0 * pkm2*y(35)*y(98) + -2.0 * ppLg*y(35)*y(118) + pdm*y(41)*y(99);
  dy(36) = pkp2*y(6)*y(12)*y(97) + pkp2*y(9)*y(10)*y(97) + pkpL*y(30)*y(31)*y(38) + -pkpLs*y(30)*y(36)*y(37) + -pkmL*y(32)*y(36) + ppLb*y(33)*y(119) + -pkm2*y(36)*y(98) + -pkm2*y(36)*y(98) + -pdm*y(36)*y(99) + -ppLg*y(36)*y(118) + pdm*y(42)*y(99) + pkmLs*y(43)*y(44) + pdm*y(99)*y(106);
  dy(37) = 0;
  dy(38) = pkp2*y(4)*y(12)*y(97) + pkp2*y(7)*y(10)*y(97) + -pkpL*y(30)*y(31)*y(38) + -pkpLs*y(30)*y(37)*y(38) + pkmL*y(32)*y(36) + -pkm2*y(38)*y(98) + -pkm2*y(38)*y(98) + -pdm*y(38)*y(99) + pkmLs*y(44)*y(47) + pdm*y(45)*y(99) + 2.0 * pdm*y(53)*y(99) + pdm*y(99)*y(101);
  dy(39) = pkp2*y(4)*y(13)*y(97) + pkp2*y(7)*y(11)*y(97) + -pkpL*y(30)*y(31)*y(39) + -pkpL*y(30)*y(31)*y(39) + pkmL*y(32)*y(34) + pkmL*y(32)*y(100) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(39)*y(94)*y(95)) + -pkm2*y(39)*y(98) + -pkm2*y(39)*y(98) + -pdm*y(39)*y(99) + pdm*y(45)*y(99) + 2.0 * pdm*y(46)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(48)*y(96) + pdm*y(99)*y(101);
  dy(40) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(17)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(40)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(48) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(40)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(49) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(34)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(40)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(40)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(40)*y(98)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(40)*y(119)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(59)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(107);
  dy(41) = pkp2*y(6)*y(18)*y(97) + pkp2*y(9)*y(14)*y(97) + pkpL*y(30)*y(31)*y(34) + pkpL*y(30)*y(31)*y(100) + -pkmL*y(32)*y(41) + -pkmL*y(32)*y(41) + 2.0 * ppLg*y(35)*y(118) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(41)*y(94)*y(95)) + -pkm2*y(41)*y(98) + -pkm2*y(41)*y(98) + -pdm*y(41)*y(99) + -ppLg*y(41)*y(118) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(49)*y(96) + 2.0 * pdm*y(51)*y(99);
  dy(42) = pkp2*y(10)*y(18)*y(97) + pkp2*y(12)*y(14)*y(97) + pkpL*y(30)*y(31)*y(45) + -pkpLs*y(30)*y(37)*y(42) + -pkmL*y(32)*y(42) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(42)*y(94)*y(95)) + -pkm2*y(42)*y(98) + -pkm2*y(42)*y(98) + -pdm*y(42)*y(99) + -pdm*y(42)*y(99) + -ppLg*y(42)*y(118) + pkmLs*y(44)*y(52) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(50)*y(96) + pdm*y(63)*y(99) + ppLb*y(100)*y(119);
  dy(43) = pkp2*y(6)*y(20)*y(97) + pkp2*y(9)*y(16)*y(97) + pkpL*y(30)*y(31)*y(47) + pkpLs*y(30)*y(36)*y(37) + -pkmL*y(32)*y(43) + -pkmLs*y(43)*y(44) + -pkm2*y(43)*y(98) + -pkm2*y(43)*y(98) + -ppLg*y(43)*y(118) + -ppLgs*y(43)*y(120) + pdm*y(52)*y(99) + pdm*y(99)*y(108);
  dy(44) = 0;
  dy(45) = pkp2*y(10)*y(13)*y(97) + pkp2*y(11)*y(12)*y(97) + -pkpL*y(30)*y(31)*y(45) + -pkpLs*y(30)*y(37)*y(45) + pkmL*y(32)*y(42) + pkmLs*y(44)*y(57) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(94)*y(95)) + -pkm2*y(45)*y(98) + -pkm2*y(45)*y(98) + -pdm*y(45)*y(99) + -pdm*y(45)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(54)*y(96) + pdm*y(56)*y(99) + pdm*y(67)*y(99);
  dy(46) = pkp2*y(11)*y(13)*y(97) + -2.0 * pkpL*y(30)*y(31)*y(46) + pkmL*y(32)*y(55) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(46)*y(94)*y(95)) + -2.0 * pkm2*y(46)*y(98) + -2.0 * pdm*y(46)*y(99) + pdm*y(56)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(58)*y(96);
  dy(47) = pkp2*y(4)*y(20)*y(97) + pkp2*y(7)*y(16)*y(97) + -pkpL*y(30)*y(31)*y(47) + pkpLs*y(30)*y(37)*y(38) + pkmL*y(32)*y(43) + -pkmLs*y(44)*y(47) + -pkm2*y(47)*y(98) + -pkm2*y(47)*y(98) + -ppLgs*y(47)*y(120) + -ppLbs*y(47)*y(121) + pdm*y(57)*y(99) + pdm*y(68)*y(99) + pdm*y(99)*y(104);
  dy(48) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(17)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(48)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(40) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(102) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(39)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(48)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(98)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(54)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(58)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(103);
  dy(49) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(40) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(102) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(49)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(49)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(41)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(49)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(98)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(49)*y(118)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(64)*y(99);
  dy(50) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(54) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(50)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(50)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(42)*y(94)*y(95) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(66) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(50)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(50)*y(99)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(50)*y(118)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(102)*y(119);
  dy(51) = pkp2*y(14)*y(18)*y(97) + pkpL*y(30)*y(31)*y(55) + -2.0 * pkmL*y(32)*y(51) + ppLg*y(41)*y(118) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(51)*y(94)*y(95)) + -2.0 * pkm2*y(51)*y(98) + -2.0 * pdm*y(51)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(64)*y(96);
  dy(52) = pkp2*y(14)*y(20)*y(97) + pkp2*y(16)*y(18)*y(97) + pkpL*y(30)*y(31)*y(57) + pkpLs*y(30)*y(37)*y(42) + -pkmL*y(32)*y(52) + ppLgs*y(43)*y(120) + -pkmLs*y(44)*y(52) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(52)*y(94)*y(95)) + -pkm2*y(52)*y(98) + -pkm2*y(52)*y(98) + -pdm*y(52)*y(99) + -ppLg*y(52)*y(118) + pdm*y(65)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(66)*y(96);
  dy(53) = pkp2*y(10)*y(12)*y(97) + -2.0 * pkpLs*y(30)*y(37)*y(53) + pkmLs*y(44)*y(68) + -2.0 * pkm2*y(53)*y(98) + -2.0 * pdm*y(53)*y(99) + pdm*y(67)*y(99);
  dy(54) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(17)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(54)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(54)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(50) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(61) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(54)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(54)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(54)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(54)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(60)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(80)*y(99);
  dy(55) = pkp2*y(11)*y(18)*y(97) + pkp2*y(13)*y(14)*y(97) + 2.0 * pkpL*y(30)*y(31)*y(46) + -pkpL*y(30)*y(31)*y(55) + 2.0 * pkmL*y(32)*y(51) + -pkmL*y(32)*y(55) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(55)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(55)*y(94)*y(95)) + -pkm2*y(55)*y(98) + -pkm2*y(55)*y(98) + -pdm*y(55)*y(99) + -pdm*y(55)*y(99) + -ppLb*y(55)*y(119) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(59)*y(96) + pdm*y(63)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(112) + ppLg*y(100)*y(118);
  dy(56) = pkp2*y(11)*y(19)*y(97) + pkp2*y(13)*y(15)*y(97) + -pkpL*y(30)*y(31)*y(56) + -pkpLs*y(30)*y(37)*y(56) + pkmL*y(32)*y(63) + pkmLs*y(44)*y(72) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(56)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(56)*y(94)*y(95)) + -pkm2*y(56)*y(98) + -pkm2*y(56)*y(98) + -pdm*y(56)*y(99) + -pdm*y(56)*y(99) + -pdm*y(56)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(60)*y(96) + 2.0 * pdm*y(69)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(113);
  dy(57) = pkp2*y(11)*y(20)*y(97) + pkp2*y(13)*y(16)*y(97) + -pkpL*y(30)*y(31)*y(57) + pkpLs*y(30)*y(37)*y(45) + pkmL*y(32)*y(52) + -pkmLs*y(44)*y(57) + ppLgs*y(47)*y(120) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(94)*y(95)) + -pkm2*y(57)*y(98) + -pkm2*y(57)*y(98) + -pdm*y(57)*y(99) + -ppLbs*y(57)*y(121) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(61)*y(96) + pdm*y(70)*y(99) + pdm*y(72)*y(99);
  dy(58) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(17)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(58)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(58)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(59) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(112) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(46)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(58)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(58)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(58)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(60)*y(99) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(62)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113);
  dy(59) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(18)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(58) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(59)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(59)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(64) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(55)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(59)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(59)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(59)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(59)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(59)*y(99)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(59)*y(119)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(73)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(115);
  dy(60) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(19)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(60)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(60)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(76) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(75) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(56)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(60)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(60)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(60)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(60)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(60)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(60)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99);
  dy(61) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(21)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(20)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(61)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(54) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(66) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(61)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(61)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(61)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(61)*y(98)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(61)*y(121)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(75)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(83)*y(99);
  dy(62) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(21)*y(97) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(30)*y(31)*y(62)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(73) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(58)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(62)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(62)*y(98)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(74)*y(99);
  dy(63) = pkp2*y(14)*y(19)*y(97) + pkp2*y(15)*y(18)*y(97) + pkpL*y(30)*y(31)*y(56) + -pkpLs*y(30)*y(37)*y(63) + -pkmL*y(32)*y(63) + ppLg*y(42)*y(118) + pkmLs*y(44)*y(65) + ppLb*y(55)*y(119) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(63)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(63)*y(94)*y(95)) + -pkm2*y(63)*y(98) + -pkm2*y(63)*y(98) + -pdm*y(63)*y(99) + -pdm*y(63)*y(99) + -pdm*y(63)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(76)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(115);
  dy(64) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(59) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(112) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(64)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(64)) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(49)*y(118) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(51)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(64)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(64)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(64)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(64)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(64)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(77)*y(96);
  dy(65) = pkp2*y(14)*y(27)*y(97) + pkp2*y(18)*y(24)*y(97) + pkpL*y(30)*y(31)*y(72) + pkpLs*y(30)*y(37)*y(63) + -pkmL*y(32)*y(65) + -pkmLs*y(44)*y(65) + ppLg*y(52)*y(118) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(65)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(65)*y(94)*y(95)) + -pkm2*y(65)*y(98) + -pkm2*y(65)*y(98) + -pdm*y(65)*y(99) + -pdm*y(65)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(79)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(116) + ppLgs*y(108)*y(120);
  dy(66) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(61) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(50) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(66)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(66)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(52)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(66)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(66)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(66)*y(98)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(66)*y(118)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(79)*y(99);
  dy(67) = pkp2*y(10)*y(19)*y(97) + pkp2*y(12)*y(15)*y(97) + -pkpLs*y(30)*y(37)*y(67) + -pkpLs*y(30)*y(37)*y(67) + pkmLs*y(44)*y(70) + pkmLs*y(44)*y(110) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(67)*y(94)*y(95)) + -pkm2*y(67)*y(98) + -pkm2*y(67)*y(98) + -pdm*y(67)*y(99) + -pdm*y(67)*y(99) + -pdm*y(67)*y(99) + 2.0 * pdm*y(69)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(80)*y(96);
  dy(68) = pkp2*y(10)*y(20)*y(97) + pkp2*y(12)*y(16)*y(97) + 2.0 * pkpLs*y(30)*y(37)*y(53) + -pkpLs*y(30)*y(37)*y(68) + -pkmLs*y(44)*y(68) + 2.0 * pkmLs*y(44)*y(71) + ppLbs*y(47)*y(121) + -pkm2*y(68)*y(98) + -pkm2*y(68)*y(98) + -pdm*y(68)*y(99) + -ppLgs*y(68)*y(120) + pdm*y(70)*y(99) + pdm*y(99)*y(110);
  dy(69) = pkp2*y(15)*y(19)*y(97) + -2.0 * pkpLs*y(30)*y(37)*y(69) + pkmLs*y(44)*y(82) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(69)*y(94)*y(95)) + -2.0 * pkm2*y(69)*y(98) + -2.0 * pdm*y(69)*y(99) + -2.0 * pdm*y(69)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(81)*y(96);
  dy(70) = pkp2*y(15)*y(20)*y(97) + pkp2*y(16)*y(19)*y(97) + pkpLs*y(30)*y(37)*y(67) + -pkpLs*y(30)*y(37)*y(70) + -pkmLs*y(44)*y(70) + pkmLs*y(44)*y(86) + ppLbs*y(57)*y(121) + ppLgs*y(68)*y(120) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(70)*y(94)*y(95)) + -pkm2*y(70)*y(98) + -pkm2*y(70)*y(98) + -pdm*y(70)*y(99) + -pdm*y(70)*y(99) + pdm*y(82)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(83)*y(96);
  dy(71) = pkp2*y(16)*y(20)*y(97) + pkpLs*y(30)*y(37)*y(68) + -2.0 * pkmLs*y(44)*y(71) + -2.0 * pkm2*y(71)*y(98) + -2.0 * ppLgs*y(71)*y(120) + pdm*y(86)*y(99);
  dy(72) = pkp2*y(11)*y(27)*y(97) + pkp2*y(13)*y(24)*y(97) + -pkpL*y(30)*y(31)*y(72) + pkpLs*y(30)*y(37)*y(56) + pkmL*y(32)*y(65) + -pkmLs*y(44)*y(72) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(72)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(72)*y(94)*y(95)) + -pkm2*y(72)*y(98) + -pkm2*y(72)*y(98) + -pdm*y(72)*y(99) + -pdm*y(72)*y(99) + -ppLbs*y(72)*y(121) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(75)*y(96) + pdm*y(82)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(114) + ppLgs*y(104)*y(120);
  dy(73) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(25)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(22)*y(97) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(30)*y(31)*y(62) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(73)) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(73)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(32)*y(77) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(59)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(73)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(73)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(73)*y(98)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(73)*y(98)) + -(((((((((((((((((ppLb + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) / 16.0)*y(73)*y(119)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(78)*y(99) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(112);
  dy(74) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(26)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(23)*y(97) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(74)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(74)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(78) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(88) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(60)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(98)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(98)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(74)*y(99)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) / 10.0)*y(84)*y(99) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(113);
  dy(75) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(27)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(21)*y(24)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(75)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(60) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(79) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(75)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(72)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(75)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(75)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(75)*y(99)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(75)*y(121)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(85)*y(99) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(96);
  dy(76) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(60) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(76)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(76)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(79) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(50)*y(118) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(63)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(76)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(76)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(78)*y(96) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(112)*y(119);
  dy(77) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(25)*y(97) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(73) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(32)*y(77)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(64)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(77)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(77)*y(98));
  dy(78) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(26)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(25)*y(97) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(74) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(78)) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(78)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(89) + ((((((((((((((((ppLb + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) / 16.0)*y(73)*y(119) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(76)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(78)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(78)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(78)*y(98)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(78)*y(98)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(78)*y(99)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(115);
  dy(79) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(22)*y(27)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(25)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(75) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(76) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(79)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(79)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(65)*y(94)*y(95) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(66)*y(118) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(79)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(79)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(79)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(89)*y(96);
  dy(80) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(23)*y(97) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(80)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(80)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(83) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(111) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(67)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(80)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(80)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(80)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(80)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(80)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99);
  dy(81) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(23)*y(97) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(81)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(81)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(85) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(117) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(69)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(81)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(81)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(84)*y(96);
  dy(82) = pkp2*y(15)*y(27)*y(97) + pkp2*y(19)*y(24)*y(97) + 2.0 * pkpLs*y(30)*y(37)*y(69) + -pkpLs*y(30)*y(37)*y(82) + -pkmLs*y(44)*y(82) + 2.0 * pkmLs*y(44)*y(87) + ppLbs*y(72)*y(121) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(94)*y(95)) + -pkm2*y(82)*y(98) + -pkm2*y(82)*y(98) + -pdm*y(82)*y(99) + -pdm*y(82)*y(99) + -pdm*y(82)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(85)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(117) + ppLgs*y(110)*y(120);
  dy(83) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(23)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(80) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(83)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(83)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(91) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(61)*y(121) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(70)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(83)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(83)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(83)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(83)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(85)*y(99);
  dy(84) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(26)*y(97) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(30)*y(37)*y(84)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(90) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(81)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(84)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(84)*y(98)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) / 10.0)*y(84)*y(99));
  dy(85) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(23)*y(27)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(26)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(81) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(85)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(85)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(92) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(75)*y(121) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(94)*y(95) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(85)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(85)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(85)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(85)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(85)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(85)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(90)*y(96);
  dy(86) = pkp2*y(16)*y(27)*y(97) + pkp2*y(20)*y(24)*y(97) + pkpLs*y(30)*y(37)*y(70) + pkpLs*y(30)*y(37)*y(110) + -pkmLs*y(44)*y(86) + -pkmLs*y(44)*y(86) + 2.0 * ppLgs*y(71)*y(120) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(86)*y(94)*y(95)) + -pkm2*y(86)*y(98) + -pkm2*y(86)*y(98) + -pdm*y(86)*y(99) + -ppLgs*y(86)*y(120) + 2.0 * pdm*y(87)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(91)*y(96);
  dy(87) = pkp2*y(24)*y(27)*y(97) + pkpLs*y(30)*y(37)*y(82) + -2.0 * pkmLs*y(44)*y(87) + ppLgs*y(86)*y(120) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(87)*y(94)*y(95)) + -2.0 * pkm2*y(87)*y(98) + -2.0 * pdm*y(87)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(92)*y(96);
  dy(88) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(17)*y(29)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(21)*y(28)*y(97) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(88)) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(74) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(89) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(88)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(75)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(98)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(98)) + -(((((((((((((((((ppLbs + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) / 16.0)*y(88)*y(121)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(90)*y(99) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(114);
  dy(89) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(22)*y(29)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(25)*y(28)*y(97) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(30)*y(31)*y(88) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(78) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(32)*y(89)) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(89)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(79)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(89)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(89)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(89)*y(98)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(89)*y(98)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(116);
  dy(90) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(23)*y(29)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(26)*y(28)*y(97) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(30)*y(37)*y(84) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(90)) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(44)*y(90)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(44)*y(93) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(85)*y(94)*y(95) + ((((((((((((((((ppLbs + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) / 16.0)*y(88)*y(121) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(90)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(90)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(90)*y(98)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(90)*y(98)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(90)*y(99)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(117);
  dy(91) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(20)*y(28)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(83) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(111) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(91)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(91)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(86)*y(94)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(91)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(91)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(91)*y(98)) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(91)*y(120)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(92)*y(99);
  dy(92) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(27)*y(28)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(85) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(117) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(92)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(92)) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(87)*y(94)*y(95) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(91)*y(120) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(94)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(92)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(92)*y(98)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(92)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(92)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(93)*y(96);
  dy(93) = ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(28)*y(29)*y(97) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(30)*y(37)*y(90) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(44)*y(93)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(94)*y(95) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(93)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(93)*y(98));
  dy(94) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(11)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(13)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(14)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(15)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(17)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(18)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(19)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(21)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(22)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(23)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(24)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(25)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(26)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(27)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(28)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(29)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(34)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(39)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(40)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(41)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(42)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(94)*y(95)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(46)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(48)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(49)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(50)*y(96) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(51)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(52)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(54)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(55)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(55)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(56)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(56)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(94)*y(95)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(58)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(58)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(59)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(59)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(60)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(60)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(61)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(62)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(63)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(63)*y(94)*y(95)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(64)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(64)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(65)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(65)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(66)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(67)*y(94)*y(95)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(69)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(70)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(72)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(72)*y(94)*y(95)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(73)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(73)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(75)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(75)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(76)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(76)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(77)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(78)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(78)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(79)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(79)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(80)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(81)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(81)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(94)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(83)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(84)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(85)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(85)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(86)*y(94)*y(95)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(87)*y(94)*y(95)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(89)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(89)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(90)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(90)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(91)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(94)*y(95)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(92)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(93)*y(96) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(100)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(101)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(104)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(106)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(108)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(110)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(112)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(113)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(114)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(115)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(116)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(117)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(102) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(103) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(105) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(107) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(109) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(111) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(112) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(113) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(114) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(115) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(116) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(117);
  dy(95) = 0;
  dy(96) = 0;
  dy(97) = 0;
  dy(98) = 0;
  dy(99) = 0;
  dy(100) = pkp2*y(4)*y(18)*y(97) + pkp2*y(7)*y(14)*y(97) + pkpL*y(30)*y(31)*y(39) + -pkpL*y(30)*y(31)*y(100) + pkmL*y(32)*y(41) + -pkmL*y(32)*y(100) + pdm*y(42)*y(99) + pdm*y(55)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(100)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(102) + -pkm2*y(98)*y(100) + -pkm2*y(98)*y(100) + -pdm*y(99)*y(100) + -ppLg*y(100)*y(118) + -ppLb*y(100)*y(119);
  dy(101) = pkp2*y(4)*y(19)*y(97) + pkp2*y(7)*y(15)*y(97) + -pkpL*y(30)*y(31)*y(101) + -pkpLs*y(30)*y(37)*y(101) + pkmL*y(32)*y(106) + pkmLs*y(44)*y(104) + pdm*y(56)*y(99) + pdm*y(67)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(101)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(103) + -pkm2*y(98)*y(101) + -pkm2*y(98)*y(101) + -pdm*y(99)*y(101) + -pdm*y(99)*y(101);
  dy(102) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(48) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(102)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(49) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(102)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(50)*y(99) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(100) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(102)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(102)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(102)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(112) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(102)*y(118)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(102)*y(119));
  dy(103) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(23)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(103)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(103)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(107) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(105) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(80)*y(99) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(101) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(103)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(103)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(103)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(103)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113);
  dy(104) = pkp2*y(4)*y(27)*y(97) + pkp2*y(7)*y(24)*y(97) + -pkpL*y(30)*y(31)*y(104) + pkpLs*y(30)*y(37)*y(101) + pkmL*y(32)*y(108) + -pkmLs*y(44)*y(104) + pdm*y(72)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(104)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(105) + -pkm2*y(98)*y(104) + -pkm2*y(98)*y(104) + -pdm*y(99)*y(104) + pdm*y(99)*y(110) + -ppLgs*y(104)*y(120) + -ppLbs*y(104)*y(121);
  dy(105) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(28)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(105)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(103) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(109) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(105)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(104) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(105)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(105)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(105)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(111) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(114) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(105)*y(120)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(105)*y(121));
  dy(106) = pkp2*y(6)*y(19)*y(97) + pkp2*y(9)*y(15)*y(97) + pkpL*y(30)*y(31)*y(101) + -pkpLs*y(30)*y(37)*y(106) + -pkmL*y(32)*y(106) + ppLb*y(34)*y(119) + ppLg*y(36)*y(118) + pkmLs*y(44)*y(108) + pdm*y(63)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(106)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(107) + -pkm2*y(98)*y(106) + -pkm2*y(98)*y(106) + -pdm*y(99)*y(106) + -pdm*y(99)*y(106);
  dy(107) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(23)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(103) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(107)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(107)) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(40)*y(119) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(109) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(106) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(107)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(107)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(107)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(107)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(115);
  dy(108) = pkp2*y(6)*y(27)*y(97) + pkp2*y(9)*y(24)*y(97) + pkpL*y(30)*y(31)*y(104) + pkpLs*y(30)*y(37)*y(106) + -pkmL*y(32)*y(108) + ppLg*y(43)*y(118) + -pkmLs*y(44)*y(108) + pdm*y(65)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(108)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(109) + -pkm2*y(98)*y(108) + -pkm2*y(98)*y(108) + -pdm*y(99)*y(108) + -ppLgs*y(108)*y(120);
  dy(109) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(28)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(105) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(107) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(109)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(109)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(108) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(109)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(109)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(109)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(116) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(109)*y(120));
  dy(110) = pkp2*y(10)*y(27)*y(97) + pkp2*y(12)*y(24)*y(97) + pkpLs*y(30)*y(37)*y(67) + -pkpLs*y(30)*y(37)*y(110) + pkmLs*y(44)*y(86) + -pkmLs*y(44)*y(110) + pdm*y(82)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(110)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(111) + -pkm2*y(98)*y(110) + -pkm2*y(98)*y(110) + -pdm*y(99)*y(110) + -pdm*y(99)*y(110) + ppLbs*y(104)*y(121) + -ppLgs*y(110)*y(120);
  dy(111) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(28)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(80) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(111)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(91) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(111)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(94)*y(95)*y(110) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(111)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(111)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(111)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(111)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(105)*y(121) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(111)*y(120));
  dy(112) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(25)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(22)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(58) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(112)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(64) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(112)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(55)*y(94)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(73)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(112)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(112)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(112)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(112)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(112)) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(102)*y(118) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(112)*y(119));
  dy(113) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(23)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(113)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(113)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(115) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(114) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(56)*y(94)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(113)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(113)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(113)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(113)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113));
  dy(114) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(28)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(114)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(113) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(116) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(114)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(72)*y(94)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(114)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(114)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(114)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(114)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(114)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(105)*y(120) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(114)*y(121));
  dy(115) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(26)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(23)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(113) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(115)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(115)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(116) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(59)*y(119) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(63)*y(94)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(78)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(115)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(115)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(115)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(115)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(115)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(115));
  dy(116) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(14)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(18)*y(28)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(30)*y(31)*y(114) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(115) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(32)*y(116)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(116)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(65)*y(94)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(89)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(116)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(116)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(116)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(116)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(116)) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(109)*y(120);
  dy(117) = ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(15)*y(29)*y(97) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(19)*y(28)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(81) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(30)*y(37)*y(117)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(92) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(44)*y(117)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(94)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(90)*y(96) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(94)*y(95)*y(117)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(96)*y(117)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(117)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(98)*y(117)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117)) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(111)*y(120) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(114)*y(121);
  dy(118) = 0;
  dy(119) = 0;
  dy(120) = 0;
  dy(121) = 0;
end
