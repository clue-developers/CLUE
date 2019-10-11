

% Automatically generated from MODEL1001150000_FE_pKCaMcurry.
% Original number of species: 121.
% Original number of reactions: 264.

% Correspondence with original names:
%     y(1) = caminit
%     y(2) = pKCaM_0_0
%     y(3) = CaM_0_1
%     y(4) = Ca
%     y(5) = k1Con
%     y(6) = CaM_1_1
%     y(7) = k1Coff
%     y(8) = CaM_0_0
%     y(9) = k1Non
%     y(10) = k1Noff
%     y(11) = k2Non
%     y(12) = CaM_0_2
%     y(13) = k2Noff
%     y(14) = KaMe
%     y(15) = kCaM1Non
%     y(16) = KCaM_0_1
%     y(17) = kCaM1Noff
%     y(18) = CaM_1_2
%     y(19) = kCaM2Non
%     y(20) = KCaM_0_2
%     y(21) = kCaM2Noff
%     y(22) = CaM_1_0
%     y(23) = k2Con
%     y(24) = CaM_2_0
%     y(25) = k2Coff
%     y(26) = kCaM1Con
%     y(27) = KCaM_1_0
%     y(28) = kCaM1Coff
%     y(29) = CaM_2_1
%     y(30) = kCaM1C1Non
%     y(31) = KCaM_1_1
%     y(32) = kCaM1C1Noff
%     y(33) = CaM_2_2
%     y(34) = kCaM1C2Non
%     y(35) = KCaM_1_2
%     y(36) = kCaM1C2Noff
%     y(37) = kCaM2Con
%     y(38) = KCaM_2_0
%     y(39) = kCaM2Coff
%     y(40) = kCaM2C1Non
%     y(41) = KCaM_2_1
%     y(42) = kCaM2C1Noff
%     y(43) = kCaM4on
%     y(44) = KCaM_2_2
%     y(45) = kCaM4off
%     y(46) = KCaM_0_0
%     y(47) = kK1Con
%     y(48) = kK1Coff
%     y(49) = kK1Non
%     y(50) = kK1Noff
%     y(51) = kCaM0on
%     y(52) = kCaM0off
%     y(53) = k2CaMKon
%     y(54) = k2CaMKoff
%     y(55) = kpCaM1N
%     y(56) = kpCaM2N
%     y(57) = kpCaM1C
%     y(58) = kpCaM1C1N
%     y(59) = kpCaM1C2N
%     y(60) = kpCaM2C
%     y(61) = kpCaM2C1N
%     y(62) = kpCaM4
%     y(63) = kpCaM0
%     y(64) = pKCaMcomplex_0_0_0_0
%     y(65) = kK2Non
%     y(66) = kK2Noff
%     y(67) = pKCaMcomplex_0_0_0_1
%     y(68) = pKCaMcomplex_0_0_0_2
%     y(69) = kK2Con
%     y(70) = kK2Coff
%     y(71) = pKCaMcomplex_0_0_1_0
%     y(72) = pKCaMcomplex_0_0_1_1
%     y(73) = pKCaMcomplex_0_0_1_2
%     y(74) = pKCaMcomplex_0_0_2_0
%     y(75) = pKCaMcomplex_0_0_2_1
%     y(76) = pKCaMcomplex_0_0_2_2
%     y(77) = KCaMcomplex_0_0_1_0
%     y(78) = KCaMcomplex_0_1_1_0
%     y(79) = KCaMcomplex_0_2_1_0
%     y(80) = KCaMcomplex_1_0_1_1
%     y(81) = KCaMcomplex_1_0_1_2
%     y(82) = KCaMcomplex_1_0_2_0
%     y(83) = KCaMcomplex_1_0_2_1
%     y(84) = KCaMcomplex_1_0_2_2
%     y(85) = KCaMcomplex_1_0_1_0
%     y(86) = KCaMcomplex_0_0_1_1
%     y(87) = KCaMcomplex_0_1_1_1
%     y(88) = KCaMcomplex_0_2_1_1
%     y(89) = KCaMcomplex_1_1_1_2
%     y(90) = KCaMcomplex_1_1_2_0
%     y(91) = KCaMcomplex_1_1_2_1
%     y(92) = KCaMcomplex_1_1_2_2
%     y(93) = KCaMcomplex_1_1_1_1
%     y(94) = KCaMcomplex_0_0_1_2
%     y(95) = KCaMcomplex_0_1_1_2
%     y(96) = KCaMcomplex_0_2_1_2
%     y(97) = KCaMcomplex_1_2_2_0
%     y(98) = KCaMcomplex_1_2_2_1
%     y(99) = KCaMcomplex_1_2_2_2
%     y(100) = KCaMcomplex_1_2_1_2
%     y(101) = KCaMcomplex_0_0_2_0
%     y(102) = KCaMcomplex_0_1_2_0
%     y(103) = KCaMcomplex_0_2_2_0
%     y(104) = KCaMcomplex_2_0_2_1
%     y(105) = KCaMcomplex_2_0_2_2
%     y(106) = KCaMcomplex_2_0_2_0
%     y(107) = KCaMcomplex_0_0_2_1
%     y(108) = KCaMcomplex_0_1_2_1
%     y(109) = KCaMcomplex_0_2_2_1
%     y(110) = KCaMcomplex_2_1_2_2
%     y(111) = KCaMcomplex_2_1_2_1
%     y(112) = KCaMcomplex_0_0_2_2
%     y(113) = KCaMcomplex_0_1_2_2
%     y(114) = KCaMcomplex_0_2_2_2
%     y(115) = KCaMcomplex_2_2_2_2
%     y(116) = KCaMcomplex_0_0_0_1
%     y(117) = KCaMcomplex_0_0_0_2
%     y(118) = KCaMcomplex_0_0_0_0
%     y(119) = KCaMcomplex_0_1_0_2
%     y(120) = KCaMcomplex_0_1_0_1
%     y(121) = KCaMcomplex_0_2_0_2


