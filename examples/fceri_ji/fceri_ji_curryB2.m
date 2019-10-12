

% Automatically generated from fceri_ji_curryFE_B2.
% Original number of species: 121.
% Original number of reactions: 732.

% Correspondence with original names:
%     y(1) = Lig_tot
%     y(2) = S2
%     y(3) = S0
%     y(4) = S3
%     y(5) = kp1
%     y(6) = S5
%     y(7) = S4
%     y(8) = km1
%     y(9) = S6
%     y(10) = S13
%     y(11) = S12
%     y(12) = S30
%     y(13) = S29
%     y(14) = S1
%     y(15) = kpL
%     y(16) = kmL
%     y(17) = S7
%     y(18) = S8
%     y(19) = S9
%     y(20) = S10
%     y(21) = kpLs
%     y(22) = S17
%     y(23) = S20
%     y(24) = kmLs
%     y(25) = S36
%     y(26) = S22
%     y(27) = S45
%     y(28) = S56
%     y(29) = kp2
%     y(30) = km2
%     y(31) = S11
%     y(32) = kpS
%     y(33) = S14
%     y(34) = S15
%     y(35) = S16
%     y(36) = S18
%     y(37) = S43
%     y(38) = S21
%     y(39) = kmS
%     y(40) = S23
%     y(41) = S24
%     y(42) = S25
%     y(43) = S26
%     y(44) = S27
%     y(45) = S28
%     y(46) = S39
%     y(47) = S41
%     y(48) = S31
%     y(49) = S32
%     y(50) = S34
%     y(51) = S37
%     y(52) = S78
%     y(53) = S44
%     y(54) = S47
%     y(55) = S48
%     y(56) = S49
%     y(57) = S50
%     y(58) = S51
%     y(59) = S52
%     y(60) = S53
%     y(61) = S54
%     y(62) = S55
%     y(63) = S63
%     y(64) = S64
%     y(65) = S73
%     y(66) = S74
%     y(67) = S46
%     y(68) = S57
%     y(69) = S58
%     y(70) = S59
%     y(71) = S60
%     y(72) = S61
%     y(73) = S62
%     y(74) = S76
%     y(75) = S84
%     y(76) = S88
%     y(77) = S89
%     y(78) = S90
%     y(79) = S93
%     y(80) = S97
%     y(81) = S101
%     y(82) = S104
%     y(83) = S106
%     y(84) = S79
%     y(85) = S92
%     y(86) = S95
%     y(87) = S96
%     y(88) = S99
%     y(89) = S100
%     y(90) = S103
%     y(91) = S113
%     y(92) = S114
%     y(93) = S157
%     y(94) = S145
%     y(95) = S147
%     y(96) = S150
%     y(97) = S154
%     y(98) = S170
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
%     y(112) = pLb
%     y(113) = pLg
%     y(114) = pLgs
%     y(115) = pLbs
%     y(116) = S82
%     y(117) = S83
%     y(118) = S141
%     y(119) = S86
%     y(120) = S120
%     y(121) = S143


