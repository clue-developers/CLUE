

% Automatically generated from fceri_ji_curryFE_B1.
% Original number of species: 121.
% Original number of reactions: 732.

% Correspondence with original names:
%     y(1) = Lig_tot
%     y(2) = S0
%     y(3) = S1
%     y(4) = S3
%     y(5) = kpL
%     y(6) = S4
%     y(7) = S5
%     y(8) = kmL
%     y(9) = S7
%     y(10) = S8
%     y(11) = S6
%     y(12) = S11
%     y(13) = S9
%     y(14) = S10
%     y(15) = kpLs
%     y(16) = S14
%     y(17) = S15
%     y(18) = S17
%     y(19) = S18
%     y(20) = S21
%     y(21) = S16
%     y(22) = S43
%     y(23) = S20
%     y(24) = S12
%     y(25) = S13
%     y(26) = kmLs
%     y(27) = S23
%     y(28) = S24
%     y(29) = S31
%     y(30) = S32
%     y(31) = S36
%     y(32) = S37
%     y(33) = S25
%     y(34) = S26
%     y(35) = S34
%     y(36) = S78
%     y(37) = S39
%     y(38) = S41
%     y(39) = S22
%     y(40) = S27
%     y(41) = S28
%     y(42) = S29
%     y(43) = S30
%     y(44) = S46
%     y(45) = S47
%     y(46) = S48
%     y(47) = S49
%     y(48) = S50
%     y(49) = S52
%     y(50) = S55
%     y(51) = S57
%     y(52) = S58
%     y(53) = S51
%     y(54) = S59
%     y(55) = S60
%     y(56) = S73
%     y(57) = S74
%     y(58) = S76
%     y(59) = S44
%     y(60) = S45
%     y(61) = S53
%     y(62) = S54
%     y(63) = S61
%     y(64) = S62
%     y(65) = S56
%     y(66) = S63
%     y(67) = S64
%     y(68) = S84
%     y(69) = S95
%     y(70) = S96
%     y(71) = S97
%     y(72) = S88
%     y(73) = S99
%     y(74) = S100
%     y(75) = S101
%     y(76) = S79
%     y(77) = S89
%     y(78) = S90
%     y(79) = S92
%     y(80) = S103
%     y(81) = S104
%     y(82) = S93
%     y(83) = S106
%     y(84) = S113
%     y(85) = S114
%     y(86) = S147
%     y(87) = S150
%     y(88) = S154
%     y(89) = S145
%     y(90) = S157
%     y(91) = S170
%     y(92) = S2
%     y(93) = kpS
%     y(94) = kmS
%     y(95) = kp2
%     y(96) = km2
%     y(97) = kp1
%     y(98) = km1
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
%     y(110) = pLg
%     y(111) = pLb
%     y(112) = S82
%     y(113) = S83
%     y(114) = S141
%     y(115) = pLgs
%     y(116) = S80
%     y(117) = S139
%     y(118) = pLbs
%     y(119) = S86
%     y(120) = S120
%     y(121) = S143


