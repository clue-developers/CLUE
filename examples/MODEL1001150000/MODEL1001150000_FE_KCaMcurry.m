

% Automatically generated from MODEL1001150000_FE_KCaMcurry.
% Original number of species: 121.
% Original number of reactions: 264.

% Correspondence with original names:
%     y(1) = caminit
%     y(2) = KCaM_0_0
%     y(3) = KCaM_0_1
%     y(4) = KCaM_0_2
%     y(5) = KCaM_1_0
%     y(6) = KCaM_1_1
%     y(7) = KCaM_1_2
%     y(8) = KCaM_2_0
%     y(9) = KCaM_2_1
%     y(10) = KCaM_2_2
%     y(11) = CaM_0_1
%     y(12) = Ca
%     y(13) = k1Con
%     y(14) = CaM_1_1
%     y(15) = k1Coff
%     y(16) = CaM_0_0
%     y(17) = k1Non
%     y(18) = k1Noff
%     y(19) = k2Non
%     y(20) = CaM_0_2
%     y(21) = k2Noff
%     y(22) = KaMe
%     y(23) = kCaM1Non
%     y(24) = kCaM1Noff
%     y(25) = CaM_1_2
%     y(26) = kCaM2Non
%     y(27) = kCaM2Noff
%     y(28) = CaM_1_0
%     y(29) = k2Con
%     y(30) = CaM_2_0
%     y(31) = k2Coff
%     y(32) = kCaM1Con
%     y(33) = kCaM1Coff
%     y(34) = CaM_2_1
%     y(35) = kCaM1C1Non
%     y(36) = kCaM1C1Noff
%     y(37) = CaM_2_2
%     y(38) = kCaM1C2Non
%     y(39) = kCaM1C2Noff
%     y(40) = kCaM2Con
%     y(41) = kCaM2Coff
%     y(42) = kCaM2C1Non
%     y(43) = kCaM2C1Noff
%     y(44) = kCaM4on
%     y(45) = kCaM4off
%     y(46) = k2CaMKon
%     y(47) = k2CaMKoff
%     y(48) = kpCaM0
%     y(49) = kpCaM1N
%     y(50) = kpCaM2N
%     y(51) = kpCaM1C
%     y(52) = kpCaM1C1N
%     y(53) = kpCaM1C2N
%     y(54) = kpCaM2C
%     y(55) = kpCaM2C1N
%     y(56) = kpCaM4
%     y(57) = pKCaMcomplex_0_0_0_0
%     y(58) = pKCaMcomplex_0_0_0_1
%     y(59) = pKCaMcomplex_0_0_0_2
%     y(60) = pKCaMcomplex_0_0_1_0
%     y(61) = pKCaMcomplex_0_0_1_1
%     y(62) = pKCaMcomplex_0_0_1_2
%     y(63) = pKCaMcomplex_0_0_2_0
%     y(64) = pKCaMcomplex_0_0_2_1
%     y(65) = pKCaMcomplex_0_0_2_2
%     y(66) = kCaM0on
%     y(67) = kCaM0off
%     y(68) = kK1Con
%     y(69) = kK1Coff
%     y(70) = kK2Con
%     y(71) = kK2Coff
%     y(72) = kK1Non
%     y(73) = kK1Noff
%     y(74) = kK2Non
%     y(75) = kK2Noff
%     y(76) = KCaMcomplex_0_0_0_1
%     y(77) = KCaMcomplex_0_0_0_2
%     y(78) = KCaMcomplex_0_0_1_0
%     y(79) = KCaMcomplex_0_0_1_1
%     y(80) = KCaMcomplex_0_0_1_2
%     y(81) = KCaMcomplex_0_0_2_0
%     y(82) = KCaMcomplex_0_0_2_1
%     y(83) = KCaMcomplex_0_0_2_2
%     y(84) = KCaMcomplex_0_0_0_0
%     y(85) = pKCaM_0_0
%     y(86) = KCaMcomplex_0_1_0_2
%     y(87) = KCaMcomplex_0_1_1_0
%     y(88) = KCaMcomplex_0_1_1_1
%     y(89) = KCaMcomplex_0_1_1_2
%     y(90) = KCaMcomplex_0_1_2_0
%     y(91) = KCaMcomplex_0_1_2_1
%     y(92) = KCaMcomplex_0_1_2_2
%     y(93) = KCaMcomplex_0_1_0_1
%     y(94) = KCaMcomplex_0_2_1_0
%     y(95) = KCaMcomplex_0_2_1_1
%     y(96) = KCaMcomplex_0_2_1_2
%     y(97) = KCaMcomplex_0_2_2_0
%     y(98) = KCaMcomplex_0_2_2_1
%     y(99) = KCaMcomplex_0_2_2_2
%     y(100) = KCaMcomplex_0_2_0_2
%     y(101) = KCaMcomplex_1_0_1_1
%     y(102) = KCaMcomplex_1_0_1_2
%     y(103) = KCaMcomplex_1_0_2_0
%     y(104) = KCaMcomplex_1_0_2_1
%     y(105) = KCaMcomplex_1_0_2_2
%     y(106) = KCaMcomplex_1_0_1_0
%     y(107) = KCaMcomplex_1_1_1_2
%     y(108) = KCaMcomplex_1_1_2_0
%     y(109) = KCaMcomplex_1_1_2_1
%     y(110) = KCaMcomplex_1_1_2_2
%     y(111) = KCaMcomplex_1_1_1_1
%     y(112) = KCaMcomplex_1_2_2_0
%     y(113) = KCaMcomplex_1_2_2_1
%     y(114) = KCaMcomplex_1_2_2_2
%     y(115) = KCaMcomplex_1_2_1_2
%     y(116) = KCaMcomplex_2_0_2_1
%     y(117) = KCaMcomplex_2_0_2_2
%     y(118) = KCaMcomplex_2_0_2_0
%     y(119) = KCaMcomplex_2_1_2_2
%     y(120) = KCaMcomplex_2_1_2_1
%     y(121) = KCaMcomplex_2_2_2_2


function MODEL1001150000_FE_KCaMcurry
[T,Y]=ode45(@ode,[0 100.0],[  210.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 100.0 4.0 0.0 40.0 30.0 100.0 2500.0 150.0 0.0 750.0 80.0 0.022 3.1 0.0 0.1 1.7 0.0 10.0 0.0 9.25 0.059 6.8 0.0 3.3 3.4 0.0 1.9 1.9 0.92 6.8 5.2 3.8 30.0 1.7 50.0 60.0 0.0 0.06 0.12 0.032 0.094 0.154 0.064 0.124 0.96 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0038 5.5 44.0 33.0 44.0 2.7 75.0 300.0 76.0 33.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0]);
 function array =  getSpecies(y)
array =  Y(:,y);
end