function MODEL1001150000_FE_pKCaMcurry
[T,Y]=ode45(@ode,[0 100.0],[  210.0 0.0 0.0 100.0 4.0 0.0 40.0 30.0 100.0 2500.0 150.0 0.0 750.0 80.0 0.022 0.0 3.1 0.0 0.1 0.0 1.7 0.0 10.0 0.0 9.25 0.059 0.0 6.8 0.0 3.3 0.0 3.4 0.0 1.9 0.0 1.9 0.92 0.0 6.8 5.2 0.0 3.8 30.0 0.0 1.7 0.0 44.0 33.0 75.0 300.0 0.0038 5.5 50.0 60.0 0.06 0.12 0.032 0.094 0.154 0.064 0.124 0.96 0.0 0.0 76.0 33.0 0.0 0.0 44.0 2.7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0]);
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
view= getSpecies(101)/1;
plot(T,view);
hold on;
view= getSpecies(21)/1;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(55)/1;
plot(T,view);
hold on;
view= getSpecies(74)/9;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(48)/1;
plot(T,view);
hold on;
view= getSpecies(109)/1;
plot(T,view);
hold on;
view= getSpecies(100)/1;
plot(T,view);
hold on;
view= getSpecies(75)/9;
plot(T,view);
hold on;
view= getSpecies(94)/1;
plot(T,view);
hold on;
view= getSpecies(23)/1;
plot(T,view);
hold on;
view= getSpecies(22)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(92)/1;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(91)/1;
plot(T,view);
hold on;
view= getSpecies(56)/1;
plot(T,view);
hold on;
view= getSpecies(62)/1;
plot(T,view);
hold on;
view= getSpecies(105)/1;
plot(T,view);
hold on;
view= getSpecies(83)/1;
plot(T,view);
hold on;
view= getSpecies(84)/1;
plot(T,view);
hold on;
view= getSpecies(102)/1;
plot(T,view);
hold on;
view= getSpecies(98)/1;
plot(T,view);
hold on;
view= getSpecies(79)/1;
plot(T,view);
hold on;
view= getSpecies(95)/1;
plot(T,view);
hold on;
view= getSpecies(99)/1;
plot(T,view);
hold on;
view= getSpecies(96)/1;
plot(T,view);
hold on;
view= getSpecies(66)/1;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(30)/1;
plot(T,view);
hold on;
view= getSpecies(58)/1;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(121)/1;
plot(T,view);
hold on;
view= getSpecies(69)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(50)/1;
plot(T,view);
hold on;
view= getSpecies(53)/1;
plot(T,view);
hold on;
view= getSpecies(118)/1;
plot(T,view);
hold on;
view= getSpecies(76)/9;
plot(T,view);
hold on;
view= getSpecies(70)/1;
plot(T,view);
hold on;
view= getSpecies(29)/1;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(78)/1;
plot(T,view);
hold on;
view= getSpecies(61)/1;
plot(T,view);
hold on;
view= getSpecies(65)/1;
plot(T,view);
hold on;
view= getSpecies(120)/1;
plot(T,view);
hold on;
view= getSpecies(88)/1;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(26)/1;
plot(T,view);
hold on;
view= getSpecies(80)/1;
plot(T,view);
hold on;
view= getSpecies(87)/1;
plot(T,view);
hold on;
view= getSpecies(31)/1;
plot(T,view);
hold on;
view= getSpecies(68)/9;
plot(T,view);
hold on;
view= getSpecies(117)/1;
plot(T,view);
hold on;
view= getSpecies(44)/1;
plot(T,view);
hold on;
view= getSpecies(89)/1;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(81)/1;
plot(T,view);
hold on;
view= getSpecies(49)/1;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(77)/1;
plot(T,view);
hold on;
view= getSpecies(90)/1;
plot(T,view);
hold on;
view= getSpecies(25)/1;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(60)/1;
plot(T,view);
hold on;
view= getSpecies(64)/9;
plot(T,view);
hold on;
view= getSpecies(115)/1;
plot(T,view);
hold on;
view= getSpecies(97)/1;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(111)/1;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(27)/1;
plot(T,view);
hold on;
view= getSpecies(20)/1;
plot(T,view);
hold on;
view= getSpecies(45)/1;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(82)/1;
plot(T,view);
hold on;
view= getSpecies(116)/1;
plot(T,view);
hold on;
view= getSpecies(119)/1;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(71)/9;
plot(T,view);
hold on;
view= getSpecies(63)/1;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(108)/1;
plot(T,view);
hold on;
view= getSpecies(35)/1;
plot(T,view);
hold on;
view= getSpecies(2)/9;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(103)/1;
plot(T,view);
hold on;
view= getSpecies(85)/1;
plot(T,view);
hold on;
view= getSpecies(32)/1;
plot(T,view);
hold on;
view= getSpecies(51)/1;
plot(T,view);
hold on;
view= getSpecies(59)/1;
plot(T,view);
hold on;
view= getSpecies(36)/1;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(114)/1;
plot(T,view);
hold on;
view= getSpecies(57)/1;
plot(T,view);
hold on;
view= getSpecies(106)/1;
plot(T,view);
hold on;
view= getSpecies(104)/1;
plot(T,view);
hold on;
view= getSpecies(110)/1;
plot(T,view);
hold on;
view= getSpecies(73)/9;
plot(T,view);
hold on;
view= getSpecies(107)/1;
plot(T,view);
hold on;
view= getSpecies(113)/1;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
view= getSpecies(93)/1;
plot(T,view);
hold on;
view= getSpecies(54)/1;
plot(T,view);
hold on;
view= getSpecies(67)/9;
plot(T,view);
hold on;
view= getSpecies(1)/3;
plot(T,view);
hold on;
view= getSpecies(52)/1;
plot(T,view);
hold on;
view= getSpecies(86)/1;
plot(T,view);
hold on;
view= getSpecies(72)/9;
plot(T,view);
hold on;
view= getSpecies(19)/1;
plot(T,view);
hold on;
view= getSpecies(38)/1;
plot(T,view);
hold on;
view= getSpecies(112)/1;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vKCaMcomplex_0_0_2_0','vkCaM2Noff','vCaM_0_2','vkpCaM1N','vpKCaMcomplex_0_0_2_0','vkCaM1C2Non','vkK1Coff','vKCaMcomplex_0_2_2_1','vKCaMcomplex_1_2_1_2','vpKCaMcomplex_0_0_2_1','vKCaMcomplex_0_0_1_2','vk2Con','vCaM_1_0','vkCaM2C1Noff','vCaM_1_2','vKCaMcomplex_1_1_2_2','vCaM_0_0','vKCaMcomplex_1_1_2_1','vkpCaM2N','vkpCaM4','vKCaMcomplex_2_0_2_2','vKCaMcomplex_1_0_2_1','vKCaMcomplex_1_0_2_2','vKCaMcomplex_0_1_2_0','vKCaMcomplex_1_2_2_1','vKCaMcomplex_0_2_1_0','vKCaMcomplex_0_1_1_2','vKCaMcomplex_1_2_2_2','vKCaMcomplex_0_2_1_2','vkK2Noff','vkCaM4on','vkCaM1C1Non','vkpCaM1C1N','vKCaM_0_1','vKCaMcomplex_0_2_0_2','vkK2Con','vCa','vCaM_2_0','vkK1Noff','vk2CaMKon','vKCaMcomplex_0_0_0_0','vpKCaMcomplex_0_0_2_2','vkK2Coff','vCaM_2_1','vkK1Con','vk1Coff','vKCaMcomplex_0_1_1_0','vkpCaM2C1N','vkK2Non','vKCaMcomplex_0_1_0_1','vKCaMcomplex_0_2_1_1','vk1Noff','vkCaM1Con','vKCaMcomplex_1_0_1_1','vKCaMcomplex_0_1_1_1','vKCaM_1_1','vpKCaMcomplex_0_0_0_2','vKCaMcomplex_0_0_0_2','vKCaM_2_2','vKCaMcomplex_1_1_1_2','vCaM_2_2','vKCaMcomplex_1_0_1_2','vkK1Non','vCaM_1_1','vKCaMcomplex_0_0_1_0','vKCaMcomplex_1_1_2_0','vk2Coff','vCaM_0_1','vkCaM2Con','vkpCaM2C','vpKCaMcomplex_0_0_0_0','vKCaMcomplex_2_2_2_2','vKCaMcomplex_1_2_2_0','vkCaM1Noff','vKCaMcomplex_2_1_2_1','vk1Con','vk2Non','vKCaM_1_0','vKCaM_0_2','vkCaM4off','vkCaM2C1Non','vKCaMcomplex_1_0_2_0','vKCaMcomplex_0_0_0_1','vKCaMcomplex_0_1_0_2','vKaMe','vpKCaMcomplex_0_0_1_0','vkpCaM0','vkCaM2Coff','vKCaMcomplex_0_1_2_1','vKCaM_1_2','vpKCaM_0_0','vk2Noff','vKCaM_0_0','vkCaM1Non','vkCaM1Coff','vKCaMcomplex_0_2_2_0','vKCaMcomplex_1_0_1_0','vkCaM1C1Noff','vkCaM0on','vkpCaM1C2N','vkCaM1C2Noff','vKCaM_2_1','vKCaMcomplex_0_2_2_2','vkpCaM1C','vKCaMcomplex_2_0_2_0','vKCaMcomplex_2_0_2_1','vKCaMcomplex_2_1_2_2','vpKCaMcomplex_0_0_1_2','vKCaMcomplex_0_0_2_1','vKCaMcomplex_0_1_2_2','vk1Non','vKCaMcomplex_1_1_1_1','vk2CaMKoff','vpKCaMcomplex_0_0_0_1','vcaminit','vkCaM0off','vKCaMcomplex_0_0_1_1','vpKCaMcomplex_0_0_1_1','vkCaM2Non','vKCaM_2_0','vKCaMcomplex_0_0_2_2');
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
  dy(2) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(16)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(20)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(27)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(31)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(35)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(38)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(41)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(44)*y(53)) + -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(46)*y(53)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(64) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(67) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(68) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(71) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(72) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(73) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(74) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(75) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(76) + 2*((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*y(55)*y(67)) + pkpCaM1N*y(55)*y(78) + pkpCaM1N*y(55)*y(87) + pkpCaM1N*y(55)*y(95) + pkpCaM1N*y(55)*y(102) + pkpCaM1N*y(55)*y(108) + pkpCaM1N*y(55)*y(113) + pkpCaM1N*y(55)*y(116) + pkpCaM1N*y(55)*y(119) + pkpCaM1N*y(55)*y(120) + 2*((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*y(56)*y(68)) + pkpCaM2N*y(56)*y(79) + pkpCaM2N*y(56)*y(88) + pkpCaM2N*y(56)*y(96) + pkpCaM2N*y(56)*y(103) + pkpCaM2N*y(56)*y(109) + pkpCaM2N*y(56)*y(114) + pkpCaM2N*y(56)*y(117) + pkpCaM2N*y(56)*y(119) + pkpCaM2N*y(56)*y(121) + 2*((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*y(57)*y(71)) + pkpCaM1C*y(57)*y(77) + pkpCaM1C*y(57)*y(78) + pkpCaM1C*y(57)*y(79) + pkpCaM1C*y(57)*y(80) + pkpCaM1C*y(57)*y(81) + pkpCaM1C*y(57)*y(82) + pkpCaM1C*y(57)*y(83) + pkpCaM1C*y(57)*y(84) + pkpCaM1C*y(57)*y(85) + 2*((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*y(58)*y(72)) + pkpCaM1C1N*y(58)*y(80) + pkpCaM1C1N*y(58)*y(86) + pkpCaM1C1N*y(58)*y(87) + pkpCaM1C1N*y(58)*y(88) + pkpCaM1C1N*y(58)*y(89) + pkpCaM1C1N*y(58)*y(90) + pkpCaM1C1N*y(58)*y(91) + pkpCaM1C1N*y(58)*y(92) + pkpCaM1C1N*y(58)*y(93) + 2*((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*y(59)*y(73)) + pkpCaM1C2N*y(59)*y(81) + pkpCaM1C2N*y(59)*y(89) + pkpCaM1C2N*y(59)*y(94) + pkpCaM1C2N*y(59)*y(95) + pkpCaM1C2N*y(59)*y(96) + pkpCaM1C2N*y(59)*y(97) + pkpCaM1C2N*y(59)*y(98) + pkpCaM1C2N*y(59)*y(99) + pkpCaM1C2N*y(59)*y(100) + 2*((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*y(60)*y(74)) + pkpCaM2C*y(60)*y(82) + pkpCaM2C*y(60)*y(90) + pkpCaM2C*y(60)*y(97) + pkpCaM2C*y(60)*y(101) + pkpCaM2C*y(60)*y(102) + pkpCaM2C*y(60)*y(103) + pkpCaM2C*y(60)*y(104) + pkpCaM2C*y(60)*y(105) + pkpCaM2C*y(60)*y(106) + 2*((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*y(61)*y(75)) + pkpCaM2C1N*y(61)*y(83) + pkpCaM2C1N*y(61)*y(91) + pkpCaM2C1N*y(61)*y(98) + pkpCaM2C1N*y(61)*y(104) + pkpCaM2C1N*y(61)*y(107) + pkpCaM2C1N*y(61)*y(108) + pkpCaM2C1N*y(61)*y(109) + pkpCaM2C1N*y(61)*y(110) + pkpCaM2C1N*y(61)*y(111) + 2*((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*y(62)*y(76)) + pkpCaM4*y(62)*y(84) + pkpCaM4*y(62)*y(92) + pkpCaM4*y(62)*y(99) + pkpCaM4*y(62)*y(105) + pkpCaM4*y(62)*y(110) + pkpCaM4*y(62)*y(112) + pkpCaM4*y(62)*y(113) + pkpCaM4*y(62)*y(114) + pkpCaM4*y(62)*y(115) + 2*((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*y(63)*y(64)) + pkpCaM0*y(63)*y(77) + pkpCaM0*y(63)*y(86) + pkpCaM0*y(63)*y(94) + pkpCaM0*y(63)*y(101) + pkpCaM0*y(63)*y(107) + pkpCaM0*y(63)*y(112) + pkpCaM0*y(63)*y(116) + pkpCaM0*y(63)*y(117) + pkpCaM0*y(63)*y(118);
  dy(3) = -pk1Con*y(3)*y(4)*y(5) + -pk2Non*y(3)*y(4)*y(11) + -pk1Noff*y(3)*y(10) + -pkCaM1Non*y(3)*y(14)*y(15) + pk1Non*y(4)*y(8)*y(9) + pk1Coff*y(6)*y(7) + pk2Noff*y(12)*y(13) + pkCaM1Noff*y(16)*y(17);
  dy(4) = -pk1Con*y(3)*y(4)*y(5) + -pk2Non*y(3)*y(4)*y(11) + pk1Noff*y(3)*y(10) + -pk1Con*y(4)*y(5)*y(8) + -pk1Con*y(4)*y(5)*y(12) + -pk2Non*y(4)*y(6)*y(11) + -pk2Con*y(4)*y(6)*y(23) + -pk1Non*y(4)*y(8)*y(9) + -pk1Non*y(4)*y(9)*y(22) + -pk1Non*y(4)*y(9)*y(24) + -pk2Non*y(4)*y(11)*y(29) + -pkK1Con*y(4)*y(16)*y(47) + -pkK2Non*y(4)*y(16)*y(65) + -pk2Con*y(4)*y(18)*y(23) + -pkK1Con*y(4)*y(20)*y(47) + -pk2Con*y(4)*y(22)*y(23) + -pkK1Non*y(4)*y(27)*y(49) + -pkK2Con*y(4)*y(27)*y(69) + -pkK2Non*y(4)*y(31)*y(65) + -pkK2Con*y(4)*y(31)*y(69) + -pkK2Con*y(4)*y(35)*y(69) + -pkK1Non*y(4)*y(38)*y(49) + -pkK2Non*y(4)*y(41)*y(65) + -pkK1Con*y(4)*y(46)*y(47) + -pkK1Non*y(4)*y(46)*y(49) + pk1Coff*y(6)*y(7) + pk1Noff*y(6)*y(10) + pk1Coff*y(7)*y(18) + pk1Coff*y(7)*y(22) + pk1Noff*y(10)*y(29) + pk2Noff*y(12)*y(13) + pk2Noff*y(13)*y(18) + pk2Noff*y(13)*y(33) + pkK1Noff*y(16)*y(50) + pkK2Noff*y(20)*y(66) + pk2Coff*y(24)*y(25) + pk2Coff*y(25)*y(29) + pk2Coff*y(25)*y(33) + pkK1Coff*y(27)*y(48) + pkK1Coff*y(31)*y(48) + pkK1Noff*y(31)*y(50) + pkK1Coff*y(35)*y(48) + pkK2Noff*y(35)*y(66) + pkK2Coff*y(38)*y(70) + pkK1Noff*y(41)*y(50) + pkK2Coff*y(41)*y(70) + pkK2Noff*y(44)*y(66) + pkK2Coff*y(44)*y(70);
  dy(5) = 0;
  dy(6) = pk1Con*y(3)*y(4)*y(5) + -pk2Non*y(4)*y(6)*y(11) + -pk2Con*y(4)*y(6)*y(23) + pk1Non*y(4)*y(9)*y(22) + -pk1Coff*y(6)*y(7) + -pk1Noff*y(6)*y(10) + -pkCaM1C1Non*y(6)*y(14)*y(30) + pk2Noff*y(13)*y(18) + pk2Coff*y(25)*y(29) + pkCaM1C1Noff*y(31)*y(32);
  dy(7) = 0;
  dy(8) = pk1Noff*y(3)*y(10) + -pk1Con*y(4)*y(5)*y(8) + -pk1Non*y(4)*y(8)*y(9) + pk1Coff*y(7)*y(22) + -pkCaM0on*y(8)*y(14)*y(51) + pkCaM0off*y(46)*y(52);
  dy(9) = 0;
  dy(10) = 0;
  dy(11) = 0;
  dy(12) = pk2Non*y(3)*y(4)*y(11) + -pk1Con*y(4)*y(5)*y(12) + pk1Coff*y(7)*y(18) + -pk2Noff*y(12)*y(13) + -pkCaM2Non*y(12)*y(14)*y(19) + pkCaM2Noff*y(20)*y(21);
  dy(13) = 0;
  dy(14) = -pkCaM1Non*y(3)*y(14)*y(15) + -pkCaM1C1Non*y(6)*y(14)*y(30) + -pkCaM0on*y(8)*y(14)*y(51) + -pkCaM2Non*y(12)*y(14)*y(19) + -pkCaM1C2Non*y(14)*y(18)*y(34) + -pkCaM1Con*y(14)*y(22)*y(26) + -pkCaM2Con*y(14)*y(24)*y(37) + -pkCaM2C1Non*y(14)*y(29)*y(40) + -pkCaM4on*y(14)*y(33)*y(43) + pkCaM1Noff*y(16)*y(17) + pkCaM2Noff*y(20)*y(21) + pkCaM1Coff*y(27)*y(28) + pkCaM1C1Noff*y(31)*y(32) + pkCaM1C2Noff*y(35)*y(36) + pkCaM2Coff*y(38)*y(39) + pkCaM2C1Noff*y(41)*y(42) + pkCaM4off*y(44)*y(45) + pkCaM0off*y(46)*y(52);
  dy(15) = 0;
  dy(16) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(16)*y(53)) + pkCaM1Non*y(3)*y(14)*y(15) + -pkK1Con*y(4)*y(16)*y(47) + -pkK2Non*y(4)*y(16)*y(65) + pkK1Non*y(4)*y(46)*y(49) + -pkCaM1Noff*y(16)*y(17) + -pk2CaMKon*y(16)*y(20)*y(53) + -pk2CaMKon*y(16)*y(27)*y(53) + -pk2CaMKon*y(16)*y(31)*y(53) + -pk2CaMKon*y(16)*y(35)*y(53) + -pk2CaMKon*y(16)*y(38)*y(53) + -pk2CaMKon*y(16)*y(41)*y(53) + -pk2CaMKon*y(16)*y(44)*y(53) + -pk2CaMKon*y(16)*y(46)*y(53) + -pkK1Noff*y(16)*y(50) + -2*(pk2CaMKon*y(16)*y(16)*y(53)) + pkK2Noff*y(20)*y(66) + pkK1Coff*y(31)*y(48) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(67) + pk2CaMKoff*y(54)*y(78) + pk2CaMKoff*y(54)*y(87) + pk2CaMKoff*y(54)*y(95) + pk2CaMKoff*y(54)*y(102) + pk2CaMKoff*y(54)*y(108) + pk2CaMKoff*y(54)*y(113) + pk2CaMKoff*y(54)*y(116) + pk2CaMKoff*y(54)*y(119) + 2*(pk2CaMKoff*y(54)*y(120)) + pkpCaM1N*y(55)*y(120) + pkpCaM2N*y(56)*y(119) + pkpCaM1C*y(57)*y(78) + pkpCaM1C1N*y(58)*y(87) + pkpCaM1C2N*y(59)*y(95) + pkpCaM2C*y(60)*y(102) + pkpCaM2C1N*y(61)*y(108) + pkpCaM4*y(62)*y(113) + pkpCaM0*y(63)*y(116);
  dy(17) = 0;
  dy(18) = pk1Con*y(4)*y(5)*y(12) + pk2Non*y(4)*y(6)*y(11) + -pk2Con*y(4)*y(18)*y(23) + -pk1Coff*y(7)*y(18) + -pk2Noff*y(13)*y(18) + -pkCaM1C2Non*y(14)*y(18)*y(34) + pk2Coff*y(25)*y(33) + pkCaM1C2Noff*y(35)*y(36);
  dy(19) = 0;
  dy(20) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(20)*y(53)) + pkK2Non*y(4)*y(16)*y(65) + -pkK1Con*y(4)*y(20)*y(47) + pkCaM2Non*y(12)*y(14)*y(19) + -pk2CaMKon*y(16)*y(20)*y(53) + -pkCaM2Noff*y(20)*y(21) + -pk2CaMKon*y(20)*y(27)*y(53) + -pk2CaMKon*y(20)*y(31)*y(53) + -pk2CaMKon*y(20)*y(35)*y(53) + -pk2CaMKon*y(20)*y(38)*y(53) + -pk2CaMKon*y(20)*y(41)*y(53) + -pk2CaMKon*y(20)*y(44)*y(53) + -pk2CaMKon*y(20)*y(46)*y(53) + -pkK2Noff*y(20)*y(66) + -2*(pk2CaMKon*y(20)*y(20)*y(53)) + pkK1Coff*y(35)*y(48) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(68) + pk2CaMKoff*y(54)*y(79) + pk2CaMKoff*y(54)*y(88) + pk2CaMKoff*y(54)*y(96) + pk2CaMKoff*y(54)*y(103) + pk2CaMKoff*y(54)*y(109) + pk2CaMKoff*y(54)*y(114) + pk2CaMKoff*y(54)*y(117) + pk2CaMKoff*y(54)*y(119) + 2*(pk2CaMKoff*y(54)*y(121)) + pkpCaM1N*y(55)*y(119) + pkpCaM2N*y(56)*y(121) + pkpCaM1C*y(57)*y(79) + pkpCaM1C1N*y(58)*y(88) + pkpCaM1C2N*y(59)*y(96) + pkpCaM2C*y(60)*y(103) + pkpCaM2C1N*y(61)*y(109) + pkpCaM4*y(62)*y(114) + pkpCaM0*y(63)*y(117);
  dy(21) = 0;
  dy(22) = pk1Con*y(4)*y(5)*y(8) + -pk1Non*y(4)*y(9)*y(22) + -pk2Con*y(4)*y(22)*y(23) + pk1Noff*y(6)*y(10) + -pk1Coff*y(7)*y(22) + -pkCaM1Con*y(14)*y(22)*y(26) + pk2Coff*y(24)*y(25) + pkCaM1Coff*y(27)*y(28);
  dy(23) = 0;
  dy(24) = -pk1Non*y(4)*y(9)*y(24) + pk2Con*y(4)*y(22)*y(23) + pk1Noff*y(10)*y(29) + -pkCaM2Con*y(14)*y(24)*y(37) + -pk2Coff*y(24)*y(25) + pkCaM2Coff*y(38)*y(39);
  dy(25) = 0;
  dy(26) = 0;
  dy(27) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(27)*y(53)) + -pkK1Non*y(4)*y(27)*y(49) + -pkK2Con*y(4)*y(27)*y(69) + pkK1Con*y(4)*y(46)*y(47) + pkCaM1Con*y(14)*y(22)*y(26) + -pk2CaMKon*y(16)*y(27)*y(53) + -pk2CaMKon*y(20)*y(27)*y(53) + -pkCaM1Coff*y(27)*y(28) + -pk2CaMKon*y(27)*y(31)*y(53) + -pk2CaMKon*y(27)*y(35)*y(53) + -pk2CaMKon*y(27)*y(38)*y(53) + -pk2CaMKon*y(27)*y(41)*y(53) + -pk2CaMKon*y(27)*y(44)*y(53) + -pk2CaMKon*y(27)*y(46)*y(53) + -pkK1Coff*y(27)*y(48) + -2*(pk2CaMKon*y(27)*y(27)*y(53)) + pkK1Noff*y(31)*y(50) + pkK2Coff*y(38)*y(70) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(71) + pk2CaMKoff*y(54)*y(77) + pk2CaMKoff*y(54)*y(78) + pk2CaMKoff*y(54)*y(79) + pk2CaMKoff*y(54)*y(80) + pk2CaMKoff*y(54)*y(81) + pk2CaMKoff*y(54)*y(82) + pk2CaMKoff*y(54)*y(83) + pk2CaMKoff*y(54)*y(84) + 2*(pk2CaMKoff*y(54)*y(85)) + pkpCaM1N*y(55)*y(78) + pkpCaM2N*y(56)*y(79) + pkpCaM1C*y(57)*y(85) + pkpCaM1C1N*y(58)*y(80) + pkpCaM1C2N*y(59)*y(81) + pkpCaM2C*y(60)*y(82) + pkpCaM2C1N*y(61)*y(83) + pkpCaM4*y(62)*y(84) + pkpCaM0*y(63)*y(77);
  dy(28) = 0;
  dy(29) = pk2Con*y(4)*y(6)*y(23) + pk1Non*y(4)*y(9)*y(24) + -pk2Non*y(4)*y(11)*y(29) + -pk1Noff*y(10)*y(29) + pk2Noff*y(13)*y(33) + -pkCaM2C1Non*y(14)*y(29)*y(40) + -pk2Coff*y(25)*y(29) + pkCaM2C1Noff*y(41)*y(42);
  dy(30) = 0;
  dy(31) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(31)*y(53)) + pkK1Con*y(4)*y(16)*y(47) + pkK1Non*y(4)*y(27)*y(49) + -pkK2Non*y(4)*y(31)*y(65) + -pkK2Con*y(4)*y(31)*y(69) + pkCaM1C1Non*y(6)*y(14)*y(30) + -pk2CaMKon*y(16)*y(31)*y(53) + -pk2CaMKon*y(20)*y(31)*y(53) + -pk2CaMKon*y(27)*y(31)*y(53) + -pkCaM1C1Noff*y(31)*y(32) + -pk2CaMKon*y(31)*y(35)*y(53) + -pk2CaMKon*y(31)*y(38)*y(53) + -pk2CaMKon*y(31)*y(41)*y(53) + -pk2CaMKon*y(31)*y(44)*y(53) + -pk2CaMKon*y(31)*y(46)*y(53) + -pkK1Coff*y(31)*y(48) + -pkK1Noff*y(31)*y(50) + -2*(pk2CaMKon*y(31)*y(31)*y(53)) + pkK2Noff*y(35)*y(66) + pkK2Coff*y(41)*y(70) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(72) + pk2CaMKoff*y(54)*y(80) + pk2CaMKoff*y(54)*y(86) + pk2CaMKoff*y(54)*y(87) + pk2CaMKoff*y(54)*y(88) + pk2CaMKoff*y(54)*y(89) + pk2CaMKoff*y(54)*y(90) + pk2CaMKoff*y(54)*y(91) + pk2CaMKoff*y(54)*y(92) + 2*(pk2CaMKoff*y(54)*y(93)) + pkpCaM1N*y(55)*y(87) + pkpCaM2N*y(56)*y(88) + pkpCaM1C*y(57)*y(80) + pkpCaM1C1N*y(58)*y(93) + pkpCaM1C2N*y(59)*y(89) + pkpCaM2C*y(60)*y(90) + pkpCaM2C1N*y(61)*y(91) + pkpCaM4*y(62)*y(92) + pkpCaM0*y(63)*y(86);
  dy(32) = 0;
  dy(33) = pk2Non*y(4)*y(11)*y(29) + pk2Con*y(4)*y(18)*y(23) + -pk2Noff*y(13)*y(33) + -pkCaM4on*y(14)*y(33)*y(43) + -pk2Coff*y(25)*y(33) + pkCaM4off*y(44)*y(45);
  dy(34) = 0;
  dy(35) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(35)*y(53)) + pkK1Con*y(4)*y(20)*y(47) + pkK2Non*y(4)*y(31)*y(65) + -pkK2Con*y(4)*y(35)*y(69) + pkCaM1C2Non*y(14)*y(18)*y(34) + -pk2CaMKon*y(16)*y(35)*y(53) + -pk2CaMKon*y(20)*y(35)*y(53) + -pk2CaMKon*y(27)*y(35)*y(53) + -pk2CaMKon*y(31)*y(35)*y(53) + -pkCaM1C2Noff*y(35)*y(36) + -pk2CaMKon*y(35)*y(38)*y(53) + -pk2CaMKon*y(35)*y(41)*y(53) + -pk2CaMKon*y(35)*y(44)*y(53) + -pk2CaMKon*y(35)*y(46)*y(53) + -pkK1Coff*y(35)*y(48) + -pkK2Noff*y(35)*y(66) + -2*(pk2CaMKon*y(35)*y(35)*y(53)) + pkK2Coff*y(44)*y(70) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(73) + pk2CaMKoff*y(54)*y(81) + pk2CaMKoff*y(54)*y(89) + pk2CaMKoff*y(54)*y(94) + pk2CaMKoff*y(54)*y(95) + pk2CaMKoff*y(54)*y(96) + pk2CaMKoff*y(54)*y(97) + pk2CaMKoff*y(54)*y(98) + pk2CaMKoff*y(54)*y(99) + 2*(pk2CaMKoff*y(54)*y(100)) + pkpCaM1N*y(55)*y(95) + pkpCaM2N*y(56)*y(96) + pkpCaM1C*y(57)*y(81) + pkpCaM1C1N*y(58)*y(89) + pkpCaM1C2N*y(59)*y(100) + pkpCaM2C*y(60)*y(97) + pkpCaM2C1N*y(61)*y(98) + pkpCaM4*y(62)*y(99) + pkpCaM0*y(63)*y(94);
  dy(36) = 0;
  dy(37) = 0;
  dy(38) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(38)*y(53)) + pkK2Con*y(4)*y(27)*y(69) + -pkK1Non*y(4)*y(38)*y(49) + pkCaM2Con*y(14)*y(24)*y(37) + -pk2CaMKon*y(16)*y(38)*y(53) + -pk2CaMKon*y(20)*y(38)*y(53) + -pk2CaMKon*y(27)*y(38)*y(53) + -pk2CaMKon*y(31)*y(38)*y(53) + -pk2CaMKon*y(35)*y(38)*y(53) + -pkCaM2Coff*y(38)*y(39) + -pk2CaMKon*y(38)*y(41)*y(53) + -pk2CaMKon*y(38)*y(44)*y(53) + -pk2CaMKon*y(38)*y(46)*y(53) + -pkK2Coff*y(38)*y(70) + -2*(pk2CaMKon*y(38)*y(38)*y(53)) + pkK1Noff*y(41)*y(50) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(74) + pk2CaMKoff*y(54)*y(82) + pk2CaMKoff*y(54)*y(90) + pk2CaMKoff*y(54)*y(97) + pk2CaMKoff*y(54)*y(101) + pk2CaMKoff*y(54)*y(102) + pk2CaMKoff*y(54)*y(103) + pk2CaMKoff*y(54)*y(104) + pk2CaMKoff*y(54)*y(105) + 2*(pk2CaMKoff*y(54)*y(106)) + pkpCaM1N*y(55)*y(102) + pkpCaM2N*y(56)*y(103) + pkpCaM1C*y(57)*y(82) + pkpCaM1C1N*y(58)*y(90) + pkpCaM1C2N*y(59)*y(97) + pkpCaM2C*y(60)*y(106) + pkpCaM2C1N*y(61)*y(104) + pkpCaM4*y(62)*y(105) + pkpCaM0*y(63)*y(101);
  dy(39) = 0;
  dy(40) = 0;
  dy(41) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(41)*y(53)) + pkK2Con*y(4)*y(31)*y(69) + pkK1Non*y(4)*y(38)*y(49) + -pkK2Non*y(4)*y(41)*y(65) + pkCaM2C1Non*y(14)*y(29)*y(40) + -pk2CaMKon*y(16)*y(41)*y(53) + -pk2CaMKon*y(20)*y(41)*y(53) + -pk2CaMKon*y(27)*y(41)*y(53) + -pk2CaMKon*y(31)*y(41)*y(53) + -pk2CaMKon*y(35)*y(41)*y(53) + -pk2CaMKon*y(38)*y(41)*y(53) + -pkCaM2C1Noff*y(41)*y(42) + -pk2CaMKon*y(41)*y(44)*y(53) + -pk2CaMKon*y(41)*y(46)*y(53) + -pkK1Noff*y(41)*y(50) + -pkK2Coff*y(41)*y(70) + -2*(pk2CaMKon*y(41)*y(41)*y(53)) + pkK2Noff*y(44)*y(66) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(75) + pk2CaMKoff*y(54)*y(83) + pk2CaMKoff*y(54)*y(91) + pk2CaMKoff*y(54)*y(98) + pk2CaMKoff*y(54)*y(104) + pk2CaMKoff*y(54)*y(107) + pk2CaMKoff*y(54)*y(108) + pk2CaMKoff*y(54)*y(109) + pk2CaMKoff*y(54)*y(110) + 2*(pk2CaMKoff*y(54)*y(111)) + pkpCaM1N*y(55)*y(108) + pkpCaM2N*y(56)*y(109) + pkpCaM1C*y(57)*y(83) + pkpCaM1C1N*y(58)*y(91) + pkpCaM1C2N*y(59)*y(98) + pkpCaM2C*y(60)*y(104) + pkpCaM2C1N*y(61)*y(111) + pkpCaM4*y(62)*y(110) + pkpCaM0*y(63)*y(107);
  dy(42) = 0;
  dy(43) = 0;
  dy(44) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(44)*y(53)) + pkK2Con*y(4)*y(35)*y(69) + pkK2Non*y(4)*y(41)*y(65) + pkCaM4on*y(14)*y(33)*y(43) + -pk2CaMKon*y(16)*y(44)*y(53) + -pk2CaMKon*y(20)*y(44)*y(53) + -pk2CaMKon*y(27)*y(44)*y(53) + -pk2CaMKon*y(31)*y(44)*y(53) + -pk2CaMKon*y(35)*y(44)*y(53) + -pk2CaMKon*y(38)*y(44)*y(53) + -pk2CaMKon*y(41)*y(44)*y(53) + -pkCaM4off*y(44)*y(45) + -pk2CaMKon*y(44)*y(46)*y(53) + -pkK2Noff*y(44)*y(66) + -pkK2Coff*y(44)*y(70) + -2*(pk2CaMKon*y(44)*y(44)*y(53)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(76) + pk2CaMKoff*y(54)*y(84) + pk2CaMKoff*y(54)*y(92) + pk2CaMKoff*y(54)*y(99) + pk2CaMKoff*y(54)*y(105) + pk2CaMKoff*y(54)*y(110) + pk2CaMKoff*y(54)*y(112) + pk2CaMKoff*y(54)*y(113) + pk2CaMKoff*y(54)*y(114) + 2*(pk2CaMKoff*y(54)*y(115)) + pkpCaM1N*y(55)*y(113) + pkpCaM2N*y(56)*y(114) + pkpCaM1C*y(57)*y(84) + pkpCaM1C1N*y(58)*y(92) + pkpCaM1C2N*y(59)*y(99) + pkpCaM2C*y(60)*y(105) + pkpCaM2C1N*y(61)*y(110) + pkpCaM4*y(62)*y(115) + pkpCaM0*y(63)*y(112);
  dy(45) = 0;
  dy(46) = -((((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(46)*y(53)) + -pkK1Con*y(4)*y(46)*y(47) + -pkK1Non*y(4)*y(46)*y(49) + pkCaM0on*y(8)*y(14)*y(51) + -pk2CaMKon*y(16)*y(46)*y(53) + pkK1Noff*y(16)*y(50) + -pk2CaMKon*y(20)*y(46)*y(53) + -pk2CaMKon*y(27)*y(46)*y(53) + pkK1Coff*y(27)*y(48) + -pk2CaMKon*y(31)*y(46)*y(53) + -pk2CaMKon*y(35)*y(46)*y(53) + -pk2CaMKon*y(38)*y(46)*y(53) + -pk2CaMKon*y(41)*y(46)*y(53) + -pk2CaMKon*y(44)*y(46)*y(53) + -pkCaM0off*y(46)*y(52) + -2*(pk2CaMKon*y(46)*y(46)*y(53)) + (((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(64) + pk2CaMKoff*y(54)*y(77) + pk2CaMKoff*y(54)*y(86) + pk2CaMKoff*y(54)*y(94) + pk2CaMKoff*y(54)*y(101) + pk2CaMKoff*y(54)*y(107) + pk2CaMKoff*y(54)*y(112) + pk2CaMKoff*y(54)*y(116) + pk2CaMKoff*y(54)*y(117) + 2*(pk2CaMKoff*y(54)*y(118)) + pkpCaM1N*y(55)*y(116) + pkpCaM2N*y(56)*y(117) + pkpCaM1C*y(57)*y(77) + pkpCaM1C1N*y(58)*y(86) + pkpCaM1C2N*y(59)*y(94) + pkpCaM2C*y(60)*y(101) + pkpCaM2C1N*y(61)*y(107) + pkpCaM4*y(62)*y(112) + pkpCaM0*y(63)*y(118);
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
  dy(57) = 0;
  dy(58) = 0;
  dy(59) = 0;
  dy(60) = 0;
  dy(61) = 0;
  dy(62) = 0;
  dy(63) = 0;
  dy(64) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(46)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(64)) + -((((((((((pkpCaM0 + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) + pkpCaM0) / 9.0)*y(63)*y(64));
  dy(65) = 0;
  dy(66) = 0;
  dy(67) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(16)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(67)) + -((((((((((pkpCaM1N + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) + pkpCaM1N) / 9.0)*y(55)*y(67));
  dy(68) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(20)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(68)) + -((((((((((pkpCaM2N + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) + pkpCaM2N) / 9.0)*y(56)*y(68));
  dy(69) = 0;
  dy(70) = 0;
  dy(71) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(27)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(71)) + -((((((((((pkpCaM1C + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) + pkpCaM1C) / 9.0)*y(57)*y(71));
  dy(72) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(31)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(72)) + -((((((((((pkpCaM1C1N + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) + pkpCaM1C1N) / 9.0)*y(58)*y(72));
  dy(73) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(35)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(73)) + -((((((((((pkpCaM1C2N + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) + pkpCaM1C2N) / 9.0)*y(59)*y(73));
  dy(74) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(38)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(74)) + -((((((((((pkpCaM2C + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) + pkpCaM2C) / 9.0)*y(60)*y(74));
  dy(75) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(41)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(75)) + -((((((((((pkpCaM2C1N + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) + pkpCaM2C1N) / 9.0)*y(61)*y(75));
  dy(76) = (((((((((pk2CaMKon + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) + pk2CaMKon) / 9.0)*y(2)*y(44)*y(53) + -((((((((((pk2CaMKoff + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) + pk2CaMKoff) / 9.0)*y(54)*y(76)) + -((((((((((pkpCaM4 + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) + pkpCaM4) / 9.0)*y(62)*y(76));
  dy(77) = pk2CaMKon*y(27)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(77) + -pkpCaM1C*y(57)*y(77) + -pkpCaM0*y(63)*y(77);
  dy(78) = pk2CaMKon*y(16)*y(27)*y(53) + -pk2CaMKoff*y(54)*y(78) + -pkpCaM1N*y(55)*y(78) + -pkpCaM1C*y(57)*y(78);
  dy(79) = pk2CaMKon*y(20)*y(27)*y(53) + -pk2CaMKoff*y(54)*y(79) + -pkpCaM2N*y(56)*y(79) + -pkpCaM1C*y(57)*y(79);
  dy(80) = pk2CaMKon*y(27)*y(31)*y(53) + -pk2CaMKoff*y(54)*y(80) + -pkpCaM1C*y(57)*y(80) + -pkpCaM1C1N*y(58)*y(80);
  dy(81) = pk2CaMKon*y(27)*y(35)*y(53) + -pk2CaMKoff*y(54)*y(81) + -pkpCaM1C*y(57)*y(81) + -pkpCaM1C2N*y(59)*y(81);
  dy(82) = pk2CaMKon*y(27)*y(38)*y(53) + -pk2CaMKoff*y(54)*y(82) + -pkpCaM1C*y(57)*y(82) + -pkpCaM2C*y(60)*y(82);
  dy(83) = pk2CaMKon*y(27)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(83) + -pkpCaM1C*y(57)*y(83) + -pkpCaM2C1N*y(61)*y(83);
  dy(84) = pk2CaMKon*y(27)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(84) + -pkpCaM1C*y(57)*y(84) + -pkpCaM4*y(62)*y(84);
  dy(85) = pk2CaMKon*y(27)*y(27)*y(53) + -pk2CaMKoff*y(54)*y(85) + -pkpCaM1C*y(57)*y(85);
  dy(86) = pk2CaMKon*y(31)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(86) + -pkpCaM1C1N*y(58)*y(86) + -pkpCaM0*y(63)*y(86);
  dy(87) = pk2CaMKon*y(16)*y(31)*y(53) + -pk2CaMKoff*y(54)*y(87) + -pkpCaM1N*y(55)*y(87) + -pkpCaM1C1N*y(58)*y(87);
  dy(88) = pk2CaMKon*y(20)*y(31)*y(53) + -pk2CaMKoff*y(54)*y(88) + -pkpCaM2N*y(56)*y(88) + -pkpCaM1C1N*y(58)*y(88);
  dy(89) = pk2CaMKon*y(31)*y(35)*y(53) + -pk2CaMKoff*y(54)*y(89) + -pkpCaM1C1N*y(58)*y(89) + -pkpCaM1C2N*y(59)*y(89);
  dy(90) = pk2CaMKon*y(31)*y(38)*y(53) + -pk2CaMKoff*y(54)*y(90) + -pkpCaM1C1N*y(58)*y(90) + -pkpCaM2C*y(60)*y(90);
  dy(91) = pk2CaMKon*y(31)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(91) + -pkpCaM1C1N*y(58)*y(91) + -pkpCaM2C1N*y(61)*y(91);
  dy(92) = pk2CaMKon*y(31)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(92) + -pkpCaM1C1N*y(58)*y(92) + -pkpCaM4*y(62)*y(92);
  dy(93) = pk2CaMKon*y(31)*y(31)*y(53) + -pk2CaMKoff*y(54)*y(93) + -pkpCaM1C1N*y(58)*y(93);
  dy(94) = pk2CaMKon*y(35)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(94) + -pkpCaM1C2N*y(59)*y(94) + -pkpCaM0*y(63)*y(94);
  dy(95) = pk2CaMKon*y(16)*y(35)*y(53) + -pk2CaMKoff*y(54)*y(95) + -pkpCaM1N*y(55)*y(95) + -pkpCaM1C2N*y(59)*y(95);
  dy(96) = pk2CaMKon*y(20)*y(35)*y(53) + -pk2CaMKoff*y(54)*y(96) + -pkpCaM2N*y(56)*y(96) + -pkpCaM1C2N*y(59)*y(96);
  dy(97) = pk2CaMKon*y(35)*y(38)*y(53) + -pk2CaMKoff*y(54)*y(97) + -pkpCaM1C2N*y(59)*y(97) + -pkpCaM2C*y(60)*y(97);
  dy(98) = pk2CaMKon*y(35)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(98) + -pkpCaM1C2N*y(59)*y(98) + -pkpCaM2C1N*y(61)*y(98);
  dy(99) = pk2CaMKon*y(35)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(99) + -pkpCaM1C2N*y(59)*y(99) + -pkpCaM4*y(62)*y(99);
  dy(100) = pk2CaMKon*y(35)*y(35)*y(53) + -pk2CaMKoff*y(54)*y(100) + -pkpCaM1C2N*y(59)*y(100);
  dy(101) = pk2CaMKon*y(38)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(101) + -pkpCaM2C*y(60)*y(101) + -pkpCaM0*y(63)*y(101);
  dy(102) = pk2CaMKon*y(16)*y(38)*y(53) + -pk2CaMKoff*y(54)*y(102) + -pkpCaM1N*y(55)*y(102) + -pkpCaM2C*y(60)*y(102);
  dy(103) = pk2CaMKon*y(20)*y(38)*y(53) + -pk2CaMKoff*y(54)*y(103) + -pkpCaM2N*y(56)*y(103) + -pkpCaM2C*y(60)*y(103);
  dy(104) = pk2CaMKon*y(38)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(104) + -pkpCaM2C*y(60)*y(104) + -pkpCaM2C1N*y(61)*y(104);
  dy(105) = pk2CaMKon*y(38)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(105) + -pkpCaM2C*y(60)*y(105) + -pkpCaM4*y(62)*y(105);
  dy(106) = pk2CaMKon*y(38)*y(38)*y(53) + -pk2CaMKoff*y(54)*y(106) + -pkpCaM2C*y(60)*y(106);
  dy(107) = pk2CaMKon*y(41)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(107) + -pkpCaM2C1N*y(61)*y(107) + -pkpCaM0*y(63)*y(107);
  dy(108) = pk2CaMKon*y(16)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(108) + -pkpCaM1N*y(55)*y(108) + -pkpCaM2C1N*y(61)*y(108);
  dy(109) = pk2CaMKon*y(20)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(109) + -pkpCaM2N*y(56)*y(109) + -pkpCaM2C1N*y(61)*y(109);
  dy(110) = pk2CaMKon*y(41)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(110) + -pkpCaM2C1N*y(61)*y(110) + -pkpCaM4*y(62)*y(110);
  dy(111) = pk2CaMKon*y(41)*y(41)*y(53) + -pk2CaMKoff*y(54)*y(111) + -pkpCaM2C1N*y(61)*y(111);
  dy(112) = pk2CaMKon*y(44)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(112) + -pkpCaM4*y(62)*y(112) + -pkpCaM0*y(63)*y(112);
  dy(113) = pk2CaMKon*y(16)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(113) + -pkpCaM1N*y(55)*y(113) + -pkpCaM4*y(62)*y(113);
  dy(114) = pk2CaMKon*y(20)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(114) + -pkpCaM2N*y(56)*y(114) + -pkpCaM4*y(62)*y(114);
  dy(115) = pk2CaMKon*y(44)*y(44)*y(53) + -pk2CaMKoff*y(54)*y(115) + -pkpCaM4*y(62)*y(115);
  dy(116) = pk2CaMKon*y(16)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(116) + -pkpCaM1N*y(55)*y(116) + -pkpCaM0*y(63)*y(116);
  dy(117) = pk2CaMKon*y(20)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(117) + -pkpCaM2N*y(56)*y(117) + -pkpCaM0*y(63)*y(117);
  dy(118) = pk2CaMKon*y(46)*y(46)*y(53) + -pk2CaMKoff*y(54)*y(118) + -pkpCaM0*y(63)*y(118);
  dy(119) = pk2CaMKon*y(16)*y(20)*y(53) + -pk2CaMKoff*y(54)*y(119) + -pkpCaM1N*y(55)*y(119) + -pkpCaM2N*y(56)*y(119);
  dy(120) = pk2CaMKon*y(16)*y(16)*y(53) + -pk2CaMKoff*y(54)*y(120) + -pkpCaM1N*y(55)*y(120);
  dy(121) = pk2CaMKon*y(20)*y(20)*y(53) + -pk2CaMKoff*y(54)*y(121) + -pkpCaM2N*y(56)*y(121);
end
