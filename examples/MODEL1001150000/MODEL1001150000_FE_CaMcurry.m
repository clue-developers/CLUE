

% Automatically generated from MODEL1001150000_FE_CaMcurry.
% Original number of species: 121.
% Original number of reactions: 264.

% Correspondence with original names:
%     y(1) = caminit
%     y(2) = CaM_0_0
%     y(3) = CaM_0_1
%     y(4) = CaM_0_2
%     y(5) = CaM_1_0
%     y(6) = CaM_1_1
%     y(7) = CaM_1_2
%     y(8) = CaM_2_0
%     y(9) = CaM_2_1
%     y(10) = CaM_2_2
%     y(11) = KCaM_0_0
%     y(12) = Ca
%     y(13) = kK1Con
%     y(14) = KCaM_1_0
%     y(15) = kK1Coff
%     y(16) = kK1Non
%     y(17) = KCaM_0_1
%     y(18) = kK1Noff
%     y(19) = k2CaMKon
%     y(20) = KCaMcomplex_0_0_0_1
%     y(21) = k2CaMKoff
%     y(22) = KCaM_0_2
%     y(23) = KCaMcomplex_0_0_0_2
%     y(24) = KCaMcomplex_0_0_1_0
%     y(25) = KCaM_1_1
%     y(26) = KCaMcomplex_0_0_1_1
%     y(27) = KCaM_1_2
%     y(28) = KCaMcomplex_0_0_1_2
%     y(29) = KCaM_2_0
%     y(30) = KCaMcomplex_0_0_2_0
%     y(31) = KCaM_2_1
%     y(32) = KCaMcomplex_0_0_2_1
%     y(33) = KCaM_2_2
%     y(34) = KCaMcomplex_0_0_2_2
%     y(35) = kpCaM1N
%     y(36) = kpCaM2N
%     y(37) = kpCaM1C
%     y(38) = kpCaM1C1N
%     y(39) = kpCaM1C2N
%     y(40) = kpCaM2C
%     y(41) = kpCaM2C1N
%     y(42) = kpCaM4
%     y(43) = kpCaM0
%     y(44) = pKCaM_0_0
%     y(45) = kK2Non
%     y(46) = kK2Noff
%     y(47) = KCaMcomplex_0_1_0_2
%     y(48) = KCaMcomplex_0_1_1_0
%     y(49) = KCaMcomplex_0_1_1_1
%     y(50) = KCaMcomplex_0_1_1_2
%     y(51) = KCaMcomplex_0_1_2_0
%     y(52) = KCaMcomplex_0_1_2_1
%     y(53) = KCaMcomplex_0_1_2_2
%     y(54) = KCaMcomplex_0_2_1_0
%     y(55) = KCaMcomplex_0_2_1_1
%     y(56) = KCaMcomplex_0_2_1_2
%     y(57) = KCaMcomplex_0_2_2_0
%     y(58) = KCaMcomplex_0_2_2_1
%     y(59) = KCaMcomplex_0_2_2_2
%     y(60) = kK2Con
%     y(61) = kK2Coff
%     y(62) = KCaMcomplex_1_0_1_1
%     y(63) = KCaMcomplex_1_0_1_2
%     y(64) = KCaMcomplex_1_0_2_0
%     y(65) = KCaMcomplex_1_0_2_1
%     y(66) = KCaMcomplex_1_0_2_2
%     y(67) = KCaMcomplex_1_1_1_2
%     y(68) = KCaMcomplex_1_1_2_0
%     y(69) = KCaMcomplex_1_1_2_1
%     y(70) = KCaMcomplex_1_1_2_2
%     y(71) = KCaMcomplex_1_2_2_0
%     y(72) = KCaMcomplex_1_2_2_1
%     y(73) = KCaMcomplex_1_2_2_2
%     y(74) = KCaMcomplex_2_0_2_1
%     y(75) = KCaMcomplex_2_0_2_2
%     y(76) = KCaMcomplex_2_1_2_2
%     y(77) = k1Con
%     y(78) = k1Coff
%     y(79) = k2Con
%     y(80) = k2Coff
%     y(81) = k1Non
%     y(82) = k1Noff
%     y(83) = k2Non
%     y(84) = k2Noff
%     y(85) = KaMe
%     y(86) = kCaM0on
%     y(87) = kCaM0off
%     y(88) = kCaM1Non
%     y(89) = kCaM1Noff
%     y(90) = kCaM2Non
%     y(91) = kCaM2Noff
%     y(92) = kCaM1Con
%     y(93) = kCaM1Coff
%     y(94) = kCaM1C1Non
%     y(95) = kCaM1C1Noff
%     y(96) = kCaM1C2Non
%     y(97) = kCaM1C2Noff
%     y(98) = kCaM2Con
%     y(99) = kCaM2Coff
%     y(100) = kCaM2C1Non
%     y(101) = kCaM2C1Noff
%     y(102) = kCaM4on
%     y(103) = kCaM4off
%     y(104) = KCaMcomplex_0_0_0_0
%     y(105) = pKCaMcomplex_0_0_0_0
%     y(106) = KCaMcomplex_1_0_1_0
%     y(107) = pKCaMcomplex_0_0_1_0
%     y(108) = KCaMcomplex_0_1_0_1
%     y(109) = pKCaMcomplex_0_0_0_1
%     y(110) = KCaMcomplex_0_2_0_2
%     y(111) = pKCaMcomplex_0_0_0_2
%     y(112) = KCaMcomplex_1_1_1_1
%     y(113) = pKCaMcomplex_0_0_1_1
%     y(114) = KCaMcomplex_1_2_1_2
%     y(115) = pKCaMcomplex_0_0_1_2
%     y(116) = KCaMcomplex_2_0_2_0
%     y(117) = pKCaMcomplex_0_0_2_0
%     y(118) = KCaMcomplex_2_1_2_1
%     y(119) = pKCaMcomplex_0_0_2_1
%     y(120) = KCaMcomplex_2_2_2_2
%     y(121) = pKCaMcomplex_0_0_2_2