% Output is restricted to Views.
pk1Con = 1.0;
pk1Coff = 1.0;
pk2Con = 1.0;
pk2Coff = 1.0;
pk1Non = 1.0;
pk1Noff = 1.0;
pk2Non = 1.0;
pk2Noff = 1.0;
pkK1Con = 1.0;
pkK1Coff = 1.0;
pkK2Con = 1.0;
pkK2Coff = 1.0;
pkK1Non = 1.0;
pkK1Noff = 1.0;
pkK2Non = 1.0;
pkK2Noff = 1.0;
pkCaM0on = 1.0;
pkCaM0off = 1.0;
pkCaM1Con = 1.0;
pkCaM1Coff = 1.0;
pkCaM2Con = 1.0;
pkCaM2Coff = 1.0;
pkCaM2C1Non = 1.0;
pkCaM2C1Noff = 1.0;
pkCaM1C1Non = 1.0;
pkCaM1C1Noff = 1.0;
pkCaM4on = 1.0;
pkCaM4off = 1.0;
pkCaM1Non = 1.0;
pkCaM1Noff = 1.0;
pkCaM1C2Non = 1.0;
pkCaM1C2Noff = 1.0;
pkCaM2Non = 1.0;
pkCaM2Noff = 1.0;
pk2CaMKon = 1.0;
pk2CaMKoff = 1.0;
pkpCaM0 = 1.0;
pkpCaM1C = 1.0;
pkpCaM2C = 1.0;
pkpCaM2C1N = 1.0;
pkpCaM1C1N = 1.0;
pkpCaM4 = 1.0;
pkpCaM1N = 1.0;
pkpCaM1C2N = 1.0;
pkpCaM2N = 1.0;
pcaminit = 1.0;
pckinit = 1.0;
pcainit = 1.0;
view= getSpecies(60)/9;
plot(T,view);
hold on;
view= getSpecies(20)/1;
plot(T,view);
hold on;
view= getSpecies(109)/1;
plot(T,view);
hold on;
view= getSpecies(120)/1;
plot(T,view);
hold on;
view= getSpecies(97)/1;
plot(T,view);
hold on;
view= getSpecies(27)/1;
plot(T,view);
hold on;
view= getSpecies(87)/1;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(69)/1;
plot(T,view);
hold on;
view= getSpecies(98)/1;
plot(T,view);
hold on;
view= getSpecies(112)/1;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
view= getSpecies(86)/1;
plot(T,view);
hold on;
view= getSpecies(116)/1;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(36)/1;
plot(T,view);
hold on;
view= getSpecies(117)/1;
plot(T,view);
hold on;
view= getSpecies(90)/1;
plot(T,view);
hold on;
view= getSpecies(94)/1;
plot(T,view);
hold on;
view= getSpecies(25)/1;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(50)/1;
plot(T,view);
hold on;
view= getSpecies(30)/1;
plot(T,view);
hold on;
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(53)/1;
plot(T,view);
hold on;
view= getSpecies(59)/9;
plot(T,view);
hold on;
view= getSpecies(83)/1;
plot(T,view);
hold on;
view= getSpecies(106)/1;
plot(T,view);
hold on;
view= getSpecies(55)/1;
plot(T,view);
hold on;
view= getSpecies(82)/1;
plot(T,view);
hold on;
view= getSpecies(93)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(65)/9;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(80)/1;
plot(T,view);
hold on;
view= getSpecies(62)/9;
plot(T,view);
hold on;
view= getSpecies(115)/1;
plot(T,view);
hold on;
view= getSpecies(84)/1;
plot(T,view);
hold on;
view= getSpecies(29)/1;
plot(T,view);
hold on;
view= getSpecies(107)/1;
plot(T,view);
hold on;
view= getSpecies(101)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(32)/1;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(70)/1;
plot(T,view);
hold on;
view= getSpecies(49)/1;
plot(T,view);
hold on;
view= getSpecies(1)/3;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(89)/1;
plot(T,view);
hold on;
view= getSpecies(26)/1;
plot(T,view);
hold on;
view= getSpecies(100)/1;
plot(T,view);
hold on;
view= getSpecies(74)/1;
plot(T,view);
hold on;
view= getSpecies(81)/1;
plot(T,view);
hold on;
view= getSpecies(75)/1;
plot(T,view);
hold on;
view= getSpecies(76)/1;
plot(T,view);
hold on;
view= getSpecies(102)/1;
plot(T,view);
hold on;
view= getSpecies(103)/1;
plot(T,view);
hold on;
view= getSpecies(111)/1;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(119)/1;
plot(T,view);
hold on;
view= getSpecies(108)/1;
plot(T,view);
hold on;
view= getSpecies(22)/1;
plot(T,view);
hold on;
view= getSpecies(105)/1;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(92)/1;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(19)/1;
plot(T,view);
hold on;
view= getSpecies(54)/1;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(56)/1;
plot(T,view);
hold on;
view= getSpecies(79)/1;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(73)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(91)/1;
plot(T,view);
hold on;
view= getSpecies(38)/1;
plot(T,view);
hold on;
view= getSpecies(99)/1;
plot(T,view);
hold on;
view= getSpecies(118)/1;
plot(T,view);
hold on;
view= getSpecies(67)/1;
plot(T,view);
hold on;
view= getSpecies(95)/1;
plot(T,view);
hold on;
view= getSpecies(45)/1;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(66)/1;
plot(T,view);
hold on;
view= getSpecies(35)/1;
plot(T,view);
hold on;
view= getSpecies(110)/1;
plot(T,view);
hold on;
view= getSpecies(88)/1;
plot(T,view);
hold on;
view= getSpecies(68)/1;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(63)/9;
plot(T,view);
hold on;
view= getSpecies(77)/1;
plot(T,view);
hold on;
view= getSpecies(23)/1;
plot(T,view);
hold on;
view= getSpecies(78)/1;
plot(T,view);
hold on;
view= getSpecies(72)/1;
plot(T,view);
hold on;
view= getSpecies(52)/1;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(85)/9;
plot(T,view);
hold on;
view= getSpecies(64)/9;
plot(T,view);
hold on;
view= getSpecies(114)/1;
plot(T,view);
hold on;
view= getSpecies(51)/1;
plot(T,view);
hold on;
view= getSpecies(57)/9;
plot(T,view);
hold on;
view= getSpecies(71)/1;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(48)/1;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(121)/1;
plot(T,view);
hold on;
view= getSpecies(96)/1;
plot(T,view);
hold on;
view= getSpecies(58)/9;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(61)/9;
plot(T,view);
hold on;
view= getSpecies(21)/1;
plot(T,view);
hold on;
view= getSpecies(44)/1;
plot(T,view);
hold on;
view= getSpecies(31)/1;
plot(T,view);
hold on;
view= getSpecies(113)/1;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(104)/1;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vpKCaMcomplex_0_0_1_0','vCaM_0_2','vKCaMcomplex_1_1_2_1','vKCaMcomplex_2_1_2_1','vKCaMcomplex_0_2_2_0','vkCaM2Noff','vKCaMcomplex_0_1_1_0','vkCaM1C2Noff','vkK1Coff','vKCaMcomplex_0_2_2_1','vKCaMcomplex_1_2_2_0','vKCaM_2_1','vKCaMcomplex_0_1_0_2','vKCaMcomplex_2_0_2_1','vk1Con','vk1Non','vkCaM1C1Noff','vKCaMcomplex_2_0_2_2','vKCaMcomplex_0_1_2_0','vKCaMcomplex_0_2_1_0','vCaM_1_2','vkCaM2Con','vkpCaM2N','vCaM_2_0','vCaM_1_0','vkpCaM1C2N','vpKCaMcomplex_0_0_0_2','vKCaMcomplex_0_0_2_2','vKCaMcomplex_1_0_1_0','vkpCaM2C1N','vKCaMcomplex_0_0_2_1','vKCaMcomplex_0_1_0_1','vkCaM2C1Non','vpKCaMcomplex_0_0_2_2','vKCaM_2_2','vkCaM1Noff','vKCaMcomplex_0_0_1_2','vpKCaMcomplex_0_0_1_2','vKCaMcomplex_1_2_1_2','vKCaMcomplex_0_0_0_0','vk2Con','vKCaMcomplex_1_1_1_2','vKCaMcomplex_1_0_1_1','vKCaM_0_2','vkCaM1Con','vk1Noff','vkK2Con','vkpCaM1N','vcaminit','vKCaM_0_1','vKCaMcomplex_0_1_1_2','vkCaM2Non','vKCaMcomplex_0_2_0_2','vkK2Non','vKCaMcomplex_0_0_2_0','vkK2Noff','vKCaMcomplex_0_0_0_1','vKCaMcomplex_1_0_1_2','vKCaMcomplex_1_0_2_0','vKCaMcomplex_1_1_1_1','vKCaM_1_0','vKCaMcomplex_2_1_2_2','vKCaMcomplex_1_1_2_0','vKaMe','vKCaMcomplex_1_0_2_2','vCaM_2_1','vKCaMcomplex_0_1_2_2','vCaM_2_2','vk2Non','vkpCaM2C','vKCaM_2_0','vkpCaM4','vKCaMcomplex_0_0_1_1','vKCaM_1_1','vkK1Noff','vKCaM_0_0','vCaM_1_1','vKCaMcomplex_0_1_2_1','vkCaM1C2Non','vKCaMcomplex_0_2_2_2','vKCaMcomplex_2_0_2_0','vkCaM0off','vKCaMcomplex_0_2_1_1','vkCaM4off','vk2CaMKoff','vkCaM0on','vkCaM1C1Non','vKCaMcomplex_1_1_2_2','vKCaMcomplex_0_1_1_1','vkK1Con','vkCaM1Coff','vpKCaMcomplex_0_0_2_0','vKCaMcomplex_0_0_0_2','vkCaM1Non','vKCaMcomplex_0_0_1_0','vkK1Non','vkpCaM1C1N','vCaM_0_0','vk2CaMKon','vpKCaM_0_0','vpKCaMcomplex_0_0_2_1','vKCaMcomplex_1_2_2_2','vkpCaM1C','vpKCaMcomplex_0_0_0_0','vkK2Coff','vkCaM2C1Noff','vKCaM_1_2','vCa','vkpCaM0','vkCaM2Coff','vKCaMcomplex_2_2_2_2','vKCaMcomplex_0_2_1_2','vpKCaMcomplex_0_0_0_1','vk1Coff','vpKCaMcomplex_0_0_1_1','vk2Noff','vkCaM4on','vk2Coff','vKCaMcomplex_1_2_2_1','vCaM_0_1','vKCaMcomplex_1_0_2_1');
end