function fceri_ji_curryB1
[T,Y]=ode45(@ode,[0 100.0],[  7278.1900000000005 6000.0 28.0 400.0 0.05 0.0 0.0 20.0 0.0 0.0 0.0 0.0 0.0 0.0 0.05 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.12 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 400.0 0.06 0.13 0.25 0.0 1.32845238E-7 0.0 20.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 30.0 0.0 0.0 0.0 3.0 0.0 0.0 100.0 0.0 0.0 0.0]);
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
view= getSpecies(30)/4;
plot(T,view);
hold on;
view= getSpecies(81)/4;
plot(T,view);
hold on;
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(62)/1;
plot(T,view);
hold on;
view= getSpecies(114)/4;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(93)/1;
plot(T,view);
hold on;
view= getSpecies(75)/4;
plot(T,view);
hold on;
view= getSpecies(55)/4;
plot(T,view);
hold on;
view= getSpecies(58)/4;
plot(T,view);
hold on;
view= getSpecies(70)/16;
plot(T,view);
hold on;
view= getSpecies(67)/1;
plot(T,view);
hold on;
view= getSpecies(56)/4;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(51)/4;
plot(T,view);
hold on;
view= getSpecies(36)/4;
plot(T,view);
hold on;
view= getSpecies(82)/1;
plot(T,view);
hold on;
view= getSpecies(1)/11;
plot(T,view);
hold on;
view= getSpecies(73)/10;
plot(T,view);
hold on;
view= getSpecies(106)/1;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(50)/4;
plot(T,view);
hold on;
view= getSpecies(23)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(77)/4;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(49)/4;
plot(T,view);
hold on;
view= getSpecies(92)/4;
plot(T,view);
hold on;
view= getSpecies(120)/4;
plot(T,view);
hold on;
view= getSpecies(91)/10;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(83)/1;
plot(T,view);
hold on;
view= getSpecies(79)/4;
plot(T,view);
hold on;
view= getSpecies(64)/4;
plot(T,view);
hold on;
view= getSpecies(103)/4;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(86)/16;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(60)/1;
plot(T,view);
hold on;
view= getSpecies(115)/1;
plot(T,view);
hold on;
view= getSpecies(19)/1;
plot(T,view);
hold on;
view= getSpecies(105)/4;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(20)/4;
plot(T,view);
hold on;
view= getSpecies(65)/1;
plot(T,view);
hold on;
view= getSpecies(102)/4;
plot(T,view);
hold on;
view= getSpecies(104)/1;
plot(T,view);
hold on;
view= getSpecies(118)/1;
plot(T,view);
hold on;
view= getSpecies(71)/4;
plot(T,view);
hold on;
view= getSpecies(25)/1;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(99)/1;
plot(T,view);
hold on;
view= getSpecies(29)/4;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(31)/1;
plot(T,view);
hold on;
view= getSpecies(110)/1;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(107)/4;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(22)/1;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(44)/4;
plot(T,view);
hold on;
view= getSpecies(78)/1;
plot(T,view);
hold on;
view= getSpecies(101)/1;
plot(T,view);
hold on;
view= getSpecies(45)/1;
plot(T,view);
hold on;
view= getSpecies(74)/16;
plot(T,view);
hold on;
view= getSpecies(95)/1;
plot(T,view);
hold on;
view= getSpecies(94)/1;
plot(T,view);
hold on;
view= getSpecies(97)/1;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(69)/16;
plot(T,view);
hold on;
view= getSpecies(112)/4;
plot(T,view);
hold on;
view= getSpecies(85)/4;
plot(T,view);
hold on;
view= getSpecies(66)/1;
plot(T,view);
hold on;
view= getSpecies(52)/10;
plot(T,view);
hold on;
view= getSpecies(54)/4;
plot(T,view);
hold on;
view= getSpecies(57)/1;
plot(T,view);
hold on;
view= getSpecies(59)/1;
plot(T,view);
hold on;
view= getSpecies(35)/4;
plot(T,view);
hold on;
view= getSpecies(32)/4;
plot(T,view);
hold on;
view= getSpecies(117)/4;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(76)/4;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(113)/4;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(63)/4;
plot(T,view);
hold on;
view= getSpecies(119)/4;
plot(T,view);
hold on;
view= getSpecies(53)/1;
plot(T,view);
hold on;
view= getSpecies(48)/4;
plot(T,view);
hold on;
view= getSpecies(108)/1;
plot(T,view);
hold on;
view= getSpecies(21)/1;
plot(T,view);
hold on;
view= getSpecies(96)/1;
plot(T,view);
hold on;
view= getSpecies(121)/4;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(72)/4;
plot(T,view);
hold on;
view= getSpecies(109)/4;
plot(T,view);
hold on;
view= getSpecies(38)/1;
plot(T,view);
hold on;
view= getSpecies(27)/1;
plot(T,view);
hold on;
view= getSpecies(68)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(89)/4;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(26)/1;
plot(T,view);
hold on;
view= getSpecies(98)/1;
plot(T,view);
hold on;
view= getSpecies(88)/16;
plot(T,view);
hold on;
view= getSpecies(116)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(87)/16;
plot(T,view);
hold on;
view= getSpecies(61)/1;
plot(T,view);
hold on;
view= getSpecies(80)/10;
plot(T,view);
hold on;
view= getSpecies(84)/4;
plot(T,view);
hold on;
view= getSpecies(100)/1;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(111)/1;
plot(T,view);
hold on;
view= getSpecies(90)/4;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vS32','vS104','vS24','vS54','vS141','vS28','vkpS','vS101','vS60','vS76','vS96','vS64','vS73','vS30','vS57','vS78','vS93','vLig_tot','vS99','vS19','vkmL','vS55','vS20','vS29','vS89','vkpL','vS52','vS2','vS120','vS170','vS1','vS106','vS92','vS62','vS69','vkpLs','vS147','vS25','vS5','vS45','vpLgs','vS18','vS117','vS4','vS21','vS56','vS67','vS70','vpLbs','vS97','vS13','vS22','vdm','vS31','vS14','vS36','vpLg','vS49','vS38','vS48','vS43','vS12','vS6','vS46','vS90','vS35','vS47','vS100','vkp2','vkmS','vkp1','vS39','vS95','vS82','vS114','vS63','vS58','vS59','vS74','vS44','vS34','vS37','vS139','vS8','vS79','vS26','vS11','vS83','vS17','vS61','vS86','vS51','vS50','vS40','vS16','vkm2','vS143','vS9','vS88','vS75','vS41','vS23','vS84','vS3','vS145','vS10','vS7','vS15','vkmLs','vkm1','vS154','vS80','vS0','vS150','vS53','vS103','vS113','vS33','vS27','vpLb','vS157');
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
  dy(2) = -2.0 * pkp1*y(2)*y(4)*y(97) + -2.0 * pkp1*y(2)*y(7)*y(97) + -2.0 * pkp1*y(2)*y(17)*y(97) + -2.0 * pkp1*y(2)*y(25)*y(97) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(30)*y(97)) + -2.0 * pkp1*y(2)*y(34)*y(97) + -2.0 * pkp1*y(2)*y(41)*y(97) + -2.0 * pkp1*y(2)*y(43)*y(97) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(55)*y(97)) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(64)*y(97)) + -2.0 * pkp1*y(2)*y(67)*y(97) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(85)*y(97)) + pkm1*y(6)*y(98) + pkm1*y(11)*y(98) + pkm1*y(16)*y(98) + pkm1*y(24)*y(98) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(29)*y(98) + pkm1*y(33)*y(98) + pkm1*y(40)*y(98) + pkm1*y(42)*y(98) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(54)*y(98) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(63)*y(98) + pkm1*y(66)*y(98) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(84)*y(98);
  dy(3) = -pkpL*y(3)*y(4)*y(5) + -pkpL*y(3)*y(5)*y(6) + -2.0 * pkpL*y(3)*y(5)*y(9) + -pkpL*y(3)*y(5)*y(10) + -pkpL*y(3)*y(5)*y(12) + -pkpL*y(3)*y(5)*y(16) + -pkpL*y(3)*y(5)*y(17) + -pkpL*y(3)*y(5)*y(18) + -pkpL*y(3)*y(5)*y(19) + -pkpL*y(3)*y(5)*y(19) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(20)) + -pkpL*y(3)*y(5)*y(27) + -2.0 * pkpL*y(3)*y(5)*y(28) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(29)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(30)) + -pkpL*y(3)*y(5)*y(31) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(32)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(32)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(44)) + -pkpL*y(3)*y(5)*y(45) + -pkpL*y(3)*y(5)*y(46) + -pkpL*y(3)*y(5)*y(47) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(49)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(50)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(51)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(3)*y(5)*y(52)) + -pkpL*y(3)*y(5)*y(68) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(69)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(70)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(71)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(86)) + -pkpL*y(3)*y(5)*y(100) + -pkpL*y(3)*y(5)*y(101) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(102)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(103)) + -pkpL*y(3)*y(5)*y(104) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(105)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(112)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(113)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(114)) + -pkpLs*y(3)*y(14)*y(15) + -pkpLs*y(3)*y(15)*y(18) + -pkpLs*y(3)*y(15)*y(22) + -pkpLs*y(3)*y(15)*y(24) + -pkpLs*y(3)*y(15)*y(25) + -pkpLs*y(3)*y(15)*y(27) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(36)) + -2.0 * pkpLs*y(3)*y(15)*y(39) + -pkpLs*y(3)*y(15)*y(40) + -pkpLs*y(3)*y(15)*y(41) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(44)) + -pkpLs*y(3)*y(15)*y(46) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(50)) + -pkpLs*y(3)*y(15)*y(53) + -pkpLs*y(3)*y(15)*y(59) + -pkpLs*y(3)*y(15)*y(59) + -pkpLs*y(3)*y(15)*y(60) + -2.0 * pkpLs*y(3)*y(15)*y(61) + -pkpLs*y(3)*y(15)*y(62) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(63)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(64)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(70)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(72)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(74)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(76)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(76)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(77)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(77)) + -pkpLs*y(3)*y(15)*y(78) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(79)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(3)*y(15)*y(80)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(81)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(88)) + -pkpLs*y(3)*y(15)*y(101) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(103)) + -pkpLs*y(3)*y(15)*y(106) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(107)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(113)) + -pkpLs*y(3)*y(15)*y(116) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(117)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(119)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(121)) + pkmL*y(7)*y(8) + pkmL*y(8)*y(10) + pkmL*y(8)*y(11) + pkmL*y(8)*y(12) + 2.0 * pkmL*y(8)*y(13) + pkmL*y(8)*y(14) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(20) + pkmL*y(8)*y(21) + pkmL*y(8)*y(21) + pkmL*y(8)*y(22) + pkmL*y(8)*y(23) + pkmL*y(8)*y(33) + pkmL*y(8)*y(34) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(35) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(35) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(36) + 2.0 * pkmL*y(8)*y(37) + pkmL*y(8)*y(38) + pkmL*y(8)*y(45) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(49) + pkmL*y(8)*y(53) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(54) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(55) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(56) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(56) + pkmL*y(8)*y(57) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(58) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(69) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(72) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(8)*y(73) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(74) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(75) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(87) + pkmL*y(8)*y(100) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(102) + pkmL*y(8)*y(106) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(107) + pkmL*y(8)*y(108) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(109) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(112) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(119) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(120) + pkmLs*y(23)*y(26) + pkmLs*y(26)*y(31) + pkmLs*y(26)*y(38) + pkmLs*y(26)*y(42) + pkmLs*y(26)*y(43) + pkmLs*y(26)*y(47) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(51) + pkmLs*y(26)*y(57) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(58) + pkmLs*y(26)*y(60) + pkmLs*y(26)*y(62) + 2.0 * pkmLs*y(26)*y(65) + pkmLs*y(26)*y(66) + pkmLs*y(26)*y(67) + pkmLs*y(26)*y(68) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(71) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(75) + pkmLs*y(26)*y(78) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(79) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(81) + pkmLs*y(26)*y(82) + pkmLs*y(26)*y(82) + 2.0 * pkmLs*y(26)*y(83) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(84) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(85) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(86) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(87) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(88) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(89) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(89) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(90) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(90) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(26)*y(91) + pkmLs*y(26)*y(104) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(105) + pkmLs*y(26)*y(108) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(109) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(114) + pkmLs*y(26)*y(116) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(117) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(120) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(121);
  dy(4) = -2.0 * pkp1*y(2)*y(4)*y(97) + -pkpL*y(3)*y(4)*y(5) + -pkp2*y(4)*y(6)*y(95) + -pkp2*y(4)*y(11)*y(95) + -pkp2*y(4)*y(16)*y(95) + -pkp2*y(4)*y(24)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(95)) + -pkp2*y(4)*y(33)*y(95) + -pkp2*y(4)*y(40)*y(95) + -pkp2*y(4)*y(42)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(63)*y(95)) + -pkp2*y(4)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(84)*y(95)) + pkm1*y(6)*y(98) + pkmL*y(7)*y(8) + 2.0 * pkm2*y(9)*y(96) + pkm2*y(10)*y(96) + pdm*y(17)*y(99) + pkm2*y(18)*y(96) + pkm2*y(19)*y(96) + pdm*y(25)*y(99) + pkm2*y(31)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(32)*y(96) + pkm2*y(96)*y(100) + pkm2*y(96)*y(101) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(103) + pkm2*y(96)*y(104) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(105);
  dy(5) = 0;
  dy(6) = 2.0 * pkp1*y(2)*y(4)*y(97) + -pkpL*y(3)*y(5)*y(6) + -pkp2*y(4)*y(6)*y(95) + -pkp2*y(6)*y(7)*y(95) + -pkp2*y(6)*y(17)*y(95) + -pkp2*y(6)*y(25)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(30)*y(95)) + -pkp2*y(6)*y(34)*y(95) + -pkp2*y(6)*y(41)*y(95) + -pkp2*y(6)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(64)*y(95)) + -pkp2*y(6)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(85)*y(95)) + -pkm1*y(6)*y(98) + pkmL*y(8)*y(11) + 2.0 * pkm2*y(9)*y(96) + pkm2*y(10)*y(96) + pdm*y(16)*y(99) + pkm2*y(18)*y(96) + pkm2*y(19)*y(96) + pdm*y(24)*y(99) + pkm2*y(31)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(32)*y(96) + pkm2*y(96)*y(100) + pkm2*y(96)*y(101) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(103) + pkm2*y(96)*y(104) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(105);
  dy(7) = -2.0 * pkp1*y(2)*y(7)*y(97) + pkpL*y(3)*y(4)*y(5) + -pkp2*y(6)*y(7)*y(95) + -pkmL*y(7)*y(8) + -pkp2*y(7)*y(11)*y(95) + -pkp2*y(7)*y(16)*y(95) + -pkp2*y(7)*y(24)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(95)) + -pkp2*y(7)*y(33)*y(95) + -pkp2*y(7)*y(40)*y(95) + -pkp2*y(7)*y(42)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(63)*y(95)) + -pkp2*y(7)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(84)*y(95)) + pkm2*y(10)*y(96) + pkm1*y(11)*y(98) + pkm2*y(12)*y(96) + 2.0 * pkm2*y(13)*y(96) + pkm2*y(14)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(20)*y(96) + pkm2*y(21)*y(96) + pkm2*y(23)*y(96) + pdm*y(34)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(35)*y(96) + pkm2*y(96)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(107) + pkm2*y(96)*y(108) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(109);
  dy(8) = 0;
  dy(9) = -2.0 * pkpL*y(3)*y(5)*y(9) + pkp2*y(4)*y(6)*y(95) + pkmL*y(8)*y(10) + -2.0 * pkm2*y(9)*y(96) + pdm*y(18)*y(99) + pdm*y(19)*y(99);
  dy(10) = 2.0 * pkpL*y(3)*y(5)*y(9) + -pkpL*y(3)*y(5)*y(10) + pkp2*y(4)*y(11)*y(95) + pkp2*y(6)*y(7)*y(95) + -pkmL*y(8)*y(10) + 2.0 * pkmL*y(8)*y(13) + -pkm2*y(10)*y(96) + -pkm2*y(10)*y(96) + -ppLg*y(10)*y(110) + -ppLb*y(10)*y(111) + pdm*y(12)*y(99) + pdm*y(14)*y(99) + pdm*y(99)*y(100);
  dy(11) = 2.0 * pkp1*y(2)*y(7)*y(97) + pkpL*y(3)*y(5)*y(6) + -pkp2*y(4)*y(11)*y(95) + -pkp2*y(7)*y(11)*y(95) + -pkmL*y(8)*y(11) + pkm2*y(10)*y(96) + -pkp2*y(11)*y(17)*y(95) + -pkp2*y(11)*y(25)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(30)*y(95)) + -pkp2*y(11)*y(34)*y(95) + -pkp2*y(11)*y(41)*y(95) + -pkp2*y(11)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(64)*y(95)) + -pkp2*y(11)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(85)*y(95)) + -pkm1*y(11)*y(98) + pkm2*y(12)*y(96) + 2.0 * pkm2*y(13)*y(96) + pkm2*y(14)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(20)*y(96) + pkm2*y(21)*y(96) + pkm2*y(23)*y(96) + pdm*y(33)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(35)*y(96) + pkm2*y(96)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(107) + pkm2*y(96)*y(108) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(109);
  dy(12) = -pkpL*y(3)*y(5)*y(12) + pkpL*y(3)*y(5)*y(19) + pkp2*y(7)*y(16)*y(95) + -pkmL*y(8)*y(12) + pkmL*y(8)*y(21) + ppLg*y(10)*y(110) + pkp2*y(11)*y(17)*y(95) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(12)*y(92)*y(93)) + -pkm2*y(12)*y(96) + -pkm2*y(12)*y(96) + -pdm*y(12)*y(99) + -ppLb*y(12)*y(111) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(20)*y(94) + pdm*y(45)*y(99) + pdm*y(99)*y(106);
  dy(13) = pkpL*y(3)*y(5)*y(10) + pkp2*y(7)*y(11)*y(95) + -2.0 * pkmL*y(8)*y(13) + -2.0 * pkm2*y(13)*y(96) + -2.0 * ppLg*y(13)*y(110) + pdm*y(21)*y(99);
  dy(14) = pkpL*y(3)*y(5)*y(18) + -pkpLs*y(3)*y(14)*y(15) + pkp2*y(7)*y(24)*y(95) + -pkmL*y(8)*y(14) + ppLb*y(10)*y(111) + pkp2*y(11)*y(25)*y(95) + -pkm2*y(14)*y(96) + -pkm2*y(14)*y(96) + -pdm*y(14)*y(99) + -ppLg*y(14)*y(110) + pdm*y(22)*y(99) + pkmLs*y(23)*y(26) + pdm*y(99)*y(106);
  dy(15) = 0;
  dy(16) = 2.0 * pkp1*y(2)*y(17)*y(97) + -pkpL*y(3)*y(5)*y(16) + -pkp2*y(4)*y(16)*y(95) + -pkp2*y(7)*y(16)*y(95) + pkmL*y(8)*y(33) + pkm2*y(12)*y(96) + -pkp2*y(16)*y(17)*y(95) + -pkp2*y(16)*y(25)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(30)*y(95)) + -pkp2*y(16)*y(34)*y(95) + -pkp2*y(16)*y(41)*y(95) + -pkp2*y(16)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(64)*y(95)) + -pkp2*y(16)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(85)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(16)*y(92)*y(93)) + -pkm1*y(16)*y(98) + -pdm*y(16)*y(99) + pkm2*y(19)*y(96) + pkm2*y(27)*y(96) + 2.0 * pkm2*y(28)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(29)*y(94) + pdm*y(40)*y(99) + pkm2*y(45)*y(96) + pkm2*y(46)*y(96) + pkm2*y(47)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(96) + pkm2*y(68)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(112) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(114);
  dy(17) = -2.0 * pkp1*y(2)*y(17)*y(97) + -pkpL*y(3)*y(5)*y(17) + -pkp2*y(6)*y(17)*y(95) + pkmL*y(8)*y(34) + -pkp2*y(11)*y(17)*y(95) + pkm2*y(12)*y(96) + -pkp2*y(16)*y(17)*y(95) + pkm1*y(16)*y(98) + -pkp2*y(17)*y(24)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(29)*y(95)) + -pkp2*y(17)*y(33)*y(95) + -pkp2*y(17)*y(40)*y(95) + -pkp2*y(17)*y(42)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(63)*y(95)) + -pkp2*y(17)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(84)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(17)*y(92)*y(93)) + -pdm*y(17)*y(99) + pkm2*y(19)*y(96) + pkm2*y(27)*y(96) + 2.0 * pkm2*y(28)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(30)*y(94) + pdm*y(41)*y(99) + pkm2*y(45)*y(96) + pkm2*y(46)*y(96) + pkm2*y(47)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(96) + pkm2*y(68)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(112) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(114);
  dy(18) = -pkpL*y(3)*y(5)*y(18) + -pkpLs*y(3)*y(15)*y(18) + pkp2*y(4)*y(24)*y(95) + pkp2*y(6)*y(25)*y(95) + pkmL*y(8)*y(14) + -pkm2*y(18)*y(96) + -pkm2*y(18)*y(96) + -pdm*y(18)*y(99) + pkmLs*y(26)*y(31) + pdm*y(27)*y(99) + 2.0 * pdm*y(39)*y(99) + pdm*y(99)*y(101);
  dy(19) = -pkpL*y(3)*y(5)*y(19) + -pkpL*y(3)*y(5)*y(19) + pkp2*y(4)*y(16)*y(95) + pkp2*y(6)*y(17)*y(95) + pkmL*y(8)*y(12) + pkmL*y(8)*y(100) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(19)*y(92)*y(93)) + -pkm2*y(19)*y(96) + -pkm2*y(19)*y(96) + -pdm*y(19)*y(99) + pdm*y(27)*y(99) + 2.0 * pdm*y(28)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(32)*y(94) + pdm*y(99)*y(101);
  dy(20) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(20)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(32) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(95) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(20)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(35) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(30)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(12)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(20)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(20)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(20)*y(96)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(20)*y(111)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(49)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(107);
  dy(21) = pkpL*y(3)*y(5)*y(12) + pkpL*y(3)*y(5)*y(100) + pkp2*y(7)*y(33)*y(95) + -pkmL*y(8)*y(21) + -pkmL*y(8)*y(21) + pkp2*y(11)*y(34)*y(95) + 2.0 * ppLg*y(13)*y(110) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(21)*y(92)*y(93)) + -pkm2*y(21)*y(96) + -pkm2*y(21)*y(96) + -pdm*y(21)*y(99) + -ppLg*y(21)*y(110) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(35)*y(94) + 2.0 * pdm*y(37)*y(99);
  dy(22) = pkpL*y(3)*y(5)*y(27) + -pkpLs*y(3)*y(15)*y(22) + -pkmL*y(8)*y(22) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(22)*y(92)*y(93)) + -pkm2*y(22)*y(96) + -pkm2*y(22)*y(96) + -pdm*y(22)*y(99) + -pdm*y(22)*y(99) + -ppLg*y(22)*y(110) + pkp2*y(24)*y(34)*y(95) + pkp2*y(25)*y(33)*y(95) + pkmLs*y(26)*y(38) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(36)*y(94) + pdm*y(53)*y(99) + ppLb*y(100)*y(111);
  dy(23) = pkpL*y(3)*y(5)*y(31) + pkpLs*y(3)*y(14)*y(15) + pkp2*y(7)*y(42)*y(95) + -pkmL*y(8)*y(23) + pkp2*y(11)*y(43)*y(95) + -pkmLs*y(23)*y(26) + -pkm2*y(23)*y(96) + -pkm2*y(23)*y(96) + -ppLg*y(23)*y(110) + -ppLgs*y(23)*y(115) + pdm*y(38)*y(99) + pdm*y(99)*y(108);
  dy(24) = 2.0 * pkp1*y(2)*y(25)*y(97) + -pkpLs*y(3)*y(15)*y(24) + -pkp2*y(4)*y(24)*y(95) + -pkp2*y(7)*y(24)*y(95) + pkm2*y(14)*y(96) + -pkp2*y(17)*y(24)*y(95) + pkm2*y(18)*y(96) + pkm2*y(22)*y(96) + -pkp2*y(24)*y(25)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(30)*y(95)) + -pkp2*y(24)*y(34)*y(95) + -pkp2*y(24)*y(41)*y(95) + -pkp2*y(24)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(64)*y(95)) + -pkp2*y(24)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(85)*y(95)) + -pkm1*y(24)*y(98) + -pdm*y(24)*y(99) + pkmLs*y(26)*y(42) + pkm2*y(27)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(36)*y(96) + 2.0 * pkm2*y(39)*y(96) + pdm*y(40)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(44)*y(96) + pkm2*y(59)*y(96) + pkm2*y(60)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(96) + pkm2*y(96)*y(116) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(117);
  dy(25) = -2.0 * pkp1*y(2)*y(25)*y(97) + -pkpLs*y(3)*y(15)*y(25) + -pkp2*y(6)*y(25)*y(95) + -pkp2*y(11)*y(25)*y(95) + pkm2*y(14)*y(96) + -pkp2*y(16)*y(25)*y(95) + pkm2*y(18)*y(96) + pkm2*y(22)*y(96) + -pkp2*y(24)*y(25)*y(95) + pkm1*y(24)*y(98) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(29)*y(95)) + -pkp2*y(25)*y(33)*y(95) + -pkp2*y(25)*y(40)*y(95) + -pkp2*y(25)*y(42)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(63)*y(95)) + -pkp2*y(25)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(84)*y(95)) + -pdm*y(25)*y(99) + pkmLs*y(26)*y(43) + pkm2*y(27)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(36)*y(96) + 2.0 * pkm2*y(39)*y(96) + pdm*y(41)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(44)*y(96) + pkm2*y(59)*y(96) + pkm2*y(60)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(96) + pkm2*y(96)*y(116) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(117);
  dy(26) = 0;
  dy(27) = -pkpL*y(3)*y(5)*y(27) + -pkpLs*y(3)*y(15)*y(27) + pkmL*y(8)*y(22) + pkp2*y(16)*y(25)*y(95) + pkp2*y(17)*y(24)*y(95) + pkmLs*y(26)*y(47) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(27)*y(92)*y(93)) + -pkm2*y(27)*y(96) + -pkm2*y(27)*y(96) + -pdm*y(27)*y(99) + -pdm*y(27)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(44)*y(94) + pdm*y(46)*y(99) + pdm*y(59)*y(99);
  dy(28) = -2.0 * pkpL*y(3)*y(5)*y(28) + pkmL*y(8)*y(45) + pkp2*y(16)*y(17)*y(95) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(28)*y(92)*y(93)) + -2.0 * pkm2*y(28)*y(96) + -2.0 * pdm*y(28)*y(99) + pdm*y(46)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(48)*y(94);
  dy(29) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(30)*y(97) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(29)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(95)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(54) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(16)*y(92)*y(93) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(29)*y(95)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(20)*y(96) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(29)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(30)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(41)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(55)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(67)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(85)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(29)*y(94)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(29)*y(98)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(32)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(44)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(51)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(52)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(63)*y(99) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(69)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(70)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(71)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(86)*y(96);
  dy(30) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(30)*y(97)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(30)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(30)*y(95)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(55) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(30)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(30)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(17)*y(92)*y(93) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(20)*y(96) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(30)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(30)*y(95)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(29)*y(98) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(33)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(40)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(42)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(54)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(66)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(84)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(30)*y(94)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(32)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(44)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(51)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(52)*y(96) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(64)*y(99) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(69)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(70)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(71)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(86)*y(96);
  dy(31) = -pkpL*y(3)*y(5)*y(31) + pkpLs*y(3)*y(15)*y(18) + pkp2*y(4)*y(42)*y(95) + pkp2*y(6)*y(43)*y(95) + pkmL*y(8)*y(23) + -pkmLs*y(26)*y(31) + -pkm2*y(31)*y(96) + -pkm2*y(31)*y(96) + -ppLgs*y(31)*y(115) + -ppLbs*y(31)*y(118) + pdm*y(47)*y(99) + pdm*y(60)*y(99) + pdm*y(99)*y(104);
  dy(32) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(32)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(32)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(30)*y(95) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(20) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(102) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(19)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(32)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(32)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(32)*y(96)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(44)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(48)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(103);
  dy(33) = 2.0 * pkp1*y(2)*y(34)*y(97) + pkpL*y(3)*y(5)*y(16) + -pkp2*y(4)*y(33)*y(95) + -pkp2*y(7)*y(33)*y(95) + -pkmL*y(8)*y(33) + -pkp2*y(17)*y(33)*y(95) + pkm2*y(21)*y(96) + pkm2*y(22)*y(96) + -pkp2*y(25)*y(33)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(33)*y(95)) + -pkp2*y(33)*y(34)*y(95) + -pkp2*y(33)*y(41)*y(95) + -pkp2*y(33)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(64)*y(95)) + -pkp2*y(33)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(85)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(33)*y(92)*y(93)) + -pkm1*y(33)*y(98) + -pdm*y(33)*y(99) + 2.0 * pkm2*y(37)*y(96) + pkm2*y(38)*y(96) + pkm2*y(45)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(96) + pkm2*y(53)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(54)*y(94) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(56)*y(96) + pkm2*y(57)*y(96) + pkm2*y(96)*y(100) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(119) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(120);
  dy(34) = -2.0 * pkp1*y(2)*y(34)*y(97) + pkpL*y(3)*y(5)*y(17) + -pkp2*y(6)*y(34)*y(95) + -pkmL*y(8)*y(34) + -pkp2*y(11)*y(34)*y(95) + -pkp2*y(16)*y(34)*y(95) + pkm2*y(21)*y(96) + pkm2*y(22)*y(96) + -pkp2*y(24)*y(34)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(95)) + -pkp2*y(33)*y(34)*y(95) + pkm1*y(33)*y(98) + -pkp2*y(34)*y(40)*y(95) + -pkp2*y(34)*y(42)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(63)*y(95)) + -pkp2*y(34)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(84)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(34)*y(92)*y(93)) + -pdm*y(34)*y(99) + 2.0 * pkm2*y(37)*y(96) + pkm2*y(38)*y(96) + pkm2*y(45)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(96) + pkm2*y(53)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(55)*y(94) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(56)*y(96) + pkm2*y(57)*y(96) + pkm2*y(96)*y(100) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(119) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(120);
  dy(35) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(20) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(102) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(54)*y(95) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(35)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(35)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(55)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(21)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(35)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(35)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(35)*y(96)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(35)*y(110)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(56)*y(99);
  dy(36) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(44) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(36)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(36)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(22)*y(92)*y(93) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(55)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(54)*y(95) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(58) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(36)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(36)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(36)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(36)*y(99)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(36)*y(110)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(72)*y(99) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(102)*y(111);
  dy(37) = pkpL*y(3)*y(5)*y(45) + -2.0 * pkmL*y(8)*y(37) + ppLg*y(21)*y(110) + pkp2*y(33)*y(34)*y(95) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(37)*y(92)*y(93)) + -2.0 * pkm2*y(37)*y(96) + -2.0 * pdm*y(37)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(56)*y(94);
  dy(38) = pkpL*y(3)*y(5)*y(47) + pkpLs*y(3)*y(15)*y(22) + -pkmL*y(8)*y(38) + ppLgs*y(23)*y(115) + -pkmLs*y(26)*y(38) + pkp2*y(33)*y(43)*y(95) + pkp2*y(34)*y(42)*y(95) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(38)*y(92)*y(93)) + -pkm2*y(38)*y(96) + -pkm2*y(38)*y(96) + -pdm*y(38)*y(99) + -ppLg*y(38)*y(110) + pdm*y(57)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(58)*y(94);
  dy(39) = -2.0 * pkpLs*y(3)*y(15)*y(39) + pkp2*y(24)*y(25)*y(95) + pkmLs*y(26)*y(60) + -2.0 * pkm2*y(39)*y(96) + -2.0 * pdm*y(39)*y(99) + pdm*y(59)*y(99);
  dy(40) = 2.0 * pkp1*y(2)*y(41)*y(97) + -pkpLs*y(3)*y(15)*y(40) + -pkp2*y(4)*y(40)*y(95) + -pkp2*y(7)*y(40)*y(95) + -pkp2*y(17)*y(40)*y(95) + -pkp2*y(25)*y(40)*y(95) + pkmLs*y(26)*y(66) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(40)*y(95)) + -pkp2*y(34)*y(40)*y(95) + -pkp2*y(40)*y(41)*y(95) + -pkp2*y(40)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(64)*y(95)) + -pkp2*y(40)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(85)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(40)*y(92)*y(93)) + -pkm1*y(40)*y(98) + -pdm*y(40)*y(99) + -pdm*y(40)*y(99) + pkm2*y(46)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(96) + pkm2*y(53)*y(96) + pkm2*y(59)*y(96) + 2.0 * pkm2*y(61)*y(96) + pkm2*y(62)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(63)*y(94) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(72)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(77)*y(96) + pkm2*y(78)*y(96) + pkm2*y(96)*y(101) + pkm2*y(96)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(121);
  dy(41) = -2.0 * pkp1*y(2)*y(41)*y(97) + -pkpLs*y(3)*y(15)*y(41) + -pkp2*y(6)*y(41)*y(95) + -pkp2*y(11)*y(41)*y(95) + -pkp2*y(16)*y(41)*y(95) + -pkp2*y(24)*y(41)*y(95) + pkmLs*y(26)*y(67) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(41)*y(95)) + -pkp2*y(33)*y(41)*y(95) + -pkp2*y(40)*y(41)*y(95) + pkm1*y(40)*y(98) + -pkp2*y(41)*y(42)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(63)*y(95)) + -pkp2*y(41)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(84)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(41)*y(92)*y(93)) + -pdm*y(41)*y(99) + -pdm*y(41)*y(99) + pkm2*y(46)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(96) + pkm2*y(53)*y(96) + pkm2*y(59)*y(96) + 2.0 * pkm2*y(61)*y(96) + pkm2*y(62)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(64)*y(94) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(72)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(77)*y(96) + pkm2*y(78)*y(96) + pkm2*y(96)*y(101) + pkm2*y(96)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(121);
  dy(42) = 2.0 * pkp1*y(2)*y(43)*y(97) + pkpLs*y(3)*y(15)*y(24) + -pkp2*y(4)*y(42)*y(95) + -pkp2*y(7)*y(42)*y(95) + -pkp2*y(17)*y(42)*y(95) + pkm2*y(23)*y(96) + -pkp2*y(25)*y(42)*y(95) + -pkmLs*y(26)*y(42) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(42)*y(95)) + pkm2*y(31)*y(96) + -pkp2*y(34)*y(42)*y(95) + pkm2*y(38)*y(96) + -pkp2*y(41)*y(42)*y(95) + -pkp2*y(42)*y(43)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(64)*y(95)) + -pkp2*y(42)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(85)*y(95)) + -pkm1*y(42)*y(98) + pkm2*y(47)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(51)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(96) + pkm2*y(60)*y(96) + pkm2*y(62)*y(96) + 2.0 * pkm2*y(65)*y(96) + pdm*y(66)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(96) + pkm2*y(82)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(89)*y(96);
  dy(43) = -2.0 * pkp1*y(2)*y(43)*y(97) + pkpLs*y(3)*y(15)*y(25) + -pkp2*y(6)*y(43)*y(95) + -pkp2*y(11)*y(43)*y(95) + -pkp2*y(16)*y(43)*y(95) + pkm2*y(23)*y(96) + -pkp2*y(24)*y(43)*y(95) + -pkmLs*y(26)*y(43) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(95)) + pkm2*y(31)*y(96) + -pkp2*y(33)*y(43)*y(95) + pkm2*y(38)*y(96) + -pkp2*y(40)*y(43)*y(95) + -pkp2*y(42)*y(43)*y(95) + pkm1*y(42)*y(98) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(63)*y(95)) + -pkp2*y(43)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(84)*y(95)) + pkm2*y(47)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(51)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(96) + pkm2*y(60)*y(96) + pkm2*y(62)*y(96) + 2.0 * pkm2*y(65)*y(96) + pdm*y(67)*y(99) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(96) + pkm2*y(82)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(89)*y(96);
  dy(44) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(44)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(44)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(36) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(30)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(29)*y(95) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(51) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(27)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(44)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(44)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(44)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(44)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(50)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99);
  dy(45) = 2.0 * pkpL*y(3)*y(5)*y(28) + -pkpL*y(3)*y(5)*y(45) + 2.0 * pkmL*y(8)*y(37) + -pkmL*y(8)*y(45) + pkp2*y(16)*y(34)*y(95) + pkp2*y(17)*y(33)*y(95) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(92)*y(93)) + -pkm2*y(45)*y(96) + -pkm2*y(45)*y(96) + -pdm*y(45)*y(99) + -pdm*y(45)*y(99) + -ppLb*y(45)*y(111) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(49)*y(94) + pdm*y(53)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(112) + ppLg*y(100)*y(110);
  dy(46) = -pkpL*y(3)*y(5)*y(46) + -pkpLs*y(3)*y(15)*y(46) + pkmL*y(8)*y(53) + pkp2*y(16)*y(41)*y(95) + pkp2*y(17)*y(40)*y(95) + pkmLs*y(26)*y(68) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(46)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(46)*y(92)*y(93)) + -pkm2*y(46)*y(96) + -pkm2*y(46)*y(96) + -pdm*y(46)*y(99) + -pdm*y(46)*y(99) + -pdm*y(46)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(50)*y(94) + 2.0 * pdm*y(61)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(113);
  dy(47) = -pkpL*y(3)*y(5)*y(47) + pkpLs*y(3)*y(15)*y(27) + pkmL*y(8)*y(38) + pkp2*y(16)*y(43)*y(95) + pkp2*y(17)*y(42)*y(95) + -pkmLs*y(26)*y(47) + ppLgs*y(31)*y(115) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(47)*y(92)*y(93)) + -pkm2*y(47)*y(96) + -pkm2*y(47)*y(96) + -pdm*y(47)*y(99) + -ppLbs*y(47)*y(118) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(51)*y(94) + pdm*y(62)*y(99) + pdm*y(68)*y(99);
  dy(48) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(48)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(49) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(112) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(30)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(29)*y(95) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(28)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(48)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(48)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(48)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(48)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(50)*y(99) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(52)*y(94) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113);
  dy(49) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(48) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(49)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(49)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(56) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(33)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(49)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(49)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(49)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(49)*y(99)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(49)*y(111)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(69)*y(94) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119);
  dy(50) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(50)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(50)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(72) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(71) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(41)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(40)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(46)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(50)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(50)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(50)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(50)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(50)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(70)*y(94) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99);
  dy(51) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(51)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(44) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(58) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(51)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(42)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(47)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(51)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(51)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(51)*y(96)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(51)*y(118)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(71)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(79)*y(99);
  dy(52) = -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(3)*y(5)*y(52)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(69) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(30)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(48)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(52)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(52)*y(96)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(70)*y(99);
  dy(53) = pkpL*y(3)*y(5)*y(46) + -pkpLs*y(3)*y(15)*y(53) + -pkmL*y(8)*y(53) + ppLg*y(22)*y(110) + pkmLs*y(26)*y(57) + pkp2*y(33)*y(41)*y(95) + pkp2*y(34)*y(40)*y(95) + ppLb*y(45)*y(111) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(53)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(53)*y(92)*y(93)) + -pkm2*y(53)*y(96) + -pkm2*y(53)*y(96) + -pdm*y(53)*y(99) + -pdm*y(53)*y(99) + -pdm*y(53)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(72)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(119);
  dy(54) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(55)*y(97) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(29) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(54)*y(95)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(54)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(54)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(54)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(33)*y(92)*y(93) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(54)*y(95)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(35)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(36)*y(96) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(54)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(54)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(55)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(54)*y(67)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(85)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(54)*y(94)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(54)*y(98)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(56)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(69)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(72)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(73)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(87)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(112);
  dy(55) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(55)*y(97)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(30) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(55)*y(95)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(55)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(55)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(55)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(34)*y(92)*y(93) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(35)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(36)*y(96) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(55)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(55)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(55)*y(95)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(54)*y(98) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(55)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(55)*y(66)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(55)*y(84)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(55)*y(94)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(56)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(69)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(72)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(73)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(87)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(112);
  dy(56) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(49) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(112) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(56)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(56)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(55)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(54)*y(95) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(35)*y(110) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(37)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(56)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(56)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(56)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(56)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(56)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(73)*y(94);
  dy(57) = pkpL*y(3)*y(5)*y(68) + pkpLs*y(3)*y(15)*y(53) + -pkmL*y(8)*y(57) + -pkmLs*y(26)*y(57) + pkp2*y(33)*y(67)*y(95) + pkp2*y(34)*y(66)*y(95) + ppLg*y(38)*y(110) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(92)*y(93)) + -pkm2*y(57)*y(96) + -pkm2*y(57)*y(96) + -pdm*y(57)*y(99) + -pdm*y(57)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(75)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(120) + ppLgs*y(108)*y(115);
  dy(58) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(51) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(36) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(58)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(58)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(38)*y(92)*y(93) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(55)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(54)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(58)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(58)*y(96)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(58)*y(110)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(75)*y(99);
  dy(59) = -pkpLs*y(3)*y(15)*y(59) + -pkpLs*y(3)*y(15)*y(59) + pkp2*y(24)*y(41)*y(95) + pkp2*y(25)*y(40)*y(95) + pkmLs*y(26)*y(62) + pkmLs*y(26)*y(116) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(59)*y(92)*y(93)) + -pkm2*y(59)*y(96) + -pkm2*y(59)*y(96) + -pdm*y(59)*y(99) + -pdm*y(59)*y(99) + -pdm*y(59)*y(99) + 2.0 * pdm*y(61)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(76)*y(94);
  dy(60) = 2.0 * pkpLs*y(3)*y(15)*y(39) + -pkpLs*y(3)*y(15)*y(60) + pkp2*y(24)*y(43)*y(95) + pkp2*y(25)*y(42)*y(95) + -pkmLs*y(26)*y(60) + 2.0 * pkmLs*y(26)*y(65) + ppLbs*y(31)*y(118) + -pkm2*y(60)*y(96) + -pkm2*y(60)*y(96) + -pdm*y(60)*y(99) + -ppLgs*y(60)*y(115) + pdm*y(62)*y(99) + pdm*y(99)*y(116);
  dy(61) = -2.0 * pkpLs*y(3)*y(15)*y(61) + pkmLs*y(26)*y(78) + pkp2*y(40)*y(41)*y(95) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(61)*y(92)*y(93)) + -2.0 * pkm2*y(61)*y(96) + -2.0 * pdm*y(61)*y(99) + -2.0 * pdm*y(61)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(77)*y(94);
  dy(62) = pkpLs*y(3)*y(15)*y(59) + -pkpLs*y(3)*y(15)*y(62) + -pkmLs*y(26)*y(62) + pkmLs*y(26)*y(82) + pkp2*y(40)*y(43)*y(95) + pkp2*y(41)*y(42)*y(95) + ppLbs*y(47)*y(118) + ppLgs*y(60)*y(115) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(62)*y(92)*y(93)) + -pkm2*y(62)*y(96) + -pkm2*y(62)*y(96) + -pdm*y(62)*y(99) + -pdm*y(62)*y(99) + pdm*y(78)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(79)*y(94);
  dy(63) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(64)*y(97) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(63)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(63)*y(95)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(84) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(63)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(40)*y(92)*y(93) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(63)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(63)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(55)*y(63)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(63)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(63)*y(67)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(63)*y(85)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(63)*y(94)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(63)*y(98)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(63)*y(99)) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(70)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(77)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(80)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(103) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(107) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(119);
  dy(64) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(64)*y(97)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(64)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(64)*y(95)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(85) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(64)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(64)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(41)*y(92)*y(93) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(64)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(64)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(63)*y(64)*y(95)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(63)*y(98) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(64)*y(66)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(64)*y(84)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(64)*y(94)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(64)*y(99)) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(70)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(77)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(80)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(103) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(107) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(113) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(119);
  dy(65) = pkpLs*y(3)*y(15)*y(60) + -2.0 * pkmLs*y(26)*y(65) + pkp2*y(42)*y(43)*y(95) + -2.0 * pkm2*y(65)*y(96) + -2.0 * ppLgs*y(65)*y(115) + pdm*y(82)*y(99);
  dy(66) = 2.0 * pkp1*y(2)*y(67)*y(97) + pkpLs*y(3)*y(15)*y(40) + -pkp2*y(4)*y(66)*y(95) + -pkp2*y(7)*y(66)*y(95) + -pkp2*y(17)*y(66)*y(95) + -pkp2*y(25)*y(66)*y(95) + -pkmLs*y(26)*y(66) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(66)*y(95)) + -pkp2*y(34)*y(66)*y(95) + -pkp2*y(41)*y(66)*y(95) + -pkp2*y(43)*y(66)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(55)*y(66)*y(95)) + pkm2*y(57)*y(96) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(64)*y(66)*y(95)) + -pkp2*y(66)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(66)*y(85)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(66)*y(92)*y(93)) + -pkm1*y(66)*y(98) + -pdm*y(66)*y(99) + pkm2*y(68)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(71)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(96) + pkm2*y(78)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(96) + pkm2*y(82)*y(96) + 2.0 * pkm2*y(83)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(84)*y(94) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(90)*y(96) + pkm2*y(96)*y(104) + pkm2*y(96)*y(108) + pkm2*y(96)*y(116);
  dy(67) = -2.0 * pkp1*y(2)*y(67)*y(97) + pkpLs*y(3)*y(15)*y(41) + -pkp2*y(6)*y(67)*y(95) + -pkp2*y(11)*y(67)*y(95) + -pkp2*y(16)*y(67)*y(95) + -pkp2*y(24)*y(67)*y(95) + -pkmLs*y(26)*y(67) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(67)*y(95)) + -pkp2*y(33)*y(67)*y(95) + -pkp2*y(40)*y(67)*y(95) + -pkp2*y(42)*y(67)*y(95) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(54)*y(67)*y(95)) + pkm2*y(57)*y(96) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(63)*y(67)*y(95)) + -pkp2*y(66)*y(67)*y(95) + pkm1*y(66)*y(98) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(67)*y(84)*y(95)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(67)*y(92)*y(93)) + -pdm*y(67)*y(99) + pkm2*y(68)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(71)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(96) + pkm2*y(78)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(96) + pkm2*y(82)*y(96) + 2.0 * pkm2*y(83)*y(96) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(85)*y(94) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(90)*y(96) + pkm2*y(96)*y(104) + pkm2*y(96)*y(108) + pkm2*y(96)*y(116);
  dy(68) = -pkpL*y(3)*y(5)*y(68) + pkpLs*y(3)*y(15)*y(46) + pkmL*y(8)*y(57) + pkp2*y(16)*y(67)*y(95) + pkp2*y(17)*y(66)*y(95) + -pkmLs*y(26)*y(68) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(68)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(68)*y(92)*y(93)) + -pkm2*y(68)*y(96) + -pkm2*y(68)*y(96) + -pdm*y(68)*y(99) + -pdm*y(68)*y(99) + -ppLbs*y(68)*y(118) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(71)*y(94) + pdm*y(78)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(114) + ppLgs*y(104)*y(115);
  dy(69) = ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(3)*y(5)*y(52) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(69)) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(69)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(8)*y(73) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(55)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(54)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(49)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(69)*y(94)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(69)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(69)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(69)*y(96)) + -(((((((((((((((((ppLb + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) / 16.0)*y(69)*y(111)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(74)*y(99) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(112);
  dy(70) = -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(70)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(70)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(74) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(86) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(64)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(63)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(50)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(70)*y(94)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(70)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(70)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(70)*y(96)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(70)*y(99)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) / 10.0)*y(80)*y(99) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(113);
  dy(71) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(71)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(50) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(75) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(71)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(67)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(30)*y(66)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(68)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(71)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(71)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(71)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(71)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(71)*y(99)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(71)*y(118)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(86)*y(94);
  dy(72) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(50) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(72)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(72)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(75) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(36)*y(110) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(55)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(54)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(53)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(72)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(72)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(72)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(72)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(72)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(72)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(94) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(111)*y(112);
  dy(73) = ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(69) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(8)*y(73)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(55)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(56)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(73)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(73)*y(96));
  dy(74) = ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(70) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(74)) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(74)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(87) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(64)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(55)*y(63)*y(95) + ((((((((((((((((ppLb + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) / 16.0)*y(69)*y(111) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(72)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(94)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(74)*y(96)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(74)*y(99)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(119);
  dy(75) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(71) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(72) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(75)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(75)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(54)*y(67)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(55)*y(66)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(92)*y(93) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(58)*y(110) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(75)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(75)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(75)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(75)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(87)*y(94);
  dy(76) = -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(76)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(76)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(64)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(63)*y(95) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(79) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(117) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(59)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(76)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(76)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99);
  dy(77) = -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(77)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(77)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(81) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(121) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(64)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(63)*y(95) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(61)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(77)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(77)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(77)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(77)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(80)*y(94);
  dy(78) = 2.0 * pkpLs*y(3)*y(15)*y(61) + -pkpLs*y(3)*y(15)*y(78) + -pkmLs*y(26)*y(78) + 2.0 * pkmLs*y(26)*y(83) + pkp2*y(40)*y(67)*y(95) + pkp2*y(41)*y(66)*y(95) + ppLbs*y(68)*y(118) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(78)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(78)*y(92)*y(93)) + -pkm2*y(78)*y(96) + -pkm2*y(78)*y(96) + -pdm*y(78)*y(99) + -pdm*y(78)*y(99) + -pdm*y(78)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(81)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(121) + ppLgs*y(115)*y(116);
  dy(79) = ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(76) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(79)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(79)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(89) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(64)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(63)*y(95) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(51)*y(118) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(62)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(79)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(79)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(79)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99);
  dy(80) = -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(3)*y(15)*y(80)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(88) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(63)*y(64)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(77)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(80)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(80)*y(96)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) / 10.0)*y(80)*y(99));
  dy(81) = ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(77) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(81)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(81)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(90) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(63)*y(67)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(64)*y(66)*y(95) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(71)*y(118) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(78)*y(92)*y(93) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(81)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(81)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(81)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(94);
  dy(82) = pkpLs*y(3)*y(15)*y(62) + pkpLs*y(3)*y(15)*y(116) + -pkmLs*y(26)*y(82) + -pkmLs*y(26)*y(82) + pkp2*y(42)*y(67)*y(95) + pkp2*y(43)*y(66)*y(95) + 2.0 * ppLgs*y(65)*y(115) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(92)*y(93)) + -pkm2*y(82)*y(96) + -pkm2*y(82)*y(96) + -pdm*y(82)*y(99) + -ppLgs*y(82)*y(115) + 2.0 * pdm*y(83)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(89)*y(94);
  dy(83) = pkpLs*y(3)*y(15)*y(78) + -2.0 * pkmLs*y(26)*y(83) + pkp2*y(66)*y(67)*y(95) + ppLgs*y(82)*y(115) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(83)*y(92)*y(93)) + -2.0 * pkm2*y(83)*y(96) + -2.0 * pdm*y(83)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(90)*y(94);
  dy(84) = (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(85)*y(97) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(84)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(84)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(84)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(84)*y(95)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(84)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(84)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(84)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(84)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(84)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(55)*y(84)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(64)*y(84)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(66)*y(92)*y(93) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(67)*y(84)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(84)*y(85)*y(95)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(84)*y(94)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(84)*y(98)) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(86)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(87)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(89)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(90)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(91)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(105) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(109) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(114) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(117) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(120) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(121);
  dy(85) = -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(2)*y(85)*y(97)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(85)*y(95)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(85)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(85)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(85)*y(95)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(63)*y(85)*y(95)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(66)*y(85)*y(95)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(67)*y(92)*y(93) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(84)*y(85)*y(95)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(84)*y(98) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(85)*y(94)) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(86)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(87)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(89)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(90)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(91)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(105) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(109) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(114) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(117) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(120) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(121);
  dy(86) = -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(86)) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(70) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(87) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(86)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(85)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(30)*y(84)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(71)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(86)*y(94)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(86)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(86)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(86)*y(96)) + -(((((((((((((((((ppLbs + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) / 16.0)*y(86)*y(118)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(88)*y(99) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(114);
  dy(87) = ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(3)*y(5)*y(86) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(74) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(8)*y(87)) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(87)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(54)*y(85)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(55)*y(84)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(75)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(87)*y(94)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(87)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(87)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(87)*y(96)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(120);
  dy(88) = ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(3)*y(15)*y(80) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(88)) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(26)*y(88)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(26)*y(91) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(63)*y(85)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(64)*y(84)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(81)*y(92)*y(93) + ((((((((((((((((ppLbs + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) / 16.0)*y(86)*y(118) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(94)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(88)*y(96)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(88)*y(99)) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(121);
  dy(89) = ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(79) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(117) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(89)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(89)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(42)*y(85)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(43)*y(84)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(92)*y(93) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(89)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(89)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(89)*y(96)) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(89)*y(115)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(90)*y(99);
  dy(90) = ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(81) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(121) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(90)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(90)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(66)*y(85)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(67)*y(84)*y(95) + (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(83)*y(92)*y(93) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(89)*y(115) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(90)*y(92)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(90)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(90)*y(96)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(90)*y(96)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(90)*y(99)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(91)*y(94);
  dy(91) = ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(3)*y(15)*y(88) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(26)*y(91)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(84)*y(85)*y(95) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(90)*y(92)*y(93) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(91)*y(94)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(91)*y(96));
  dy(92) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(12)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(16)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(17)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(19)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(20)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(21)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(22)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(27)*y(92)*y(93)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(28)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(29)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(30)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(32)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(33)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(34)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(35)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(36)*y(94) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(37)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(38)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(40)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(41)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(44)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(46)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(46)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(47)*y(92)*y(93)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(48)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(48)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(49)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(49)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(50)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(50)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(51)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(52)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(53)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(53)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(54)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(55)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(56)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(56)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(58)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(59)*y(92)*y(93)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(61)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(62)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(63)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(64)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(66)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(67)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(68)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(68)*y(92)*y(93)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(69)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(69)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(70)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(70)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(71)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(71)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(72)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(72)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(73)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(75)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(75)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(76)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(77)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(77)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(78)*y(92)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(78)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(79)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(80)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(81)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(81)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(82)*y(92)*y(93)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(83)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(84)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(85)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(86)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(86)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(87)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(87)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(94) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(89)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(90)*y(92)*y(93)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(90)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(91)*y(94) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(100)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(101)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(104)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(106)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(108)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(112)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(113)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(114)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(116)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(119)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(120)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(121)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(102) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(103) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(105) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(107) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(109) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(112) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(113) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(114) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(117) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(119) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(120) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(121);
  dy(93) = 0;
  dy(94) = 0;
  dy(95) = 0;
  dy(96) = 0;
  dy(97) = 0;
  dy(98) = 0;
  dy(99) = 0;
  dy(100) = pkpL*y(3)*y(5)*y(19) + -pkpL*y(3)*y(5)*y(100) + pkp2*y(4)*y(33)*y(95) + pkp2*y(6)*y(34)*y(95) + pkmL*y(8)*y(21) + -pkmL*y(8)*y(100) + pdm*y(22)*y(99) + pdm*y(45)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(100)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(102) + -pkm2*y(96)*y(100) + -pkm2*y(96)*y(100) + -pdm*y(99)*y(100) + -ppLg*y(100)*y(110) + -ppLb*y(100)*y(111);
  dy(101) = -pkpL*y(3)*y(5)*y(101) + -pkpLs*y(3)*y(15)*y(101) + pkp2*y(4)*y(40)*y(95) + pkp2*y(6)*y(41)*y(95) + pkmL*y(8)*y(106) + pkmLs*y(26)*y(104) + pdm*y(46)*y(99) + pdm*y(59)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(101)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(103) + -pkm2*y(96)*y(101) + -pkm2*y(96)*y(101) + -pdm*y(99)*y(101) + -pdm*y(99)*y(101);
  dy(102) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(32) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(102)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(54)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(55)*y(95) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(35) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(102)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(36)*y(99) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(100) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(102)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(102)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(102)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(112) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(102)*y(110)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(102)*y(111));
  dy(103) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(103)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(103)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(63)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(64)*y(95) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(107) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(105) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(101) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(103)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(103)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(103)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(103)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113);
  dy(104) = -pkpL*y(3)*y(5)*y(104) + pkpLs*y(3)*y(15)*y(101) + pkp2*y(4)*y(66)*y(95) + pkp2*y(6)*y(67)*y(95) + pkmL*y(8)*y(108) + -pkmLs*y(26)*y(104) + pdm*y(68)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(104)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(105) + -pkm2*y(96)*y(104) + -pkm2*y(96)*y(104) + -pdm*y(99)*y(104) + pdm*y(99)*y(116) + -ppLgs*y(104)*y(115) + -ppLbs*y(104)*y(118);
  dy(105) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(105)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(103) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(84)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(85)*y(95) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(109) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(105)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(104) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(105)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(105)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(105)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(114) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(105)*y(115)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(105)*y(118));
  dy(106) = pkpL*y(3)*y(5)*y(101) + -pkpLs*y(3)*y(15)*y(106) + pkp2*y(7)*y(40)*y(95) + -pkmL*y(8)*y(106) + pkp2*y(11)*y(41)*y(95) + ppLb*y(12)*y(111) + ppLg*y(14)*y(110) + pkmLs*y(26)*y(108) + pdm*y(53)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(106)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(107) + -pkm2*y(96)*y(106) + -pkm2*y(96)*y(106) + -pdm*y(99)*y(106) + -pdm*y(99)*y(106);
  dy(107) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(103) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(107)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(63)*y(95) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(107)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(64)*y(95) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(20)*y(111) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(109) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(106) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(107)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(107)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(107)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(107)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119);
  dy(108) = pkpL*y(3)*y(5)*y(104) + pkpLs*y(3)*y(15)*y(106) + pkp2*y(7)*y(66)*y(95) + -pkmL*y(8)*y(108) + pkp2*y(11)*y(67)*y(95) + ppLg*y(23)*y(110) + -pkmLs*y(26)*y(108) + pdm*y(57)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(108)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(109) + -pkm2*y(96)*y(108) + -pkm2*y(96)*y(108) + -pdm*y(99)*y(108) + -ppLgs*y(108)*y(115);
  dy(109) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(105) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(107) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(84)*y(95) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(109)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(85)*y(95) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(109)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(108) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(109)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(109)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(109)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(120) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(109)*y(115));
  dy(110) = 0;
  dy(111) = 0;
  dy(112) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(48) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(112)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(56) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(112)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(55)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(54)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(45)*y(92)*y(93) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(69)*y(94) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(72)*y(99) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(112)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(112)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(112)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(112)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(112)) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(102)*y(110) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(111)*y(112));
  dy(113) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(113)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(113)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(119) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(64)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(63)*y(95) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(114) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(46)*y(92)*y(93) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(70)*y(94) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(113)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(113)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(113)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(113)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(113));
  dy(114) = -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(114)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(113) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(120) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(16)*y(85)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(17)*y(84)*y(95) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(114)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(68)*y(92)*y(93) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(86)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(114)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(114)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(114)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(114)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(114)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(105)*y(115) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(114)*y(118));
  dy(115) = 0;
  dy(116) = pkpLs*y(3)*y(15)*y(59) + -pkpLs*y(3)*y(15)*y(116) + pkp2*y(24)*y(67)*y(95) + pkp2*y(25)*y(66)*y(95) + pkmLs*y(26)*y(82) + -pkmLs*y(26)*y(116) + pdm*y(78)*y(99) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(116)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(117) + -pkm2*y(96)*y(116) + -pkm2*y(96)*y(116) + -pdm*y(99)*y(116) + -pdm*y(99)*y(116) + ppLbs*y(104)*y(118) + -ppLgs*y(115)*y(116);
  dy(117) = ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(76) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(117)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(24)*y(85)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(25)*y(84)*y(95) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(89) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(117)) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(92)*y(93)*y(116) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(117)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(117)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(117)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(105)*y(118) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(115)*y(117));
  dy(118) = 0;
  dy(119) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(113) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(119)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(119)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(120) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(64)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(63)*y(95) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(49)*y(111) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(53)*y(92)*y(93) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(74)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(119)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(119)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(119)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(119)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119));
  dy(120) = ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(3)*y(5)*y(114) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(119) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(8)*y(120)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(120)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(33)*y(85)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(34)*y(84)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(57)*y(92)*y(93) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(87)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(120)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(120)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(120)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(120)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(120)) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(109)*y(115);
  dy(121) = ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(77) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(3)*y(15)*y(121)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(90) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(26)*y(121)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(40)*y(85)*y(95) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(41)*y(84)*y(95) + ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(78)*y(92)*y(93) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(88)*y(94) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(92)*y(93)*y(121)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(94)*y(121)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(121)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(96)*y(121)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121)) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(114)*y(118) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(115)*y(117);
end
