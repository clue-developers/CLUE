

% Automatically generated from MODEL1001150000_curry.
% Original number of species: 203.
% Original number of reactions: 480.

% Correspondence with original names:
%     y(1) = CaM_0_1
%     y(2) = CaM_0_2
%     y(3) = CaM_1_0
%     y(4) = CaM_1_1
%     y(5) = CaM_1_2
%     y(6) = CaM_2_0
%     y(7) = CaM_2_1
%     y(8) = CaM_2_2
%     y(9) = KCaM_0_0
%     y(10) = KCaM_0_1
%     y(11) = KCaM_0_2
%     y(12) = KCaM_1_0
%     y(13) = KCaM_1_1
%     y(14) = KCaM_1_2
%     y(15) = KCaM_2_0
%     y(16) = KCaM_2_1
%     y(17) = KCaM_2_2
%     y(18) = KCaMcomplex_0_0_0_1
%     y(19) = KCaMcomplex_0_0_0_2
%     y(20) = KCaMcomplex_0_0_1_0
%     y(21) = KCaMcomplex_0_0_1_1
%     y(22) = KCaMcomplex_0_0_1_2
%     y(23) = KCaMcomplex_0_0_2_0
%     y(24) = KCaMcomplex_0_0_2_1
%     y(25) = KCaMcomplex_0_0_2_2
%     y(26) = KCaMcomplex_0_1_0_2
%     y(27) = KCaMcomplex_0_1_1_0
%     y(28) = KCaMcomplex_0_1_1_1
%     y(29) = KCaMcomplex_0_1_1_2
%     y(30) = KCaMcomplex_0_1_2_0
%     y(31) = KCaMcomplex_0_1_2_1
%     y(32) = KCaMcomplex_0_1_2_2
%     y(33) = KCaMcomplex_0_2_1_0
%     y(34) = KCaMcomplex_0_2_1_1
%     y(35) = KCaMcomplex_0_2_1_2
%     y(36) = KCaMcomplex_0_2_2_0
%     y(37) = KCaMcomplex_0_2_2_1
%     y(38) = KCaMcomplex_0_2_2_2
%     y(39) = KCaMcomplex_1_0_1_1
%     y(40) = KCaMcomplex_1_0_1_2
%     y(41) = KCaMcomplex_1_0_2_0
%     y(42) = KCaMcomplex_1_0_2_1
%     y(43) = KCaMcomplex_1_0_2_2
%     y(44) = KCaMcomplex_1_1_1_2
%     y(45) = KCaMcomplex_1_1_2_0
%     y(46) = KCaMcomplex_1_1_2_1
%     y(47) = KCaMcomplex_1_1_2_2
%     y(48) = KCaMcomplex_1_2_2_0
%     y(49) = KCaMcomplex_1_2_2_1
%     y(50) = KCaMcomplex_1_2_2_2
%     y(51) = KCaMcomplex_2_0_2_1
%     y(52) = KCaMcomplex_2_0_2_2
%     y(53) = KCaMcomplex_2_1_2_2
%     y(54) = KCaMcomplex_0_0_0_0
%     y(55) = KCaMcomplex_0_1_0_1
%     y(56) = KCaMcomplex_0_2_0_2
%     y(57) = KCaMcomplex_1_0_1_0
%     y(58) = KCaMcomplex_1_1_1_1
%     y(59) = KCaMcomplex_1_2_1_2
%     y(60) = KCaMcomplex_2_0_2_0
%     y(61) = KCaMcomplex_2_1_2_1
%     y(62) = KCaMcomplex_2_2_2_2
%     y(63) = pKCaM_0_0
%     y(64) = pKCaM_0_1
%     y(65) = pKCaM_0_2
%     y(66) = pKCaM_1_0
%     y(67) = pKCaM_1_1
%     y(68) = pKCaM_1_2
%     y(69) = pKCaM_2_0
%     y(70) = pKCaM_2_1
%     y(71) = pKCaM_2_2
%     y(72) = pKCaMcomplex_0_0_0_0
%     y(73) = pKCaMcomplex_0_0_0_1
%     y(74) = pKCaMcomplex_0_0_0_2
%     y(75) = pKCaMcomplex_0_0_1_0
%     y(76) = pKCaMcomplex_0_0_1_1
%     y(77) = pKCaMcomplex_0_0_1_2
%     y(78) = pKCaMcomplex_0_0_2_0
%     y(79) = pKCaMcomplex_0_0_2_1
%     y(80) = pKCaMcomplex_0_0_2_2
%     y(81) = pKCaMcomplex_0_1_0_0
%     y(82) = pKCaMcomplex_0_1_0_1
%     y(83) = pKCaMcomplex_0_1_0_2
%     y(84) = pKCaMcomplex_0_1_1_0
%     y(85) = pKCaMcomplex_0_1_1_1
%     y(86) = pKCaMcomplex_0_1_1_2
%     y(87) = pKCaMcomplex_0_1_2_0
%     y(88) = pKCaMcomplex_0_1_2_1
%     y(89) = pKCaMcomplex_0_1_2_2
%     y(90) = pKCaMcomplex_0_2_0_0
%     y(91) = pKCaMcomplex_0_2_0_1
%     y(92) = pKCaMcomplex_0_2_0_2
%     y(93) = pKCaMcomplex_0_2_1_0
%     y(94) = pKCaMcomplex_0_2_1_1
%     y(95) = pKCaMcomplex_0_2_1_2
%     y(96) = pKCaMcomplex_0_2_2_0
%     y(97) = pKCaMcomplex_0_2_2_1
%     y(98) = pKCaMcomplex_0_2_2_2
%     y(99) = pKCaMcomplex_1_0_0_0
%     y(100) = pKCaMcomplex_1_0_0_1
%     y(101) = pKCaMcomplex_1_0_0_2
%     y(102) = pKCaMcomplex_1_0_1_0
%     y(103) = pKCaMcomplex_1_0_1_1
%     y(104) = pKCaMcomplex_1_0_1_2
%     y(105) = pKCaMcomplex_1_0_2_0
%     y(106) = pKCaMcomplex_1_0_2_1
%     y(107) = pKCaMcomplex_1_0_2_2
%     y(108) = pKCaMcomplex_1_1_0_0
%     y(109) = pKCaMcomplex_1_1_0_1
%     y(110) = pKCaMcomplex_1_1_0_2
%     y(111) = pKCaMcomplex_1_1_1_0
%     y(112) = pKCaMcomplex_1_1_1_1
%     y(113) = pKCaMcomplex_1_1_1_2
%     y(114) = pKCaMcomplex_1_1_2_0
%     y(115) = pKCaMcomplex_1_1_2_1
%     y(116) = pKCaMcomplex_1_1_2_2
%     y(117) = pKCaMcomplex_1_2_0_0
%     y(118) = pKCaMcomplex_1_2_0_1
%     y(119) = pKCaMcomplex_1_2_0_2
%     y(120) = pKCaMcomplex_1_2_1_0
%     y(121) = pKCaMcomplex_1_2_1_1
%     y(122) = pKCaMcomplex_1_2_1_2
%     y(123) = pKCaMcomplex_1_2_2_0
%     y(124) = pKCaMcomplex_1_2_2_1
%     y(125) = pKCaMcomplex_1_2_2_2
%     y(126) = pKCaMcomplex_2_0_0_0
%     y(127) = pKCaMcomplex_2_0_0_1
%     y(128) = pKCaMcomplex_2_0_0_2
%     y(129) = pKCaMcomplex_2_0_1_0
%     y(130) = pKCaMcomplex_2_0_1_1
%     y(131) = pKCaMcomplex_2_0_1_2
%     y(132) = pKCaMcomplex_2_0_2_0
%     y(133) = pKCaMcomplex_2_0_2_1
%     y(134) = pKCaMcomplex_2_0_2_2
%     y(135) = pKCaMcomplex_2_1_0_0
%     y(136) = pKCaMcomplex_2_1_0_1
%     y(137) = pKCaMcomplex_2_1_0_2
%     y(138) = pKCaMcomplex_2_1_1_0
%     y(139) = pKCaMcomplex_2_1_1_1
%     y(140) = pKCaMcomplex_2_1_1_2
%     y(141) = pKCaMcomplex_2_1_2_0
%     y(142) = pKCaMcomplex_2_1_2_1
%     y(143) = pKCaMcomplex_2_1_2_2
%     y(144) = pKCaMcomplex_2_2_0_0
%     y(145) = pKCaMcomplex_2_2_0_1
%     y(146) = pKCaMcomplex_2_2_0_2
%     y(147) = pKCaMcomplex_2_2_1_0
%     y(148) = pKCaMcomplex_2_2_1_1
%     y(149) = pKCaMcomplex_2_2_1_2
%     y(150) = pKCaMcomplex_2_2_2_0
%     y(151) = pKCaMcomplex_2_2_2_1
%     y(152) = pKCaMcomplex_2_2_2_2
%     y(153) = CaM_0_0
%     y(154) = KaMe
%     y(155) = Ca
%     y(156) = k1Con
%     y(157) = k1Coff
%     y(158) = k2Con
%     y(159) = k2Coff
%     y(160) = k1Non
%     y(161) = k1Noff
%     y(162) = k2Non
%     y(163) = k2Noff
%     y(164) = kK1Con
%     y(165) = kK1Coff
%     y(166) = kK2Con
%     y(167) = kK2Coff
%     y(168) = kK1Non
%     y(169) = kK1Noff
%     y(170) = kK2Non
%     y(171) = kK2Noff
%     y(172) = kCaM0on
%     y(173) = kCaM0off
%     y(174) = kCaM1Con
%     y(175) = kCaM1Coff
%     y(176) = kCaM2Con
%     y(177) = kCaM2Coff
%     y(178) = kCaM2C1Non
%     y(179) = kCaM2C1Noff
%     y(180) = kCaM1C1Non
%     y(181) = kCaM1C1Noff
%     y(182) = kCaM4on
%     y(183) = kCaM4off
%     y(184) = kCaM1Non
%     y(185) = kCaM1Noff
%     y(186) = kCaM1C2Non
%     y(187) = kCaM1C2Noff
%     y(188) = kCaM2Non
%     y(189) = kCaM2Noff
%     y(190) = k2CaMKon
%     y(191) = k2CaMKoff
%     y(192) = kpCaM0
%     y(193) = kpCaM1C
%     y(194) = kpCaM2C
%     y(195) = kpCaM2C1N
%     y(196) = kpCaM1C1N
%     y(197) = kpCaM4
%     y(198) = kpCaM1N
%     y(199) = kpCaM1C2N
%     y(200) = kpCaM2N
%     y(201) = caminit
%     y(202) = ckinit
%     y(203) = cainit


function MODEL1001150000_curry
[T,Y]=ode45(@ode,[0 100.0],[  0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 30.0 80.0 100.0 4.0 40.0 10.0 9.25 100.0 2500.0 150.0 750.0 44.0 33.0 44.0 2.7 75.0 300.0 76.0 33.0 0.0038 5.5 0.059 6.8 0.92 6.8 5.2 3.8 3.3 3.4 30.0 1.7 0.022 3.1 1.9 1.9 0.1 1.7 50.0 60.0 0.0 0.032 0.064 0.124 0.094 0.96 0.06 0.154 0.12 30.0 80.0 100.0]);
 function array =  getSpecies(y)
array =  Y(:,y);
end