function MODEL1001150000_FE_CaMcurry
[T,Y]=ode45(@ode,[0 100.0],[  210.0 30.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 100.0 44.0 0.0 33.0 75.0 0.0 300.0 50.0 0.0 60.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.06 0.12 0.032 0.094 0.154 0.064 0.124 0.96 0.0 0.0 76.0 33.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 44.0 2.7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 4.0 40.0 10.0 9.25 100.0 2500.0 150.0 750.0 80.0 0.0038 5.5 0.022 3.1 0.1 1.7 0.059 6.8 3.3 3.4 1.9 1.9 0.92 6.8 5.2 3.8 30.0 1.7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0]);
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
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(70)/1;
plot(T,view);
hold on;
view= getSpecies(103)/1;
plot(T,view);
hold on;
view= getSpecies(59)/1;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(49)/1;
plot(T,view);
hold on;
view= getSpecies(1)/3;
plot(T,view);
hold on;
view= getSpecies(54)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(63)/1;
plot(T,view);
hold on;
view= getSpecies(56)/1;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(85)/1;
plot(T,view);
hold on;
view= getSpecies(109)/9;
plot(T,view);
hold on;
view= getSpecies(108)/1;
plot(T,view);
hold on;
view= getSpecies(90)/1;
plot(T,view);
hold on;
view= getSpecies(29)/1;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(104)/1;
plot(T,view);
hold on;
view= getSpecies(58)/1;
plot(T,view);
hold on;
view= getSpecies(105)/9;
plot(T,view);
hold on;
view= getSpecies(120)/1;
plot(T,view);
hold on;
view= getSpecies(113)/9;
plot(T,view);
hold on;
view= getSpecies(81)/1;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(95)/1;
plot(T,view);
hold on;
view= getSpecies(38)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(92)/1;
plot(T,view);
hold on;
view= getSpecies(25)/1;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(77)/1;
plot(T,view);
hold on;
view= getSpecies(88)/1;
plot(T,view);
hold on;
view= getSpecies(97)/1;
plot(T,view);
hold on;
view= getSpecies(62)/1;
plot(T,view);
hold on;
view= getSpecies(76)/1;
plot(T,view);
hold on;
view= getSpecies(71)/1;
plot(T,view);
hold on;
view= getSpecies(106)/1;
plot(T,view);
hold on;
view= getSpecies(114)/1;
plot(T,view);
hold on;
view= getSpecies(68)/1;
plot(T,view);
hold on;
view= getSpecies(64)/1;
plot(T,view);
hold on;
view= getSpecies(93)/1;
plot(T,view);
hold on;
view= getSpecies(101)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(100)/1;
plot(T,view);
hold on;
view= getSpecies(74)/1;
plot(T,view);
hold on;
view= getSpecies(80)/1;
plot(T,view);
hold on;
view= getSpecies(83)/1;
plot(T,view);
hold on;
view= getSpecies(82)/1;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
view= getSpecies(52)/1;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(55)/1;
plot(T,view);
hold on;
view= getSpecies(96)/1;
plot(T,view);
hold on;
view= getSpecies(21)/1;
plot(T,view);
hold on;
view= getSpecies(51)/1;
plot(T,view);
hold on;
view= getSpecies(36)/1;
plot(T,view);
hold on;
view= getSpecies(31)/1;
plot(T,view);
hold on;
view= getSpecies(19)/1;
plot(T,view);
hold on;
view= getSpecies(116)/1;
plot(T,view);
hold on;
view= getSpecies(94)/1;
plot(T,view);
hold on;
view= getSpecies(117)/9;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(44)/9;
plot(T,view);
hold on;
view= getSpecies(48)/1;
plot(T,view);
hold on;
view= getSpecies(23)/1;
plot(T,view);
hold on;
view= getSpecies(91)/1;
plot(T,view);
hold on;
view= getSpecies(72)/1;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(32)/1;
plot(T,view);
hold on;
view= getSpecies(75)/1;
plot(T,view);
hold on;
view= getSpecies(115)/9;
plot(T,view);
hold on;
view= getSpecies(98)/1;
plot(T,view);
hold on;
view= getSpecies(73)/1;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(89)/1;
plot(T,view);
hold on;
view= getSpecies(22)/1;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(84)/1;
plot(T,view);
hold on;
view= getSpecies(121)/9;
plot(T,view);
hold on;
view= getSpecies(66)/1;
plot(T,view);
hold on;
view= getSpecies(86)/1;
plot(T,view);
hold on;
view= getSpecies(61)/1;
plot(T,view);
hold on;
view= getSpecies(79)/1;
plot(T,view);
hold on;
view= getSpecies(65)/1;
plot(T,view);
hold on;
view= getSpecies(20)/1;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(27)/1;
plot(T,view);
hold on;
view= getSpecies(35)/1;
plot(T,view);
hold on;
view= getSpecies(118)/1;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(78)/1;
plot(T,view);
hold on;
view= getSpecies(102)/1;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(67)/1;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(60)/1;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(69)/1;
plot(T,view);
hold on;
view= getSpecies(26)/1;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(112)/1;
plot(T,view);
hold on;
view= getSpecies(119)/9;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(50)/1;
plot(T,view);
hold on;
view= getSpecies(45)/1;
plot(T,view);
hold on;
view= getSpecies(87)/1;
plot(T,view);
hold on;
view= getSpecies(111)/9;
plot(T,view);
hold on;
view= getSpecies(30)/1;
plot(T,view);
hold on;
view= getSpecies(57)/1;
plot(T,view);
hold on;
view= getSpecies(107)/9;
plot(T,view);
hold on;
view= getSpecies(110)/1;
plot(T,view);
hold on;
view= getSpecies(99)/1;
plot(T,view);
hold on;
view= getSpecies(53)/1;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vKCaMcomplex_0_0_1_2','vKCaMcomplex_1_1_2_2','vkCaM4off','vKCaMcomplex_0_2_2_2','vKCaMcomplex_0_0_2_2','vkK1Non','vKCaMcomplex_0_1_1_1','vcaminit','vKCaMcomplex_0_2_1_0','vkpCaM4','vKCaMcomplex_1_0_1_2','vKCaMcomplex_0_2_1_2','vkpCaM0','vKaMe','vpKCaMcomplex_0_0_0_1','vKCaMcomplex_0_1_0_1','vkCaM2Non','vKCaM_2_0','vkK1Coff','vKCaMcomplex_0_0_0_0','vKCaMcomplex_0_2_2_1','vpKCaMcomplex_0_0_0_0','vKCaMcomplex_2_2_2_2','vpKCaMcomplex_0_0_1_1','vk1Non','vCaM_1_1','vkCaM1C1Noff','vkpCaM1C1N','vCaM_0_0','vkCaM1Con','vKCaM_1_1','vKCaM_1_0','vk1Con','vkCaM1Non','vkCaM1C2Noff','vKCaMcomplex_1_0_1_1','vKCaMcomplex_2_1_2_2','vKCaMcomplex_1_2_2_0','vKCaMcomplex_1_0_1_0','vKCaMcomplex_1_2_1_2','vKCaMcomplex_1_1_2_0','vKCaMcomplex_1_0_2_0','vkCaM1Coff','vkCaM2C1Noff','vCaM_0_2','vkCaM2C1Non','vKCaMcomplex_2_0_2_1','vk2Coff','vk2Non','vk1Noff','vCaM_2_1','vKCaMcomplex_0_1_2_1','vkpCaM1C','vKCaMcomplex_0_2_1_1','vkCaM1C2Non','vk2CaMKoff','vKCaMcomplex_0_1_2_0','vkpCaM2N','vKCaM_2_1','vk2CaMKon','vKCaMcomplex_2_0_2_0','vkCaM1C1Non','vpKCaMcomplex_0_0_2_0','vCaM_0_1','vpKCaM_0_0','vKCaMcomplex_0_1_1_0','vKCaMcomplex_0_0_0_2','vkCaM2Noff','vKCaMcomplex_1_2_2_1','vkpCaM2C1N','vKCaMcomplex_0_0_2_1','vKCaMcomplex_2_0_2_2','vpKCaMcomplex_0_0_1_2','vkCaM2Con','vKCaMcomplex_1_2_2_2','vCaM_1_2','vkCaM1Noff','vKCaM_0_2','vkpCaM2C','vkK1Con','vkK2Noff','vk2Noff','vpKCaMcomplex_0_0_2_2','vKCaMcomplex_1_0_2_2','vkCaM0on','vkK2Coff','vk2Con','vKCaMcomplex_1_0_2_1','vKCaMcomplex_0_0_0_1','vKCaMcomplex_0_1_0_2','vKCaM_1_2','vkpCaM1N','vKCaMcomplex_2_1_2_1','vkK1Noff','vCaM_2_0','vk1Coff','vkCaM4on','vKCaM_2_2','vCa','vKCaMcomplex_1_1_1_2','vCaM_1_0','vKCaMcomplex_0_0_1_0','vkpCaM1C2N','vkK2Con','vCaM_2_2','vKCaMcomplex_1_1_2_1','vKCaMcomplex_0_0_1_1','vKCaM_0_1','vKCaMcomplex_1_1_1_1','vpKCaMcomplex_0_0_2_1','vKCaM_0_0','vKCaMcomplex_0_1_1_2','vkK2Non','vkCaM0off','vpKCaMcomplex_0_0_0_2','vKCaMcomplex_0_0_2_0','vKCaMcomplex_0_2_2_0','vpKCaMcomplex_0_0_1_0','vKCaMcomplex_0_2_0_2','vkCaM2Coff','vKCaMcomplex_0_1_2_2');
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
  dy(2) = -pk1Con*y(2)*y(12)*y(77) + -pk1Non*y(2)*y(12)*y(81) + -pkCaM0on*y(2)*y(85)*y(86) + pk1Noff*y(3)*y(82) + pk1Coff*y(5)*y(78) + pkCaM0off*y(11)*y(87);
  dy(3) = pk1Non*y(2)*y(12)*y(81) + -pk1Con*y(3)*y(12)*y(77) + -pk2Non*y(3)*y(12)*y(83) + -pk1Noff*y(3)*y(82) + -pkCaM1Non*y(3)*y(85)*y(88) + pk2Noff*y(4)*y(84) + pk1Coff*y(6)*y(78) + pkCaM1Noff*y(17)*y(89);
  dy(4) = pk2Non*y(3)*y(12)*y(83) + -pk1Con*y(4)*y(12)*y(77) + -pk2Noff*y(4)*y(84) + -pkCaM2Non*y(4)*y(85)*y(90) + pk1Coff*y(7)*y(78) + pkCaM2Noff*y(22)*y(91);
  dy(5) = pk1Con*y(2)*y(12)*y(77) + -pk2Con*y(5)*y(12)*y(79) + -pk1Non*y(5)*y(12)*y(81) + -pk1Coff*y(5)*y(78) + -pkCaM1Con*y(5)*y(85)*y(92) + pk1Noff*y(6)*y(82) + pk2Coff*y(8)*y(80) + pkCaM1Coff*y(14)*y(93);
  dy(6) = pk1Con*y(3)*y(12)*y(77) + pk1Non*y(5)*y(12)*y(81) + -pk2Con*y(6)*y(12)*y(79) + -pk2Non*y(6)*y(12)*y(83) + -pk1Coff*y(6)*y(78) + -pk1Noff*y(6)*y(82) + -pkCaM1C1Non*y(6)*y(85)*y(94) + pk2Noff*y(7)*y(84) + pk2Coff*y(9)*y(80) + pkCaM1C1Noff*y(25)*y(95);
  dy(7) = pk1Con*y(4)*y(12)*y(77) + pk2Non*y(6)*y(12)*y(83) + -pk2Con*y(7)*y(12)*y(79) + -pk1Coff*y(7)*y(78) + -pk2Noff*y(7)*y(84) + -pkCaM1C2Non*y(7)*y(85)*y(96) + pk2Coff*y(10)*y(80) + pkCaM1C2Noff*y(27)*y(97);
  dy(8) = pk2Con*y(5)*y(12)*y(79) + -pk1Non*y(8)*y(12)*y(81) + -pk2Coff*y(8)*y(80) + -pkCaM2Con*y(8)*y(85)*y(98) + pk1Noff*y(9)*y(82) + pkCaM2Coff*y(29)*y(99);
  dy(9) = pk2Con*y(6)*y(12)*y(79) + pk1Non*y(8)*y(12)*y(81) + -pk2Non*y(9)*y(12)*y(83) + -pk2Coff*y(9)*y(80) + -pk1Noff*y(9)*y(82) + -pkCaM2C1Non*y(9)*y(85)*y(100) + pk2Noff*y(10)*y(84) + pkCaM2C1Noff*y(31)*y(101);
  dy(10) = pk2Con*y(7)*y(12)*y(79) + pk2Non*y(9)*y(12)*y(83) + -pk2Coff*y(10)*y(80) + -pk2Noff*y(10)*y(84) + -pkCaM4on*y(10)*y(85)*y(102) + pkCaM4off*y(33)*y(103);
  dy(11) = pkCaM0on*y(2)*y(85)*y(86) + -pkK1Con*y(11)*y(12)*y(13) + -pkK1Non*y(11)*y(12)*y(16) + -pk2CaMKon*y(11)*y(14)*y(19) + -pk2CaMKon*y(11)*y(17)*y(19) + -pk2CaMKon*y(11)*y(19)*y(22) + -pk2CaMKon*y(11)*y(19)*y(25) + -pk2CaMKon*y(11)*y(19)*y(27) + -pk2CaMKon*y(11)*y(19)*y(29) + -pk2CaMKon*y(11)*y(19)*y(31) + -pk2CaMKon*y(11)*y(19)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(11)*y(19)*y(44)) + -pkCaM0off*y(11)*y(87) + -2*(pk2CaMKon*y(11)*y(11)*y(19)) + pkK1Coff*y(14)*y(15) + pkK1Noff*y(17)*y(18) + pk2CaMKoff*y(20)*y(21) + pkpCaM1N*y(20)*y(35) + pk2CaMKoff*y(21)*y(23) + pk2CaMKoff*y(21)*y(24) + pk2CaMKoff*y(21)*y(26) + pk2CaMKoff*y(21)*y(28) + pk2CaMKoff*y(21)*y(30) + pk2CaMKoff*y(21)*y(32) + pk2CaMKoff*y(21)*y(34) + 2*(pk2CaMKoff*y(21)*y(104)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(105) + pkpCaM2N*y(23)*y(36) + pkpCaM1C*y(24)*y(37) + pkpCaM1C1N*y(26)*y(38) + pkpCaM1C2N*y(28)*y(39) + pkpCaM2C*y(30)*y(40) + pkpCaM2C1N*y(32)*y(41) + pkpCaM4*y(34)*y(42) + pkpCaM0*y(43)*y(104);
  dy(12) = -pk1Con*y(2)*y(12)*y(77) + -pk1Non*y(2)*y(12)*y(81) + -pk1Con*y(3)*y(12)*y(77) + -pk2Non*y(3)*y(12)*y(83) + pk1Noff*y(3)*y(82) + -pk1Con*y(4)*y(12)*y(77) + pk2Noff*y(4)*y(84) + -pk2Con*y(5)*y(12)*y(79) + -pk1Non*y(5)*y(12)*y(81) + pk1Coff*y(5)*y(78) + -pk2Con*y(6)*y(12)*y(79) + -pk2Non*y(6)*y(12)*y(83) + pk1Coff*y(6)*y(78) + pk1Noff*y(6)*y(82) + -pk2Con*y(7)*y(12)*y(79) + pk1Coff*y(7)*y(78) + pk2Noff*y(7)*y(84) + -pk1Non*y(8)*y(12)*y(81) + pk2Coff*y(8)*y(80) + -pk2Non*y(9)*y(12)*y(83) + pk2Coff*y(9)*y(80) + pk1Noff*y(9)*y(82) + pk2Coff*y(10)*y(80) + pk2Noff*y(10)*y(84) + -pkK1Con*y(11)*y(12)*y(13) + -pkK1Non*y(11)*y(12)*y(16) + -pkK1Con*y(12)*y(13)*y(17) + -pkK1Con*y(12)*y(13)*y(22) + -pkK1Non*y(12)*y(14)*y(16) + -pkK2Con*y(12)*y(14)*y(60) + -pkK1Non*y(12)*y(16)*y(29) + -pkK2Non*y(12)*y(17)*y(45) + -pkK2Non*y(12)*y(25)*y(45) + -pkK2Con*y(12)*y(25)*y(60) + -pkK2Con*y(12)*y(27)*y(60) + -pkK2Non*y(12)*y(31)*y(45) + pkK1Coff*y(14)*y(15) + pkK1Coff*y(15)*y(25) + pkK1Coff*y(15)*y(27) + pkK1Noff*y(17)*y(18) + pkK1Noff*y(18)*y(25) + pkK1Noff*y(18)*y(31) + pkK2Noff*y(22)*y(46) + pkK2Noff*y(27)*y(46) + pkK2Coff*y(29)*y(61) + pkK2Coff*y(31)*y(61) + pkK2Noff*y(33)*y(46) + pkK2Coff*y(33)*y(61);
  dy(13) = 0;
  dy(14) = pkCaM1Con*y(5)*y(85)*y(92) + pkK1Con*y(11)*y(12)*y(13) + -pk2CaMKon*y(11)*y(14)*y(19) + -pkK1Non*y(12)*y(14)*y(16) + -pkK2Con*y(12)*y(14)*y(60) + -pkK1Coff*y(14)*y(15) + -pk2CaMKon*y(14)*y(17)*y(19) + -pk2CaMKon*y(14)*y(19)*y(22) + -pk2CaMKon*y(14)*y(19)*y(25) + -pk2CaMKon*y(14)*y(19)*y(27) + -pk2CaMKon*y(14)*y(19)*y(29) + -pk2CaMKon*y(14)*y(19)*y(31) + -pk2CaMKon*y(14)*y(19)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(14)*y(19)*y(44)) + -pkCaM1Coff*y(14)*y(93) + -2*(pk2CaMKon*y(14)*y(14)*y(19)) + pkK1Noff*y(18)*y(25) + pk2CaMKoff*y(21)*y(24) + pk2CaMKoff*y(21)*y(48) + pk2CaMKoff*y(21)*y(54) + pk2CaMKoff*y(21)*y(62) + pk2CaMKoff*y(21)*y(63) + pk2CaMKoff*y(21)*y(64) + pk2CaMKoff*y(21)*y(65) + pk2CaMKoff*y(21)*y(66) + 2*(pk2CaMKoff*y(21)*y(106)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(107) + pkpCaM0*y(24)*y(43) + pkK2Coff*y(29)*y(61) + pkpCaM1N*y(35)*y(48) + pkpCaM2N*y(36)*y(54) + pkpCaM1C*y(37)*y(106) + pkpCaM1C1N*y(38)*y(62) + pkpCaM1C2N*y(39)*y(63) + pkpCaM2C*y(40)*y(64) + pkpCaM2C1N*y(41)*y(65) + pkpCaM4*y(42)*y(66);
  dy(15) = 0;
  dy(16) = 0;
  dy(17) = pkCaM1Non*y(3)*y(85)*y(88) + pkK1Non*y(11)*y(12)*y(16) + -pk2CaMKon*y(11)*y(17)*y(19) + -pkK1Con*y(12)*y(13)*y(17) + -pkK2Non*y(12)*y(17)*y(45) + -pk2CaMKon*y(14)*y(17)*y(19) + pkK1Coff*y(15)*y(25) + -pkK1Noff*y(17)*y(18) + -pk2CaMKon*y(17)*y(19)*y(22) + -pk2CaMKon*y(17)*y(19)*y(25) + -pk2CaMKon*y(17)*y(19)*y(27) + -pk2CaMKon*y(17)*y(19)*y(29) + -pk2CaMKon*y(17)*y(19)*y(31) + -pk2CaMKon*y(17)*y(19)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(17)*y(19)*y(44)) + -pkCaM1Noff*y(17)*y(89) + -2*(pk2CaMKon*y(17)*y(17)*y(19)) + pk2CaMKoff*y(20)*y(21) + pkpCaM0*y(20)*y(43) + pk2CaMKoff*y(21)*y(47) + pk2CaMKoff*y(21)*y(48) + pk2CaMKoff*y(21)*y(49) + pk2CaMKoff*y(21)*y(50) + pk2CaMKoff*y(21)*y(51) + pk2CaMKoff*y(21)*y(52) + pk2CaMKoff*y(21)*y(53) + 2*(pk2CaMKoff*y(21)*y(108)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(109) + pkK2Noff*y(22)*y(46) + pkpCaM1N*y(35)*y(108) + pkpCaM2N*y(36)*y(47) + pkpCaM1C*y(37)*y(48) + pkpCaM1C1N*y(38)*y(49) + pkpCaM1C2N*y(39)*y(50) + pkpCaM2C*y(40)*y(51) + pkpCaM2C1N*y(41)*y(52) + pkpCaM4*y(42)*y(53);
  dy(18) = 0;
  dy(19) = 0;
  dy(20) = pk2CaMKon*y(11)*y(17)*y(19) + -pk2CaMKoff*y(20)*y(21) + -pkpCaM1N*y(20)*y(35) + -pkpCaM0*y(20)*y(43);
  dy(21) = 0;
  dy(22) = pkCaM2Non*y(4)*y(85)*y(90) + -pk2CaMKon*y(11)*y(19)*y(22) + -pkK1Con*y(12)*y(13)*y(22) + pkK2Non*y(12)*y(17)*y(45) + -pk2CaMKon*y(14)*y(19)*y(22) + pkK1Coff*y(15)*y(27) + -pk2CaMKon*y(17)*y(19)*y(22) + -pk2CaMKon*y(19)*y(22)*y(25) + -pk2CaMKon*y(19)*y(22)*y(27) + -pk2CaMKon*y(19)*y(22)*y(29) + -pk2CaMKon*y(19)*y(22)*y(31) + -pk2CaMKon*y(19)*y(22)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(22)*y(44)) + -2*(pk2CaMKon*y(19)*y(22)*y(22)) + pk2CaMKoff*y(21)*y(23) + pk2CaMKoff*y(21)*y(47) + pk2CaMKoff*y(21)*y(54) + pk2CaMKoff*y(21)*y(55) + pk2CaMKoff*y(21)*y(56) + pk2CaMKoff*y(21)*y(57) + pk2CaMKoff*y(21)*y(58) + pk2CaMKoff*y(21)*y(59) + 2*(pk2CaMKoff*y(21)*y(110)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(111) + -pkK2Noff*y(22)*y(46) + -pkCaM2Noff*y(22)*y(91) + pkpCaM0*y(23)*y(43) + pkpCaM1N*y(35)*y(47) + pkpCaM2N*y(36)*y(110) + pkpCaM1C*y(37)*y(54) + pkpCaM1C1N*y(38)*y(55) + pkpCaM1C2N*y(39)*y(56) + pkpCaM2C*y(40)*y(57) + pkpCaM2C1N*y(41)*y(58) + pkpCaM4*y(42)*y(59);
  dy(23) = pk2CaMKon*y(11)*y(19)*y(22) + -pk2CaMKoff*y(21)*y(23) + -pkpCaM2N*y(23)*y(36) + -pkpCaM0*y(23)*y(43);
  dy(24) = pk2CaMKon*y(11)*y(14)*y(19) + -pk2CaMKoff*y(21)*y(24) + -pkpCaM1C*y(24)*y(37) + -pkpCaM0*y(24)*y(43);
  dy(25) = pkCaM1C1Non*y(6)*y(85)*y(94) + -pk2CaMKon*y(11)*y(19)*y(25) + pkK1Con*y(12)*y(13)*y(17) + pkK1Non*y(12)*y(14)*y(16) + -pkK2Non*y(12)*y(25)*y(45) + -pkK2Con*y(12)*y(25)*y(60) + -pk2CaMKon*y(14)*y(19)*y(25) + -pkK1Coff*y(15)*y(25) + -pk2CaMKon*y(17)*y(19)*y(25) + -pkK1Noff*y(18)*y(25) + -pk2CaMKon*y(19)*y(22)*y(25) + -pk2CaMKon*y(19)*y(25)*y(27) + -pk2CaMKon*y(19)*y(25)*y(29) + -pk2CaMKon*y(19)*y(25)*y(31) + -pk2CaMKon*y(19)*y(25)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(25)*y(44)) + -2*(pk2CaMKon*y(19)*y(25)*y(25)) + pk2CaMKoff*y(21)*y(26) + pk2CaMKoff*y(21)*y(49) + pk2CaMKoff*y(21)*y(55) + pk2CaMKoff*y(21)*y(62) + pk2CaMKoff*y(21)*y(67) + pk2CaMKoff*y(21)*y(68) + pk2CaMKoff*y(21)*y(69) + pk2CaMKoff*y(21)*y(70) + 2*(pk2CaMKoff*y(21)*y(112)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(113) + -pkCaM1C1Noff*y(25)*y(95) + pkpCaM0*y(26)*y(43) + pkK2Noff*y(27)*y(46) + pkK2Coff*y(31)*y(61) + pkpCaM1N*y(35)*y(49) + pkpCaM2N*y(36)*y(55) + pkpCaM1C*y(37)*y(62) + pkpCaM1C1N*y(38)*y(112) + pkpCaM1C2N*y(39)*y(67) + pkpCaM2C*y(40)*y(68) + pkpCaM2C1N*y(41)*y(69) + pkpCaM4*y(42)*y(70);
  dy(26) = pk2CaMKon*y(11)*y(19)*y(25) + -pk2CaMKoff*y(21)*y(26) + -pkpCaM1C1N*y(26)*y(38) + -pkpCaM0*y(26)*y(43);
  dy(27) = pkCaM1C2Non*y(7)*y(85)*y(96) + -pk2CaMKon*y(11)*y(19)*y(27) + pkK1Con*y(12)*y(13)*y(22) + pkK2Non*y(12)*y(25)*y(45) + -pkK2Con*y(12)*y(27)*y(60) + -pk2CaMKon*y(14)*y(19)*y(27) + -pkK1Coff*y(15)*y(27) + -pk2CaMKon*y(17)*y(19)*y(27) + -pk2CaMKon*y(19)*y(22)*y(27) + -pk2CaMKon*y(19)*y(25)*y(27) + -pk2CaMKon*y(19)*y(27)*y(29) + -pk2CaMKon*y(19)*y(27)*y(31) + -pk2CaMKon*y(19)*y(27)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(27)*y(44)) + -2*(pk2CaMKon*y(19)*y(27)*y(27)) + pk2CaMKoff*y(21)*y(28) + pk2CaMKoff*y(21)*y(50) + pk2CaMKoff*y(21)*y(56) + pk2CaMKoff*y(21)*y(63) + pk2CaMKoff*y(21)*y(67) + pk2CaMKoff*y(21)*y(71) + pk2CaMKoff*y(21)*y(72) + pk2CaMKoff*y(21)*y(73) + 2*(pk2CaMKoff*y(21)*y(114)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(115) + -pkK2Noff*y(27)*y(46) + -pkCaM1C2Noff*y(27)*y(97) + pkpCaM0*y(28)*y(43) + pkK2Coff*y(33)*y(61) + pkpCaM1N*y(35)*y(50) + pkpCaM2N*y(36)*y(56) + pkpCaM1C*y(37)*y(63) + pkpCaM1C1N*y(38)*y(67) + pkpCaM1C2N*y(39)*y(114) + pkpCaM2C*y(40)*y(71) + pkpCaM2C1N*y(41)*y(72) + pkpCaM4*y(42)*y(73);
  dy(28) = pk2CaMKon*y(11)*y(19)*y(27) + -pk2CaMKoff*y(21)*y(28) + -pkpCaM1C2N*y(28)*y(39) + -pkpCaM0*y(28)*y(43);
  dy(29) = pkCaM2Con*y(8)*y(85)*y(98) + -pk2CaMKon*y(11)*y(19)*y(29) + pkK2Con*y(12)*y(14)*y(60) + -pkK1Non*y(12)*y(16)*y(29) + -pk2CaMKon*y(14)*y(19)*y(29) + -pk2CaMKon*y(17)*y(19)*y(29) + pkK1Noff*y(18)*y(31) + -pk2CaMKon*y(19)*y(22)*y(29) + -pk2CaMKon*y(19)*y(25)*y(29) + -pk2CaMKon*y(19)*y(27)*y(29) + -pk2CaMKon*y(19)*y(29)*y(31) + -pk2CaMKon*y(19)*y(29)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(29)*y(44)) + -2*(pk2CaMKon*y(19)*y(29)*y(29)) + pk2CaMKoff*y(21)*y(30) + pk2CaMKoff*y(21)*y(51) + pk2CaMKoff*y(21)*y(57) + pk2CaMKoff*y(21)*y(64) + pk2CaMKoff*y(21)*y(68) + pk2CaMKoff*y(21)*y(71) + pk2CaMKoff*y(21)*y(74) + pk2CaMKoff*y(21)*y(75) + 2*(pk2CaMKoff*y(21)*y(116)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(117) + -pkK2Coff*y(29)*y(61) + -pkCaM2Coff*y(29)*y(99) + pkpCaM0*y(30)*y(43) + pkpCaM1N*y(35)*y(51) + pkpCaM2N*y(36)*y(57) + pkpCaM1C*y(37)*y(64) + pkpCaM1C1N*y(38)*y(68) + pkpCaM1C2N*y(39)*y(71) + pkpCaM2C*y(40)*y(116) + pkpCaM2C1N*y(41)*y(74) + pkpCaM4*y(42)*y(75);
  dy(30) = pk2CaMKon*y(11)*y(19)*y(29) + -pk2CaMKoff*y(21)*y(30) + -pkpCaM2C*y(30)*y(40) + -pkpCaM0*y(30)*y(43);
  dy(31) = pkCaM2C1Non*y(9)*y(85)*y(100) + -pk2CaMKon*y(11)*y(19)*y(31) + pkK1Non*y(12)*y(16)*y(29) + pkK2Con*y(12)*y(25)*y(60) + -pkK2Non*y(12)*y(31)*y(45) + -pk2CaMKon*y(14)*y(19)*y(31) + -pk2CaMKon*y(17)*y(19)*y(31) + -pkK1Noff*y(18)*y(31) + -pk2CaMKon*y(19)*y(22)*y(31) + -pk2CaMKon*y(19)*y(25)*y(31) + -pk2CaMKon*y(19)*y(27)*y(31) + -pk2CaMKon*y(19)*y(29)*y(31) + -pk2CaMKon*y(19)*y(31)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(31)*y(44)) + -2*(pk2CaMKon*y(19)*y(31)*y(31)) + pk2CaMKoff*y(21)*y(32) + pk2CaMKoff*y(21)*y(52) + pk2CaMKoff*y(21)*y(58) + pk2CaMKoff*y(21)*y(65) + pk2CaMKoff*y(21)*y(69) + pk2CaMKoff*y(21)*y(72) + pk2CaMKoff*y(21)*y(74) + pk2CaMKoff*y(21)*y(76) + 2*(pk2CaMKoff*y(21)*y(118)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(119) + -pkK2Coff*y(31)*y(61) + -pkCaM2C1Noff*y(31)*y(101) + pkpCaM0*y(32)*y(43) + pkK2Noff*y(33)*y(46) + pkpCaM1N*y(35)*y(52) + pkpCaM2N*y(36)*y(58) + pkpCaM1C*y(37)*y(65) + pkpCaM1C1N*y(38)*y(69) + pkpCaM1C2N*y(39)*y(72) + pkpCaM2C*y(40)*y(74) + pkpCaM2C1N*y(41)*y(118) + pkpCaM4*y(42)*y(76);
  dy(32) = pk2CaMKon*y(11)*y(19)*y(31) + -pk2CaMKoff*y(21)*y(32) + -pkpCaM2C1N*y(32)*y(41) + -pkpCaM0*y(32)*y(43);
  dy(33) = pkCaM4on*y(10)*y(85)*y(102) + -pk2CaMKon*y(11)*y(19)*y(33) + pkK2Con*y(12)*y(27)*y(60) + pkK2Non*y(12)*y(31)*y(45) + -pk2CaMKon*y(14)*y(19)*y(33) + -pk2CaMKon*y(17)*y(19)*y(33) + -pk2CaMKon*y(19)*y(22)*y(33) + -pk2CaMKon*y(19)*y(25)*y(33) + -pk2CaMKon*y(19)*y(27)*y(33) + -pk2CaMKon*y(19)*y(29)*y(33) + -pk2CaMKon*y(19)*y(31)*y(33) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(33)*y(44)) + -2*(pk2CaMKon*y(19)*y(33)*y(33)) + pk2CaMKoff*y(21)*y(34) + pk2CaMKoff*y(21)*y(53) + pk2CaMKoff*y(21)*y(59) + pk2CaMKoff*y(21)*y(66) + pk2CaMKoff*y(21)*y(70) + pk2CaMKoff*y(21)*y(73) + pk2CaMKoff*y(21)*y(75) + pk2CaMKoff*y(21)*y(76) + 2*(pk2CaMKoff*y(21)*y(120)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(121) + -pkK2Noff*y(33)*y(46) + -pkK2Coff*y(33)*y(61) + -pkCaM4off*y(33)*y(103) + pkpCaM0*y(34)*y(43) + pkpCaM1N*y(35)*y(53) + pkpCaM2N*y(36)*y(59) + pkpCaM1C*y(37)*y(66) + pkpCaM1C1N*y(38)*y(70) + pkpCaM1C2N*y(39)*y(73) + pkpCaM2C*y(40)*y(75) + pkpCaM2C1N*y(41)*y(76) + pkpCaM4*y(42)*y(120);
  dy(34) = pk2CaMKon*y(11)*y(19)*y(33) + -pk2CaMKoff*y(21)*y(34) + -pkpCaM4*y(34)*y(42) + -pkpCaM0*y(34)*y(43);
  dy(35) = 0;
  dy(36) = 0;
  dy(37) = 0;
  dy(38) = 0;
  dy(39) = 0;
  dy(40) = 0;
  dy(41) = 0;
  dy(42) = 0;
  dy(43) = 0;
  dy(44) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(11)*y(19)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(14)*y(19)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(17)*y(19)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(22)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(25)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(27)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(29)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(31)*y(44)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(33)*y(44)) + pkpCaM1N*y(20)*y(35) + pkpCaM0*y(20)*y(43) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(105) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(107) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(109) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(111) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(113) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(115) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(117) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(119) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(121) + pkpCaM2N*y(23)*y(36) + pkpCaM0*y(23)*y(43) + pkpCaM1C*y(24)*y(37) + pkpCaM0*y(24)*y(43) + pkpCaM1C1N*y(26)*y(38) + pkpCaM0*y(26)*y(43) + pkpCaM1C2N*y(28)*y(39) + pkpCaM0*y(28)*y(43) + pkpCaM2C*y(30)*y(40) + pkpCaM0*y(30)*y(43) + pkpCaM2C1N*y(32)*y(41) + pkpCaM0*y(32)*y(43) + pkpCaM4*y(34)*y(42) + pkpCaM0*y(34)*y(43) + pkpCaM1N*y(35)*y(47) + pkpCaM1N*y(35)*y(48) + pkpCaM1N*y(35)*y(49) + pkpCaM1N*y(35)*y(50) + pkpCaM1N*y(35)*y(51) + pkpCaM1N*y(35)*y(52) + pkpCaM1N*y(35)*y(53) + pkpCaM1N*y(35)*y(108) + 2*((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*y(35)*y(109)) + pkpCaM2N*y(36)*y(47) + pkpCaM2N*y(36)*y(54) + pkpCaM2N*y(36)*y(55) + pkpCaM2N*y(36)*y(56) + pkpCaM2N*y(36)*y(57) + pkpCaM2N*y(36)*y(58) + pkpCaM2N*y(36)*y(59) + pkpCaM2N*y(36)*y(110) + 2*((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*y(36)*y(111)) + pkpCaM1C*y(37)*y(48) + pkpCaM1C*y(37)*y(54) + pkpCaM1C*y(37)*y(62) + pkpCaM1C*y(37)*y(63) + pkpCaM1C*y(37)*y(64) + pkpCaM1C*y(37)*y(65) + pkpCaM1C*y(37)*y(66) + pkpCaM1C*y(37)*y(106) + 2*((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*y(37)*y(107)) + pkpCaM1C1N*y(38)*y(49) + pkpCaM1C1N*y(38)*y(55) + pkpCaM1C1N*y(38)*y(62) + pkpCaM1C1N*y(38)*y(67) + pkpCaM1C1N*y(38)*y(68) + pkpCaM1C1N*y(38)*y(69) + pkpCaM1C1N*y(38)*y(70) + pkpCaM1C1N*y(38)*y(112) + 2*((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*y(38)*y(113)) + pkpCaM1C2N*y(39)*y(50) + pkpCaM1C2N*y(39)*y(56) + pkpCaM1C2N*y(39)*y(63) + pkpCaM1C2N*y(39)*y(67) + pkpCaM1C2N*y(39)*y(71) + pkpCaM1C2N*y(39)*y(72) + pkpCaM1C2N*y(39)*y(73) + pkpCaM1C2N*y(39)*y(114) + 2*((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*y(39)*y(115)) + pkpCaM2C*y(40)*y(51) + pkpCaM2C*y(40)*y(57) + pkpCaM2C*y(40)*y(64) + pkpCaM2C*y(40)*y(68) + pkpCaM2C*y(40)*y(71) + pkpCaM2C*y(40)*y(74) + pkpCaM2C*y(40)*y(75) + pkpCaM2C*y(40)*y(116) + 2*((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*y(40)*y(117)) + pkpCaM2C1N*y(41)*y(52) + pkpCaM2C1N*y(41)*y(58) + pkpCaM2C1N*y(41)*y(65) + pkpCaM2C1N*y(41)*y(69) + pkpCaM2C1N*y(41)*y(72) + pkpCaM2C1N*y(41)*y(74) + pkpCaM2C1N*y(41)*y(76) + pkpCaM2C1N*y(41)*y(118) + 2*((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*y(41)*y(119)) + pkpCaM4*y(42)*y(53) + pkpCaM4*y(42)*y(59) + pkpCaM4*y(42)*y(66) + pkpCaM4*y(42)*y(70) + pkpCaM4*y(42)*y(73) + pkpCaM4*y(42)*y(75) + pkpCaM4*y(42)*y(76) + pkpCaM4*y(42)*y(120) + 2*((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*y(42)*y(121)) + pkpCaM0*y(43)*y(104) + 2*((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*y(43)*y(105));
  dy(45) = 0;
  dy(46) = 0;
  dy(47) = pk2CaMKon*y(17)*y(19)*y(22) + -pk2CaMKoff*y(21)*y(47) + -pkpCaM1N*y(35)*y(47) + -pkpCaM2N*y(36)*y(47);
  dy(48) = pk2CaMKon*y(14)*y(17)*y(19) + -pk2CaMKoff*y(21)*y(48) + -pkpCaM1N*y(35)*y(48) + -pkpCaM1C*y(37)*y(48);
  dy(49) = pk2CaMKon*y(17)*y(19)*y(25) + -pk2CaMKoff*y(21)*y(49) + -pkpCaM1N*y(35)*y(49) + -pkpCaM1C1N*y(38)*y(49);
  dy(50) = pk2CaMKon*y(17)*y(19)*y(27) + -pk2CaMKoff*y(21)*y(50) + -pkpCaM1N*y(35)*y(50) + -pkpCaM1C2N*y(39)*y(50);
  dy(51) = pk2CaMKon*y(17)*y(19)*y(29) + -pk2CaMKoff*y(21)*y(51) + -pkpCaM1N*y(35)*y(51) + -pkpCaM2C*y(40)*y(51);
  dy(52) = pk2CaMKon*y(17)*y(19)*y(31) + -pk2CaMKoff*y(21)*y(52) + -pkpCaM1N*y(35)*y(52) + -pkpCaM2C1N*y(41)*y(52);
  dy(53) = pk2CaMKon*y(17)*y(19)*y(33) + -pk2CaMKoff*y(21)*y(53) + -pkpCaM1N*y(35)*y(53) + -pkpCaM4*y(42)*y(53);
  dy(54) = pk2CaMKon*y(14)*y(19)*y(22) + -pk2CaMKoff*y(21)*y(54) + -pkpCaM2N*y(36)*y(54) + -pkpCaM1C*y(37)*y(54);
  dy(55) = pk2CaMKon*y(19)*y(22)*y(25) + -pk2CaMKoff*y(21)*y(55) + -pkpCaM2N*y(36)*y(55) + -pkpCaM1C1N*y(38)*y(55);
  dy(56) = pk2CaMKon*y(19)*y(22)*y(27) + -pk2CaMKoff*y(21)*y(56) + -pkpCaM2N*y(36)*y(56) + -pkpCaM1C2N*y(39)*y(56);
  dy(57) = pk2CaMKon*y(19)*y(22)*y(29) + -pk2CaMKoff*y(21)*y(57) + -pkpCaM2N*y(36)*y(57) + -pkpCaM2C*y(40)*y(57);
  dy(58) = pk2CaMKon*y(19)*y(22)*y(31) + -pk2CaMKoff*y(21)*y(58) + -pkpCaM2N*y(36)*y(58) + -pkpCaM2C1N*y(41)*y(58);
  dy(59) = pk2CaMKon*y(19)*y(22)*y(33) + -pk2CaMKoff*y(21)*y(59) + -pkpCaM2N*y(36)*y(59) + -pkpCaM4*y(42)*y(59);
  dy(60) = 0;
  dy(61) = 0;
  dy(62) = pk2CaMKon*y(14)*y(19)*y(25) + -pk2CaMKoff*y(21)*y(62) + -pkpCaM1C*y(37)*y(62) + -pkpCaM1C1N*y(38)*y(62);
  dy(63) = pk2CaMKon*y(14)*y(19)*y(27) + -pk2CaMKoff*y(21)*y(63) + -pkpCaM1C*y(37)*y(63) + -pkpCaM1C2N*y(39)*y(63);
  dy(64) = pk2CaMKon*y(14)*y(19)*y(29) + -pk2CaMKoff*y(21)*y(64) + -pkpCaM1C*y(37)*y(64) + -pkpCaM2C*y(40)*y(64);
  dy(65) = pk2CaMKon*y(14)*y(19)*y(31) + -pk2CaMKoff*y(21)*y(65) + -pkpCaM1C*y(37)*y(65) + -pkpCaM2C1N*y(41)*y(65);
  dy(66) = pk2CaMKon*y(14)*y(19)*y(33) + -pk2CaMKoff*y(21)*y(66) + -pkpCaM1C*y(37)*y(66) + -pkpCaM4*y(42)*y(66);
  dy(67) = pk2CaMKon*y(19)*y(25)*y(27) + -pk2CaMKoff*y(21)*y(67) + -pkpCaM1C1N*y(38)*y(67) + -pkpCaM1C2N*y(39)*y(67);
  dy(68) = pk2CaMKon*y(19)*y(25)*y(29) + -pk2CaMKoff*y(21)*y(68) + -pkpCaM1C1N*y(38)*y(68) + -pkpCaM2C*y(40)*y(68);
  dy(69) = pk2CaMKon*y(19)*y(25)*y(31) + -pk2CaMKoff*y(21)*y(69) + -pkpCaM1C1N*y(38)*y(69) + -pkpCaM2C1N*y(41)*y(69);
  dy(70) = pk2CaMKon*y(19)*y(25)*y(33) + -pk2CaMKoff*y(21)*y(70) + -pkpCaM1C1N*y(38)*y(70) + -pkpCaM4*y(42)*y(70);
  dy(71) = pk2CaMKon*y(19)*y(27)*y(29) + -pk2CaMKoff*y(21)*y(71) + -pkpCaM1C2N*y(39)*y(71) + -pkpCaM2C*y(40)*y(71);
  dy(72) = pk2CaMKon*y(19)*y(27)*y(31) + -pk2CaMKoff*y(21)*y(72) + -pkpCaM1C2N*y(39)*y(72) + -pkpCaM2C1N*y(41)*y(72);
  dy(73) = pk2CaMKon*y(19)*y(27)*y(33) + -pk2CaMKoff*y(21)*y(73) + -pkpCaM1C2N*y(39)*y(73) + -pkpCaM4*y(42)*y(73);
  dy(74) = pk2CaMKon*y(19)*y(29)*y(31) + -pk2CaMKoff*y(21)*y(74) + -pkpCaM2C*y(40)*y(74) + -pkpCaM2C1N*y(41)*y(74);
  dy(75) = pk2CaMKon*y(19)*y(29)*y(33) + -pk2CaMKoff*y(21)*y(75) + -pkpCaM2C*y(40)*y(75) + -pkpCaM4*y(42)*y(75);
  dy(76) = pk2CaMKon*y(19)*y(31)*y(33) + -pk2CaMKoff*y(21)*y(76) + -pkpCaM2C1N*y(41)*y(76) + -pkpCaM4*y(42)*y(76);
  dy(77) = 0;
  dy(78) = 0;
  dy(79) = 0;
  dy(80) = 0;
  dy(81) = 0;
  dy(82) = 0;
  dy(83) = 0;
  dy(84) = 0;
  dy(85) = -pkCaM0on*y(2)*y(85)*y(86) + -pkCaM1Non*y(3)*y(85)*y(88) + -pkCaM2Non*y(4)*y(85)*y(90) + -pkCaM1Con*y(5)*y(85)*y(92) + -pkCaM1C1Non*y(6)*y(85)*y(94) + -pkCaM1C2Non*y(7)*y(85)*y(96) + -pkCaM2Con*y(8)*y(85)*y(98) + -pkCaM2C1Non*y(9)*y(85)*y(100) + -pkCaM4on*y(10)*y(85)*y(102) + pkCaM0off*y(11)*y(87) + pkCaM1Coff*y(14)*y(93) + pkCaM1Noff*y(17)*y(89) + pkCaM2Noff*y(22)*y(91) + pkCaM1C1Noff*y(25)*y(95) + pkCaM1C2Noff*y(27)*y(97) + pkCaM2Coff*y(29)*y(99) + pkCaM2C1Noff*y(31)*y(101) + pkCaM4off*y(33)*y(103);
  dy(86) = 0;
  dy(87) = 0;
  dy(88) = 0;
  dy(89) = 0;
  dy(90) = 0;
  dy(91) = 0;
  dy(92) = 0;
  dy(93) = 0;
  dy(94) = 0;
  dy(95) = 0;
  dy(96) = 0;
  dy(97) = 0;
  dy(98) = 0;
  dy(99) = 0;
  dy(100) = 0;
  dy(101) = 0;
  dy(102) = 0;
  dy(103) = 0;
  dy(104) = pk2CaMKon*y(11)*y(11)*y(19) + -pk2CaMKoff*y(21)*y(104) + -pkpCaM0*y(43)*y(104);
  dy(105) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(11)*y(19)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(105)) + -((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*y(43)*y(105));
  dy(106) = pk2CaMKon*y(14)*y(14)*y(19) + -pk2CaMKoff*y(21)*y(106) + -pkpCaM1C*y(37)*y(106);
  dy(107) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(14)*y(19)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(107)) + -((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*y(37)*y(107));
  dy(108) = pk2CaMKon*y(17)*y(17)*y(19) + -pk2CaMKoff*y(21)*y(108) + -pkpCaM1N*y(35)*y(108);
  dy(109) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(17)*y(19)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(109)) + -((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*y(35)*y(109));
  dy(110) = pk2CaMKon*y(19)*y(22)*y(22) + -pk2CaMKoff*y(21)*y(110) + -pkpCaM2N*y(36)*y(110);
  dy(111) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(22)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(111)) + -((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*y(36)*y(111));
  dy(112) = pk2CaMKon*y(19)*y(25)*y(25) + -pk2CaMKoff*y(21)*y(112) + -pkpCaM1C1N*y(38)*y(112);
  dy(113) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(25)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(113)) + -((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*y(38)*y(113));
  dy(114) = pk2CaMKon*y(19)*y(27)*y(27) + -pk2CaMKoff*y(21)*y(114) + -pkpCaM1C2N*y(39)*y(114);
  dy(115) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(27)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(115)) + -((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*y(39)*y(115));
  dy(116) = pk2CaMKon*y(19)*y(29)*y(29) + -pk2CaMKoff*y(21)*y(116) + -pkpCaM2C*y(40)*y(116);
  dy(117) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(29)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(117)) + -((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*y(40)*y(117));
  dy(118) = pk2CaMKon*y(19)*y(31)*y(31) + -pk2CaMKoff*y(21)*y(118) + -pkpCaM2C1N*y(41)*y(118);
  dy(119) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(31)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(119)) + -((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*y(41)*y(119));
  dy(120) = pk2CaMKon*y(19)*y(33)*y(33) + -pk2CaMKoff*y(21)*y(120) + -pkpCaM4*y(42)*y(120);
  dy(121) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(19)*y(33)*y(44) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(21)*y(121)) + -((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*y(42)*y(121));
end