function dy =  ode(t,y) 
  pk1Con = 1.0;
  pk1Coff = 1.0;
  pk2Con = 1.0;
  pk2Coff = 1.0;
  pk1Non = 1.0;
  pk1Noff = 1.0;
  pk2Non = 1.0;
  pk2Noff = 1.0;
  pkK1Con = 1.0;
  pkK1Coff = 1.0;
  pkK2Con = 1.0;
  pkK2Coff = 1.0;
  pkK1Non = 1.0;
  pkK1Noff = 1.0;
  pkK2Non = 1.0;
  pkK2Noff = 1.0;
  pkCaM0on = 1.0;
  pkCaM0off = 1.0;
  pkCaM1Con = 1.0;
  pkCaM1Coff = 1.0;
  pkCaM2Con = 1.0;
  pkCaM2Coff = 1.0;
  pkCaM2C1Non = 1.0;
  pkCaM2C1Noff = 1.0;
  pkCaM1C1Non = 1.0;
  pkCaM1C1Noff = 1.0;
  pkCaM4on = 1.0;
  pkCaM4off = 1.0;
  pkCaM1Non = 1.0;
  pkCaM1Noff = 1.0;
  pkCaM1C2Non = 1.0;
  pkCaM1C2Noff = 1.0;
  pkCaM2Non = 1.0;
  pkCaM2Noff = 1.0;
  pk2CaMKon = 1.0;
  pk2CaMKoff = 1.0;
  pkpCaM0 = 1.0;
  pkpCaM1C = 1.0;
  pkpCaM2C = 1.0;
  pkpCaM2C1N = 1.0;
  pkpCaM1C1N = 1.0;
  pkpCaM4 = 1.0;
  pkpCaM1N = 1.0;
  pkpCaM1C2N = 1.0;
  pkpCaM2N = 1.0;
  pcaminit = 1.0;
  pckinit = 1.0;
  pcainit = 1.0;

  dy=zeros(121,1);

  dy(1) = 0;
  dy(2) = -pk2CaMKon*y(2)*y(3)*y(46) + -pk2CaMKon*y(2)*y(4)*y(46) + -pk2CaMKon*y(2)*y(5)*y(46) + -pk2CaMKon*y(2)*y(6)*y(46) + -pk2CaMKon*y(2)*y(7)*y(46) + -pk2CaMKon*y(2)*y(8)*y(46) + -pk2CaMKon*y(2)*y(9)*y(46) + -pk2CaMKon*y(2)*y(10)*y(46) + -pkK1Con*y(2)*y(12)*y(68) + -pkK1Non*y(2)*y(12)*y(72) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(46)*y(85)) + -pkCaM0off*y(2)*y(67) + -2*(pk2CaMKon*y(2)*y(2)*y(46)) + pkK1Noff*y(3)*y(73) + pkK1Coff*y(5)*y(69) + pkCaM0on*y(16)*y(22)*y(66) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(57) + pk2CaMKoff*y(47)*y(76) + pk2CaMKoff*y(47)*y(77) + pk2CaMKoff*y(47)*y(78) + pk2CaMKoff*y(47)*y(79) + pk2CaMKoff*y(47)*y(80) + pk2CaMKoff*y(47)*y(81) + pk2CaMKoff*y(47)*y(82) + pk2CaMKoff*y(47)*y(83) + 2*(pk2CaMKoff*y(47)*y(84)) + pkpCaM0*y(48)*y(84) + pkpCaM1N*y(49)*y(76) + pkpCaM2N*y(50)*y(77) + pkpCaM1C*y(51)*y(78) + pkpCaM1C1N*y(52)*y(79) + pkpCaM1C2N*y(53)*y(80) + pkpCaM2C*y(54)*y(81) + pkpCaM2C1N*y(55)*y(82) + pkpCaM4*y(56)*y(83);
  dy(3) = -pk2CaMKon*y(2)*y(3)*y(46) + pkK1Non*y(2)*y(12)*y(72) + -pk2CaMKon*y(3)*y(4)*y(46) + -pk2CaMKon*y(3)*y(5)*y(46) + -pk2CaMKon*y(3)*y(6)*y(46) + -pk2CaMKon*y(3)*y(7)*y(46) + -pk2CaMKon*y(3)*y(8)*y(46) + -pk2CaMKon*y(3)*y(9)*y(46) + -pk2CaMKon*y(3)*y(10)*y(46) + -pkK1Con*y(3)*y(12)*y(68) + -pkK2Non*y(3)*y(12)*y(74) + -pkCaM1Noff*y(3)*y(24) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(3)*y(46)*y(85)) + -pkK1Noff*y(3)*y(73) + -2*(pk2CaMKon*y(3)*y(3)*y(46)) + pkK2Noff*y(4)*y(75) + pkK1Coff*y(6)*y(69) + pkCaM1Non*y(11)*y(22)*y(23) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(58) + pk2CaMKoff*y(47)*y(76) + pk2CaMKoff*y(47)*y(86) + pk2CaMKoff*y(47)*y(87) + pk2CaMKoff*y(47)*y(88) + pk2CaMKoff*y(47)*y(89) + pk2CaMKoff*y(47)*y(90) + pk2CaMKoff*y(47)*y(91) + pk2CaMKoff*y(47)*y(92) + 2*(pk2CaMKoff*y(47)*y(93)) + pkpCaM0*y(48)*y(76) + pkpCaM1N*y(49)*y(93) + pkpCaM2N*y(50)*y(86) + pkpCaM1C*y(51)*y(87) + pkpCaM1C1N*y(52)*y(88) + pkpCaM1C2N*y(53)*y(89) + pkpCaM2C*y(54)*y(90) + pkpCaM2C1N*y(55)*y(91) + pkpCaM4*y(56)*y(92);
  dy(4) = -pk2CaMKon*y(2)*y(4)*y(46) + -pk2CaMKon*y(3)*y(4)*y(46) + pkK2Non*y(3)*y(12)*y(74) + -pk2CaMKon*y(4)*y(5)*y(46) + -pk2CaMKon*y(4)*y(6)*y(46) + -pk2CaMKon*y(4)*y(7)*y(46) + -pk2CaMKon*y(4)*y(8)*y(46) + -pk2CaMKon*y(4)*y(9)*y(46) + -pk2CaMKon*y(4)*y(10)*y(46) + -pkK1Con*y(4)*y(12)*y(68) + -pkCaM2Noff*y(4)*y(27) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(4)*y(46)*y(85)) + -pkK2Noff*y(4)*y(75) + -2*(pk2CaMKon*y(4)*y(4)*y(46)) + pkK1Coff*y(7)*y(69) + pkCaM2Non*y(20)*y(22)*y(26) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(59) + pk2CaMKoff*y(47)*y(77) + pk2CaMKoff*y(47)*y(86) + pk2CaMKoff*y(47)*y(94) + pk2CaMKoff*y(47)*y(95) + pk2CaMKoff*y(47)*y(96) + pk2CaMKoff*y(47)*y(97) + pk2CaMKoff*y(47)*y(98) + pk2CaMKoff*y(47)*y(99) + 2*(pk2CaMKoff*y(47)*y(100)) + pkpCaM0*y(48)*y(77) + pkpCaM1N*y(49)*y(86) + pkpCaM2N*y(50)*y(100) + pkpCaM1C*y(51)*y(94) + pkpCaM1C1N*y(52)*y(95) + pkpCaM1C2N*y(53)*y(96) + pkpCaM2C*y(54)*y(97) + pkpCaM2C1N*y(55)*y(98) + pkpCaM4*y(56)*y(99);
  dy(5) = -pk2CaMKon*y(2)*y(5)*y(46) + pkK1Con*y(2)*y(12)*y(68) + -pk2CaMKon*y(3)*y(5)*y(46) + -pk2CaMKon*y(4)*y(5)*y(46) + -pk2CaMKon*y(5)*y(6)*y(46) + -pk2CaMKon*y(5)*y(7)*y(46) + -pk2CaMKon*y(5)*y(8)*y(46) + -pk2CaMKon*y(5)*y(9)*y(46) + -pk2CaMKon*y(5)*y(10)*y(46) + -pkK2Con*y(5)*y(12)*y(70) + -pkK1Non*y(5)*y(12)*y(72) + -pkCaM1Coff*y(5)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(5)*y(46)*y(85)) + -pkK1Coff*y(5)*y(69) + -2*(pk2CaMKon*y(5)*y(5)*y(46)) + pkK1Noff*y(6)*y(73) + pkK2Coff*y(8)*y(71) + pkCaM1Con*y(22)*y(28)*y(32) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(60) + pk2CaMKoff*y(47)*y(78) + pk2CaMKoff*y(47)*y(87) + pk2CaMKoff*y(47)*y(94) + pk2CaMKoff*y(47)*y(101) + pk2CaMKoff*y(47)*y(102) + pk2CaMKoff*y(47)*y(103) + pk2CaMKoff*y(47)*y(104) + pk2CaMKoff*y(47)*y(105) + 2*(pk2CaMKoff*y(47)*y(106)) + pkpCaM0*y(48)*y(78) + pkpCaM1N*y(49)*y(87) + pkpCaM2N*y(50)*y(94) + pkpCaM1C*y(51)*y(106) + pkpCaM1C1N*y(52)*y(101) + pkpCaM1C2N*y(53)*y(102) + pkpCaM2C*y(54)*y(103) + pkpCaM2C1N*y(55)*y(104) + pkpCaM4*y(56)*y(105);
  dy(6) = -pk2CaMKon*y(2)*y(6)*y(46) + -pk2CaMKon*y(3)*y(6)*y(46) + pkK1Con*y(3)*y(12)*y(68) + -pk2CaMKon*y(4)*y(6)*y(46) + -pk2CaMKon*y(5)*y(6)*y(46) + pkK1Non*y(5)*y(12)*y(72) + -pk2CaMKon*y(6)*y(7)*y(46) + -pk2CaMKon*y(6)*y(8)*y(46) + -pk2CaMKon*y(6)*y(9)*y(46) + -pk2CaMKon*y(6)*y(10)*y(46) + -pkK2Con*y(6)*y(12)*y(70) + -pkK2Non*y(6)*y(12)*y(74) + -pkCaM1C1Noff*y(6)*y(36) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(6)*y(46)*y(85)) + -pkK1Coff*y(6)*y(69) + -pkK1Noff*y(6)*y(73) + -2*(pk2CaMKon*y(6)*y(6)*y(46)) + pkK2Noff*y(7)*y(75) + pkK2Coff*y(9)*y(71) + pkCaM1C1Non*y(14)*y(22)*y(35) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(61) + pk2CaMKoff*y(47)*y(79) + pk2CaMKoff*y(47)*y(88) + pk2CaMKoff*y(47)*y(95) + pk2CaMKoff*y(47)*y(101) + pk2CaMKoff*y(47)*y(107) + pk2CaMKoff*y(47)*y(108) + pk2CaMKoff*y(47)*y(109) + pk2CaMKoff*y(47)*y(110) + 2*(pk2CaMKoff*y(47)*y(111)) + pkpCaM0*y(48)*y(79) + pkpCaM1N*y(49)*y(88) + pkpCaM2N*y(50)*y(95) + pkpCaM1C*y(51)*y(101) + pkpCaM1C1N*y(52)*y(111) + pkpCaM1C2N*y(53)*y(107) + pkpCaM2C*y(54)*y(108) + pkpCaM2C1N*y(55)*y(109) + pkpCaM4*y(56)*y(110);
  dy(7) = -pk2CaMKon*y(2)*y(7)*y(46) + -pk2CaMKon*y(3)*y(7)*y(46) + -pk2CaMKon*y(4)*y(7)*y(46) + pkK1Con*y(4)*y(12)*y(68) + -pk2CaMKon*y(5)*y(7)*y(46) + -pk2CaMKon*y(6)*y(7)*y(46) + pkK2Non*y(6)*y(12)*y(74) + -pk2CaMKon*y(7)*y(8)*y(46) + -pk2CaMKon*y(7)*y(9)*y(46) + -pk2CaMKon*y(7)*y(10)*y(46) + -pkK2Con*y(7)*y(12)*y(70) + -pkCaM1C2Noff*y(7)*y(39) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(7)*y(46)*y(85)) + -pkK1Coff*y(7)*y(69) + -pkK2Noff*y(7)*y(75) + -2*(pk2CaMKon*y(7)*y(7)*y(46)) + pkK2Coff*y(10)*y(71) + pkCaM1C2Non*y(22)*y(25)*y(38) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(62) + pk2CaMKoff*y(47)*y(80) + pk2CaMKoff*y(47)*y(89) + pk2CaMKoff*y(47)*y(96) + pk2CaMKoff*y(47)*y(102) + pk2CaMKoff*y(47)*y(107) + pk2CaMKoff*y(47)*y(112) + pk2CaMKoff*y(47)*y(113) + pk2CaMKoff*y(47)*y(114) + 2*(pk2CaMKoff*y(47)*y(115)) + pkpCaM0*y(48)*y(80) + pkpCaM1N*y(49)*y(89) + pkpCaM2N*y(50)*y(96) + pkpCaM1C*y(51)*y(102) + pkpCaM1C1N*y(52)*y(107) + pkpCaM1C2N*y(53)*y(115) + pkpCaM2C*y(54)*y(112) + pkpCaM2C1N*y(55)*y(113) + pkpCaM4*y(56)*y(114);
  dy(8) = -pk2CaMKon*y(2)*y(8)*y(46) + -pk2CaMKon*y(3)*y(8)*y(46) + -pk2CaMKon*y(4)*y(8)*y(46) + -pk2CaMKon*y(5)*y(8)*y(46) + pkK2Con*y(5)*y(12)*y(70) + -pk2CaMKon*y(6)*y(8)*y(46) + -pk2CaMKon*y(7)*y(8)*y(46) + -pk2CaMKon*y(8)*y(9)*y(46) + -pk2CaMKon*y(8)*y(10)*y(46) + -pkK1Non*y(8)*y(12)*y(72) + -pkCaM2Coff*y(8)*y(41) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(8)*y(46)*y(85)) + -pkK2Coff*y(8)*y(71) + -2*(pk2CaMKon*y(8)*y(8)*y(46)) + pkK1Noff*y(9)*y(73) + pkCaM2Con*y(22)*y(30)*y(40) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(63) + pk2CaMKoff*y(47)*y(81) + pk2CaMKoff*y(47)*y(90) + pk2CaMKoff*y(47)*y(97) + pk2CaMKoff*y(47)*y(103) + pk2CaMKoff*y(47)*y(108) + pk2CaMKoff*y(47)*y(112) + pk2CaMKoff*y(47)*y(116) + pk2CaMKoff*y(47)*y(117) + 2*(pk2CaMKoff*y(47)*y(118)) + pkpCaM0*y(48)*y(81) + pkpCaM1N*y(49)*y(90) + pkpCaM2N*y(50)*y(97) + pkpCaM1C*y(51)*y(103) + pkpCaM1C1N*y(52)*y(108) + pkpCaM1C2N*y(53)*y(112) + pkpCaM2C*y(54)*y(118) + pkpCaM2C1N*y(55)*y(116) + pkpCaM4*y(56)*y(117);
  dy(9) = -pk2CaMKon*y(2)*y(9)*y(46) + -pk2CaMKon*y(3)*y(9)*y(46) + -pk2CaMKon*y(4)*y(9)*y(46) + -pk2CaMKon*y(5)*y(9)*y(46) + -pk2CaMKon*y(6)*y(9)*y(46) + pkK2Con*y(6)*y(12)*y(70) + -pk2CaMKon*y(7)*y(9)*y(46) + -pk2CaMKon*y(8)*y(9)*y(46) + pkK1Non*y(8)*y(12)*y(72) + -pk2CaMKon*y(9)*y(10)*y(46) + -pkK2Non*y(9)*y(12)*y(74) + -pkCaM2C1Noff*y(9)*y(43) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(9)*y(46)*y(85)) + -pkK2Coff*y(9)*y(71) + -pkK1Noff*y(9)*y(73) + -2*(pk2CaMKon*y(9)*y(9)*y(46)) + pkK2Noff*y(10)*y(75) + pkCaM2C1Non*y(22)*y(34)*y(42) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(64) + pk2CaMKoff*y(47)*y(82) + pk2CaMKoff*y(47)*y(91) + pk2CaMKoff*y(47)*y(98) + pk2CaMKoff*y(47)*y(104) + pk2CaMKoff*y(47)*y(109) + pk2CaMKoff*y(47)*y(113) + pk2CaMKoff*y(47)*y(116) + pk2CaMKoff*y(47)*y(119) + 2*(pk2CaMKoff*y(47)*y(120)) + pkpCaM0*y(48)*y(82) + pkpCaM1N*y(49)*y(91) + pkpCaM2N*y(50)*y(98) + pkpCaM1C*y(51)*y(104) + pkpCaM1C1N*y(52)*y(109) + pkpCaM1C2N*y(53)*y(113) + pkpCaM2C*y(54)*y(116) + pkpCaM2C1N*y(55)*y(120) + pkpCaM4*y(56)*y(119);
  dy(10) = -pk2CaMKon*y(2)*y(10)*y(46) + -pk2CaMKon*y(3)*y(10)*y(46) + -pk2CaMKon*y(4)*y(10)*y(46) + -pk2CaMKon*y(5)*y(10)*y(46) + -pk2CaMKon*y(6)*y(10)*y(46) + -pk2CaMKon*y(7)*y(10)*y(46) + pkK2Con*y(7)*y(12)*y(70) + -pk2CaMKon*y(8)*y(10)*y(46) + -pk2CaMKon*y(9)*y(10)*y(46) + pkK2Non*y(9)*y(12)*y(74) + -pkCaM4off*y(10)*y(45) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(10)*y(46)*y(85)) + -pkK2Coff*y(10)*y(71) + -pkK2Noff*y(10)*y(75) + -2*(pk2CaMKon*y(10)*y(10)*y(46)) + pkCaM4on*y(22)*y(37)*y(44) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(65) + pk2CaMKoff*y(47)*y(83) + pk2CaMKoff*y(47)*y(92) + pk2CaMKoff*y(47)*y(99) + pk2CaMKoff*y(47)*y(105) + pk2CaMKoff*y(47)*y(110) + pk2CaMKoff*y(47)*y(114) + pk2CaMKoff*y(47)*y(117) + pk2CaMKoff*y(47)*y(119) + 2*(pk2CaMKoff*y(47)*y(121)) + pkpCaM0*y(48)*y(83) + pkpCaM1N*y(49)*y(92) + pkpCaM2N*y(50)*y(99) + pkpCaM1C*y(51)*y(105) + pkpCaM1C1N*y(52)*y(110) + pkpCaM1C2N*y(53)*y(114) + pkpCaM2C*y(54)*y(117) + pkpCaM2C1N*y(55)*y(119) + pkpCaM4*y(56)*y(121);
  dy(11) = pkCaM1Noff*y(3)*y(24) + -pk1Con*y(11)*y(12)*y(13) + -pk2Non*y(11)*y(12)*y(19) + -pk1Noff*y(11)*y(18) + -pkCaM1Non*y(11)*y(22)*y(23) + pk1Non*y(12)*y(16)*y(17) + pk1Coff*y(14)*y(15) + pk2Noff*y(20)*y(21);
  dy(12) = -pkK1Con*y(2)*y(12)*y(68) + -pkK1Non*y(2)*y(12)*y(72) + -pkK1Con*y(3)*y(12)*y(68) + -pkK2Non*y(3)*y(12)*y(74) + pkK1Noff*y(3)*y(73) + -pkK1Con*y(4)*y(12)*y(68) + pkK2Noff*y(4)*y(75) + -pkK2Con*y(5)*y(12)*y(70) + -pkK1Non*y(5)*y(12)*y(72) + pkK1Coff*y(5)*y(69) + -pkK2Con*y(6)*y(12)*y(70) + -pkK2Non*y(6)*y(12)*y(74) + pkK1Coff*y(6)*y(69) + pkK1Noff*y(6)*y(73) + -pkK2Con*y(7)*y(12)*y(70) + pkK1Coff*y(7)*y(69) + pkK2Noff*y(7)*y(75) + -pkK1Non*y(8)*y(12)*y(72) + pkK2Coff*y(8)*y(71) + -pkK2Non*y(9)*y(12)*y(74) + pkK2Coff*y(9)*y(71) + pkK1Noff*y(9)*y(73) + pkK2Coff*y(10)*y(71) + pkK2Noff*y(10)*y(75) + -pk1Con*y(11)*y(12)*y(13) + -pk2Non*y(11)*y(12)*y(19) + pk1Noff*y(11)*y(18) + -pk1Con*y(12)*y(13)*y(16) + -pk1Con*y(12)*y(13)*y(20) + -pk2Non*y(12)*y(14)*y(19) + -pk2Con*y(12)*y(14)*y(29) + -pk1Non*y(12)*y(16)*y(17) + -pk1Non*y(12)*y(17)*y(28) + -pk1Non*y(12)*y(17)*y(30) + -pk2Non*y(12)*y(19)*y(34) + -pk2Con*y(12)*y(25)*y(29) + -pk2Con*y(12)*y(28)*y(29) + pk1Coff*y(14)*y(15) + pk1Noff*y(14)*y(18) + pk1Coff*y(15)*y(25) + pk1Coff*y(15)*y(28) + pk1Noff*y(18)*y(34) + pk2Noff*y(20)*y(21) + pk2Noff*y(21)*y(25) + pk2Noff*y(21)*y(37) + pk2Coff*y(30)*y(31) + pk2Coff*y(31)*y(34) + pk2Coff*y(31)*y(37);
  dy(13) = 0;
  dy(14) = pkCaM1C1Noff*y(6)*y(36) + pk1Con*y(11)*y(12)*y(13) + -pk2Non*y(12)*y(14)*y(19) + -pk2Con*y(12)*y(14)*y(29) + pk1Non*y(12)*y(17)*y(28) + -pk1Coff*y(14)*y(15) + -pk1Noff*y(14)*y(18) + -pkCaM1C1Non*y(14)*y(22)*y(35) + pk2Noff*y(21)*y(25) + pk2Coff*y(31)*y(34);
  dy(15) = 0;
  dy(16) = pkCaM0off*y(2)*y(67) + pk1Noff*y(11)*y(18) + -pk1Con*y(12)*y(13)*y(16) + -pk1Non*y(12)*y(16)*y(17) + pk1Coff*y(15)*y(28) + -pkCaM0on*y(16)*y(22)*y(66);
  dy(17) = 0;
  dy(18) = 0;
  dy(19) = 0;
  dy(20) = pkCaM2Noff*y(4)*y(27) + pk2Non*y(11)*y(12)*y(19) + -pk1Con*y(12)*y(13)*y(20) + pk1Coff*y(15)*y(25) + -pk2Noff*y(20)*y(21) + -pkCaM2Non*y(20)*y(22)*y(26);
  dy(21) = 0;
  dy(22) = pkCaM0off*y(2)*y(67) + pkCaM1Noff*y(3)*y(24) + pkCaM2Noff*y(4)*y(27) + pkCaM1Coff*y(5)*y(33) + pkCaM1C1Noff*y(6)*y(36) + pkCaM1C2Noff*y(7)*y(39) + pkCaM2Coff*y(8)*y(41) + pkCaM2C1Noff*y(9)*y(43) + pkCaM4off*y(10)*y(45) + -pkCaM1Non*y(11)*y(22)*y(23) + -pkCaM1C1Non*y(14)*y(22)*y(35) + -pkCaM0on*y(16)*y(22)*y(66) + -pkCaM2Non*y(20)*y(22)*y(26) + -pkCaM1C2Non*y(22)*y(25)*y(38) + -pkCaM1Con*y(22)*y(28)*y(32) + -pkCaM2Con*y(22)*y(30)*y(40) + -pkCaM2C1Non*y(22)*y(34)*y(42) + -pkCaM4on*y(22)*y(37)*y(44);
  dy(23) = 0;
  dy(24) = 0;
  dy(25) = pkCaM1C2Noff*y(7)*y(39) + pk1Con*y(12)*y(13)*y(20) + pk2Non*y(12)*y(14)*y(19) + -pk2Con*y(12)*y(25)*y(29) + -pk1Coff*y(15)*y(25) + -pk2Noff*y(21)*y(25) + -pkCaM1C2Non*y(22)*y(25)*y(38) + pk2Coff*y(31)*y(37);
  dy(26) = 0;
  dy(27) = 0;
  dy(28) = pkCaM1Coff*y(5)*y(33) + pk1Con*y(12)*y(13)*y(16) + -pk1Non*y(12)*y(17)*y(28) + -pk2Con*y(12)*y(28)*y(29) + pk1Noff*y(14)*y(18) + -pk1Coff*y(15)*y(28) + -pkCaM1Con*y(22)*y(28)*y(32) + pk2Coff*y(30)*y(31);
  dy(29) = 0;
  dy(30) = pkCaM2Coff*y(8)*y(41) + -pk1Non*y(12)*y(17)*y(30) + pk2Con*y(12)*y(28)*y(29) + pk1Noff*y(18)*y(34) + -pkCaM2Con*y(22)*y(30)*y(40) + -pk2Coff*y(30)*y(31);
  dy(31) = 0;
  dy(32) = 0;
  dy(33) = 0;
  dy(34) = pkCaM2C1Noff*y(9)*y(43) + pk2Con*y(12)*y(14)*y(29) + pk1Non*y(12)*y(17)*y(30) + -pk2Non*y(12)*y(19)*y(34) + -pk1Noff*y(18)*y(34) + pk2Noff*y(21)*y(37) + -pkCaM2C1Non*y(22)*y(34)*y(42) + -pk2Coff*y(31)*y(34);
  dy(35) = 0;
  dy(36) = 0;
  dy(37) = pkCaM4off*y(10)*y(45) + pk2Non*y(12)*y(19)*y(34) + pk2Con*y(12)*y(25)*y(29) + -pk2Noff*y(21)*y(37) + -pkCaM4on*y(22)*y(37)*y(44) + -pk2Coff*y(31)*y(37);
  dy(38) = 0;
  dy(39) = 0;
  dy(40) = 0;
  dy(41) = 0;
  dy(42) = 0;
  dy(43) = 0;
  dy(44) = 0;
  dy(45) = 0;
  dy(46) = 0;
  dy(47) = 0;
  dy(48) = 0;
  dy(49) = 0;
  dy(50) = 0;
  dy(51) = 0;
  dy(52) = 0;
  dy(53) = 0;
  dy(54) = 0;
  dy(55) = 0;
  dy(56) = 0;
  dy(57) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(57)) + -((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*y(48)*y(57));
  dy(58) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(3)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(58)) + -((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*y(49)*y(58));
  dy(59) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(4)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(59)) + -((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*y(50)*y(59));
  dy(60) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(5)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(60)) + -((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*y(51)*y(60));
  dy(61) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(6)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(61)) + -((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*y(52)*y(61));
  dy(62) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(7)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(62)) + -((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*y(53)*y(62));
  dy(63) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(8)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(63)) + -((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*y(54)*y(63));
  dy(64) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(9)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(64)) + -((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*y(55)*y(64));
  dy(65) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(10)*y(46)*y(85) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(65)) + -((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*y(56)*y(65));
  dy(66) = 0;
  dy(67) = 0;
  dy(68) = 0;
  dy(69) = 0;
  dy(70) = 0;
  dy(71) = 0;
  dy(72) = 0;
  dy(73) = 0;
  dy(74) = 0;
  dy(75) = 0;
  dy(76) = pk2CaMKon*y(2)*y(3)*y(46) + -pk2CaMKoff*y(47)*y(76) + -pkpCaM0*y(48)*y(76) + -pkpCaM1N*y(49)*y(76);
  dy(77) = pk2CaMKon*y(2)*y(4)*y(46) + -pk2CaMKoff*y(47)*y(77) + -pkpCaM0*y(48)*y(77) + -pkpCaM2N*y(50)*y(77);
  dy(78) = pk2CaMKon*y(2)*y(5)*y(46) + -pk2CaMKoff*y(47)*y(78) + -pkpCaM0*y(48)*y(78) + -pkpCaM1C*y(51)*y(78);
  dy(79) = pk2CaMKon*y(2)*y(6)*y(46) + -pk2CaMKoff*y(47)*y(79) + -pkpCaM0*y(48)*y(79) + -pkpCaM1C1N*y(52)*y(79);
  dy(80) = pk2CaMKon*y(2)*y(7)*y(46) + -pk2CaMKoff*y(47)*y(80) + -pkpCaM0*y(48)*y(80) + -pkpCaM1C2N*y(53)*y(80);
  dy(81) = pk2CaMKon*y(2)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(81) + -pkpCaM0*y(48)*y(81) + -pkpCaM2C*y(54)*y(81);
  dy(82) = pk2CaMKon*y(2)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(82) + -pkpCaM0*y(48)*y(82) + -pkpCaM2C1N*y(55)*y(82);
  dy(83) = pk2CaMKon*y(2)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(83) + -pkpCaM0*y(48)*y(83) + -pkpCaM4*y(56)*y(83);
  dy(84) = pk2CaMKon*y(2)*y(2)*y(46) + -pk2CaMKoff*y(47)*y(84) + -pkpCaM0*y(48)*y(84);
  dy(85) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(3)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(4)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(5)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(6)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(7)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(8)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(9)*y(46)*y(85)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(10)*y(46)*y(85)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(57) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(58) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(59) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(60) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(61) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(62) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(63) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(64) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(47)*y(65) + 2*((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*y(48)*y(57)) + pkpCaM0*y(48)*y(76) + pkpCaM0*y(48)*y(77) + pkpCaM0*y(48)*y(78) + pkpCaM0*y(48)*y(79) + pkpCaM0*y(48)*y(80) + pkpCaM0*y(48)*y(81) + pkpCaM0*y(48)*y(82) + pkpCaM0*y(48)*y(83) + pkpCaM0*y(48)*y(84) + 2*((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*y(49)*y(58)) + pkpCaM1N*y(49)*y(76) + pkpCaM1N*y(49)*y(86) + pkpCaM1N*y(49)*y(87) + pkpCaM1N*y(49)*y(88) + pkpCaM1N*y(49)*y(89) + pkpCaM1N*y(49)*y(90) + pkpCaM1N*y(49)*y(91) + pkpCaM1N*y(49)*y(92) + pkpCaM1N*y(49)*y(93) + 2*((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*y(50)*y(59)) + pkpCaM2N*y(50)*y(77) + pkpCaM2N*y(50)*y(86) + pkpCaM2N*y(50)*y(94) + pkpCaM2N*y(50)*y(95) + pkpCaM2N*y(50)*y(96) + pkpCaM2N*y(50)*y(97) + pkpCaM2N*y(50)*y(98) + pkpCaM2N*y(50)*y(99) + pkpCaM2N*y(50)*y(100) + 2*((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*y(51)*y(60)) + pkpCaM1C*y(51)*y(78) + pkpCaM1C*y(51)*y(87) + pkpCaM1C*y(51)*y(94) + pkpCaM1C*y(51)*y(101) + pkpCaM1C*y(51)*y(102) + pkpCaM1C*y(51)*y(103) + pkpCaM1C*y(51)*y(104) + pkpCaM1C*y(51)*y(105) + pkpCaM1C*y(51)*y(106) + 2*((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*y(52)*y(61)) + pkpCaM1C1N*y(52)*y(79) + pkpCaM1C1N*y(52)*y(88) + pkpCaM1C1N*y(52)*y(95) + pkpCaM1C1N*y(52)*y(101) + pkpCaM1C1N*y(52)*y(107) + pkpCaM1C1N*y(52)*y(108) + pkpCaM1C1N*y(52)*y(109) + pkpCaM1C1N*y(52)*y(110) + pkpCaM1C1N*y(52)*y(111) + 2*((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*y(53)*y(62)) + pkpCaM1C2N*y(53)*y(80) + pkpCaM1C2N*y(53)*y(89) + pkpCaM1C2N*y(53)*y(96) + pkpCaM1C2N*y(53)*y(102) + pkpCaM1C2N*y(53)*y(107) + pkpCaM1C2N*y(53)*y(112) + pkpCaM1C2N*y(53)*y(113) + pkpCaM1C2N*y(53)*y(114) + pkpCaM1C2N*y(53)*y(115) + 2*((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*y(54)*y(63)) + pkpCaM2C*y(54)*y(81) + pkpCaM2C*y(54)*y(90) + pkpCaM2C*y(54)*y(97) + pkpCaM2C*y(54)*y(103) + pkpCaM2C*y(54)*y(108) + pkpCaM2C*y(54)*y(112) + pkpCaM2C*y(54)*y(116) + pkpCaM2C*y(54)*y(117) + pkpCaM2C*y(54)*y(118) + 2*((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*y(55)*y(64)) + pkpCaM2C1N*y(55)*y(82) + pkpCaM2C1N*y(55)*y(91) + pkpCaM2C1N*y(55)*y(98) + pkpCaM2C1N*y(55)*y(104) + pkpCaM2C1N*y(55)*y(109) + pkpCaM2C1N*y(55)*y(113) + pkpCaM2C1N*y(55)*y(116) + pkpCaM2C1N*y(55)*y(119) + pkpCaM2C1N*y(55)*y(120) + 2*((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*y(56)*y(65)) + pkpCaM4*y(56)*y(83) + pkpCaM4*y(56)*y(92) + pkpCaM4*y(56)*y(99) + pkpCaM4*y(56)*y(105) + pkpCaM4*y(56)*y(110) + pkpCaM4*y(56)*y(114) + pkpCaM4*y(56)*y(117) + pkpCaM4*y(56)*y(119) + pkpCaM4*y(56)*y(121);
  dy(86) = pk2CaMKon*y(3)*y(4)*y(46) + -pk2CaMKoff*y(47)*y(86) + -pkpCaM1N*y(49)*y(86) + -pkpCaM2N*y(50)*y(86);
  dy(87) = pk2CaMKon*y(3)*y(5)*y(46) + -pk2CaMKoff*y(47)*y(87) + -pkpCaM1N*y(49)*y(87) + -pkpCaM1C*y(51)*y(87);
  dy(88) = pk2CaMKon*y(3)*y(6)*y(46) + -pk2CaMKoff*y(47)*y(88) + -pkpCaM1N*y(49)*y(88) + -pkpCaM1C1N*y(52)*y(88);
  dy(89) = pk2CaMKon*y(3)*y(7)*y(46) + -pk2CaMKoff*y(47)*y(89) + -pkpCaM1N*y(49)*y(89) + -pkpCaM1C2N*y(53)*y(89);
  dy(90) = pk2CaMKon*y(3)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(90) + -pkpCaM1N*y(49)*y(90) + -pkpCaM2C*y(54)*y(90);
  dy(91) = pk2CaMKon*y(3)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(91) + -pkpCaM1N*y(49)*y(91) + -pkpCaM2C1N*y(55)*y(91);
  dy(92) = pk2CaMKon*y(3)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(92) + -pkpCaM1N*y(49)*y(92) + -pkpCaM4*y(56)*y(92);
  dy(93) = pk2CaMKon*y(3)*y(3)*y(46) + -pk2CaMKoff*y(47)*y(93) + -pkpCaM1N*y(49)*y(93);
  dy(94) = pk2CaMKon*y(4)*y(5)*y(46) + -pk2CaMKoff*y(47)*y(94) + -pkpCaM2N*y(50)*y(94) + -pkpCaM1C*y(51)*y(94);
  dy(95) = pk2CaMKon*y(4)*y(6)*y(46) + -pk2CaMKoff*y(47)*y(95) + -pkpCaM2N*y(50)*y(95) + -pkpCaM1C1N*y(52)*y(95);
  dy(96) = pk2CaMKon*y(4)*y(7)*y(46) + -pk2CaMKoff*y(47)*y(96) + -pkpCaM2N*y(50)*y(96) + -pkpCaM1C2N*y(53)*y(96);
  dy(97) = pk2CaMKon*y(4)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(97) + -pkpCaM2N*y(50)*y(97) + -pkpCaM2C*y(54)*y(97);
  dy(98) = pk2CaMKon*y(4)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(98) + -pkpCaM2N*y(50)*y(98) + -pkpCaM2C1N*y(55)*y(98);
  dy(99) = pk2CaMKon*y(4)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(99) + -pkpCaM2N*y(50)*y(99) + -pkpCaM4*y(56)*y(99);
  dy(100) = pk2CaMKon*y(4)*y(4)*y(46) + -pk2CaMKoff*y(47)*y(100) + -pkpCaM2N*y(50)*y(100);
  dy(101) = pk2CaMKon*y(5)*y(6)*y(46) + -pk2CaMKoff*y(47)*y(101) + -pkpCaM1C*y(51)*y(101) + -pkpCaM1C1N*y(52)*y(101);
  dy(102) = pk2CaMKon*y(5)*y(7)*y(46) + -pk2CaMKoff*y(47)*y(102) + -pkpCaM1C*y(51)*y(102) + -pkpCaM1C2N*y(53)*y(102);
  dy(103) = pk2CaMKon*y(5)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(103) + -pkpCaM1C*y(51)*y(103) + -pkpCaM2C*y(54)*y(103);
  dy(104) = pk2CaMKon*y(5)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(104) + -pkpCaM1C*y(51)*y(104) + -pkpCaM2C1N*y(55)*y(104);
  dy(105) = pk2CaMKon*y(5)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(105) + -pkpCaM1C*y(51)*y(105) + -pkpCaM4*y(56)*y(105);
  dy(106) = pk2CaMKon*y(5)*y(5)*y(46) + -pk2CaMKoff*y(47)*y(106) + -pkpCaM1C*y(51)*y(106);
  dy(107) = pk2CaMKon*y(6)*y(7)*y(46) + -pk2CaMKoff*y(47)*y(107) + -pkpCaM1C1N*y(52)*y(107) + -pkpCaM1C2N*y(53)*y(107);
  dy(108) = pk2CaMKon*y(6)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(108) + -pkpCaM1C1N*y(52)*y(108) + -pkpCaM2C*y(54)*y(108);
  dy(109) = pk2CaMKon*y(6)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(109) + -pkpCaM1C1N*y(52)*y(109) + -pkpCaM2C1N*y(55)*y(109);
  dy(110) = pk2CaMKon*y(6)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(110) + -pkpCaM1C1N*y(52)*y(110) + -pkpCaM4*y(56)*y(110);
  dy(111) = pk2CaMKon*y(6)*y(6)*y(46) + -pk2CaMKoff*y(47)*y(111) + -pkpCaM1C1N*y(52)*y(111);
  dy(112) = pk2CaMKon*y(7)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(112) + -pkpCaM1C2N*y(53)*y(112) + -pkpCaM2C*y(54)*y(112);
  dy(113) = pk2CaMKon*y(7)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(113) + -pkpCaM1C2N*y(53)*y(113) + -pkpCaM2C1N*y(55)*y(113);
  dy(114) = pk2CaMKon*y(7)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(114) + -pkpCaM1C2N*y(53)*y(114) + -pkpCaM4*y(56)*y(114);
  dy(115) = pk2CaMKon*y(7)*y(7)*y(46) + -pk2CaMKoff*y(47)*y(115) + -pkpCaM1C2N*y(53)*y(115);
  dy(116) = pk2CaMKon*y(8)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(116) + -pkpCaM2C*y(54)*y(116) + -pkpCaM2C1N*y(55)*y(116);
  dy(117) = pk2CaMKon*y(8)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(117) + -pkpCaM2C*y(54)*y(117) + -pkpCaM4*y(56)*y(117);
  dy(118) = pk2CaMKon*y(8)*y(8)*y(46) + -pk2CaMKoff*y(47)*y(118) + -pkpCaM2C*y(54)*y(118);
  dy(119) = pk2CaMKon*y(9)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(119) + -pkpCaM2C1N*y(55)*y(119) + -pkpCaM4*y(56)*y(119);
  dy(120) = pk2CaMKon*y(9)*y(9)*y(46) + -pk2CaMKoff*y(47)*y(120) + -pkpCaM2C1N*y(55)*y(120);
  dy(121) = pk2CaMKon*y(10)*y(10)*y(46) + -pk2CaMKoff*y(47)*y(121) + -pkpCaM4*y(56)*y(121);
end