% Output contains population trajectory of all species:
plot(T,Y(:,1));
hold on;
plot(T,Y(:,2));
hold on;
plot(T,Y(:,3));
hold on;
plot(T,Y(:,4));
hold on;
plot(T,Y(:,5));
hold on;
plot(T,Y(:,6));
hold on;
plot(T,Y(:,7));
hold on;
plot(T,Y(:,8));
hold on;
plot(T,Y(:,9));
hold on;
plot(T,Y(:,10));
hold on;
plot(T,Y(:,11));
hold on;
plot(T,Y(:,12));
hold on;
plot(T,Y(:,13));
hold on;
plot(T,Y(:,14));
hold on;
plot(T,Y(:,15));
hold on;
plot(T,Y(:,16));
hold on;
plot(T,Y(:,17));
hold on;
plot(T,Y(:,18));
hold on;
plot(T,Y(:,19));
hold on;
plot(T,Y(:,20));
hold on;
plot(T,Y(:,21));
hold on;
plot(T,Y(:,22));
hold on;
plot(T,Y(:,23));
hold on;
plot(T,Y(:,24));
hold on;
plot(T,Y(:,25));
hold on;
plot(T,Y(:,26));
hold on;
plot(T,Y(:,27));
hold on;
plot(T,Y(:,28));
hold on;
plot(T,Y(:,29));
hold on;
plot(T,Y(:,30));
hold on;
plot(T,Y(:,31));
hold on;
plot(T,Y(:,32));
hold on;
plot(T,Y(:,33));
hold on;
plot(T,Y(:,34));
hold on;
plot(T,Y(:,35));
hold on;
plot(T,Y(:,36));
hold on;
plot(T,Y(:,37));
hold on;
plot(T,Y(:,38));
hold on;
plot(T,Y(:,39));
hold on;
plot(T,Y(:,40));
hold on;
plot(T,Y(:,41));
hold on;
plot(T,Y(:,42));
hold on;
plot(T,Y(:,43));
hold on;
plot(T,Y(:,44));
hold on;
plot(T,Y(:,45));
hold on;
plot(T,Y(:,46));
hold on;
plot(T,Y(:,47));
hold on;
plot(T,Y(:,48));
hold on;
plot(T,Y(:,49));
hold on;
plot(T,Y(:,50));
hold on;
plot(T,Y(:,51));
hold on;
plot(T,Y(:,52));
hold on;
plot(T,Y(:,53));
hold on;
plot(T,Y(:,54));
hold on;
plot(T,Y(:,55));
hold on;
plot(T,Y(:,56));
hold on;
plot(T,Y(:,57));
hold on;
plot(T,Y(:,58));
hold on;
plot(T,Y(:,59));
hold on;
plot(T,Y(:,60));
hold on;
plot(T,Y(:,61));
hold on;
plot(T,Y(:,62));
hold on;
plot(T,Y(:,63));
hold on;
plot(T,Y(:,64));
hold on;
plot(T,Y(:,65));
hold on;
plot(T,Y(:,66));
hold on;
plot(T,Y(:,67));
hold on;
plot(T,Y(:,68));
hold on;
plot(T,Y(:,69));
hold on;
plot(T,Y(:,70));
hold on;
plot(T,Y(:,71));
hold on;
plot(T,Y(:,72));
hold on;
plot(T,Y(:,73));
hold on;
plot(T,Y(:,74));
hold on;
plot(T,Y(:,75));
hold on;
plot(T,Y(:,76));
hold on;
plot(T,Y(:,77));
hold on;
plot(T,Y(:,78));
hold on;
plot(T,Y(:,79));
hold on;
plot(T,Y(:,80));
hold on;
plot(T,Y(:,81));
hold on;
plot(T,Y(:,82));
hold on;
plot(T,Y(:,83));
hold on;
plot(T,Y(:,84));
hold on;
plot(T,Y(:,85));
hold on;
plot(T,Y(:,86));
hold on;
plot(T,Y(:,87));
hold on;
plot(T,Y(:,88));
hold on;
plot(T,Y(:,89));
hold on;
plot(T,Y(:,90));
hold on;
plot(T,Y(:,91));
hold on;
plot(T,Y(:,92));
hold on;
plot(T,Y(:,93));
hold on;
plot(T,Y(:,94));
hold on;
plot(T,Y(:,95));
hold on;
plot(T,Y(:,96));
hold on;
plot(T,Y(:,97));
hold on;
plot(T,Y(:,98));
hold on;
plot(T,Y(:,99));
hold on;
plot(T,Y(:,100));
hold on;
plot(T,Y(:,101));
hold on;
plot(T,Y(:,102));
hold on;
plot(T,Y(:,103));
hold on;
plot(T,Y(:,104));
hold on;
plot(T,Y(:,105));
hold on;
plot(T,Y(:,106));
hold on;
plot(T,Y(:,107));
hold on;
plot(T,Y(:,108));
hold on;
plot(T,Y(:,109));
hold on;
plot(T,Y(:,110));
hold on;
plot(T,Y(:,111));
hold on;
plot(T,Y(:,112));
hold on;
plot(T,Y(:,113));
hold on;
plot(T,Y(:,114));
hold on;
plot(T,Y(:,115));
hold on;
plot(T,Y(:,116));
hold on;
plot(T,Y(:,117));
hold on;
plot(T,Y(:,118));
hold on;
plot(T,Y(:,119));
hold on;
plot(T,Y(:,120));
hold on;
plot(T,Y(:,121));
hold on;
plot(T,Y(:,122));
hold on;
plot(T,Y(:,123));
hold on;
plot(T,Y(:,124));
hold on;
plot(T,Y(:,125));
hold on;
plot(T,Y(:,126));
hold on;
plot(T,Y(:,127));
hold on;
plot(T,Y(:,128));
hold on;
plot(T,Y(:,129));
hold on;
plot(T,Y(:,130));
hold on;
plot(T,Y(:,131));
hold on;
plot(T,Y(:,132));
hold on;
plot(T,Y(:,133));
hold on;
plot(T,Y(:,134));
hold on;
plot(T,Y(:,135));
hold on;
plot(T,Y(:,136));
hold on;
plot(T,Y(:,137));
hold on;
plot(T,Y(:,138));
hold on;
plot(T,Y(:,139));
hold on;
plot(T,Y(:,140));
hold on;
plot(T,Y(:,141));
hold on;
plot(T,Y(:,142));
hold on;
plot(T,Y(:,143));
hold on;
plot(T,Y(:,144));
hold on;
plot(T,Y(:,145));
hold on;
plot(T,Y(:,146));
hold on;
plot(T,Y(:,147));
hold on;
plot(T,Y(:,148));
hold on;
plot(T,Y(:,149));
hold on;
plot(T,Y(:,150));
hold on;
plot(T,Y(:,151));
hold on;
plot(T,Y(:,152));
hold on;
plot(T,Y(:,153));
hold on;
plot(T,Y(:,154));
hold on;
plot(T,Y(:,155));
hold on;
plot(T,Y(:,156));
hold on;
plot(T,Y(:,157));
hold on;
plot(T,Y(:,158));
hold on;
plot(T,Y(:,159));
hold on;
plot(T,Y(:,160));
hold on;
plot(T,Y(:,161));
hold on;
plot(T,Y(:,162));
hold on;
plot(T,Y(:,163));
hold on;
plot(T,Y(:,164));
hold on;
plot(T,Y(:,165));
hold on;
plot(T,Y(:,166));
hold on;
plot(T,Y(:,167));
hold on;
plot(T,Y(:,168));
hold on;
plot(T,Y(:,169));
hold on;
plot(T,Y(:,170));
hold on;
plot(T,Y(:,171));
hold on;
plot(T,Y(:,172));
hold on;
plot(T,Y(:,173));
hold on;
plot(T,Y(:,174));
hold on;
plot(T,Y(:,175));
hold on;
plot(T,Y(:,176));
hold on;
plot(T,Y(:,177));
hold on;
plot(T,Y(:,178));
hold on;
plot(T,Y(:,179));
hold on;
plot(T,Y(:,180));
hold on;
plot(T,Y(:,181));
hold on;
plot(T,Y(:,182));
hold on;
plot(T,Y(:,183));
hold on;
plot(T,Y(:,184));
hold on;
plot(T,Y(:,185));
hold on;
plot(T,Y(:,186));
hold on;
plot(T,Y(:,187));
hold on;
plot(T,Y(:,188));
hold on;
plot(T,Y(:,189));
hold on;
plot(T,Y(:,190));
hold on;
plot(T,Y(:,191));
hold on;
plot(T,Y(:,192));
hold on;
plot(T,Y(:,193));
hold on;
plot(T,Y(:,194));
hold on;
plot(T,Y(:,195));
hold on;
plot(T,Y(:,196));
hold on;
plot(T,Y(:,197));
hold on;
plot(T,Y(:,198));
hold on;
plot(T,Y(:,199));
hold on;
plot(T,Y(:,200));
hold on;
plot(T,Y(:,201));
hold on;
plot(T,Y(:,202));
hold on;
plot(T,Y(:,203));
hold on;
xlabel('time');
ylabel('value');
legend('CaM_0_1','CaM_0_2','CaM_1_0','CaM_1_1','CaM_1_2','CaM_2_0','CaM_2_1','CaM_2_2','KCaM_0_0','KCaM_0_1','KCaM_0_2','KCaM_1_0','KCaM_1_1','KCaM_1_2','KCaM_2_0','KCaM_2_1','KCaM_2_2','KCaMcomplex_0_0_0_1','KCaMcomplex_0_0_0_2','KCaMcomplex_0_0_1_0','KCaMcomplex_0_0_1_1','KCaMcomplex_0_0_1_2','KCaMcomplex_0_0_2_0','KCaMcomplex_0_0_2_1','KCaMcomplex_0_0_2_2','KCaMcomplex_0_1_0_2','KCaMcomplex_0_1_1_0','KCaMcomplex_0_1_1_1','KCaMcomplex_0_1_1_2','KCaMcomplex_0_1_2_0','KCaMcomplex_0_1_2_1','KCaMcomplex_0_1_2_2','KCaMcomplex_0_2_1_0','KCaMcomplex_0_2_1_1','KCaMcomplex_0_2_1_2','KCaMcomplex_0_2_2_0','KCaMcomplex_0_2_2_1','KCaMcomplex_0_2_2_2','KCaMcomplex_1_0_1_1','KCaMcomplex_1_0_1_2','KCaMcomplex_1_0_2_0','KCaMcomplex_1_0_2_1','KCaMcomplex_1_0_2_2','KCaMcomplex_1_1_1_2','KCaMcomplex_1_1_2_0','KCaMcomplex_1_1_2_1','KCaMcomplex_1_1_2_2','KCaMcomplex_1_2_2_0','KCaMcomplex_1_2_2_1','KCaMcomplex_1_2_2_2','KCaMcomplex_2_0_2_1','KCaMcomplex_2_0_2_2','KCaMcomplex_2_1_2_2','KCaMcomplex_0_0_0_0','KCaMcomplex_0_1_0_1','KCaMcomplex_0_2_0_2','KCaMcomplex_1_0_1_0','KCaMcomplex_1_1_1_1','KCaMcomplex_1_2_1_2','KCaMcomplex_2_0_2_0','KCaMcomplex_2_1_2_1','KCaMcomplex_2_2_2_2','pKCaM_0_0','pKCaM_0_1','pKCaM_0_2','pKCaM_1_0','pKCaM_1_1','pKCaM_1_2','pKCaM_2_0','pKCaM_2_1','pKCaM_2_2','pKCaMcomplex_0_0_0_0','pKCaMcomplex_0_0_0_1','pKCaMcomplex_0_0_0_2','pKCaMcomplex_0_0_1_0','pKCaMcomplex_0_0_1_1','pKCaMcomplex_0_0_1_2','pKCaMcomplex_0_0_2_0','pKCaMcomplex_0_0_2_1','pKCaMcomplex_0_0_2_2','pKCaMcomplex_0_1_0_0','pKCaMcomplex_0_1_0_1','pKCaMcomplex_0_1_0_2','pKCaMcomplex_0_1_1_0','pKCaMcomplex_0_1_1_1','pKCaMcomplex_0_1_1_2','pKCaMcomplex_0_1_2_0','pKCaMcomplex_0_1_2_1','pKCaMcomplex_0_1_2_2','pKCaMcomplex_0_2_0_0','pKCaMcomplex_0_2_0_1','pKCaMcomplex_0_2_0_2','pKCaMcomplex_0_2_1_0','pKCaMcomplex_0_2_1_1','pKCaMcomplex_0_2_1_2','pKCaMcomplex_0_2_2_0','pKCaMcomplex_0_2_2_1','pKCaMcomplex_0_2_2_2','pKCaMcomplex_1_0_0_0','pKCaMcomplex_1_0_0_1','pKCaMcomplex_1_0_0_2','pKCaMcomplex_1_0_1_0','pKCaMcomplex_1_0_1_1','pKCaMcomplex_1_0_1_2','pKCaMcomplex_1_0_2_0','pKCaMcomplex_1_0_2_1','pKCaMcomplex_1_0_2_2','pKCaMcomplex_1_1_0_0','pKCaMcomplex_1_1_0_1','pKCaMcomplex_1_1_0_2','pKCaMcomplex_1_1_1_0','pKCaMcomplex_1_1_1_1','pKCaMcomplex_1_1_1_2','pKCaMcomplex_1_1_2_0','pKCaMcomplex_1_1_2_1','pKCaMcomplex_1_1_2_2','pKCaMcomplex_1_2_0_0','pKCaMcomplex_1_2_0_1','pKCaMcomplex_1_2_0_2','pKCaMcomplex_1_2_1_0','pKCaMcomplex_1_2_1_1','pKCaMcomplex_1_2_1_2','pKCaMcomplex_1_2_2_0','pKCaMcomplex_1_2_2_1','pKCaMcomplex_1_2_2_2','pKCaMcomplex_2_0_0_0','pKCaMcomplex_2_0_0_1','pKCaMcomplex_2_0_0_2','pKCaMcomplex_2_0_1_0','pKCaMcomplex_2_0_1_1','pKCaMcomplex_2_0_1_2','pKCaMcomplex_2_0_2_0','pKCaMcomplex_2_0_2_1','pKCaMcomplex_2_0_2_2','pKCaMcomplex_2_1_0_0','pKCaMcomplex_2_1_0_1','pKCaMcomplex_2_1_0_2','pKCaMcomplex_2_1_1_0','pKCaMcomplex_2_1_1_1','pKCaMcomplex_2_1_1_2','pKCaMcomplex_2_1_2_0','pKCaMcomplex_2_1_2_1','pKCaMcomplex_2_1_2_2','pKCaMcomplex_2_2_0_0','pKCaMcomplex_2_2_0_1','pKCaMcomplex_2_2_0_2','pKCaMcomplex_2_2_1_0','pKCaMcomplex_2_2_1_1','pKCaMcomplex_2_2_1_2','pKCaMcomplex_2_2_2_0','pKCaMcomplex_2_2_2_1','pKCaMcomplex_2_2_2_2','CaM_0_0','KaMe','Ca','k1Con','k1Coff','k2Con','k2Coff','k1Non','k1Noff','k2Non','k2Noff','kK1Con','kK1Coff','kK2Con','kK2Coff','kK1Non','kK1Noff','kK2Non','kK2Noff','kCaM0on','kCaM0off','kCaM1Con','kCaM1Coff','kCaM2Con','kCaM2Coff','kCaM2C1Non','kCaM2C1Noff','kCaM1C1Non','kCaM1C1Noff','kCaM4on','kCaM4off','kCaM1Non','kCaM1Noff','kCaM1C2Non','kCaM1C2Noff','kCaM2Non','kCaM2Noff','k2CaMKon','k2CaMKoff','kpCaM0','kpCaM1C','kpCaM2C','kpCaM2C1N','kpCaM1C1N','kpCaM4','kpCaM1N','kpCaM1C2N','kpCaM2N','caminit','ckinit','cainit');
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

  dy=zeros(203,1);

  dy(1) = -pk1Con*y(1)*y(155)*y(156) + pk1Coff*y(4)*y(157) + pk1Non*y(153)*y(155)*y(160) + -pk1Noff*y(1)*y(161) + -pk2Non*y(1)*y(155)*y(162) + pk2Noff*y(2)*y(163) + -pkCaM1Non*y(1)*y(154)*y(184) + pkCaM1Noff*y(10)*y(185);
  dy(2) = -pk1Con*y(2)*y(155)*y(156) + pk1Coff*y(5)*y(157) + pk2Non*y(1)*y(155)*y(162) + -pk2Noff*y(2)*y(163) + -pkCaM2Non*y(2)*y(154)*y(188) + pkCaM2Noff*y(11)*y(189);
  dy(3) = pk1Con*y(153)*y(155)*y(156) + -pk1Coff*y(3)*y(157) + -pk2Con*y(3)*y(155)*y(158) + pk2Coff*y(6)*y(159) + -pk1Non*y(3)*y(155)*y(160) + pk1Noff*y(4)*y(161) + -pkCaM1Con*y(3)*y(154)*y(174) + pkCaM1Coff*y(12)*y(175);
  dy(4) = pk1Con*y(1)*y(155)*y(156) + -pk1Coff*y(4)*y(157) + -pk2Con*y(4)*y(155)*y(158) + pk2Coff*y(7)*y(159) + pk1Non*y(3)*y(155)*y(160) + -pk1Noff*y(4)*y(161) + -pk2Non*y(4)*y(155)*y(162) + pk2Noff*y(5)*y(163) + -pkCaM1C1Non*y(4)*y(154)*y(180) + pkCaM1C1Noff*y(13)*y(181);
  dy(5) = pk1Con*y(2)*y(155)*y(156) + -pk1Coff*y(5)*y(157) + -pk2Con*y(5)*y(155)*y(158) + pk2Coff*y(8)*y(159) + pk2Non*y(4)*y(155)*y(162) + -pk2Noff*y(5)*y(163) + -pkCaM1C2Non*y(5)*y(154)*y(186) + pkCaM1C2Noff*y(14)*y(187);
  dy(6) = pk2Con*y(3)*y(155)*y(158) + -pk2Coff*y(6)*y(159) + -pk1Non*y(6)*y(155)*y(160) + pk1Noff*y(7)*y(161) + -pkCaM2Con*y(6)*y(154)*y(176) + pkCaM2Coff*y(15)*y(177);
  dy(7) = pk2Con*y(4)*y(155)*y(158) + -pk2Coff*y(7)*y(159) + pk1Non*y(6)*y(155)*y(160) + -pk1Noff*y(7)*y(161) + -pk2Non*y(7)*y(155)*y(162) + pk2Noff*y(8)*y(163) + -pkCaM2C1Non*y(7)*y(154)*y(178) + pkCaM2C1Noff*y(16)*y(179);
  dy(8) = pk2Con*y(5)*y(155)*y(158) + -pk2Coff*y(8)*y(159) + pk2Non*y(7)*y(155)*y(162) + -pk2Noff*y(8)*y(163) + -pkCaM4on*y(8)*y(154)*y(182) + pkCaM4off*y(17)*y(183);
  dy(9) = -pkK1Con*y(9)*y(155)*y(164) + pkK1Coff*y(12)*y(165) + -pkK1Non*y(9)*y(155)*y(168) + pkK1Noff*y(10)*y(169) + pkCaM0on*y(153)*y(154)*y(172) + -pkCaM0off*y(9)*y(173) + -pk2CaMKon*y(9)*y(10)*y(190) + pk2CaMKoff*y(18)*y(191) + -pk2CaMKon*y(9)*y(11)*y(190) + pk2CaMKoff*y(19)*y(191) + -pk2CaMKon*y(9)*y(12)*y(190) + pk2CaMKoff*y(20)*y(191) + -pk2CaMKon*y(9)*y(13)*y(190) + pk2CaMKoff*y(21)*y(191) + -pk2CaMKon*y(9)*y(14)*y(190) + pk2CaMKoff*y(22)*y(191) + -pk2CaMKon*y(9)*y(15)*y(190) + pk2CaMKoff*y(23)*y(191) + -pk2CaMKon*y(9)*y(16)*y(190) + pk2CaMKoff*y(24)*y(191) + -pk2CaMKon*y(9)*y(17)*y(190) + pk2CaMKoff*y(25)*y(191) + -2*(pk2CaMKon*y(9)*y(9)*y(190)) + 2*(pk2CaMKoff*y(54)*y(191)) + pkpCaM1N*y(18)*y(198) + pkpCaM2N*y(19)*y(200) + pkpCaM1C*y(20)*y(193) + pkpCaM1C1N*y(21)*y(196) + pkpCaM1C2N*y(22)*y(199) + pkpCaM2C*y(23)*y(194) + pkpCaM2C1N*y(24)*y(195) + pkpCaM4*y(25)*y(197) + pkpCaM0*y(54)*y(192) + -pk2CaMKon*y(9)*y(63)*y(190) + pk2CaMKoff*y(72)*y(191) + -pk2CaMKon*y(9)*y(64)*y(190) + pk2CaMKoff*y(81)*y(191) + -pk2CaMKon*y(9)*y(65)*y(190) + pk2CaMKoff*y(90)*y(191) + -pk2CaMKon*y(9)*y(66)*y(190) + pk2CaMKoff*y(99)*y(191) + -pk2CaMKon*y(9)*y(67)*y(190) + pk2CaMKoff*y(108)*y(191) + -pk2CaMKon*y(9)*y(68)*y(190) + pk2CaMKoff*y(117)*y(191) + -pk2CaMKon*y(9)*y(69)*y(190) + pk2CaMKoff*y(126)*y(191) + -pk2CaMKon*y(9)*y(70)*y(190) + pk2CaMKoff*y(135)*y(191) + -pk2CaMKon*y(9)*y(71)*y(190) + pk2CaMKoff*y(144)*y(191);
  dy(10) = -pkK1Con*y(10)*y(155)*y(164) + pkK1Coff*y(13)*y(165) + pkK1Non*y(9)*y(155)*y(168) + -pkK1Noff*y(10)*y(169) + -pkK2Non*y(10)*y(155)*y(170) + pkK2Noff*y(11)*y(171) + pkCaM1Non*y(1)*y(154)*y(184) + -pkCaM1Noff*y(10)*y(185) + -pk2CaMKon*y(9)*y(10)*y(190) + pk2CaMKoff*y(18)*y(191) + -pk2CaMKon*y(10)*y(11)*y(190) + pk2CaMKoff*y(26)*y(191) + -pk2CaMKon*y(10)*y(12)*y(190) + pk2CaMKoff*y(27)*y(191) + -pk2CaMKon*y(10)*y(13)*y(190) + pk2CaMKoff*y(28)*y(191) + -pk2CaMKon*y(10)*y(14)*y(190) + pk2CaMKoff*y(29)*y(191) + -pk2CaMKon*y(10)*y(15)*y(190) + pk2CaMKoff*y(30)*y(191) + -pk2CaMKon*y(10)*y(16)*y(190) + pk2CaMKoff*y(31)*y(191) + -pk2CaMKon*y(10)*y(17)*y(190) + pk2CaMKoff*y(32)*y(191) + -2*(pk2CaMKon*y(10)*y(10)*y(190)) + 2*(pk2CaMKoff*y(55)*y(191)) + pkpCaM0*y(18)*y(192) + pkpCaM2N*y(26)*y(200) + pkpCaM1C*y(27)*y(193) + pkpCaM1C1N*y(28)*y(196) + pkpCaM1C2N*y(29)*y(199) + pkpCaM2C*y(30)*y(194) + pkpCaM2C1N*y(31)*y(195) + pkpCaM4*y(32)*y(197) + pkpCaM1N*y(55)*y(198) + -pk2CaMKon*y(10)*y(63)*y(190) + pk2CaMKoff*y(73)*y(191) + -pk2CaMKon*y(10)*y(64)*y(190) + pk2CaMKoff*y(82)*y(191) + -pk2CaMKon*y(10)*y(65)*y(190) + pk2CaMKoff*y(91)*y(191) + -pk2CaMKon*y(10)*y(66)*y(190) + pk2CaMKoff*y(100)*y(191) + -pk2CaMKon*y(10)*y(67)*y(190) + pk2CaMKoff*y(109)*y(191) + -pk2CaMKon*y(10)*y(68)*y(190) + pk2CaMKoff*y(118)*y(191) + -pk2CaMKon*y(10)*y(69)*y(190) + pk2CaMKoff*y(127)*y(191) + -pk2CaMKon*y(10)*y(70)*y(190) + pk2CaMKoff*y(136)*y(191) + -pk2CaMKon*y(10)*y(71)*y(190) + pk2CaMKoff*y(145)*y(191);
  dy(11) = -pkK1Con*y(11)*y(155)*y(164) + pkK1Coff*y(14)*y(165) + pkK2Non*y(10)*y(155)*y(170) + -pkK2Noff*y(11)*y(171) + pkCaM2Non*y(2)*y(154)*y(188) + -pkCaM2Noff*y(11)*y(189) + -pk2CaMKon*y(9)*y(11)*y(190) + pk2CaMKoff*y(19)*y(191) + -pk2CaMKon*y(10)*y(11)*y(190) + pk2CaMKoff*y(26)*y(191) + -pk2CaMKon*y(11)*y(12)*y(190) + pk2CaMKoff*y(33)*y(191) + -pk2CaMKon*y(11)*y(13)*y(190) + pk2CaMKoff*y(34)*y(191) + -pk2CaMKon*y(11)*y(14)*y(190) + pk2CaMKoff*y(35)*y(191) + -pk2CaMKon*y(11)*y(15)*y(190) + pk2CaMKoff*y(36)*y(191) + -pk2CaMKon*y(11)*y(16)*y(190) + pk2CaMKoff*y(37)*y(191) + -pk2CaMKon*y(11)*y(17)*y(190) + pk2CaMKoff*y(38)*y(191) + -2*(pk2CaMKon*y(11)*y(11)*y(190)) + 2*(pk2CaMKoff*y(56)*y(191)) + pkpCaM0*y(19)*y(192) + pkpCaM1N*y(26)*y(198) + pkpCaM1C*y(33)*y(193) + pkpCaM1C1N*y(34)*y(196) + pkpCaM1C2N*y(35)*y(199) + pkpCaM2C*y(36)*y(194) + pkpCaM2C1N*y(37)*y(195) + pkpCaM4*y(38)*y(197) + pkpCaM2N*y(56)*y(200) + -pk2CaMKon*y(11)*y(63)*y(190) + pk2CaMKoff*y(74)*y(191) + -pk2CaMKon*y(11)*y(64)*y(190) + pk2CaMKoff*y(83)*y(191) + -pk2CaMKon*y(11)*y(65)*y(190) + pk2CaMKoff*y(92)*y(191) + -pk2CaMKon*y(11)*y(66)*y(190) + pk2CaMKoff*y(101)*y(191) + -pk2CaMKon*y(11)*y(67)*y(190) + pk2CaMKoff*y(110)*y(191) + -pk2CaMKon*y(11)*y(68)*y(190) + pk2CaMKoff*y(119)*y(191) + -pk2CaMKon*y(11)*y(69)*y(190) + pk2CaMKoff*y(128)*y(191) + -pk2CaMKon*y(11)*y(70)*y(190) + pk2CaMKoff*y(137)*y(191) + -pk2CaMKon*y(11)*y(71)*y(190) + pk2CaMKoff*y(146)*y(191);
  dy(12) = pkK1Con*y(9)*y(155)*y(164) + -pkK1Coff*y(12)*y(165) + -pkK2Con*y(12)*y(155)*y(166) + pkK2Coff*y(15)*y(167) + -pkK1Non*y(12)*y(155)*y(168) + pkK1Noff*y(13)*y(169) + pkCaM1Con*y(3)*y(154)*y(174) + -pkCaM1Coff*y(12)*y(175) + -pk2CaMKon*y(9)*y(12)*y(190) + pk2CaMKoff*y(20)*y(191) + -pk2CaMKon*y(10)*y(12)*y(190) + pk2CaMKoff*y(27)*y(191) + -pk2CaMKon*y(11)*y(12)*y(190) + pk2CaMKoff*y(33)*y(191) + -pk2CaMKon*y(12)*y(13)*y(190) + pk2CaMKoff*y(39)*y(191) + -pk2CaMKon*y(12)*y(14)*y(190) + pk2CaMKoff*y(40)*y(191) + -pk2CaMKon*y(12)*y(15)*y(190) + pk2CaMKoff*y(41)*y(191) + -pk2CaMKon*y(12)*y(16)*y(190) + pk2CaMKoff*y(42)*y(191) + -pk2CaMKon*y(12)*y(17)*y(190) + pk2CaMKoff*y(43)*y(191) + -2*(pk2CaMKon*y(12)*y(12)*y(190)) + 2*(pk2CaMKoff*y(57)*y(191)) + pkpCaM0*y(20)*y(192) + pkpCaM1N*y(27)*y(198) + pkpCaM2N*y(33)*y(200) + pkpCaM1C1N*y(39)*y(196) + pkpCaM1C2N*y(40)*y(199) + pkpCaM2C*y(41)*y(194) + pkpCaM2C1N*y(42)*y(195) + pkpCaM4*y(43)*y(197) + pkpCaM1C*y(57)*y(193) + -pk2CaMKon*y(12)*y(63)*y(190) + pk2CaMKoff*y(75)*y(191) + -pk2CaMKon*y(12)*y(64)*y(190) + pk2CaMKoff*y(84)*y(191) + -pk2CaMKon*y(12)*y(65)*y(190) + pk2CaMKoff*y(93)*y(191) + -pk2CaMKon*y(12)*y(66)*y(190) + pk2CaMKoff*y(102)*y(191) + -pk2CaMKon*y(12)*y(67)*y(190) + pk2CaMKoff*y(111)*y(191) + -pk2CaMKon*y(12)*y(68)*y(190) + pk2CaMKoff*y(120)*y(191) + -pk2CaMKon*y(12)*y(69)*y(190) + pk2CaMKoff*y(129)*y(191) + -pk2CaMKon*y(12)*y(70)*y(190) + pk2CaMKoff*y(138)*y(191) + -pk2CaMKon*y(12)*y(71)*y(190) + pk2CaMKoff*y(147)*y(191);
  dy(13) = pkK1Con*y(10)*y(155)*y(164) + -pkK1Coff*y(13)*y(165) + -pkK2Con*y(13)*y(155)*y(166) + pkK2Coff*y(16)*y(167) + pkK1Non*y(12)*y(155)*y(168) + -pkK1Noff*y(13)*y(169) + -pkK2Non*y(13)*y(155)*y(170) + pkK2Noff*y(14)*y(171) + pkCaM1C1Non*y(4)*y(154)*y(180) + -pkCaM1C1Noff*y(13)*y(181) + -pk2CaMKon*y(9)*y(13)*y(190) + pk2CaMKoff*y(21)*y(191) + -pk2CaMKon*y(10)*y(13)*y(190) + pk2CaMKoff*y(28)*y(191) + -pk2CaMKon*y(11)*y(13)*y(190) + pk2CaMKoff*y(34)*y(191) + -pk2CaMKon*y(12)*y(13)*y(190) + pk2CaMKoff*y(39)*y(191) + -pk2CaMKon*y(13)*y(14)*y(190) + pk2CaMKoff*y(44)*y(191) + -pk2CaMKon*y(13)*y(15)*y(190) + pk2CaMKoff*y(45)*y(191) + -pk2CaMKon*y(13)*y(16)*y(190) + pk2CaMKoff*y(46)*y(191) + -pk2CaMKon*y(13)*y(17)*y(190) + pk2CaMKoff*y(47)*y(191) + -2*(pk2CaMKon*y(13)*y(13)*y(190)) + 2*(pk2CaMKoff*y(58)*y(191)) + pkpCaM0*y(21)*y(192) + pkpCaM1N*y(28)*y(198) + pkpCaM2N*y(34)*y(200) + pkpCaM1C*y(39)*y(193) + pkpCaM1C2N*y(44)*y(199) + pkpCaM2C*y(45)*y(194) + pkpCaM2C1N*y(46)*y(195) + pkpCaM4*y(47)*y(197) + pkpCaM1C1N*y(58)*y(196) + -pk2CaMKon*y(13)*y(63)*y(190) + pk2CaMKoff*y(76)*y(191) + -pk2CaMKon*y(13)*y(64)*y(190) + pk2CaMKoff*y(85)*y(191) + -pk2CaMKon*y(13)*y(65)*y(190) + pk2CaMKoff*y(94)*y(191) + -pk2CaMKon*y(13)*y(66)*y(190) + pk2CaMKoff*y(103)*y(191) + -pk2CaMKon*y(13)*y(67)*y(190) + pk2CaMKoff*y(112)*y(191) + -pk2CaMKon*y(13)*y(68)*y(190) + pk2CaMKoff*y(121)*y(191) + -pk2CaMKon*y(13)*y(69)*y(190) + pk2CaMKoff*y(130)*y(191) + -pk2CaMKon*y(13)*y(70)*y(190) + pk2CaMKoff*y(139)*y(191) + -pk2CaMKon*y(13)*y(71)*y(190) + pk2CaMKoff*y(148)*y(191);
  dy(14) = pkK1Con*y(11)*y(155)*y(164) + -pkK1Coff*y(14)*y(165) + -pkK2Con*y(14)*y(155)*y(166) + pkK2Coff*y(17)*y(167) + pkK2Non*y(13)*y(155)*y(170) + -pkK2Noff*y(14)*y(171) + pkCaM1C2Non*y(5)*y(154)*y(186) + -pkCaM1C2Noff*y(14)*y(187) + -pk2CaMKon*y(9)*y(14)*y(190) + pk2CaMKoff*y(22)*y(191) + -pk2CaMKon*y(10)*y(14)*y(190) + pk2CaMKoff*y(29)*y(191) + -pk2CaMKon*y(11)*y(14)*y(190) + pk2CaMKoff*y(35)*y(191) + -pk2CaMKon*y(12)*y(14)*y(190) + pk2CaMKoff*y(40)*y(191) + -pk2CaMKon*y(13)*y(14)*y(190) + pk2CaMKoff*y(44)*y(191) + -pk2CaMKon*y(14)*y(15)*y(190) + pk2CaMKoff*y(48)*y(191) + -pk2CaMKon*y(14)*y(16)*y(190) + pk2CaMKoff*y(49)*y(191) + -pk2CaMKon*y(14)*y(17)*y(190) + pk2CaMKoff*y(50)*y(191) + -2*(pk2CaMKon*y(14)*y(14)*y(190)) + 2*(pk2CaMKoff*y(59)*y(191)) + pkpCaM0*y(22)*y(192) + pkpCaM1N*y(29)*y(198) + pkpCaM2N*y(35)*y(200) + pkpCaM1C*y(40)*y(193) + pkpCaM1C1N*y(44)*y(196) + pkpCaM2C*y(48)*y(194) + pkpCaM2C1N*y(49)*y(195) + pkpCaM4*y(50)*y(197) + pkpCaM1C2N*y(59)*y(199) + -pk2CaMKon*y(14)*y(63)*y(190) + pk2CaMKoff*y(77)*y(191) + -pk2CaMKon*y(14)*y(64)*y(190) + pk2CaMKoff*y(86)*y(191) + -pk2CaMKon*y(14)*y(65)*y(190) + pk2CaMKoff*y(95)*y(191) + -pk2CaMKon*y(14)*y(66)*y(190) + pk2CaMKoff*y(104)*y(191) + -pk2CaMKon*y(14)*y(67)*y(190) + pk2CaMKoff*y(113)*y(191) + -pk2CaMKon*y(14)*y(68)*y(190) + pk2CaMKoff*y(122)*y(191) + -pk2CaMKon*y(14)*y(69)*y(190) + pk2CaMKoff*y(131)*y(191) + -pk2CaMKon*y(14)*y(70)*y(190) + pk2CaMKoff*y(140)*y(191) + -pk2CaMKon*y(14)*y(71)*y(190) + pk2CaMKoff*y(149)*y(191);
  dy(15) = pkK2Con*y(12)*y(155)*y(166) + -pkK2Coff*y(15)*y(167) + -pkK1Non*y(15)*y(155)*y(168) + pkK1Noff*y(16)*y(169) + pkCaM2Con*y(6)*y(154)*y(176) + -pkCaM2Coff*y(15)*y(177) + -pk2CaMKon*y(9)*y(15)*y(190) + pk2CaMKoff*y(23)*y(191) + -pk2CaMKon*y(10)*y(15)*y(190) + pk2CaMKoff*y(30)*y(191) + -pk2CaMKon*y(11)*y(15)*y(190) + pk2CaMKoff*y(36)*y(191) + -pk2CaMKon*y(12)*y(15)*y(190) + pk2CaMKoff*y(41)*y(191) + -pk2CaMKon*y(13)*y(15)*y(190) + pk2CaMKoff*y(45)*y(191) + -pk2CaMKon*y(14)*y(15)*y(190) + pk2CaMKoff*y(48)*y(191) + -pk2CaMKon*y(15)*y(16)*y(190) + pk2CaMKoff*y(51)*y(191) + -pk2CaMKon*y(15)*y(17)*y(190) + pk2CaMKoff*y(52)*y(191) + -2*(pk2CaMKon*y(15)*y(15)*y(190)) + 2*(pk2CaMKoff*y(60)*y(191)) + pkpCaM0*y(23)*y(192) + pkpCaM1N*y(30)*y(198) + pkpCaM2N*y(36)*y(200) + pkpCaM1C*y(41)*y(193) + pkpCaM1C1N*y(45)*y(196) + pkpCaM1C2N*y(48)*y(199) + pkpCaM2C1N*y(51)*y(195) + pkpCaM4*y(52)*y(197) + pkpCaM2C*y(60)*y(194) + -pk2CaMKon*y(15)*y(63)*y(190) + pk2CaMKoff*y(78)*y(191) + -pk2CaMKon*y(15)*y(64)*y(190) + pk2CaMKoff*y(87)*y(191) + -pk2CaMKon*y(15)*y(65)*y(190) + pk2CaMKoff*y(96)*y(191) + -pk2CaMKon*y(15)*y(66)*y(190) + pk2CaMKoff*y(105)*y(191) + -pk2CaMKon*y(15)*y(67)*y(190) + pk2CaMKoff*y(114)*y(191) + -pk2CaMKon*y(15)*y(68)*y(190) + pk2CaMKoff*y(123)*y(191) + -pk2CaMKon*y(15)*y(69)*y(190) + pk2CaMKoff*y(132)*y(191) + -pk2CaMKon*y(15)*y(70)*y(190) + pk2CaMKoff*y(141)*y(191) + -pk2CaMKon*y(15)*y(71)*y(190) + pk2CaMKoff*y(150)*y(191);
  dy(16) = pkK2Con*y(13)*y(155)*y(166) + -pkK2Coff*y(16)*y(167) + pkK1Non*y(15)*y(155)*y(168) + -pkK1Noff*y(16)*y(169) + -pkK2Non*y(16)*y(155)*y(170) + pkK2Noff*y(17)*y(171) + pkCaM2C1Non*y(7)*y(154)*y(178) + -pkCaM2C1Noff*y(16)*y(179) + -pk2CaMKon*y(9)*y(16)*y(190) + pk2CaMKoff*y(24)*y(191) + -pk2CaMKon*y(10)*y(16)*y(190) + pk2CaMKoff*y(31)*y(191) + -pk2CaMKon*y(11)*y(16)*y(190) + pk2CaMKoff*y(37)*y(191) + -pk2CaMKon*y(12)*y(16)*y(190) + pk2CaMKoff*y(42)*y(191) + -pk2CaMKon*y(13)*y(16)*y(190) + pk2CaMKoff*y(46)*y(191) + -pk2CaMKon*y(14)*y(16)*y(190) + pk2CaMKoff*y(49)*y(191) + -pk2CaMKon*y(15)*y(16)*y(190) + pk2CaMKoff*y(51)*y(191) + -pk2CaMKon*y(16)*y(17)*y(190) + pk2CaMKoff*y(53)*y(191) + -2*(pk2CaMKon*y(16)*y(16)*y(190)) + 2*(pk2CaMKoff*y(61)*y(191)) + pkpCaM0*y(24)*y(192) + pkpCaM1N*y(31)*y(198) + pkpCaM2N*y(37)*y(200) + pkpCaM1C*y(42)*y(193) + pkpCaM1C1N*y(46)*y(196) + pkpCaM1C2N*y(49)*y(199) + pkpCaM2C*y(51)*y(194) + pkpCaM4*y(53)*y(197) + pkpCaM2C1N*y(61)*y(195) + -pk2CaMKon*y(16)*y(63)*y(190) + pk2CaMKoff*y(79)*y(191) + -pk2CaMKon*y(16)*y(64)*y(190) + pk2CaMKoff*y(88)*y(191) + -pk2CaMKon*y(16)*y(65)*y(190) + pk2CaMKoff*y(97)*y(191) + -pk2CaMKon*y(16)*y(66)*y(190) + pk2CaMKoff*y(106)*y(191) + -pk2CaMKon*y(16)*y(67)*y(190) + pk2CaMKoff*y(115)*y(191) + -pk2CaMKon*y(16)*y(68)*y(190) + pk2CaMKoff*y(124)*y(191) + -pk2CaMKon*y(16)*y(69)*y(190) + pk2CaMKoff*y(133)*y(191) + -pk2CaMKon*y(16)*y(70)*y(190) + pk2CaMKoff*y(142)*y(191) + -pk2CaMKon*y(16)*y(71)*y(190) + pk2CaMKoff*y(151)*y(191);
  dy(17) = pkK2Con*y(14)*y(155)*y(166) + -pkK2Coff*y(17)*y(167) + pkK2Non*y(16)*y(155)*y(170) + -pkK2Noff*y(17)*y(171) + pkCaM4on*y(8)*y(154)*y(182) + -pkCaM4off*y(17)*y(183) + -pk2CaMKon*y(9)*y(17)*y(190) + pk2CaMKoff*y(25)*y(191) + -pk2CaMKon*y(10)*y(17)*y(190) + pk2CaMKoff*y(32)*y(191) + -pk2CaMKon*y(11)*y(17)*y(190) + pk2CaMKoff*y(38)*y(191) + -pk2CaMKon*y(12)*y(17)*y(190) + pk2CaMKoff*y(43)*y(191) + -pk2CaMKon*y(13)*y(17)*y(190) + pk2CaMKoff*y(47)*y(191) + -pk2CaMKon*y(14)*y(17)*y(190) + pk2CaMKoff*y(50)*y(191) + -pk2CaMKon*y(15)*y(17)*y(190) + pk2CaMKoff*y(52)*y(191) + -pk2CaMKon*y(16)*y(17)*y(190) + pk2CaMKoff*y(53)*y(191) + -2*(pk2CaMKon*y(17)*y(17)*y(190)) + 2*(pk2CaMKoff*y(62)*y(191)) + pkpCaM0*y(25)*y(192) + pkpCaM1N*y(32)*y(198) + pkpCaM2N*y(38)*y(200) + pkpCaM1C*y(43)*y(193) + pkpCaM1C1N*y(47)*y(196) + pkpCaM1C2N*y(50)*y(199) + pkpCaM2C*y(52)*y(194) + pkpCaM2C1N*y(53)*y(195) + pkpCaM4*y(62)*y(197) + -pk2CaMKon*y(17)*y(63)*y(190) + pk2CaMKoff*y(80)*y(191) + -pk2CaMKon*y(17)*y(64)*y(190) + pk2CaMKoff*y(89)*y(191) + -pk2CaMKon*y(17)*y(65)*y(190) + pk2CaMKoff*y(98)*y(191) + -pk2CaMKon*y(17)*y(66)*y(190) + pk2CaMKoff*y(107)*y(191) + -pk2CaMKon*y(17)*y(67)*y(190) + pk2CaMKoff*y(116)*y(191) + -pk2CaMKon*y(17)*y(68)*y(190) + pk2CaMKoff*y(125)*y(191) + -pk2CaMKon*y(17)*y(69)*y(190) + pk2CaMKoff*y(134)*y(191) + -pk2CaMKon*y(17)*y(70)*y(190) + pk2CaMKoff*y(143)*y(191) + -pk2CaMKon*y(17)*y(71)*y(190) + pk2CaMKoff*y(152)*y(191);
  dy(18) = pk2CaMKon*y(9)*y(10)*y(190) + -pk2CaMKoff*y(18)*y(191) + -pkpCaM0*y(18)*y(192) + -pkpCaM1N*y(18)*y(198);
  dy(19) = pk2CaMKon*y(9)*y(11)*y(190) + -pk2CaMKoff*y(19)*y(191) + -pkpCaM0*y(19)*y(192) + -pkpCaM2N*y(19)*y(200);
  dy(20) = pk2CaMKon*y(9)*y(12)*y(190) + -pk2CaMKoff*y(20)*y(191) + -pkpCaM0*y(20)*y(192) + -pkpCaM1C*y(20)*y(193);
  dy(21) = pk2CaMKon*y(9)*y(13)*y(190) + -pk2CaMKoff*y(21)*y(191) + -pkpCaM0*y(21)*y(192) + -pkpCaM1C1N*y(21)*y(196);
  dy(22) = pk2CaMKon*y(9)*y(14)*y(190) + -pk2CaMKoff*y(22)*y(191) + -pkpCaM0*y(22)*y(192) + -pkpCaM1C2N*y(22)*y(199);
  dy(23) = pk2CaMKon*y(9)*y(15)*y(190) + -pk2CaMKoff*y(23)*y(191) + -pkpCaM0*y(23)*y(192) + -pkpCaM2C*y(23)*y(194);
  dy(24) = pk2CaMKon*y(9)*y(16)*y(190) + -pk2CaMKoff*y(24)*y(191) + -pkpCaM0*y(24)*y(192) + -pkpCaM2C1N*y(24)*y(195);
  dy(25) = pk2CaMKon*y(9)*y(17)*y(190) + -pk2CaMKoff*y(25)*y(191) + -pkpCaM0*y(25)*y(192) + -pkpCaM4*y(25)*y(197);
  dy(26) = pk2CaMKon*y(10)*y(11)*y(190) + -pk2CaMKoff*y(26)*y(191) + -pkpCaM1N*y(26)*y(198) + -pkpCaM2N*y(26)*y(200);
  dy(27) = pk2CaMKon*y(10)*y(12)*y(190) + -pk2CaMKoff*y(27)*y(191) + -pkpCaM1N*y(27)*y(198) + -pkpCaM1C*y(27)*y(193);
  dy(28) = pk2CaMKon*y(10)*y(13)*y(190) + -pk2CaMKoff*y(28)*y(191) + -pkpCaM1N*y(28)*y(198) + -pkpCaM1C1N*y(28)*y(196);
  dy(29) = pk2CaMKon*y(10)*y(14)*y(190) + -pk2CaMKoff*y(29)*y(191) + -pkpCaM1N*y(29)*y(198) + -pkpCaM1C2N*y(29)*y(199);
  dy(30) = pk2CaMKon*y(10)*y(15)*y(190) + -pk2CaMKoff*y(30)*y(191) + -pkpCaM1N*y(30)*y(198) + -pkpCaM2C*y(30)*y(194);
  dy(31) = pk2CaMKon*y(10)*y(16)*y(190) + -pk2CaMKoff*y(31)*y(191) + -pkpCaM1N*y(31)*y(198) + -pkpCaM2C1N*y(31)*y(195);
  dy(32) = pk2CaMKon*y(10)*y(17)*y(190) + -pk2CaMKoff*y(32)*y(191) + -pkpCaM1N*y(32)*y(198) + -pkpCaM4*y(32)*y(197);
  dy(33) = pk2CaMKon*y(11)*y(12)*y(190) + -pk2CaMKoff*y(33)*y(191) + -pkpCaM2N*y(33)*y(200) + -pkpCaM1C*y(33)*y(193);
  dy(34) = pk2CaMKon*y(11)*y(13)*y(190) + -pk2CaMKoff*y(34)*y(191) + -pkpCaM2N*y(34)*y(200) + -pkpCaM1C1N*y(34)*y(196);
  dy(35) = pk2CaMKon*y(11)*y(14)*y(190) + -pk2CaMKoff*y(35)*y(191) + -pkpCaM2N*y(35)*y(200) + -pkpCaM1C2N*y(35)*y(199);
  dy(36) = pk2CaMKon*y(11)*y(15)*y(190) + -pk2CaMKoff*y(36)*y(191) + -pkpCaM2N*y(36)*y(200) + -pkpCaM2C*y(36)*y(194);
  dy(37) = pk2CaMKon*y(11)*y(16)*y(190) + -pk2CaMKoff*y(37)*y(191) + -pkpCaM2N*y(37)*y(200) + -pkpCaM2C1N*y(37)*y(195);
  dy(38) = pk2CaMKon*y(11)*y(17)*y(190) + -pk2CaMKoff*y(38)*y(191) + -pkpCaM2N*y(38)*y(200) + -pkpCaM4*y(38)*y(197);
  dy(39) = pk2CaMKon*y(12)*y(13)*y(190) + -pk2CaMKoff*y(39)*y(191) + -pkpCaM1C*y(39)*y(193) + -pkpCaM1C1N*y(39)*y(196);
  dy(40) = pk2CaMKon*y(12)*y(14)*y(190) + -pk2CaMKoff*y(40)*y(191) + -pkpCaM1C*y(40)*y(193) + -pkpCaM1C2N*y(40)*y(199);
  dy(41) = pk2CaMKon*y(12)*y(15)*y(190) + -pk2CaMKoff*y(41)*y(191) + -pkpCaM1C*y(41)*y(193) + -pkpCaM2C*y(41)*y(194);
  dy(42) = pk2CaMKon*y(12)*y(16)*y(190) + -pk2CaMKoff*y(42)*y(191) + -pkpCaM1C*y(42)*y(193) + -pkpCaM2C1N*y(42)*y(195);
  dy(43) = pk2CaMKon*y(12)*y(17)*y(190) + -pk2CaMKoff*y(43)*y(191) + -pkpCaM1C*y(43)*y(193) + -pkpCaM4*y(43)*y(197);
  dy(44) = pk2CaMKon*y(13)*y(14)*y(190) + -pk2CaMKoff*y(44)*y(191) + -pkpCaM1C1N*y(44)*y(196) + -pkpCaM1C2N*y(44)*y(199);
  dy(45) = pk2CaMKon*y(13)*y(15)*y(190) + -pk2CaMKoff*y(45)*y(191) + -pkpCaM1C1N*y(45)*y(196) + -pkpCaM2C*y(45)*y(194);
  dy(46) = pk2CaMKon*y(13)*y(16)*y(190) + -pk2CaMKoff*y(46)*y(191) + -pkpCaM1C1N*y(46)*y(196) + -pkpCaM2C1N*y(46)*y(195);
  dy(47) = pk2CaMKon*y(13)*y(17)*y(190) + -pk2CaMKoff*y(47)*y(191) + -pkpCaM1C1N*y(47)*y(196) + -pkpCaM4*y(47)*y(197);
  dy(48) = pk2CaMKon*y(14)*y(15)*y(190) + -pk2CaMKoff*y(48)*y(191) + -pkpCaM1C2N*y(48)*y(199) + -pkpCaM2C*y(48)*y(194);
  dy(49) = pk2CaMKon*y(14)*y(16)*y(190) + -pk2CaMKoff*y(49)*y(191) + -pkpCaM1C2N*y(49)*y(199) + -pkpCaM2C1N*y(49)*y(195);
  dy(50) = pk2CaMKon*y(14)*y(17)*y(190) + -pk2CaMKoff*y(50)*y(191) + -pkpCaM1C2N*y(50)*y(199) + -pkpCaM4*y(50)*y(197);
  dy(51) = pk2CaMKon*y(15)*y(16)*y(190) + -pk2CaMKoff*y(51)*y(191) + -pkpCaM2C*y(51)*y(194) + -pkpCaM2C1N*y(51)*y(195);
  dy(52) = pk2CaMKon*y(15)*y(17)*y(190) + -pk2CaMKoff*y(52)*y(191) + -pkpCaM2C*y(52)*y(194) + -pkpCaM4*y(52)*y(197);
  dy(53) = pk2CaMKon*y(16)*y(17)*y(190) + -pk2CaMKoff*y(53)*y(191) + -pkpCaM2C1N*y(53)*y(195) + -pkpCaM4*y(53)*y(197);
  dy(54) = pk2CaMKon*y(9)*y(9)*y(190) + -pk2CaMKoff*y(54)*y(191) + -pkpCaM0*y(54)*y(192);
  dy(55) = pk2CaMKon*y(10)*y(10)*y(190) + -pk2CaMKoff*y(55)*y(191) + -pkpCaM1N*y(55)*y(198);
  dy(56) = pk2CaMKon*y(11)*y(11)*y(190) + -pk2CaMKoff*y(56)*y(191) + -pkpCaM2N*y(56)*y(200);
  dy(57) = pk2CaMKon*y(12)*y(12)*y(190) + -pk2CaMKoff*y(57)*y(191) + -pkpCaM1C*y(57)*y(193);
  dy(58) = pk2CaMKon*y(13)*y(13)*y(190) + -pk2CaMKoff*y(58)*y(191) + -pkpCaM1C1N*y(58)*y(196);
  dy(59) = pk2CaMKon*y(14)*y(14)*y(190) + -pk2CaMKoff*y(59)*y(191) + -pkpCaM1C2N*y(59)*y(199);
  dy(60) = pk2CaMKon*y(15)*y(15)*y(190) + -pk2CaMKoff*y(60)*y(191) + -pkpCaM2C*y(60)*y(194);
  dy(61) = pk2CaMKon*y(16)*y(16)*y(190) + -pk2CaMKoff*y(61)*y(191) + -pkpCaM2C1N*y(61)*y(195);
  dy(62) = pk2CaMKon*y(17)*y(17)*y(190) + -pk2CaMKoff*y(62)*y(191) + -pkpCaM4*y(62)*y(197);
  dy(63) = pkpCaM0*y(18)*y(192) + pkpCaM0*y(19)*y(192) + pkpCaM0*y(20)*y(192) + pkpCaM0*y(21)*y(192) + pkpCaM0*y(22)*y(192) + pkpCaM0*y(23)*y(192) + pkpCaM0*y(24)*y(192) + pkpCaM0*y(25)*y(192) + pkpCaM0*y(54)*y(192) + -pk2CaMKon*y(9)*y(63)*y(190) + pk2CaMKoff*y(72)*y(191) + -pk2CaMKon*y(10)*y(63)*y(190) + pk2CaMKoff*y(73)*y(191) + -pk2CaMKon*y(11)*y(63)*y(190) + pk2CaMKoff*y(74)*y(191) + -pk2CaMKon*y(12)*y(63)*y(190) + pk2CaMKoff*y(75)*y(191) + -pk2CaMKon*y(13)*y(63)*y(190) + pk2CaMKoff*y(76)*y(191) + -pk2CaMKon*y(14)*y(63)*y(190) + pk2CaMKoff*y(77)*y(191) + -pk2CaMKon*y(15)*y(63)*y(190) + pk2CaMKoff*y(78)*y(191) + -pk2CaMKon*y(16)*y(63)*y(190) + pk2CaMKoff*y(79)*y(191) + -pk2CaMKon*y(17)*y(63)*y(190) + pk2CaMKoff*y(80)*y(191) + 2*(pkpCaM0*y(72)*y(192)) + pkpCaM1N*y(73)*y(198) + pkpCaM2N*y(74)*y(200) + pkpCaM1C*y(75)*y(193) + pkpCaM1C1N*y(76)*y(196) + pkpCaM1C2N*y(77)*y(199) + pkpCaM2C*y(78)*y(194) + pkpCaM2C1N*y(79)*y(195) + pkpCaM4*y(80)*y(197) + pkpCaM0*y(81)*y(192) + pkpCaM0*y(90)*y(192) + pkpCaM0*y(99)*y(192) + pkpCaM0*y(108)*y(192) + pkpCaM0*y(117)*y(192) + pkpCaM0*y(126)*y(192) + pkpCaM0*y(135)*y(192) + pkpCaM0*y(144)*y(192);
  dy(64) = pkpCaM1N*y(18)*y(198) + pkpCaM1N*y(26)*y(198) + pkpCaM1N*y(27)*y(198) + pkpCaM1N*y(28)*y(198) + pkpCaM1N*y(29)*y(198) + pkpCaM1N*y(30)*y(198) + pkpCaM1N*y(31)*y(198) + pkpCaM1N*y(32)*y(198) + pkpCaM1N*y(55)*y(198) + -pk2CaMKon*y(9)*y(64)*y(190) + pk2CaMKoff*y(81)*y(191) + -pk2CaMKon*y(10)*y(64)*y(190) + pk2CaMKoff*y(82)*y(191) + -pk2CaMKon*y(11)*y(64)*y(190) + pk2CaMKoff*y(83)*y(191) + -pk2CaMKon*y(12)*y(64)*y(190) + pk2CaMKoff*y(84)*y(191) + -pk2CaMKon*y(13)*y(64)*y(190) + pk2CaMKoff*y(85)*y(191) + -pk2CaMKon*y(14)*y(64)*y(190) + pk2CaMKoff*y(86)*y(191) + -pk2CaMKon*y(15)*y(64)*y(190) + pk2CaMKoff*y(87)*y(191) + -pk2CaMKon*y(16)*y(64)*y(190) + pk2CaMKoff*y(88)*y(191) + -pk2CaMKon*y(17)*y(64)*y(190) + pk2CaMKoff*y(89)*y(191) + pkpCaM1N*y(73)*y(198) + pkpCaM0*y(81)*y(192) + 2*(pkpCaM1N*y(82)*y(198)) + pkpCaM2N*y(83)*y(200) + pkpCaM1C*y(84)*y(193) + pkpCaM1C1N*y(85)*y(196) + pkpCaM1C2N*y(86)*y(199) + pkpCaM2C*y(87)*y(194) + pkpCaM2C1N*y(88)*y(195) + pkpCaM4*y(89)*y(197) + pkpCaM1N*y(91)*y(198) + pkpCaM1N*y(100)*y(198) + pkpCaM1N*y(109)*y(198) + pkpCaM1N*y(118)*y(198) + pkpCaM1N*y(127)*y(198) + pkpCaM1N*y(136)*y(198) + pkpCaM1N*y(145)*y(198);
  dy(65) = pkpCaM2N*y(19)*y(200) + pkpCaM2N*y(26)*y(200) + pkpCaM2N*y(33)*y(200) + pkpCaM2N*y(34)*y(200) + pkpCaM2N*y(35)*y(200) + pkpCaM2N*y(36)*y(200) + pkpCaM2N*y(37)*y(200) + pkpCaM2N*y(38)*y(200) + pkpCaM2N*y(56)*y(200) + -pk2CaMKon*y(9)*y(65)*y(190) + pk2CaMKoff*y(90)*y(191) + -pk2CaMKon*y(10)*y(65)*y(190) + pk2CaMKoff*y(91)*y(191) + -pk2CaMKon*y(11)*y(65)*y(190) + pk2CaMKoff*y(92)*y(191) + -pk2CaMKon*y(12)*y(65)*y(190) + pk2CaMKoff*y(93)*y(191) + -pk2CaMKon*y(13)*y(65)*y(190) + pk2CaMKoff*y(94)*y(191) + -pk2CaMKon*y(14)*y(65)*y(190) + pk2CaMKoff*y(95)*y(191) + -pk2CaMKon*y(15)*y(65)*y(190) + pk2CaMKoff*y(96)*y(191) + -pk2CaMKon*y(16)*y(65)*y(190) + pk2CaMKoff*y(97)*y(191) + -pk2CaMKon*y(17)*y(65)*y(190) + pk2CaMKoff*y(98)*y(191) + pkpCaM2N*y(74)*y(200) + pkpCaM2N*y(83)*y(200) + pkpCaM0*y(90)*y(192) + pkpCaM1N*y(91)*y(198) + 2*(pkpCaM2N*y(92)*y(200)) + pkpCaM1C*y(93)*y(193) + pkpCaM1C1N*y(94)*y(196) + pkpCaM1C2N*y(95)*y(199) + pkpCaM2C*y(96)*y(194) + pkpCaM2C1N*y(97)*y(195) + pkpCaM4*y(98)*y(197) + pkpCaM2N*y(101)*y(200) + pkpCaM2N*y(110)*y(200) + pkpCaM2N*y(119)*y(200) + pkpCaM2N*y(128)*y(200) + pkpCaM2N*y(137)*y(200) + pkpCaM2N*y(146)*y(200);
  dy(66) = pkpCaM1C*y(20)*y(193) + pkpCaM1C*y(27)*y(193) + pkpCaM1C*y(33)*y(193) + pkpCaM1C*y(39)*y(193) + pkpCaM1C*y(40)*y(193) + pkpCaM1C*y(41)*y(193) + pkpCaM1C*y(42)*y(193) + pkpCaM1C*y(43)*y(193) + pkpCaM1C*y(57)*y(193) + -pk2CaMKon*y(9)*y(66)*y(190) + pk2CaMKoff*y(99)*y(191) + -pk2CaMKon*y(10)*y(66)*y(190) + pk2CaMKoff*y(100)*y(191) + -pk2CaMKon*y(11)*y(66)*y(190) + pk2CaMKoff*y(101)*y(191) + -pk2CaMKon*y(12)*y(66)*y(190) + pk2CaMKoff*y(102)*y(191) + -pk2CaMKon*y(13)*y(66)*y(190) + pk2CaMKoff*y(103)*y(191) + -pk2CaMKon*y(14)*y(66)*y(190) + pk2CaMKoff*y(104)*y(191) + -pk2CaMKon*y(15)*y(66)*y(190) + pk2CaMKoff*y(105)*y(191) + -pk2CaMKon*y(16)*y(66)*y(190) + pk2CaMKoff*y(106)*y(191) + -pk2CaMKon*y(17)*y(66)*y(190) + pk2CaMKoff*y(107)*y(191) + pkpCaM1C*y(75)*y(193) + pkpCaM1C*y(84)*y(193) + pkpCaM1C*y(93)*y(193) + pkpCaM0*y(99)*y(192) + pkpCaM1N*y(100)*y(198) + pkpCaM2N*y(101)*y(200) + 2*(pkpCaM1C*y(102)*y(193)) + pkpCaM1C1N*y(103)*y(196) + pkpCaM1C2N*y(104)*y(199) + pkpCaM2C*y(105)*y(194) + pkpCaM2C1N*y(106)*y(195) + pkpCaM4*y(107)*y(197) + pkpCaM1C*y(111)*y(193) + pkpCaM1C*y(120)*y(193) + pkpCaM1C*y(129)*y(193) + pkpCaM1C*y(138)*y(193) + pkpCaM1C*y(147)*y(193);
  dy(67) = pkpCaM1C1N*y(21)*y(196) + pkpCaM1C1N*y(28)*y(196) + pkpCaM1C1N*y(34)*y(196) + pkpCaM1C1N*y(39)*y(196) + pkpCaM1C1N*y(44)*y(196) + pkpCaM1C1N*y(45)*y(196) + pkpCaM1C1N*y(46)*y(196) + pkpCaM1C1N*y(47)*y(196) + pkpCaM1C1N*y(58)*y(196) + -pk2CaMKon*y(9)*y(67)*y(190) + pk2CaMKoff*y(108)*y(191) + -pk2CaMKon*y(10)*y(67)*y(190) + pk2CaMKoff*y(109)*y(191) + -pk2CaMKon*y(11)*y(67)*y(190) + pk2CaMKoff*y(110)*y(191) + -pk2CaMKon*y(12)*y(67)*y(190) + pk2CaMKoff*y(111)*y(191) + -pk2CaMKon*y(13)*y(67)*y(190) + pk2CaMKoff*y(112)*y(191) + -pk2CaMKon*y(14)*y(67)*y(190) + pk2CaMKoff*y(113)*y(191) + -pk2CaMKon*y(15)*y(67)*y(190) + pk2CaMKoff*y(114)*y(191) + -pk2CaMKon*y(16)*y(67)*y(190) + pk2CaMKoff*y(115)*y(191) + -pk2CaMKon*y(17)*y(67)*y(190) + pk2CaMKoff*y(116)*y(191) + pkpCaM1C1N*y(76)*y(196) + pkpCaM1C1N*y(85)*y(196) + pkpCaM1C1N*y(94)*y(196) + pkpCaM1C1N*y(103)*y(196) + pkpCaM0*y(108)*y(192) + pkpCaM1N*y(109)*y(198) + pkpCaM2N*y(110)*y(200) + pkpCaM1C*y(111)*y(193) + 2*(pkpCaM1C1N*y(112)*y(196)) + pkpCaM1C2N*y(113)*y(199) + pkpCaM2C*y(114)*y(194) + pkpCaM2C1N*y(115)*y(195) + pkpCaM4*y(116)*y(197) + pkpCaM1C1N*y(121)*y(196) + pkpCaM1C1N*y(130)*y(196) + pkpCaM1C1N*y(139)*y(196) + pkpCaM1C1N*y(148)*y(196);
  dy(68) = pkpCaM1C2N*y(22)*y(199) + pkpCaM1C2N*y(29)*y(199) + pkpCaM1C2N*y(35)*y(199) + pkpCaM1C2N*y(40)*y(199) + pkpCaM1C2N*y(44)*y(199) + pkpCaM1C2N*y(48)*y(199) + pkpCaM1C2N*y(49)*y(199) + pkpCaM1C2N*y(50)*y(199) + pkpCaM1C2N*y(59)*y(199) + -pk2CaMKon*y(9)*y(68)*y(190) + pk2CaMKoff*y(117)*y(191) + -pk2CaMKon*y(10)*y(68)*y(190) + pk2CaMKoff*y(118)*y(191) + -pk2CaMKon*y(11)*y(68)*y(190) + pk2CaMKoff*y(119)*y(191) + -pk2CaMKon*y(12)*y(68)*y(190) + pk2CaMKoff*y(120)*y(191) + -pk2CaMKon*y(13)*y(68)*y(190) + pk2CaMKoff*y(121)*y(191) + -pk2CaMKon*y(14)*y(68)*y(190) + pk2CaMKoff*y(122)*y(191) + -pk2CaMKon*y(15)*y(68)*y(190) + pk2CaMKoff*y(123)*y(191) + -pk2CaMKon*y(16)*y(68)*y(190) + pk2CaMKoff*y(124)*y(191) + -pk2CaMKon*y(17)*y(68)*y(190) + pk2CaMKoff*y(125)*y(191) + pkpCaM1C2N*y(77)*y(199) + pkpCaM1C2N*y(86)*y(199) + pkpCaM1C2N*y(95)*y(199) + pkpCaM1C2N*y(104)*y(199) + pkpCaM1C2N*y(113)*y(199) + pkpCaM0*y(117)*y(192) + pkpCaM1N*y(118)*y(198) + pkpCaM2N*y(119)*y(200) + pkpCaM1C*y(120)*y(193) + pkpCaM1C1N*y(121)*y(196) + 2*(pkpCaM1C2N*y(122)*y(199)) + pkpCaM2C*y(123)*y(194) + pkpCaM2C1N*y(124)*y(195) + pkpCaM4*y(125)*y(197) + pkpCaM1C2N*y(131)*y(199) + pkpCaM1C2N*y(140)*y(199) + pkpCaM1C2N*y(149)*y(199);
  dy(69) = pkpCaM2C*y(23)*y(194) + pkpCaM2C*y(30)*y(194) + pkpCaM2C*y(36)*y(194) + pkpCaM2C*y(41)*y(194) + pkpCaM2C*y(45)*y(194) + pkpCaM2C*y(48)*y(194) + pkpCaM2C*y(51)*y(194) + pkpCaM2C*y(52)*y(194) + pkpCaM2C*y(60)*y(194) + -pk2CaMKon*y(9)*y(69)*y(190) + pk2CaMKoff*y(126)*y(191) + -pk2CaMKon*y(10)*y(69)*y(190) + pk2CaMKoff*y(127)*y(191) + -pk2CaMKon*y(11)*y(69)*y(190) + pk2CaMKoff*y(128)*y(191) + -pk2CaMKon*y(12)*y(69)*y(190) + pk2CaMKoff*y(129)*y(191) + -pk2CaMKon*y(13)*y(69)*y(190) + pk2CaMKoff*y(130)*y(191) + -pk2CaMKon*y(14)*y(69)*y(190) + pk2CaMKoff*y(131)*y(191) + -pk2CaMKon*y(15)*y(69)*y(190) + pk2CaMKoff*y(132)*y(191) + -pk2CaMKon*y(16)*y(69)*y(190) + pk2CaMKoff*y(133)*y(191) + -pk2CaMKon*y(17)*y(69)*y(190) + pk2CaMKoff*y(134)*y(191) + pkpCaM2C*y(78)*y(194) + pkpCaM2C*y(87)*y(194) + pkpCaM2C*y(96)*y(194) + pkpCaM2C*y(105)*y(194) + pkpCaM2C*y(114)*y(194) + pkpCaM2C*y(123)*y(194) + pkpCaM0*y(126)*y(192) + pkpCaM1N*y(127)*y(198) + pkpCaM2N*y(128)*y(200) + pkpCaM1C*y(129)*y(193) + pkpCaM1C1N*y(130)*y(196) + pkpCaM1C2N*y(131)*y(199) + 2*(pkpCaM2C*y(132)*y(194)) + pkpCaM2C1N*y(133)*y(195) + pkpCaM4*y(134)*y(197) + pkpCaM2C*y(141)*y(194) + pkpCaM2C*y(150)*y(194);
  dy(70) = pkpCaM2C1N*y(24)*y(195) + pkpCaM2C1N*y(31)*y(195) + pkpCaM2C1N*y(37)*y(195) + pkpCaM2C1N*y(42)*y(195) + pkpCaM2C1N*y(46)*y(195) + pkpCaM2C1N*y(49)*y(195) + pkpCaM2C1N*y(51)*y(195) + pkpCaM2C1N*y(53)*y(195) + pkpCaM2C1N*y(61)*y(195) + -pk2CaMKon*y(9)*y(70)*y(190) + pk2CaMKoff*y(135)*y(191) + -pk2CaMKon*y(10)*y(70)*y(190) + pk2CaMKoff*y(136)*y(191) + -pk2CaMKon*y(11)*y(70)*y(190) + pk2CaMKoff*y(137)*y(191) + -pk2CaMKon*y(12)*y(70)*y(190) + pk2CaMKoff*y(138)*y(191) + -pk2CaMKon*y(13)*y(70)*y(190) + pk2CaMKoff*y(139)*y(191) + -pk2CaMKon*y(14)*y(70)*y(190) + pk2CaMKoff*y(140)*y(191) + -pk2CaMKon*y(15)*y(70)*y(190) + pk2CaMKoff*y(141)*y(191) + -pk2CaMKon*y(16)*y(70)*y(190) + pk2CaMKoff*y(142)*y(191) + -pk2CaMKon*y(17)*y(70)*y(190) + pk2CaMKoff*y(143)*y(191) + pkpCaM2C1N*y(79)*y(195) + pkpCaM2C1N*y(88)*y(195) + pkpCaM2C1N*y(97)*y(195) + pkpCaM2C1N*y(106)*y(195) + pkpCaM2C1N*y(115)*y(195) + pkpCaM2C1N*y(124)*y(195) + pkpCaM2C1N*y(133)*y(195) + pkpCaM0*y(135)*y(192) + pkpCaM1N*y(136)*y(198) + pkpCaM2N*y(137)*y(200) + pkpCaM1C*y(138)*y(193) + pkpCaM1C1N*y(139)*y(196) + pkpCaM1C2N*y(140)*y(199) + pkpCaM2C*y(141)*y(194) + 2*(pkpCaM2C1N*y(142)*y(195)) + pkpCaM4*y(143)*y(197) + pkpCaM2C1N*y(151)*y(195);
  dy(71) = pkpCaM4*y(25)*y(197) + pkpCaM4*y(32)*y(197) + pkpCaM4*y(38)*y(197) + pkpCaM4*y(43)*y(197) + pkpCaM4*y(47)*y(197) + pkpCaM4*y(50)*y(197) + pkpCaM4*y(52)*y(197) + pkpCaM4*y(53)*y(197) + pkpCaM4*y(62)*y(197) + -pk2CaMKon*y(9)*y(71)*y(190) + pk2CaMKoff*y(144)*y(191) + -pk2CaMKon*y(10)*y(71)*y(190) + pk2CaMKoff*y(145)*y(191) + -pk2CaMKon*y(11)*y(71)*y(190) + pk2CaMKoff*y(146)*y(191) + -pk2CaMKon*y(12)*y(71)*y(190) + pk2CaMKoff*y(147)*y(191) + -pk2CaMKon*y(13)*y(71)*y(190) + pk2CaMKoff*y(148)*y(191) + -pk2CaMKon*y(14)*y(71)*y(190) + pk2CaMKoff*y(149)*y(191) + -pk2CaMKon*y(15)*y(71)*y(190) + pk2CaMKoff*y(150)*y(191) + -pk2CaMKon*y(16)*y(71)*y(190) + pk2CaMKoff*y(151)*y(191) + -pk2CaMKon*y(17)*y(71)*y(190) + pk2CaMKoff*y(152)*y(191) + pkpCaM4*y(80)*y(197) + pkpCaM4*y(89)*y(197) + pkpCaM4*y(98)*y(197) + pkpCaM4*y(107)*y(197) + pkpCaM4*y(116)*y(197) + pkpCaM4*y(125)*y(197) + pkpCaM4*y(134)*y(197) + pkpCaM4*y(143)*y(197) + pkpCaM0*y(144)*y(192) + pkpCaM1N*y(145)*y(198) + pkpCaM2N*y(146)*y(200) + pkpCaM1C*y(147)*y(193) + pkpCaM1C1N*y(148)*y(196) + pkpCaM1C2N*y(149)*y(199) + pkpCaM2C*y(150)*y(194) + pkpCaM2C1N*y(151)*y(195) + 2*(pkpCaM4*y(152)*y(197));
  dy(72) = pk2CaMKon*y(9)*y(63)*y(190) + -pk2CaMKoff*y(72)*y(191) + -pkpCaM0*y(72)*y(192);
  dy(73) = pk2CaMKon*y(10)*y(63)*y(190) + -pk2CaMKoff*y(73)*y(191) + -pkpCaM1N*y(73)*y(198);
  dy(74) = pk2CaMKon*y(11)*y(63)*y(190) + -pk2CaMKoff*y(74)*y(191) + -pkpCaM2N*y(74)*y(200);
  dy(75) = pk2CaMKon*y(12)*y(63)*y(190) + -pk2CaMKoff*y(75)*y(191) + -pkpCaM1C*y(75)*y(193);
  dy(76) = pk2CaMKon*y(13)*y(63)*y(190) + -pk2CaMKoff*y(76)*y(191) + -pkpCaM1C1N*y(76)*y(196);
  dy(77) = pk2CaMKon*y(14)*y(63)*y(190) + -pk2CaMKoff*y(77)*y(191) + -pkpCaM1C2N*y(77)*y(199);
  dy(78) = pk2CaMKon*y(15)*y(63)*y(190) + -pk2CaMKoff*y(78)*y(191) + -pkpCaM2C*y(78)*y(194);
  dy(79) = pk2CaMKon*y(16)*y(63)*y(190) + -pk2CaMKoff*y(79)*y(191) + -pkpCaM2C1N*y(79)*y(195);
  dy(80) = pk2CaMKon*y(17)*y(63)*y(190) + -pk2CaMKoff*y(80)*y(191) + -pkpCaM4*y(80)*y(197);
  dy(81) = pk2CaMKon*y(9)*y(64)*y(190) + -pk2CaMKoff*y(81)*y(191) + -pkpCaM0*y(81)*y(192);
  dy(82) = pk2CaMKon*y(10)*y(64)*y(190) + -pk2CaMKoff*y(82)*y(191) + -pkpCaM1N*y(82)*y(198);
  dy(83) = pk2CaMKon*y(11)*y(64)*y(190) + -pk2CaMKoff*y(83)*y(191) + -pkpCaM2N*y(83)*y(200);
  dy(84) = pk2CaMKon*y(12)*y(64)*y(190) + -pk2CaMKoff*y(84)*y(191) + -pkpCaM1C*y(84)*y(193);
  dy(85) = pk2CaMKon*y(13)*y(64)*y(190) + -pk2CaMKoff*y(85)*y(191) + -pkpCaM1C1N*y(85)*y(196);
  dy(86) = pk2CaMKon*y(14)*y(64)*y(190) + -pk2CaMKoff*y(86)*y(191) + -pkpCaM1C2N*y(86)*y(199);
  dy(87) = pk2CaMKon*y(15)*y(64)*y(190) + -pk2CaMKoff*y(87)*y(191) + -pkpCaM2C*y(87)*y(194);
  dy(88) = pk2CaMKon*y(16)*y(64)*y(190) + -pk2CaMKoff*y(88)*y(191) + -pkpCaM2C1N*y(88)*y(195);
  dy(89) = pk2CaMKon*y(17)*y(64)*y(190) + -pk2CaMKoff*y(89)*y(191) + -pkpCaM4*y(89)*y(197);
  dy(90) = pk2CaMKon*y(9)*y(65)*y(190) + -pk2CaMKoff*y(90)*y(191) + -pkpCaM0*y(90)*y(192);
  dy(91) = pk2CaMKon*y(10)*y(65)*y(190) + -pk2CaMKoff*y(91)*y(191) + -pkpCaM1N*y(91)*y(198);
  dy(92) = pk2CaMKon*y(11)*y(65)*y(190) + -pk2CaMKoff*y(92)*y(191) + -pkpCaM2N*y(92)*y(200);
  dy(93) = pk2CaMKon*y(12)*y(65)*y(190) + -pk2CaMKoff*y(93)*y(191) + -pkpCaM1C*y(93)*y(193);
  dy(94) = pk2CaMKon*y(13)*y(65)*y(190) + -pk2CaMKoff*y(94)*y(191) + -pkpCaM1C1N*y(94)*y(196);
  dy(95) = pk2CaMKon*y(14)*y(65)*y(190) + -pk2CaMKoff*y(95)*y(191) + -pkpCaM1C2N*y(95)*y(199);
  dy(96) = pk2CaMKon*y(15)*y(65)*y(190) + -pk2CaMKoff*y(96)*y(191) + -pkpCaM2C*y(96)*y(194);
  dy(97) = pk2CaMKon*y(16)*y(65)*y(190) + -pk2CaMKoff*y(97)*y(191) + -pkpCaM2C1N*y(97)*y(195);
  dy(98) = pk2CaMKon*y(17)*y(65)*y(190) + -pk2CaMKoff*y(98)*y(191) + -pkpCaM4*y(98)*y(197);
  dy(99) = pk2CaMKon*y(9)*y(66)*y(190) + -pk2CaMKoff*y(99)*y(191) + -pkpCaM0*y(99)*y(192);
  dy(100) = pk2CaMKon*y(10)*y(66)*y(190) + -pk2CaMKoff*y(100)*y(191) + -pkpCaM1N*y(100)*y(198);
  dy(101) = pk2CaMKon*y(11)*y(66)*y(190) + -pk2CaMKoff*y(101)*y(191) + -pkpCaM2N*y(101)*y(200);
  dy(102) = pk2CaMKon*y(12)*y(66)*y(190) + -pk2CaMKoff*y(102)*y(191) + -pkpCaM1C*y(102)*y(193);
  dy(103) = pk2CaMKon*y(13)*y(66)*y(190) + -pk2CaMKoff*y(103)*y(191) + -pkpCaM1C1N*y(103)*y(196);
  dy(104) = pk2CaMKon*y(14)*y(66)*y(190) + -pk2CaMKoff*y(104)*y(191) + -pkpCaM1C2N*y(104)*y(199);
  dy(105) = pk2CaMKon*y(15)*y(66)*y(190) + -pk2CaMKoff*y(105)*y(191) + -pkpCaM2C*y(105)*y(194);
  dy(106) = pk2CaMKon*y(16)*y(66)*y(190) + -pk2CaMKoff*y(106)*y(191) + -pkpCaM2C1N*y(106)*y(195);
  dy(107) = pk2CaMKon*y(17)*y(66)*y(190) + -pk2CaMKoff*y(107)*y(191) + -pkpCaM4*y(107)*y(197);
  dy(108) = pk2CaMKon*y(9)*y(67)*y(190) + -pk2CaMKoff*y(108)*y(191) + -pkpCaM0*y(108)*y(192);
  dy(109) = pk2CaMKon*y(10)*y(67)*y(190) + -pk2CaMKoff*y(109)*y(191) + -pkpCaM1N*y(109)*y(198);
  dy(110) = pk2CaMKon*y(11)*y(67)*y(190) + -pk2CaMKoff*y(110)*y(191) + -pkpCaM2N*y(110)*y(200);
  dy(111) = pk2CaMKon*y(12)*y(67)*y(190) + -pk2CaMKoff*y(111)*y(191) + -pkpCaM1C*y(111)*y(193);
  dy(112) = pk2CaMKon*y(13)*y(67)*y(190) + -pk2CaMKoff*y(112)*y(191) + -pkpCaM1C1N*y(112)*y(196);
  dy(113) = pk2CaMKon*y(14)*y(67)*y(190) + -pk2CaMKoff*y(113)*y(191) + -pkpCaM1C2N*y(113)*y(199);
  dy(114) = pk2CaMKon*y(15)*y(67)*y(190) + -pk2CaMKoff*y(114)*y(191) + -pkpCaM2C*y(114)*y(194);
  dy(115) = pk2CaMKon*y(16)*y(67)*y(190) + -pk2CaMKoff*y(115)*y(191) + -pkpCaM2C1N*y(115)*y(195);
  dy(116) = pk2CaMKon*y(17)*y(67)*y(190) + -pk2CaMKoff*y(116)*y(191) + -pkpCaM4*y(116)*y(197);
  dy(117) = pk2CaMKon*y(9)*y(68)*y(190) + -pk2CaMKoff*y(117)*y(191) + -pkpCaM0*y(117)*y(192);
  dy(118) = pk2CaMKon*y(10)*y(68)*y(190) + -pk2CaMKoff*y(118)*y(191) + -pkpCaM1N*y(118)*y(198);
  dy(119) = pk2CaMKon*y(11)*y(68)*y(190) + -pk2CaMKoff*y(119)*y(191) + -pkpCaM2N*y(119)*y(200);
  dy(120) = pk2CaMKon*y(12)*y(68)*y(190) + -pk2CaMKoff*y(120)*y(191) + -pkpCaM1C*y(120)*y(193);
  dy(121) = pk2CaMKon*y(13)*y(68)*y(190) + -pk2CaMKoff*y(121)*y(191) + -pkpCaM1C1N*y(121)*y(196);
  dy(122) = pk2CaMKon*y(14)*y(68)*y(190) + -pk2CaMKoff*y(122)*y(191) + -pkpCaM1C2N*y(122)*y(199);
  dy(123) = pk2CaMKon*y(15)*y(68)*y(190) + -pk2CaMKoff*y(123)*y(191) + -pkpCaM2C*y(123)*y(194);
  dy(124) = pk2CaMKon*y(16)*y(68)*y(190) + -pk2CaMKoff*y(124)*y(191) + -pkpCaM2C1N*y(124)*y(195);
  dy(125) = pk2CaMKon*y(17)*y(68)*y(190) + -pk2CaMKoff*y(125)*y(191) + -pkpCaM4*y(125)*y(197);
  dy(126) = pk2CaMKon*y(9)*y(69)*y(190) + -pk2CaMKoff*y(126)*y(191) + -pkpCaM0*y(126)*y(192);
  dy(127) = pk2CaMKon*y(10)*y(69)*y(190) + -pk2CaMKoff*y(127)*y(191) + -pkpCaM1N*y(127)*y(198);
  dy(128) = pk2CaMKon*y(11)*y(69)*y(190) + -pk2CaMKoff*y(128)*y(191) + -pkpCaM2N*y(128)*y(200);
  dy(129) = pk2CaMKon*y(12)*y(69)*y(190) + -pk2CaMKoff*y(129)*y(191) + -pkpCaM1C*y(129)*y(193);
  dy(130) = pk2CaMKon*y(13)*y(69)*y(190) + -pk2CaMKoff*y(130)*y(191) + -pkpCaM1C1N*y(130)*y(196);
  dy(131) = pk2CaMKon*y(14)*y(69)*y(190) + -pk2CaMKoff*y(131)*y(191) + -pkpCaM1C2N*y(131)*y(199);
  dy(132) = pk2CaMKon*y(15)*y(69)*y(190) + -pk2CaMKoff*y(132)*y(191) + -pkpCaM2C*y(132)*y(194);
  dy(133) = pk2CaMKon*y(16)*y(69)*y(190) + -pk2CaMKoff*y(133)*y(191) + -pkpCaM2C1N*y(133)*y(195);
  dy(134) = pk2CaMKon*y(17)*y(69)*y(190) + -pk2CaMKoff*y(134)*y(191) + -pkpCaM4*y(134)*y(197);
  dy(135) = pk2CaMKon*y(9)*y(70)*y(190) + -pk2CaMKoff*y(135)*y(191) + -pkpCaM0*y(135)*y(192);
  dy(136) = pk2CaMKon*y(10)*y(70)*y(190) + -pk2CaMKoff*y(136)*y(191) + -pkpCaM1N*y(136)*y(198);
  dy(137) = pk2CaMKon*y(11)*y(70)*y(190) + -pk2CaMKoff*y(137)*y(191) + -pkpCaM2N*y(137)*y(200);
  dy(138) = pk2CaMKon*y(12)*y(70)*y(190) + -pk2CaMKoff*y(138)*y(191) + -pkpCaM1C*y(138)*y(193);
  dy(139) = pk2CaMKon*y(13)*y(70)*y(190) + -pk2CaMKoff*y(139)*y(191) + -pkpCaM1C1N*y(139)*y(196);
  dy(140) = pk2CaMKon*y(14)*y(70)*y(190) + -pk2CaMKoff*y(140)*y(191) + -pkpCaM1C2N*y(140)*y(199);
  dy(141) = pk2CaMKon*y(15)*y(70)*y(190) + -pk2CaMKoff*y(141)*y(191) + -pkpCaM2C*y(141)*y(194);
  dy(142) = pk2CaMKon*y(16)*y(70)*y(190) + -pk2CaMKoff*y(142)*y(191) + -pkpCaM2C1N*y(142)*y(195);
  dy(143) = pk2CaMKon*y(17)*y(70)*y(190) + -pk2CaMKoff*y(143)*y(191) + -pkpCaM4*y(143)*y(197);
  dy(144) = pk2CaMKon*y(9)*y(71)*y(190) + -pk2CaMKoff*y(144)*y(191) + -pkpCaM0*y(144)*y(192);
  dy(145) = pk2CaMKon*y(10)*y(71)*y(190) + -pk2CaMKoff*y(145)*y(191) + -pkpCaM1N*y(145)*y(198);
  dy(146) = pk2CaMKon*y(11)*y(71)*y(190) + -pk2CaMKoff*y(146)*y(191) + -pkpCaM2N*y(146)*y(200);
  dy(147) = pk2CaMKon*y(12)*y(71)*y(190) + -pk2CaMKoff*y(147)*y(191) + -pkpCaM1C*y(147)*y(193);
  dy(148) = pk2CaMKon*y(13)*y(71)*y(190) + -pk2CaMKoff*y(148)*y(191) + -pkpCaM1C1N*y(148)*y(196);
  dy(149) = pk2CaMKon*y(14)*y(71)*y(190) + -pk2CaMKoff*y(149)*y(191) + -pkpCaM1C2N*y(149)*y(199);
  dy(150) = pk2CaMKon*y(15)*y(71)*y(190) + -pk2CaMKoff*y(150)*y(191) + -pkpCaM2C*y(150)*y(194);
  dy(151) = pk2CaMKon*y(16)*y(71)*y(190) + -pk2CaMKoff*y(151)*y(191) + -pkpCaM2C1N*y(151)*y(195);
  dy(152) = pk2CaMKon*y(17)*y(71)*y(190) + -pk2CaMKoff*y(152)*y(191) + -pkpCaM4*y(152)*y(197);
  dy(153) = -pk1Con*y(153)*y(155)*y(156) + pk1Coff*y(3)*y(157) + -pk1Non*y(153)*y(155)*y(160) + pk1Noff*y(1)*y(161) + -pkCaM0on*y(153)*y(154)*y(172) + pkCaM0off*y(9)*y(173);
  dy(154) = -pkCaM0on*y(153)*y(154)*y(172) + pkCaM0off*y(9)*y(173) + -pkCaM1Non*y(1)*y(154)*y(184) + pkCaM1Noff*y(10)*y(185) + -pkCaM2Non*y(2)*y(154)*y(188) + pkCaM2Noff*y(11)*y(189) + -pkCaM1Con*y(3)*y(154)*y(174) + pkCaM1Coff*y(12)*y(175) + -pkCaM1C1Non*y(4)*y(154)*y(180) + pkCaM1C1Noff*y(13)*y(181) + -pkCaM1C2Non*y(5)*y(154)*y(186) + pkCaM1C2Noff*y(14)*y(187) + -pkCaM2Con*y(6)*y(154)*y(176) + pkCaM2Coff*y(15)*y(177) + -pkCaM2C1Non*y(7)*y(154)*y(178) + pkCaM2C1Noff*y(16)*y(179) + -pkCaM4on*y(8)*y(154)*y(182) + pkCaM4off*y(17)*y(183);
  dy(155) = -pk1Con*y(153)*y(155)*y(156) + pk1Coff*y(3)*y(157) + -pk1Con*y(1)*y(155)*y(156) + pk1Coff*y(4)*y(157) + -pk1Con*y(2)*y(155)*y(156) + pk1Coff*y(5)*y(157) + -pk2Con*y(3)*y(155)*y(158) + pk2Coff*y(6)*y(159) + -pk2Con*y(4)*y(155)*y(158) + pk2Coff*y(7)*y(159) + -pk2Con*y(5)*y(155)*y(158) + pk2Coff*y(8)*y(159) + -pk1Non*y(153)*y(155)*y(160) + pk1Noff*y(1)*y(161) + -pk2Non*y(1)*y(155)*y(162) + pk2Noff*y(2)*y(163) + -pk1Non*y(3)*y(155)*y(160) + pk1Noff*y(4)*y(161) + -pk2Non*y(4)*y(155)*y(162) + pk2Noff*y(5)*y(163) + -pk1Non*y(6)*y(155)*y(160) + pk1Noff*y(7)*y(161) + -pk2Non*y(7)*y(155)*y(162) + pk2Noff*y(8)*y(163) + -pkK1Con*y(9)*y(155)*y(164) + pkK1Coff*y(12)*y(165) + -pkK1Con*y(10)*y(155)*y(164) + pkK1Coff*y(13)*y(165) + -pkK1Con*y(11)*y(155)*y(164) + pkK1Coff*y(14)*y(165) + -pkK2Con*y(12)*y(155)*y(166) + pkK2Coff*y(15)*y(167) + -pkK2Con*y(13)*y(155)*y(166) + pkK2Coff*y(16)*y(167) + -pkK2Con*y(14)*y(155)*y(166) + pkK2Coff*y(17)*y(167) + -pkK1Non*y(9)*y(155)*y(168) + pkK1Noff*y(10)*y(169) + -pkK2Non*y(10)*y(155)*y(170) + pkK2Noff*y(11)*y(171) + -pkK1Non*y(12)*y(155)*y(168) + pkK1Noff*y(13)*y(169) + -pkK2Non*y(13)*y(155)*y(170) + pkK2Noff*y(14)*y(171) + -pkK1Non*y(15)*y(155)*y(168) + pkK1Noff*y(16)*y(169) + -pkK2Non*y(16)*y(155)*y(170) + pkK2Noff*y(17)*y(171);
  dy(156) = 0;
  dy(157) = 0;
  dy(158) = 0;
  dy(159) = 0;
  dy(160) = 0;
  dy(161) = 0;
  dy(162) = 0;
  dy(163) = 0;
  dy(164) = 0;
  dy(165) = 0;
  dy(166) = 0;
  dy(167) = 0;
  dy(168) = 0;
  dy(169) = 0;
  dy(170) = 0;
  dy(171) = 0;
  dy(172) = 0;
  dy(173) = 0;
  dy(174) = 0;
  dy(175) = 0;
  dy(176) = 0;
  dy(177) = 0;
  dy(178) = 0;
  dy(179) = 0;
  dy(180) = 0;
  dy(181) = 0;
  dy(182) = 0;
  dy(183) = 0;
  dy(184) = 0;
  dy(185) = 0;
  dy(186) = 0;
  dy(187) = 0;
  dy(188) = 0;
  dy(189) = 0;
  dy(190) = 0;
  dy(191) = 0;
  dy(192) = 0;
  dy(193) = 0;
  dy(194) = 0;
  dy(195) = 0;
  dy(196) = 0;
  dy(197) = 0;
  dy(198) = 0;
  dy(199) = 0;
  dy(200) = 0;
  dy(201) = 0;
  dy(202) = 0;
  dy(203) = 0;
end