function fceri_ji_curryB2
[T,Y]=ode45(@ode,[0 100.0],[  7278.1900000000005 400.0 6000.0 400.0 1.32845238E-7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 28.0 0.05 20.0 0.0 0.0 0.0 0.0 0.05 0.0 0.0 0.12 0.0 0.0 0.0 0.0 0.25 0.0 0.0 0.06 0.0 0.0 0.0 0.0 0.0 0.0 0.13 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 20.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 30.0 1.0 3.0 100.0 0.0 0.0 0.0 0.0 0.0 0.0]);
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
view= getSpecies(113)/1;
plot(T,view);
hold on;
view= getSpecies(19)/1;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(2)/4;
plot(T,view);
hold on;
view= getSpecies(94)/4;
plot(T,view);
hold on;
view= getSpecies(65)/4;
plot(T,view);
hold on;
view= getSpecies(82)/4;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(98)/10;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(93)/4;
plot(T,view);
hold on;
view= getSpecies(51)/4;
plot(T,view);
hold on;
view= getSpecies(79)/1;
plot(T,view);
hold on;
view= getSpecies(92)/4;
plot(T,view);
hold on;
view= getSpecies(75)/1;
plot(T,view);
hold on;
view= getSpecies(114)/1;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(32)/1;
plot(T,view);
hold on;
view= getSpecies(26)/1;
plot(T,view);
hold on;
view= getSpecies(112)/1;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(57)/4;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(66)/1;
plot(T,view);
hold on;
view= getSpecies(106)/1;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(72)/4;
plot(T,view);
hold on;
view= getSpecies(104)/1;
plot(T,view);
hold on;
view= getSpecies(21)/1;
plot(T,view);
hold on;
view= getSpecies(86)/16;
plot(T,view);
hold on;
view= getSpecies(67)/4;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(70)/4;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(63)/1;
plot(T,view);
hold on;
view= getSpecies(30)/1;
plot(T,view);
hold on;
view= getSpecies(29)/1;
plot(T,view);
hold on;
view= getSpecies(59)/4;
plot(T,view);
hold on;
view= getSpecies(76)/4;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(84)/4;
plot(T,view);
hold on;
view= getSpecies(49)/4;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(56)/1;
plot(T,view);
hold on;
view= getSpecies(120)/4;
plot(T,view);
hold on;
view= getSpecies(50)/4;
plot(T,view);
hold on;
view= getSpecies(25)/1;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(108)/1;
plot(T,view);
hold on;
view= getSpecies(45)/1;
plot(T,view);
hold on;
view= getSpecies(87)/16;
plot(T,view);
hold on;
view= getSpecies(52)/4;
plot(T,view);
hold on;
view= getSpecies(110)/1;
plot(T,view);
hold on;
view= getSpecies(91)/4;
plot(T,view);
hold on;
view= getSpecies(88)/10;
plot(T,view);
hold on;
view= getSpecies(62)/4;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(71)/4;
plot(T,view);
hold on;
view= getSpecies(44)/1;
plot(T,view);
hold on;
view= getSpecies(64)/1;
plot(T,view);
hold on;
view= getSpecies(83)/1;
plot(T,view);
hold on;
view= getSpecies(27)/1;
plot(T,view);
hold on;
view= getSpecies(102)/4;
plot(T,view);
hold on;
view= getSpecies(74)/4;
plot(T,view);
hold on;
view= getSpecies(116)/4;
plot(T,view);
hold on;
view= getSpecies(58)/1;
plot(T,view);
hold on;
view= getSpecies(85)/4;
plot(T,view);
hold on;
view= getSpecies(90)/10;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(107)/4;
plot(T,view);
hold on;
view= getSpecies(20)/1;
plot(T,view);
hold on;
view= getSpecies(101)/1;
plot(T,view);
hold on;
view= getSpecies(89)/16;
plot(T,view);
hold on;
view= getSpecies(68)/4;
plot(T,view);
hold on;
view= getSpecies(103)/4;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(105)/4;
plot(T,view);
hold on;
view= getSpecies(38)/4;
plot(T,view);
hold on;
view= getSpecies(23)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(1)/11;
plot(T,view);
hold on;
view= getSpecies(53)/1;
plot(T,view);
hold on;
view= getSpecies(95)/16;
plot(T,view);
hold on;
view= getSpecies(117)/4;
plot(T,view);
hold on;
view= getSpecies(35)/1;
plot(T,view);
hold on;
view= getSpecies(119)/4;
plot(T,view);
hold on;
view= getSpecies(115)/1;
plot(T,view);
hold on;
view= getSpecies(36)/1;
plot(T,view);
hold on;
view= getSpecies(60)/1;
plot(T,view);
hold on;
view= getSpecies(54)/1;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(55)/1;
plot(T,view);
hold on;
view= getSpecies(69)/10;
plot(T,view);
hold on;
view= getSpecies(78)/1;
plot(T,view);
hold on;
view= getSpecies(80)/4;
plot(T,view);
hold on;
view= getSpecies(31)/1;
plot(T,view);
hold on;
view= getSpecies(118)/4;
plot(T,view);
hold on;
view= getSpecies(81)/4;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(96)/16;
plot(T,view);
hold on;
view= getSpecies(99)/1;
plot(T,view);
hold on;
view= getSpecies(109)/4;
plot(T,view);
hold on;
view= getSpecies(77)/4;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(48)/4;
plot(T,view);
hold on;
view= getSpecies(97)/16;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(121)/4;
plot(T,view);
hold on;
view= getSpecies(22)/1;
plot(T,view);
hold on;
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(100)/1;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(111)/4;
plot(T,view);
hold on;
view= getSpecies(73)/4;
plot(T,view);
hold on;
view= getSpecies(61)/1;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vpLg','vS9','vkmL','vS2','vS145','vS73','vS104','vS1','vS170','vS43','vS157','vS37','vS93','vS114','vS84','vpLgs','vkp1','vkpS','vS22','vpLb','vS15','vS50','vS30','vS74','vS19','vS0','vS61','vS70','vkpLs','vS95','vS46','vkmS','vS59','vkpL','vS63','vkm2','vkp2','vS52','vS88','vkm1','vS79','vS32','vS8','vS6','vS7','vS49','vS120','vS34','vS36','vS23','vS40','vS28','vS96','vS78','vS80','vS113','vS99','vS55','vS12','vS60','vS27','vS64','vS106','vS45','vS67','vS76','vS82','vS51','vS92','vS103','vS5','vS26','vS38','vS10','vS35','vS100','vS57','vS69','vS41','vS117','vS21','vS20','vS25','vLig_tot','vS44','vS147','vS83','vS16','vS86','vpLbs','vS18','vS53','vS47','vS13','vS39','vS48','vS58','vS90','vS97','vS11','vS141','vS101','vS14','vS150','vdm','vS75','vS89','vS24','vS31','vS154','vS3','vS143','vS17','vS56','vS33','vS29','vkmLs','vS139','vS62','vS54','vS4');
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
  dy(2) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(31)*y(32)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(33)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(34)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(35)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(36)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(37)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(40)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(41)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(42)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(43)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(44)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(45)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(46)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(47)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(53)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(54)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(54)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(55)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(55)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(56)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(57)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(58)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(58)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(59)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(60)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(61)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(62)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(63)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(64)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(65)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(66)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(66)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(75)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(75)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(76)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(77)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(78)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(78)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(79)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(80)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(81)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(82)) + -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(83)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(93)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(100)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(101)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(104)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(106)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(108)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(110)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(116)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(117)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(118)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(119)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(120)) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(121)) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(38)*y(39) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(48) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(49) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(50) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(51) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(52) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(57) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(59) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(62) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(65) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(67) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(68) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(69) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(70) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(71) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(72) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(73) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(74) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(76) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(77) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(80) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(81) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(82) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(84) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(85) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(86) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(86) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(87) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(87) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(88) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(89) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(89) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(90) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(91) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(92) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(93) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(94) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(95) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(96) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(97) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(97) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(98) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(102) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(103) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(105) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(107) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(109) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(111) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(116) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(117) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(118) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(119) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(120) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(121);
  dy(3) = -2.0 * pkp1*y(3)*y(4)*y(5) + -2.0 * pkp1*y(3)*y(5)*y(6) + -2.0 * pkp1*y(3)*y(5)*y(10) + -2.0 * pkp1*y(3)*y(5)*y(12) + -2.0 * pkp1*y(3)*y(5)*y(34) + -2.0 * pkp1*y(3)*y(5)*y(43) + -2.0 * pkp1*y(3)*y(5)*y(45) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(49)) + -2.0 * pkp1*y(3)*y(5)*y(64) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(71)) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(73)) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(92)) + pkm1*y(7)*y(8) + pkm1*y(8)*y(9) + pkm1*y(8)*y(11) + pkm1*y(8)*y(13) + pkm1*y(8)*y(33) + pkm1*y(8)*y(42) + pkm1*y(8)*y(44) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(48) + pkm1*y(8)*y(63) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(70) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(72) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(91);
  dy(4) = -2.0 * pkp1*y(3)*y(4)*y(5) + -pkp2*y(4)*y(7)*y(29) + -pkp2*y(4)*y(9)*y(29) + -pkp2*y(4)*y(11)*y(29) + -pkp2*y(4)*y(13)*y(29) + -pkpL*y(4)*y(14)*y(15) + -pkp2*y(4)*y(29)*y(33) + -pkp2*y(4)*y(29)*y(42) + -pkp2*y(4)*y(29)*y(44) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(48)) + -pkp2*y(4)*y(29)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(91)) + pkmL*y(6)*y(16) + pkm1*y(7)*y(8) + pdm*y(10)*y(99) + 2.0 * pkm2*y(17)*y(30) + pkm2*y(18)*y(30) + pkm2*y(22)*y(30) + pkm2*y(25)*y(30) + pkm2*y(30)*y(36) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(51) + pkm2*y(30)*y(100) + pkm2*y(30)*y(101) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(103) + pkm2*y(30)*y(104) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(105) + pdm*y(34)*y(99);
  dy(5) = 0;
  dy(6) = -2.0 * pkp1*y(3)*y(5)*y(6) + pkpL*y(4)*y(14)*y(15) + -pkp2*y(6)*y(7)*y(29) + -pkp2*y(6)*y(9)*y(29) + -pkp2*y(6)*y(11)*y(29) + -pkp2*y(6)*y(13)*y(29) + -pkmL*y(6)*y(16) + -pkp2*y(6)*y(29)*y(33) + -pkp2*y(6)*y(29)*y(42) + -pkp2*y(6)*y(29)*y(44) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(48)) + -pkp2*y(6)*y(29)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(91)) + pkm1*y(8)*y(9) + pkm2*y(18)*y(30) + 2.0 * pkm2*y(19)*y(30) + pkm2*y(20)*y(30) + pkm2*y(23)*y(30) + pkm2*y(30)*y(31) + pkm2*y(30)*y(35) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(38) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(50) + pkm2*y(30)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(107) + pkm2*y(30)*y(108) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(109) + pdm*y(43)*y(99);
  dy(7) = 2.0 * pkp1*y(3)*y(4)*y(5) + -pkp2*y(4)*y(7)*y(29) + -pkp2*y(6)*y(7)*y(29) + -pkm1*y(7)*y(8) + -pkp2*y(7)*y(10)*y(29) + -pkp2*y(7)*y(12)*y(29) + -pkpL*y(7)*y(14)*y(15) + -pkp2*y(7)*y(29)*y(34) + -pkp2*y(7)*y(29)*y(43) + -pkp2*y(7)*y(29)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(49)) + -pkp2*y(7)*y(29)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(92)) + pkmL*y(9)*y(16) + pdm*y(11)*y(99) + 2.0 * pkm2*y(17)*y(30) + pkm2*y(18)*y(30) + pkm2*y(22)*y(30) + pkm2*y(25)*y(30) + pkm2*y(30)*y(36) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(51) + pkm2*y(30)*y(100) + pkm2*y(30)*y(101) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(103) + pkm2*y(30)*y(104) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(105) + pdm*y(33)*y(99);
  dy(8) = 0;
  dy(9) = 2.0 * pkp1*y(3)*y(5)*y(6) + -pkp2*y(4)*y(9)*y(29) + -pkp2*y(6)*y(9)*y(29) + pkpL*y(7)*y(14)*y(15) + -pkm1*y(8)*y(9) + -pkp2*y(9)*y(10)*y(29) + -pkp2*y(9)*y(12)*y(29) + -pkmL*y(9)*y(16) + -pkp2*y(9)*y(29)*y(34) + -pkp2*y(9)*y(29)*y(43) + -pkp2*y(9)*y(29)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(49)) + -pkp2*y(9)*y(29)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(92)) + pkm2*y(18)*y(30) + 2.0 * pkm2*y(19)*y(30) + pkm2*y(20)*y(30) + pkm2*y(23)*y(30) + pkm2*y(30)*y(31) + pkm2*y(30)*y(35) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(38) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(50) + pkm2*y(30)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(107) + pkm2*y(30)*y(108) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(109) + pdm*y(42)*y(99);
  dy(10) = -2.0 * pkp1*y(3)*y(5)*y(10) + -pkp2*y(7)*y(10)*y(29) + pkm1*y(8)*y(11) + -pkp2*y(9)*y(10)*y(29) + -pkp2*y(10)*y(11)*y(29) + -pkp2*y(10)*y(13)*y(29) + -pkpLs*y(10)*y(14)*y(21) + -pkp2*y(10)*y(29)*y(33) + -pkp2*y(10)*y(29)*y(42) + -pkp2*y(10)*y(29)*y(44) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(48)) + -pkp2*y(10)*y(29)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(91)) + -pdm*y(10)*y(99) + pkmLs*y(12)*y(24) + pkm2*y(20)*y(30) + pkm2*y(22)*y(30) + 2.0 * pkm2*y(26)*y(30) + pkm2*y(27)*y(30) + pkm2*y(30)*y(37) + pkm2*y(30)*y(40) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(52) + pkm2*y(30)*y(53) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(67) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(84) + pkm2*y(30)*y(110) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(111) + pdm*y(45)*y(99);
  dy(11) = 2.0 * pkp1*y(3)*y(5)*y(10) + -pkp2*y(4)*y(11)*y(29) + -pkp2*y(6)*y(11)*y(29) + -pkm1*y(8)*y(11) + -pkp2*y(10)*y(11)*y(29) + -pkp2*y(11)*y(12)*y(29) + -pkpLs*y(11)*y(14)*y(21) + -pkp2*y(11)*y(29)*y(34) + -pkp2*y(11)*y(29)*y(43) + -pkp2*y(11)*y(29)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(49)) + -pkp2*y(11)*y(29)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(92)) + -pdm*y(11)*y(99) + pkmLs*y(13)*y(24) + pkm2*y(20)*y(30) + pkm2*y(22)*y(30) + 2.0 * pkm2*y(26)*y(30) + pkm2*y(27)*y(30) + pkm2*y(30)*y(37) + pkm2*y(30)*y(40) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(52) + pkm2*y(30)*y(53) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(67) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(84) + pkm2*y(30)*y(110) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(111) + pdm*y(44)*y(99);
  dy(12) = -2.0 * pkp1*y(3)*y(5)*y(12) + -pkp2*y(7)*y(12)*y(29) + pkm1*y(8)*y(13) + -pkp2*y(9)*y(12)*y(29) + pkpLs*y(10)*y(14)*y(21) + -pkp2*y(11)*y(12)*y(29) + -pkp2*y(12)*y(13)*y(29) + -pkmLs*y(12)*y(24) + -pkp2*y(12)*y(29)*y(33) + -pkp2*y(12)*y(29)*y(42) + -pkp2*y(12)*y(29)*y(44) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(48)) + -pkp2*y(12)*y(29)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(91)) + pkm2*y(23)*y(30) + pkm2*y(25)*y(30) + pkm2*y(27)*y(30) + 2.0 * pkm2*y(28)*y(30) + pkm2*y(30)*y(47) + pkm2*y(30)*y(56) + pkm2*y(30)*y(61) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(68) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(74) + pkm2*y(30)*y(79) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(85) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(94) + pdm*y(64)*y(99);
  dy(13) = 2.0 * pkp1*y(3)*y(5)*y(12) + -pkp2*y(4)*y(13)*y(29) + -pkp2*y(6)*y(13)*y(29) + -pkm1*y(8)*y(13) + -pkp2*y(10)*y(13)*y(29) + pkpLs*y(11)*y(14)*y(21) + -pkp2*y(12)*y(13)*y(29) + -pkmLs*y(13)*y(24) + -pkp2*y(13)*y(29)*y(34) + -pkp2*y(13)*y(29)*y(43) + -pkp2*y(13)*y(29)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(49)) + -pkp2*y(13)*y(29)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(92)) + pkm2*y(23)*y(30) + pkm2*y(25)*y(30) + pkm2*y(27)*y(30) + 2.0 * pkm2*y(28)*y(30) + pkm2*y(30)*y(47) + pkm2*y(30)*y(56) + pkm2*y(30)*y(61) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(68) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(74) + pkm2*y(30)*y(79) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(85) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(94) + pdm*y(63)*y(99);
  dy(14) = -pkpL*y(4)*y(14)*y(15) + pkmL*y(6)*y(16) + -pkpL*y(7)*y(14)*y(15) + pkmL*y(9)*y(16) + -pkpLs*y(10)*y(14)*y(21) + -pkpLs*y(11)*y(14)*y(21) + pkmLs*y(12)*y(24) + pkmLs*y(13)*y(24) + -2.0 * pkpL*y(14)*y(15)*y(17) + -pkpL*y(14)*y(15)*y(18) + -pkpL*y(14)*y(15)*y(22) + -pkpL*y(14)*y(15)*y(25) + -pkpL*y(14)*y(15)*y(31) + -pkpL*y(14)*y(15)*y(33) + -pkpL*y(14)*y(15)*y(34) + -pkpL*y(14)*y(15)*y(36) + -pkpL*y(14)*y(15)*y(36) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(38)) + -pkpL*y(14)*y(15)*y(40) + -2.0 * pkpL*y(14)*y(15)*y(41) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(49)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(51)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(51)) + -pkpL*y(14)*y(15)*y(54) + -pkpL*y(14)*y(15)*y(55) + -pkpL*y(14)*y(15)*y(56) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(57)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(57)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(59)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(62)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(67)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(68)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(14)*y(15)*y(69)) + -pkpL*y(14)*y(15)*y(75) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(80)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(86)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(87)) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(95)) + -pkpL*y(14)*y(15)*y(100) + -pkpL*y(14)*y(15)*y(101) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(102)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(103)) + -pkpL*y(14)*y(15)*y(104) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(105)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(116)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(117)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(118)) + -pkpLs*y(14)*y(20)*y(21) + -pkpLs*y(14)*y(21)*y(22) + -2.0 * pkpLs*y(14)*y(21)*y(26) + -pkpLs*y(14)*y(21)*y(27) + -pkpLs*y(14)*y(21)*y(37) + -pkpLs*y(14)*y(21)*y(40) + -pkpLs*y(14)*y(21)*y(44) + -pkpLs*y(14)*y(21)*y(45) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(52)) + -pkpLs*y(14)*y(21)*y(53) + -pkpLs*y(14)*y(21)*y(53) + -pkpLs*y(14)*y(21)*y(55) + -pkpLs*y(14)*y(21)*y(58) + -2.0 * pkpLs*y(14)*y(21)*y(60) + -pkpLs*y(14)*y(21)*y(61) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(62)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(67)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(72)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(73)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(76)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(77)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(77)) + -pkpLs*y(14)*y(21)*y(78) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(82)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(84)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(84)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(85)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(87)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(89)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(14)*y(21)*y(90)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(97)) + -pkpLs*y(14)*y(21)*y(101) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(103)) + -pkpLs*y(14)*y(21)*y(106) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(107)) + -pkpLs*y(14)*y(21)*y(110) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(111)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(117)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(119)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(121)) + pkmL*y(16)*y(18) + 2.0 * pkmL*y(16)*y(19) + pkmL*y(16)*y(20) + pkmL*y(16)*y(23) + pkmL*y(16)*y(31) + pkmL*y(16)*y(35) + pkmL*y(16)*y(35) + pkmL*y(16)*y(37) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(38) + pkmL*y(16)*y(42) + pkmL*y(16)*y(43) + 2.0 * pkmL*y(16)*y(46) + pkmL*y(16)*y(47) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(50) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(50) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(52) + pkmL*y(16)*y(54) + pkmL*y(16)*y(58) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(59) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(65) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(65) + pkmL*y(16)*y(66) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(70) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(71) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(74) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(76) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(81) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(86) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(16)*y(88) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(89) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(96) + pkmL*y(16)*y(100) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(102) + pkmL*y(16)*y(106) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(107) + pkmL*y(16)*y(108) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(109) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(116) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(119) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(120) + pkmLs*y(23)*y(24) + pkmLs*y(24)*y(25) + pkmLs*y(24)*y(27) + 2.0 * pkmLs*y(24)*y(28) + pkmLs*y(24)*y(47) + pkmLs*y(24)*y(56) + pkmLs*y(24)*y(61) + pkmLs*y(24)*y(63) + pkmLs*y(24)*y(64) + pkmLs*y(24)*y(66) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(68) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(74) + pkmLs*y(24)*y(75) + pkmLs*y(24)*y(78) + pkmLs*y(24)*y(79) + pkmLs*y(24)*y(79) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(80) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(81) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(82) + 2.0 * pkmLs*y(24)*y(83) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(85) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(91) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(92) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(93) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(93) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(94) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(94) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(95) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(96) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(97) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(24)*y(98) + pkmLs*y(24)*y(104) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(105) + pkmLs*y(24)*y(108) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(109) + pkmLs*y(24)*y(110) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(111) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(118) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(120) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(121);
  dy(15) = 0;
  dy(16) = 0;
  dy(17) = pkp2*y(4)*y(7)*y(29) + -2.0 * pkpL*y(14)*y(15)*y(17) + pkmL*y(16)*y(18) + -2.0 * pkm2*y(17)*y(30) + pdm*y(22)*y(99) + pdm*y(36)*y(99);
  dy(18) = pkp2*y(4)*y(9)*y(29) + pkp2*y(6)*y(7)*y(29) + 2.0 * pkpL*y(14)*y(15)*y(17) + -pkpL*y(14)*y(15)*y(18) + -pkmL*y(16)*y(18) + 2.0 * pkmL*y(16)*y(19) + -pkm2*y(18)*y(30) + -pkm2*y(18)*y(30) + -ppLb*y(18)*y(112) + -ppLg*y(18)*y(113) + pdm*y(20)*y(99) + pdm*y(31)*y(99) + pdm*y(99)*y(100);
  dy(19) = pkp2*y(6)*y(9)*y(29) + pkpL*y(14)*y(15)*y(18) + -2.0 * pkmL*y(16)*y(19) + -2.0 * pkm2*y(19)*y(30) + -2.0 * ppLg*y(19)*y(113) + pdm*y(35)*y(99);
  dy(20) = pkp2*y(6)*y(11)*y(29) + pkp2*y(9)*y(10)*y(29) + pkpL*y(14)*y(15)*y(22) + -pkpLs*y(14)*y(20)*y(21) + -pkmL*y(16)*y(20) + ppLb*y(18)*y(112) + -pkm2*y(20)*y(30) + -pkm2*y(20)*y(30) + -pdm*y(20)*y(99) + -ppLg*y(20)*y(113) + pkmLs*y(23)*y(24) + pdm*y(37)*y(99) + pdm*y(99)*y(106);
  dy(21) = 0;
  dy(22) = pkp2*y(4)*y(11)*y(29) + pkp2*y(7)*y(10)*y(29) + -pkpL*y(14)*y(15)*y(22) + -pkpLs*y(14)*y(21)*y(22) + pkmL*y(16)*y(20) + -pkm2*y(22)*y(30) + -pkm2*y(22)*y(30) + -pdm*y(22)*y(99) + pkmLs*y(24)*y(25) + 2.0 * pdm*y(26)*y(99) + pdm*y(40)*y(99) + pdm*y(99)*y(101);
  dy(23) = pkp2*y(6)*y(13)*y(29) + pkp2*y(9)*y(12)*y(29) + pkpL*y(14)*y(15)*y(25) + pkpLs*y(14)*y(20)*y(21) + -pkmL*y(16)*y(23) + -pkmLs*y(23)*y(24) + -pkm2*y(23)*y(30) + -pkm2*y(23)*y(30) + -ppLg*y(23)*y(113) + -ppLgs*y(23)*y(114) + pdm*y(47)*y(99) + pdm*y(99)*y(108);
  dy(24) = 0;
  dy(25) = pkp2*y(4)*y(13)*y(29) + pkp2*y(7)*y(12)*y(29) + -pkpL*y(14)*y(15)*y(25) + pkpLs*y(14)*y(21)*y(22) + pkmL*y(16)*y(23) + -pkmLs*y(24)*y(25) + -pkm2*y(25)*y(30) + -pkm2*y(25)*y(30) + -ppLgs*y(25)*y(114) + -ppLbs*y(25)*y(115) + pdm*y(27)*y(99) + pdm*y(56)*y(99) + pdm*y(99)*y(104);
  dy(26) = pkp2*y(10)*y(11)*y(29) + -2.0 * pkpLs*y(14)*y(21)*y(26) + pkmLs*y(24)*y(27) + -2.0 * pkm2*y(26)*y(30) + -2.0 * pdm*y(26)*y(99) + pdm*y(53)*y(99);
  dy(27) = pkp2*y(10)*y(13)*y(29) + pkp2*y(11)*y(12)*y(29) + 2.0 * pkpLs*y(14)*y(21)*y(26) + -pkpLs*y(14)*y(21)*y(27) + -pkmLs*y(24)*y(27) + 2.0 * pkmLs*y(24)*y(28) + ppLbs*y(25)*y(115) + -pkm2*y(27)*y(30) + -pkm2*y(27)*y(30) + -pdm*y(27)*y(99) + -ppLgs*y(27)*y(114) + pdm*y(61)*y(99) + pdm*y(99)*y(110);
  dy(28) = pkp2*y(12)*y(13)*y(29) + pkpLs*y(14)*y(21)*y(27) + -2.0 * pkmLs*y(24)*y(28) + -2.0 * pkm2*y(28)*y(30) + -2.0 * ppLgs*y(28)*y(114) + pdm*y(79)*y(99);
  dy(29) = 0;
  dy(30) = 0;
  dy(31) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(31)*y(32)) + pkp2*y(6)*y(29)*y(33) + pkp2*y(9)*y(29)*y(34) + -pkpL*y(14)*y(15)*y(31) + pkpL*y(14)*y(15)*y(36) + -pkmL*y(16)*y(31) + pkmL*y(16)*y(35) + ppLg*y(18)*y(113) + -pkm2*y(30)*y(31) + -pkm2*y(30)*y(31) + -pdm*y(31)*y(99) + -ppLb*y(31)*y(112) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(38)*y(39) + pdm*y(54)*y(99) + pdm*y(99)*y(106);
  dy(32) = 0;
  dy(33) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(33)) + 2.0 * pkp1*y(3)*y(5)*y(34) + -pkp2*y(4)*y(29)*y(33) + -pkp2*y(6)*y(29)*y(33) + -pkm1*y(8)*y(33) + -pkp2*y(10)*y(29)*y(33) + -pkp2*y(12)*y(29)*y(33) + -pkpL*y(14)*y(15)*y(33) + pkmL*y(16)*y(42) + -pkp2*y(29)*y(33)*y(34) + -pkp2*y(29)*y(33)*y(43) + -pkp2*y(29)*y(33)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(49)) + -pkp2*y(29)*y(33)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(92)) + pkm2*y(30)*y(31) + pkm2*y(30)*y(36) + pkm2*y(30)*y(40) + 2.0 * pkm2*y(30)*y(41) + pkm2*y(30)*y(54) + pkm2*y(30)*y(55) + pkm2*y(30)*y(56) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(57) + pkm2*y(30)*y(75) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(116) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(117) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(118) + -pdm*y(33)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(48) + pdm*y(44)*y(99);
  dy(34) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(34)) + -2.0 * pkp1*y(3)*y(5)*y(34) + -pkp2*y(7)*y(29)*y(34) + pkm1*y(8)*y(33) + -pkp2*y(9)*y(29)*y(34) + -pkp2*y(11)*y(29)*y(34) + -pkp2*y(13)*y(29)*y(34) + -pkpL*y(14)*y(15)*y(34) + pkmL*y(16)*y(43) + -pkp2*y(29)*y(33)*y(34) + -pkp2*y(29)*y(34)*y(42) + -pkp2*y(29)*y(34)*y(44) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(48)) + -pkp2*y(29)*y(34)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(91)) + pkm2*y(30)*y(31) + pkm2*y(30)*y(36) + pkm2*y(30)*y(40) + 2.0 * pkm2*y(30)*y(41) + pkm2*y(30)*y(54) + pkm2*y(30)*y(55) + pkm2*y(30)*y(56) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(57) + pkm2*y(30)*y(75) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(116) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(117) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(118) + -pdm*y(34)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(49) + pdm*y(45)*y(99);
  dy(35) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(35)) + pkp2*y(6)*y(29)*y(42) + pkp2*y(9)*y(29)*y(43) + pkpL*y(14)*y(15)*y(31) + pkpL*y(14)*y(15)*y(100) + -pkmL*y(16)*y(35) + -pkmL*y(16)*y(35) + 2.0 * ppLg*y(19)*y(113) + -pkm2*y(30)*y(35) + -pkm2*y(30)*y(35) + -pdm*y(35)*y(99) + -ppLg*y(35)*y(113) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(50) + 2.0 * pdm*y(46)*y(99);
  dy(36) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(36)) + pkp2*y(4)*y(29)*y(33) + pkp2*y(7)*y(29)*y(34) + -pkpL*y(14)*y(15)*y(36) + -pkpL*y(14)*y(15)*y(36) + pkmL*y(16)*y(31) + pkmL*y(16)*y(100) + -pkm2*y(30)*y(36) + -pkm2*y(30)*y(36) + -pdm*y(36)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(51) + pdm*y(40)*y(99) + 2.0 * pdm*y(41)*y(99) + pdm*y(99)*y(101);
  dy(37) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(37)) + pkp2*y(10)*y(29)*y(42) + pkp2*y(11)*y(29)*y(43) + pkpL*y(14)*y(15)*y(40) + -pkpLs*y(14)*y(21)*y(37) + -pkmL*y(16)*y(37) + pkmLs*y(24)*y(47) + -pkm2*y(30)*y(37) + -pkm2*y(30)*y(37) + -pdm*y(37)*y(99) + -pdm*y(37)*y(99) + -ppLg*y(37)*y(113) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(52) + pdm*y(58)*y(99) + ppLb*y(100)*y(112);
  dy(38) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(31)*y(32) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(48) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(49) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(38)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(51) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(38)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(50) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(38)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(38)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(38)*y(39)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(38)*y(112)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(59)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(107);
  dy(39) = 0;
  dy(40) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(40)) + pkp2*y(10)*y(29)*y(33) + pkp2*y(11)*y(29)*y(34) + -pkpL*y(14)*y(15)*y(40) + -pkpLs*y(14)*y(21)*y(40) + pkmL*y(16)*y(37) + pkmLs*y(24)*y(56) + -pkm2*y(30)*y(40) + -pkm2*y(30)*y(40) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(67) + -pdm*y(40)*y(99) + -pdm*y(40)*y(99) + pdm*y(53)*y(99) + pdm*y(55)*y(99);
  dy(41) = -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(41)) + -2.0 * pkpL*y(14)*y(15)*y(41) + pkmL*y(16)*y(54) + pkp2*y(29)*y(33)*y(34) + -2.0 * pkm2*y(30)*y(41) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(57) + -2.0 * pdm*y(41)*y(99) + pdm*y(55)*y(99);
  dy(42) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(42)) + 2.0 * pkp1*y(3)*y(5)*y(43) + -pkp2*y(4)*y(29)*y(42) + -pkp2*y(6)*y(29)*y(42) + -pkm1*y(8)*y(42) + -pkp2*y(10)*y(29)*y(42) + -pkp2*y(12)*y(29)*y(42) + pkpL*y(14)*y(15)*y(33) + -pkmL*y(16)*y(42) + -pkp2*y(29)*y(34)*y(42) + -pkp2*y(29)*y(42)*y(43) + -pkp2*y(29)*y(42)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(49)) + -pkp2*y(29)*y(42)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(92)) + pkm2*y(30)*y(35) + pkm2*y(30)*y(37) + 2.0 * pkm2*y(30)*y(46) + pkm2*y(30)*y(47) + pkm2*y(30)*y(54) + pkm2*y(30)*y(58) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(59) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(65) + pkm2*y(30)*y(66) + pkm2*y(30)*y(100) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(119) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(120) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(70) + -pdm*y(42)*y(99);
  dy(43) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(43)) + -2.0 * pkp1*y(3)*y(5)*y(43) + -pkp2*y(7)*y(29)*y(43) + pkm1*y(8)*y(42) + -pkp2*y(9)*y(29)*y(43) + -pkp2*y(11)*y(29)*y(43) + -pkp2*y(13)*y(29)*y(43) + pkpL*y(14)*y(15)*y(34) + -pkmL*y(16)*y(43) + -pkp2*y(29)*y(33)*y(43) + -pkp2*y(29)*y(42)*y(43) + -pkp2*y(29)*y(43)*y(44) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(48)) + -pkp2*y(29)*y(43)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(91)) + pkm2*y(30)*y(35) + pkm2*y(30)*y(37) + 2.0 * pkm2*y(30)*y(46) + pkm2*y(30)*y(47) + pkm2*y(30)*y(54) + pkm2*y(30)*y(58) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(59) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(65) + pkm2*y(30)*y(66) + pkm2*y(30)*y(100) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(119) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(120) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(71) + -pdm*y(43)*y(99);
  dy(44) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(44)) + 2.0 * pkp1*y(3)*y(5)*y(45) + -pkp2*y(4)*y(29)*y(44) + -pkp2*y(6)*y(29)*y(44) + -pkm1*y(8)*y(44) + -pkp2*y(10)*y(29)*y(44) + -pkp2*y(12)*y(29)*y(44) + -pkpLs*y(14)*y(21)*y(44) + pkmLs*y(24)*y(63) + -pkp2*y(29)*y(34)*y(44) + -pkp2*y(29)*y(43)*y(44) + -pkp2*y(29)*y(44)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(49)) + -pkp2*y(29)*y(44)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(92)) + pkm2*y(30)*y(53) + pkm2*y(30)*y(55) + pkm2*y(30)*y(58) + 2.0 * pkm2*y(30)*y(60) + pkm2*y(30)*y(61) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(62) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(76) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(77) + pkm2*y(30)*y(78) + pkm2*y(30)*y(101) + pkm2*y(30)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(121) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(72) + -pdm*y(44)*y(99) + -pdm*y(44)*y(99);
  dy(45) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(45)) + -2.0 * pkp1*y(3)*y(5)*y(45) + -pkp2*y(7)*y(29)*y(45) + pkm1*y(8)*y(44) + -pkp2*y(9)*y(29)*y(45) + -pkp2*y(11)*y(29)*y(45) + -pkp2*y(13)*y(29)*y(45) + -pkpLs*y(14)*y(21)*y(45) + pkmLs*y(24)*y(64) + -pkp2*y(29)*y(33)*y(45) + -pkp2*y(29)*y(42)*y(45) + -pkp2*y(29)*y(44)*y(45) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(48)) + -pkp2*y(29)*y(45)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(91)) + pkm2*y(30)*y(53) + pkm2*y(30)*y(55) + pkm2*y(30)*y(58) + 2.0 * pkm2*y(30)*y(60) + pkm2*y(30)*y(61) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(62) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(76) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(77) + pkm2*y(30)*y(78) + pkm2*y(30)*y(101) + pkm2*y(30)*y(106) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(121) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(73) + -pdm*y(45)*y(99) + -pdm*y(45)*y(99);
  dy(46) = -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(46)) + pkpL*y(14)*y(15)*y(54) + -2.0 * pkmL*y(16)*y(46) + pkp2*y(29)*y(42)*y(43) + -2.0 * pkm2*y(30)*y(46) + ppLg*y(35)*y(113) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(65) + -2.0 * pdm*y(46)*y(99);
  dy(47) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(47)) + pkp2*y(12)*y(29)*y(42) + pkp2*y(13)*y(29)*y(43) + pkpL*y(14)*y(15)*y(56) + pkpLs*y(14)*y(21)*y(37) + -pkmL*y(16)*y(47) + ppLgs*y(23)*y(114) + -pkmLs*y(24)*y(47) + -pkm2*y(30)*y(47) + -pkm2*y(30)*y(47) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(74) + -pdm*y(47)*y(99) + -ppLg*y(47)*y(113) + pdm*y(66)*y(99);
  dy(48) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(33) + (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(49) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(48)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(48)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(48)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(48)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(48)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(48)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(70) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(48)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(48)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(48)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(48)*y(64)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(71)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(92)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(38) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(51) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(57) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(59) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(62) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(67) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(68) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(69) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(80) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(86) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(87) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(48)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(72)*y(99);
  dy(49) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(34) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(49)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(48) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(49)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(49)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(71) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(49)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(49)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(49)*y(63)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(70)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(72)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(91)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(38) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(51) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(57) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(59) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(62) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(67) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(68) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(69) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(80) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(86) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(87) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(49)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(73)*y(99);
  dy(50) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(35) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(70) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(71) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(38) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(102) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(50)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(50)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(50)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(50)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(50)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(50)*y(113)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(65)*y(99);
  dy(51) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(36) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(48) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(49) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(51)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(51)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(38) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(102) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(51)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(51)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(51)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(57)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(67)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(103);
  dy(52) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(37) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(70) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(71) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(67) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(52)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(52)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(74) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(52)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(52)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(52)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(52)*y(99)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(52)*y(113)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(102)*y(112);
  dy(53) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(53)) + pkp2*y(10)*y(29)*y(44) + pkp2*y(11)*y(29)*y(45) + -pkpLs*y(14)*y(21)*y(53) + -pkpLs*y(14)*y(21)*y(53) + pkmLs*y(24)*y(61) + pkmLs*y(24)*y(110) + -pkm2*y(30)*y(53) + -pkm2*y(30)*y(53) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(84) + -pdm*y(53)*y(99) + -pdm*y(53)*y(99) + -pdm*y(53)*y(99) + 2.0 * pdm*y(60)*y(99);
  dy(54) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(54)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(54)) + 2.0 * pkpL*y(14)*y(15)*y(41) + -pkpL*y(14)*y(15)*y(54) + 2.0 * pkmL*y(16)*y(46) + -pkmL*y(16)*y(54) + pkp2*y(29)*y(33)*y(43) + pkp2*y(29)*y(34)*y(42) + -pkm2*y(30)*y(54) + -pkm2*y(30)*y(54) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(59) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(116) + -pdm*y(54)*y(99) + -pdm*y(54)*y(99) + -ppLb*y(54)*y(112) + pdm*y(58)*y(99) + ppLg*y(100)*y(113);
  dy(55) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(55)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(55)) + -pkpL*y(14)*y(15)*y(55) + -pkpLs*y(14)*y(21)*y(55) + pkmL*y(16)*y(58) + pkmLs*y(24)*y(75) + pkp2*y(29)*y(33)*y(45) + pkp2*y(29)*y(34)*y(44) + -pkm2*y(30)*y(55) + -pkm2*y(30)*y(55) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(62) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(117) + -pdm*y(55)*y(99) + -pdm*y(55)*y(99) + -pdm*y(55)*y(99) + 2.0 * pdm*y(60)*y(99);
  dy(56) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(56)) + pkp2*y(12)*y(29)*y(33) + pkp2*y(13)*y(29)*y(34) + -pkpL*y(14)*y(15)*y(56) + pkpLs*y(14)*y(21)*y(40) + pkmL*y(16)*y(47) + -pkmLs*y(24)*y(56) + ppLgs*y(25)*y(114) + -pkm2*y(30)*y(56) + -pkm2*y(30)*y(56) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(68) + -pdm*y(56)*y(99) + -ppLbs*y(56)*y(115) + pdm*y(61)*y(99) + pdm*y(75)*y(99);
  dy(57) = (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(41) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(57)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(57)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(57)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(59) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(116) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(49) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(48) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(57)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(57)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(57)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(69) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(57)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(62)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117);
  dy(58) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(58)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(58)) + pkpL*y(14)*y(15)*y(55) + -pkpLs*y(14)*y(21)*y(58) + -pkmL*y(16)*y(58) + pkmLs*y(24)*y(66) + pkp2*y(29)*y(42)*y(45) + pkp2*y(29)*y(43)*y(44) + -pkm2*y(30)*y(58) + -pkm2*y(30)*y(58) + ppLg*y(37)*y(113) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(76) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(119) + ppLb*y(54)*y(112) + -pdm*y(58)*y(99) + -pdm*y(58)*y(99) + -pdm*y(58)*y(99);
  dy(59) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(54) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(59)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(57) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(59)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(59)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(65) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(49) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(48) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(59)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(59)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(59)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(86) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(59)*y(99)) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(59)*y(112)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119);
  dy(60) = -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(60)) + -2.0 * pkpLs*y(14)*y(21)*y(60) + pkmLs*y(24)*y(78) + pkp2*y(29)*y(44)*y(45) + -2.0 * pkm2*y(30)*y(60) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(77) + -2.0 * pdm*y(60)*y(99) + -2.0 * pdm*y(60)*y(99);
  dy(61) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(61)) + pkp2*y(12)*y(29)*y(44) + pkp2*y(13)*y(29)*y(45) + pkpLs*y(14)*y(21)*y(53) + -pkpLs*y(14)*y(21)*y(61) + -pkmLs*y(24)*y(61) + pkmLs*y(24)*y(79) + ppLgs*y(27)*y(114) + -pkm2*y(30)*y(61) + -pkm2*y(30)*y(61) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(85) + ppLbs*y(56)*y(115) + -pdm*y(61)*y(99) + -pdm*y(61)*y(99) + pdm*y(78)*y(99);
  dy(62) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(55) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(62)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(62)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(62)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(76) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(80) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(49) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(48) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(62)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(62)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(62)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(87) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(62)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(62)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99);
  dy(63) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(63)) + 2.0 * pkp1*y(3)*y(5)*y(64) + -pkp2*y(4)*y(29)*y(63) + -pkp2*y(6)*y(29)*y(63) + -pkm1*y(8)*y(63) + -pkp2*y(10)*y(29)*y(63) + -pkp2*y(12)*y(29)*y(63) + pkpLs*y(14)*y(21)*y(44) + -pkmLs*y(24)*y(63) + -pkp2*y(29)*y(34)*y(63) + -pkp2*y(29)*y(43)*y(63) + -pkp2*y(29)*y(45)*y(63) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(49)*y(63)) + -pkp2*y(29)*y(63)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(92)) + pkm2*y(30)*y(66) + pkm2*y(30)*y(75) + pkm2*y(30)*y(78) + pkm2*y(30)*y(79) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(80) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(81) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(82) + 2.0 * pkm2*y(30)*y(83) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(93) + pkm2*y(30)*y(104) + pkm2*y(30)*y(108) + pkm2*y(30)*y(110) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(91) + -pdm*y(63)*y(99);
  dy(64) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(64)) + -2.0 * pkp1*y(3)*y(5)*y(64) + -pkp2*y(7)*y(29)*y(64) + pkm1*y(8)*y(63) + -pkp2*y(9)*y(29)*y(64) + -pkp2*y(11)*y(29)*y(64) + -pkp2*y(13)*y(29)*y(64) + pkpLs*y(14)*y(21)*y(45) + -pkmLs*y(24)*y(64) + -pkp2*y(29)*y(33)*y(64) + -pkp2*y(29)*y(42)*y(64) + -pkp2*y(29)*y(44)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(48)*y(64)) + -pkp2*y(29)*y(63)*y(64) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(91)) + pkm2*y(30)*y(66) + pkm2*y(30)*y(75) + pkm2*y(30)*y(78) + pkm2*y(30)*y(79) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(80) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(81) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(82) + 2.0 * pkm2*y(30)*y(83) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(93) + pkm2*y(30)*y(104) + pkm2*y(30)*y(108) + pkm2*y(30)*y(110) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(92) + -pdm*y(64)*y(99);
  dy(65) = (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(46) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(65)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(59) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(116) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(65)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(65)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(71) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(70) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(65)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(65)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(65)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(88) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(50)*y(113) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(65)*y(99));
  dy(66) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(66)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(66)) + pkpL*y(14)*y(15)*y(75) + pkpLs*y(14)*y(21)*y(58) + -pkmL*y(16)*y(66) + -pkmLs*y(24)*y(66) + pkp2*y(29)*y(42)*y(64) + pkp2*y(29)*y(43)*y(63) + -pkm2*y(30)*y(66) + -pkm2*y(30)*y(66) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(81) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(120) + ppLg*y(47)*y(113) + -pdm*y(66)*y(99) + -pdm*y(66)*y(99) + ppLgs*y(108)*y(114);
  dy(67) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(40) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(48) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(49) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(67)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(67)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(52) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(68) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(67)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(67)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(67)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(62)*y(99) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(67)*y(99)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(84)*y(99);
  dy(68) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(56) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(48) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(49) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(68)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(67) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(74) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(68)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(68)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(68)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(68)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(68)*y(115)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(80)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(85)*y(99);
  dy(69) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(57) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(14)*y(15)*y(69)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(86) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(49) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(69)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(69)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(87)*y(99);
  dy(70) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(42) + (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(71) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(70)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(70)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(48) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(70)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(70)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(70)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(71)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(92)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(50) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(52) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(65) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(74) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(76) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(81) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(86) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(88) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(89) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(116) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(70));
  dy(71) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(43) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(71)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(70) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(71)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(49) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(71)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(71)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(71)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(71)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(71)*y(72)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(71)*y(91)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(50) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(52) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(65) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(74) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(76) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(81) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(86) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(88) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(89) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(96) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(102) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(116) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(71));
  dy(72) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(44) + (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(73) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(72)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(72)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(72)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(91) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(72)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(72)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(72)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(71)*y(72)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(72)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(72)*y(92)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(77) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(82) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(84) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(85) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(87) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(89) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(90) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(97) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(103) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(107) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(117) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(119) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(72)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(72)*y(99));
  dy(73) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(45) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(73)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(72) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(73)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(73)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(92) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(73)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(72)*y(73)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(73)*y(91)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(77) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(82) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(84) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(85) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(87) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(89) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(90) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(97) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(103) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(107) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(117) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(119) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(73)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(73)*y(99));
  dy(74) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(47) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(70) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(71) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(68) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(52) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(74)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(74)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(74)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(74)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(74)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(74)*y(113)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99);
  dy(75) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(75)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(75)) + -pkpL*y(14)*y(15)*y(75) + pkpLs*y(14)*y(21)*y(55) + pkmL*y(16)*y(66) + -pkmLs*y(24)*y(75) + pkp2*y(29)*y(33)*y(64) + pkp2*y(29)*y(34)*y(63) + -pkm2*y(30)*y(75) + -pkm2*y(30)*y(75) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(80) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(118) + -pdm*y(75)*y(99) + -pdm*y(75)*y(99) + -ppLbs*y(75)*y(115) + pdm*y(78)*y(99) + ppLgs*y(104)*y(114);
  dy(76) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(58) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(76)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(62) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(76)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(76)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(81) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(71) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(70) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(76)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(76)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(76)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(89) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(52)*y(113) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99)) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(112)*y(116);
  dy(77) = (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(60) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(77)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(77)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(77)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(82) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(121) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(73) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(72) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(77)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(77)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(77)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(90) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99));
  dy(78) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(78)) + -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(78)) + 2.0 * pkpLs*y(14)*y(21)*y(60) + -pkpLs*y(14)*y(21)*y(78) + -pkmLs*y(24)*y(78) + 2.0 * pkmLs*y(24)*y(83) + pkp2*y(29)*y(44)*y(64) + pkp2*y(29)*y(45)*y(63) + -pkm2*y(30)*y(78) + -pkm2*y(30)*y(78) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(82) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(121) + ppLbs*y(75)*y(115) + -pdm*y(78)*y(99) + -pdm*y(78)*y(99) + -pdm*y(78)*y(99) + ppLgs*y(110)*y(114);
  dy(79) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(79)) + pkp2*y(12)*y(29)*y(63) + pkp2*y(13)*y(29)*y(64) + pkpLs*y(14)*y(21)*y(61) + pkpLs*y(14)*y(21)*y(110) + -pkmLs*y(24)*y(79) + -pkmLs*y(24)*y(79) + 2.0 * ppLgs*y(28)*y(114) + -pkm2*y(30)*y(79) + -pkm2*y(30)*y(79) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(94) + -pdm*y(79)*y(99) + -ppLgs*y(79)*y(114) + 2.0 * pdm*y(83)*y(99);
  dy(80) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(75) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(80)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(80)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(62) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(81) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(80)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(48)*y(64) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(49)*y(63) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(80)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(80)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(80)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(95) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(80)*y(99)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(80)*y(115)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(82)*y(99);
  dy(81) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(66) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(81)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(80) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(76) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(81)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(81)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(71) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(70) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(81)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(81)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(81)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(96) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(74)*y(113) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(81)*y(99));
  dy(82) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(78) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(82)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(77) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(82)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(82)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(93) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(73) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(72) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(82)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(82)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(82)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(97) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(80)*y(115) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(82)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(82)*y(99));
  dy(83) = -((((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(83)) + pkpLs*y(14)*y(21)*y(78) + -2.0 * pkmLs*y(24)*y(83) + pkp2*y(29)*y(63)*y(64) + -2.0 * pkm2*y(30)*y(83) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(93) + ppLgs*y(79)*y(114) + -2.0 * pdm*y(83)*y(99);
  dy(84) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(53) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(72) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(73) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(84)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(84)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(85) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(111) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(84)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(84)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(84)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(84)*y(99)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(84)*y(99));
  dy(85) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(61) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(72) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(73) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(84) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(85)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(85)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(94) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(85)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(85)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(85)) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(68)*y(115) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(82)*y(99) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(85)*y(99));
  dy(86) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(59) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(116) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) + (2.0 * pkpL)) / 10.0)*y(14)*y(15)*y(69) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(86)) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(86)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(16)*y(88) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(71) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(70) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(86)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(86)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(86)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(86)) + -(((((((((((((((((ppLb + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) / 16.0)*y(86)*y(112)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(89)*y(99);
  dy(87) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(62) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(117) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(87)) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(87)) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(89) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(95) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(73) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(72) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(87)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(87)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(87)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(87)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(87)*y(99)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) / 10.0)*y(90)*y(99);
  dy(88) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(65) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(86) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) + (2.0 * pkmL)) / 10.0)*y(16)*y(88)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(71) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(88)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(88));
  dy(89) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(76) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(119) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(87) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(89)) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(89)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(96) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(73) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(71)*y(72) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(89)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(89)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(89)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(89)) + ((((((((((((((((ppLb + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) + ppLb) / 16.0)*y(86)*y(112) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(89)*y(99));
  dy(90) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(77) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(14)*y(21)*y(90)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(97) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(72)*y(73) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(90)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(90)) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) + (2.0 * pdm)) / 10.0)*y(90)*y(99));
  dy(91) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(63) + (((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(92) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(91)) + -(((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(91)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(72) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(91)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(91)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(91)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(71)*y(91)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(73)*y(91)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(91)*y(92)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(93) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(94) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(95) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(97) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(105) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(109) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(111) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(118) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(120) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(121) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(91));
  dy(92) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(64) + -((((((2.0 * pkp1) + (2.0 * pkp1)) + (2.0 * pkp1)) + (2.0 * pkp1)) / 4.0)*y(3)*y(5)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(92)) + ((((pkm1 + pkm1) + pkm1) + pkm1) / 4.0)*y(8)*y(91) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(92)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(73) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(92)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(92)) + -(((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(92)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(92)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(72)*y(92)) + -(((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(91)*y(92)) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(93) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(94) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(95) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(96) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(97) + ((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(98) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(105) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(109) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(111) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(118) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(120) + ((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(121) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(92));
  dy(93) = (((((2.0 * pkpS) + (2.0 * pkpS)) + (2.0 * pkpS)) + (2.0 * pkpS)) / 4.0)*y(2)*y(32)*y(83) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(93)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(82) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(121) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(93)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(93)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(63)*y(92) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(64)*y(91) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(93)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(93)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(93)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(98) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(93)*y(99)) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(94)*y(114);
  dy(94) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(79) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(12)*y(29)*y(91) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(13)*y(29)*y(92) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(85) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(111) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(94)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(94)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(94)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(94)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(93)*y(99) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(94)*y(114));
  dy(95) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(80) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(118) + -(((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(95)) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(87) + ((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(96) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(95)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(48)*y(92) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(49)*y(91) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(95)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(95)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(95)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(95)) + -(((((((((((((((((ppLbs + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) / 16.0)*y(95)*y(115)) + ((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(97)*y(99);
  dy(96) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(81) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(120) + ((((((((((((((((pkpL + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) + pkpL) / 16.0)*y(14)*y(15)*y(95) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(89) + -(((((((((((((((((pkmL + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) + pkmL) / 16.0)*y(16)*y(96)) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(96)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(70)*y(92) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(71)*y(91) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(96)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(96)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(96));
  dy(97) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(82) + ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(121) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) + (2.0 * pkpLs)) / 10.0)*y(14)*y(21)*y(90) + -(((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(97)) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) / 16.0)*y(24)*y(97)) + ((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(24)*y(98) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(72)*y(92) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(73)*y(91) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(97)) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) / 16.0)*y(30)*y(97)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(97)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(97)) + ((((((((((((((((ppLbs + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) + ppLbs) / 16.0)*y(95)*y(115) + -(((((((((((((((((pdm + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) + pdm) / 16.0)*y(97)*y(99));
  dy(98) = ((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(93) + ((((((((((((((((pkpLs + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) + pkpLs) / 16.0)*y(14)*y(21)*y(97) + -(((((((((((((((((pkmLs + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + pkmLs) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) + (2.0 * pkmLs)) / 10.0)*y(24)*y(98)) + ((((((((((((((((pkp2 + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) + pkp2) / 16.0)*y(29)*y(91)*y(92) + -(((((((((((((((((pkm2 + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + pkm2) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) + (2.0 * pkm2)) / 10.0)*y(30)*y(98)) + -(((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) + (2.0 * pkmS)) / 10.0)*y(39)*y(98));
  dy(99) = 0;
  dy(100) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(100)) + pkp2*y(4)*y(29)*y(42) + pkp2*y(7)*y(29)*y(43) + pkpL*y(14)*y(15)*y(36) + -pkpL*y(14)*y(15)*y(100) + pkmL*y(16)*y(35) + -pkmL*y(16)*y(100) + -pkm2*y(30)*y(100) + -pkm2*y(30)*y(100) + pdm*y(37)*y(99) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(102) + pdm*y(54)*y(99) + -pdm*y(99)*y(100) + -ppLb*y(100)*y(112) + -ppLg*y(100)*y(113);
  dy(101) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(101)) + pkp2*y(4)*y(29)*y(44) + pkp2*y(7)*y(29)*y(45) + -pkpL*y(14)*y(15)*y(101) + -pkpLs*y(14)*y(21)*y(101) + pkmL*y(16)*y(106) + pkmLs*y(24)*y(104) + -pkm2*y(30)*y(101) + -pkm2*y(30)*y(101) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(103) + pdm*y(53)*y(99) + pdm*y(55)*y(99) + -pdm*y(99)*y(101) + -pdm*y(99)*y(101);
  dy(102) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(100) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(70) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(71) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(51) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(102)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(50) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(102)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(102)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(102)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(102)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(52)*y(99) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(116) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(102)*y(112)) + -(((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(102)*y(113));
  dy(103) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(101) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(72) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(73) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(103)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(103)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(107) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(105) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(103)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(103)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(103)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(84)*y(99) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(103)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117);
  dy(104) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(104)) + pkp2*y(4)*y(29)*y(63) + pkp2*y(7)*y(29)*y(64) + -pkpL*y(14)*y(15)*y(104) + pkpLs*y(14)*y(21)*y(101) + pkmL*y(16)*y(108) + -pkmLs*y(24)*y(104) + -pkm2*y(30)*y(104) + -pkm2*y(30)*y(104) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(105) + pdm*y(75)*y(99) + -pdm*y(99)*y(104) + pdm*y(99)*y(110) + -ppLgs*y(104)*y(114) + -ppLbs*y(104)*y(115);
  dy(105) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(104) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(4)*y(29)*y(91) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(7)*y(29)*y(92) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(105)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(103) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(109) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(105)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(105)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(105)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(105)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(111) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(118) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(105)*y(114)) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(105)*y(115));
  dy(106) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(106)) + pkp2*y(6)*y(29)*y(44) + pkp2*y(9)*y(29)*y(45) + pkpL*y(14)*y(15)*y(101) + -pkpLs*y(14)*y(21)*y(106) + -pkmL*y(16)*y(106) + ppLg*y(20)*y(113) + pkmLs*y(24)*y(108) + -pkm2*y(30)*y(106) + -pkm2*y(30)*y(106) + ppLb*y(31)*y(112) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(107) + pdm*y(58)*y(99) + -pdm*y(99)*y(106) + -pdm*y(99)*y(106);
  dy(107) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(106) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(72) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(73) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(103) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(107)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(107)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(109) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(107)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(107)) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(38)*y(112) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(107)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(107)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119);
  dy(108) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(108)) + pkp2*y(6)*y(29)*y(63) + pkp2*y(9)*y(29)*y(64) + pkpL*y(14)*y(15)*y(104) + pkpLs*y(14)*y(21)*y(106) + -pkmL*y(16)*y(108) + ppLg*y(23)*y(113) + -pkmLs*y(24)*y(108) + -pkm2*y(30)*y(108) + -pkm2*y(30)*y(108) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(109) + pdm*y(66)*y(99) + -pdm*y(99)*y(108) + -ppLgs*y(108)*y(114);
  dy(109) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(108) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(6)*y(29)*y(91) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(9)*y(29)*y(92) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(105) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(107) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(109)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(109)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(109)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(109)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(109)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(120) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(109)*y(114));
  dy(110) = -(((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(110)) + pkp2*y(10)*y(29)*y(63) + pkp2*y(11)*y(29)*y(64) + pkpLs*y(14)*y(21)*y(53) + -pkpLs*y(14)*y(21)*y(110) + pkmLs*y(24)*y(79) + -pkmLs*y(24)*y(110) + -pkm2*y(30)*y(110) + -pkm2*y(30)*y(110) + ((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(111) + pdm*y(78)*y(99) + -pdm*y(99)*y(110) + -pdm*y(99)*y(110) + ppLbs*y(104)*y(115) + -ppLgs*y(110)*y(114);
  dy(111) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(110) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(10)*y(29)*y(91) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(11)*y(29)*y(92) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(84) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(111)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(94) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(111)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(111)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(111)) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(111)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(111)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(105)*y(115) + -(((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(111)*y(114));
  dy(112) = 0;
  dy(113) = 0;
  dy(114) = 0;
  dy(115) = 0;
  dy(116) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(54) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(116)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(57) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(116)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(65) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(116)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(71) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(70) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(116)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(116)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(86) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(116)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(76)*y(99) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(116)) + ((((ppLg + ppLg) + ppLg) + ppLg) / 4.0)*y(102)*y(113) + -(((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(112)*y(116));
  dy(117) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(55) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(117)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(117)) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(117)) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(119) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(118) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(73) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(72) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(117)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(117)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(87) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(117)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(77)*y(99) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(117));
  dy(118) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(75) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(118)) + -(((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(118)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(117) + ((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(120) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(118)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(33)*y(92) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(34)*y(91) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(118)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(118)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(95) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(118)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(118)) + ((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(105)*y(114) + -(((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(115)*y(118));
  dy(119) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(58) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(119)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(117) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(119)) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(119)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(120) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(73) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(72) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(119)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(119)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(89) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(119)) + ((((ppLb + ppLb) + ppLb) + ppLb) / 4.0)*y(59)*y(112) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(119));
  dy(120) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(66) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(120)) + ((((pkpL + pkpL) + pkpL) + pkpL) / 4.0)*y(14)*y(15)*y(118) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(119) + -(((((pkmL + pkmL) + pkmL) + pkmL) / 4.0)*y(16)*y(120)) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(120)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(42)*y(92) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(43)*y(91) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(120)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(120)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(96) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(120)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(120)) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(109)*y(114);
  dy(121) = ((((pkpS + pkpS) + pkpS) + pkpS) / 4.0)*y(2)*y(32)*y(78) + -(((((((((((((((((pkpS + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) + pkpS) / 16.0)*y(2)*y(32)*y(121)) + ((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(77) + -(((((pkpLs + pkpLs) + pkpLs) + pkpLs) / 4.0)*y(14)*y(21)*y(121)) + ((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(93) + -(((((pkmLs + pkmLs) + pkmLs) + pkmLs) / 4.0)*y(24)*y(121)) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(44)*y(92) + ((((pkp2 + pkp2) + pkp2) + pkp2) / 4.0)*y(29)*y(45)*y(91) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(121)) + -(((((pkm2 + pkm2) + pkm2) + pkm2) / 4.0)*y(30)*y(121)) + ((((((((((((((((pkmS + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) + pkmS) / 16.0)*y(39)*y(97) + -(((((pkmS + pkmS) + pkmS) + pkmS) / 4.0)*y(39)*y(121)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121)) + -(((((pdm + pdm) + pdm) + pdm) / 4.0)*y(99)*y(121)) + ((((ppLgs + ppLgs) + ppLgs) + ppLgs) / 4.0)*y(111)*y(114) + ((((ppLbs + ppLbs) + ppLbs) + ppLbs) / 4.0)*y(115)*y(118);
end
