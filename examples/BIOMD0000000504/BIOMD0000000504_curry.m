

% Automatically generated from BIOMD0000000504_Curry.
% Original number of species: 207.
% Original number of reactions: 133.

% Correspondence with original names:
%     y(1) = ADAMTS4_mRNA
%     y(2) = cFos
%     y(3) = cFos_mRNA
%     y(4) = cJun
%     y(5) = cJun_mRNA
%     y(6) = DUSP16
%     y(7) = IRAK2
%     y(8) = IRAK2_TRAF6
%     y(9) = IRAK2_TRAF6_PP4
%     y(10) = JAK1
%     y(11) = JAK1_P
%     y(12) = JNK
%     y(13) = JNK_P
%     y(14) = Matriptase
%     y(15) = MKP1
%     y(16) = MMP1_mRNA
%     y(17) = MMP3_mRNA
%     y(18) = MMP13_mRNA
%     y(19) = p38
%     y(20) = p38_P
%     y(21) = PP4
%     y(22) = proMMP1
%     y(23) = proMMP3
%     y(24) = proMMP13
%     y(25) = PTPRT
%     y(26) = SOCS3
%     y(27) = SOCS3_mRNA
%     y(28) = STAT3_cyt
%     y(29) = STAT3_P_cyt
%     y(30) = TIMP1_mRNA
%     y(31) = TIMP3_mRNA
%     y(32) = TRAF6
%     y(33) = TRAF6_PP4
%     y(34) = ADAMTS4
%     y(35) = ADAMTS4_TIMP1
%     y(36) = ADAMTS4_TIMP3
%     y(37) = Aggrecan
%     y(38) = Aggrecan_Collagen2
%     y(39) = AggFrag
%     y(40) = ColFrag
%     y(41) = Collagen2
%     y(42) = IL1
%     y(43) = MMP1
%     y(44) = MMP1_TIMP1
%     y(45) = MMP1_TIMP3
%     y(46) = MMP3
%     y(47) = MMP3_TIMP1
%     y(48) = MMP3_TIMP3
%     y(49) = MMP13
%     y(50) = MMP13_TIMP1
%     y(51) = MMP13_TIMP3
%     y(52) = OSM
%     y(53) = TIMP1
%     y(54) = TIMP3
%     y(55) = IL1_IL1R
%     y(56) = IL1_IL1Ra
%     y(57) = IL1_IL1R_IRAK2
%     y(58) = IL1R
%     y(59) = IL1Ra
%     y(60) = OSM_OSMR
%     y(61) = OSM_OSMRa
%     y(62) = OSMR_SOCS3
%     y(63) = OSMR
%     y(64) = OSMRa
%     y(65) = cFos_cJun
%     y(66) = cFos_P
%     y(67) = cJun_P
%     y(68) = cJun_dimer
%     y(69) = SP1
%     y(70) = SP1_TIMP1_DNA
%     y(71) = STAT3_nuc
%     y(72) = STAT3_P_nuc
%     y(73) = TIMP1_DNA
%     y(74) = Source
%     y(75) = Sink
%     y(76) = kactMMP13mmp3
%     y(77) = kactMMP1mat
%     y(78) = kactMMP1mmp3
%     y(79) = kactMMP3mat
%     y(80) = kAP1activity
%     y(81) = kbincFoscJun
%     y(82) = kbinIL1IL1R
%     y(83) = kbinIL1IL1Ra
%     y(84) = kbinIRAK2
%     y(85) = kbinOSMOSMR
%     y(86) = kbinOSMOSMRa
%     y(87) = kbinSOCS3OSMR
%     y(88) = kbinSP1TIMP1DNA
%     y(89) = kbinTRAF6
%     y(90) = kcyt2nucSTAT3
%     y(91) = kdedimercJun
%     y(92) = kdegADAMTS4
%     y(93) = kdegADAMTS4mRNA
%     y(94) = kdegAggrecan
%     y(95) = kdegcFos
%     y(96) = kdegcFosmRNA
%     y(97) = kdegcJun
%     y(98) = kdegcJunmRNA
%     y(99) = kdegCollagen2mmp1
%     y(100) = kdegCollagen2mmp13
%     y(101) = kdegDUSP16
%     y(102) = kdegIL1
%     y(103) = kdegMatriptase
%     y(104) = kdegMKP1
%     y(105) = kdegMMP1
%     y(106) = kdegMMP13
%     y(107) = kdegMMP13mRNA
%     y(108) = kdegMMP1mRNA
%     y(109) = kdegMMP3
%     y(110) = kdegMMP3mRNA
%     y(111) = kdegOSM
%     y(112) = kdegPP4
%     y(113) = kdegPTPRT
%     y(114) = kdegSOCS3
%     y(115) = kdegSOCS3mRNA
%     y(116) = kdegSP1
%     y(117) = kdegTIMP1
%     y(118) = kdegTIMP1mRNA
%     y(119) = kdegTIMP3
%     y(120) = kdegTIMP3mRNA
%     y(121) = kdephoscFos
%     y(122) = kdephoscFosDUSP16
%     y(123) = kdephoscJun
%     y(124) = kdephosJAK1
%     y(125) = kdephosJAK1PTPRT
%     y(126) = kdephosJNK
%     y(127) = kdephosJNKDUSP16
%     y(128) = kdephosp38
%     y(129) = kdephosp38MKP1
%     y(130) = kdephosSTAT3
%     y(131) = kdephosSTAT3nuc
%     y(132) = kdephosSTAT3nucPTPRT
%     y(133) = kdephosSTAT3PTPRT
%     y(134) = kdimercJun
%     y(135) = kinhibADAMTS4TIMP1
%     y(136) = kinhibADAMTS4TIMP3
%     y(137) = kinhibMMP13TIMP1
%     y(138) = kinhibMMP13TIMP3
%     y(139) = kinhibMMP1TIMP1
%     y(140) = kinhibMMP1TIMP3
%     y(141) = kinhibMMP3TIMP1
%     y(142) = kinhibMMP3TIMP3
%     y(143) = kinhibTRAF6
%     y(144) = knuc2cytSTAT3
%     y(145) = kphoscFos
%     y(146) = kphoscJun
%     y(147) = kphosJAK1
%     y(148) = kphosJNK
%     y(149) = kphosp38
%     y(150) = kphosSTAT3
%     y(151) = krelADAMTS4TIMP1
%     y(152) = krelADAMTS4TIMP3
%     y(153) = krelcFoscJun
%     y(154) = krelIL1IL1R
%     y(155) = krelIL1IL1Ra
%     y(156) = krelIRAK2
%     y(157) = krelMMP1
%     y(158) = krelMMP13
%     y(159) = krelMMP13TIMP3
%     y(160) = krelMMP1TIMP3
%     y(161) = krelMMP3
%     y(162) = krelMMP3TIMP3
%     y(163) = krelOSMOSMR
%     y(164) = krelOSMOSMRa
%     y(165) = krelSOCS3OSMR
%     y(166) = krelSP1TIMP1DNA
%     y(167) = krelTRAF6
%     y(168) = krelTRAF6PP4
%     y(169) = ksynADAMTS4
%     y(170) = ksynADAMTS4mRNA
%     y(171) = ksynADAMTS4mRNAcJun
%     y(172) = ksynbasalcJunmRNA
%     y(173) = ksynbasalTIMP1mRNA
%     y(174) = ksynbasalTIMP3mRNA
%     y(175) = ksyncFos
%     y(176) = ksyncFosmRNA
%     y(177) = ksyncFosmRNAStat3
%     y(178) = ksyncJun
%     y(179) = ksyncJunmRNA
%     y(180) = ksyncJunmRNAcJun
%     y(181) = ksynDUSP16
%     y(182) = ksynDUSP16cJun
%     y(183) = ksynMatriptase
%     y(184) = ksynMKP1
%     y(185) = ksynMKP1cJun
%     y(186) = ksynMMP1
%     y(187) = ksynMMP13
%     y(188) = ksynMMP13mRNA
%     y(189) = ksynMMP13mRNAcJun
%     y(190) = ksynMMP1mRNA
%     y(191) = ksynMMP1mRNAcJun
%     y(192) = ksynMMP3
%     y(193) = ksynMMP3mRNA
%     y(194) = ksynMMP3mRNAcJun
%     y(195) = ksynPP4
%     y(196) = ksynPP4cJun
%     y(197) = ksynPTPRT
%     y(198) = ksynSOCS3
%     y(199) = ksynSOCS3mRNA
%     y(200) = ksynSP1
%     y(201) = ksynTIMP1
%     y(202) = ksynTIMP1mRNA
%     y(203) = ksynTIMP1mRNAStat3
%     y(204) = ksynTIMP3
%     y(205) = ksynTIMP3mRNA
%     y(206) = ksynTIMP3mRNAStat3
%     y(207) = tempDimer


function BIOMD0000000504_curry
[T,Y]=ode45(@ode,[0 100.0],[  0.0 0.0 0.0 100.0 5.0 0.0 100.0 0.0 0.0 100.0 0.0 100.0 0.0 100.0 0.0 0.0 0.0 0.0 100.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 100.0 0.0 20.0 20.0 100.0 0.0 0.0 0.0 0.0 0.0 100000.0 0.0 0.0 0.0 100.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1000.0 200.0 200.0 0.0 0.0 0.0 100.0 0.0 0.0 0.0 0.0 100.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 2.0 1.0 1.0 5.0E-8 1.0E-9 1.0E-8 0.0000040 1.0 0.000050 0.00010 0.00010 0.000050 0.000010 0.00010 0.005 0.000010 0.000010 0.001 0.01 0.000050 0.000014 3.0E-8 0.00020 0.003 0.00013 0.003 5.0E-12 5.0E-11 0.00013 0.00020 0.0000080 0.00010 0.0000010 0.0000010 0.0000064 0.0000064 0.0000010 0.0000064 0.000048 0.00010 0.000050 0.00080 0.00040 0.000020 0.000020 0.000014 0.000020 0.000014 0.00010 0.00010 0.01 0.00040 0.004 0.001 0.001 0.001 0.000010 0.000010 1.0E-7 0.00050 0.00080 0.000050 0.0000030 0.00050 3.0E-7 1.0E-8 3.0E-7 1.0E-8 3.0E-7 1.0E-8 0.5 0.001 5.0E-7 0.00010 0.000010 0.00010 0.00010 0.005 0.001 0.001 0.000040 0.001 0.00010 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.000010 0.000010 0.000010 0.0000050 0.00010 0.0000010 0.00050 0.00050 0.0000040 0.015 0.00014 0.00028 0.001 0.0000050 0.05 0.0026 0.0125 0.005 0.005 0.00020 9.0E-10 0.000025 0.0000010 0.00015 0.000015 0.00050 0.000020 0.005 0.00020 0.000030 0.005 0.00020 0.005 0.00020 0.00010 0.001 0.006 0.000020 0.00020 5.0E-7 0.000040 0.00040 5.0E-7 0.000040 0.5]);
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
plot(T,Y(:,204));
hold on;
plot(T,Y(:,205));
hold on;
plot(T,Y(:,206));
hold on;
plot(T,Y(:,207));
hold on;
xlabel('time');
ylabel('value');
legend('ADAMTS4_mRNA','cFos','cFos_mRNA','cJun','cJun_mRNA','DUSP16','IRAK2','IRAK2_TRAF6','IRAK2_TRAF6_PP4','JAK1','JAK1_P','JNK','JNK_P','Matriptase','MKP1','MMP1_mRNA','MMP3_mRNA','MMP13_mRNA','p38','p38_P','PP4','proMMP1','proMMP3','proMMP13','PTPRT','SOCS3','SOCS3_mRNA','STAT3_cyt','STAT3_P_cyt','TIMP1_mRNA','TIMP3_mRNA','TRAF6','TRAF6_PP4','ADAMTS4','ADAMTS4_TIMP1','ADAMTS4_TIMP3','Aggrecan','Aggrecan_Collagen2','AggFrag','ColFrag','Collagen2','IL1','MMP1','MMP1_TIMP1','MMP1_TIMP3','MMP3','MMP3_TIMP1','MMP3_TIMP3','MMP13','MMP13_TIMP1','MMP13_TIMP3','OSM','TIMP1','TIMP3','IL1_IL1R','IL1_IL1Ra','IL1_IL1R_IRAK2','IL1R','IL1Ra','OSM_OSMR','OSM_OSMRa','OSMR_SOCS3','OSMR','OSMRa','cFos_cJun','cFos_P','cJun_P','cJun_dimer','SP1','SP1_TIMP1_DNA','STAT3_nuc','STAT3_P_nuc','TIMP1_DNA','Source','Sink','kactMMP13mmp3','kactMMP1mat','kactMMP1mmp3','kactMMP3mat','kAP1activity','kbincFoscJun','kbinIL1IL1R','kbinIL1IL1Ra','kbinIRAK2','kbinOSMOSMR','kbinOSMOSMRa','kbinSOCS3OSMR','kbinSP1TIMP1DNA','kbinTRAF6','kcyt2nucSTAT3','kdedimercJun','kdegADAMTS4','kdegADAMTS4mRNA','kdegAggrecan','kdegcFos','kdegcFosmRNA','kdegcJun','kdegcJunmRNA','kdegCollagen2mmp1','kdegCollagen2mmp13','kdegDUSP16','kdegIL1','kdegMatriptase','kdegMKP1','kdegMMP1','kdegMMP13','kdegMMP13mRNA','kdegMMP1mRNA','kdegMMP3','kdegMMP3mRNA','kdegOSM','kdegPP4','kdegPTPRT','kdegSOCS3','kdegSOCS3mRNA','kdegSP1','kdegTIMP1','kdegTIMP1mRNA','kdegTIMP3','kdegTIMP3mRNA','kdephoscFos','kdephoscFosDUSP16','kdephoscJun','kdephosJAK1','kdephosJAK1PTPRT','kdephosJNK','kdephosJNKDUSP16','kdephosp38','kdephosp38MKP1','kdephosSTAT3','kdephosSTAT3nuc','kdephosSTAT3nucPTPRT','kdephosSTAT3PTPRT','kdimercJun','kinhibADAMTS4TIMP1','kinhibADAMTS4TIMP3','kinhibMMP13TIMP1','kinhibMMP13TIMP3','kinhibMMP1TIMP1','kinhibMMP1TIMP3','kinhibMMP3TIMP1','kinhibMMP3TIMP3','kinhibTRAF6','knuc2cytSTAT3','kphoscFos','kphoscJun','kphosJAK1','kphosJNK','kphosp38','kphosSTAT3','krelADAMTS4TIMP1','krelADAMTS4TIMP3','krelcFoscJun','krelIL1IL1R','krelIL1IL1Ra','krelIRAK2','krelMMP1','krelMMP13','krelMMP13TIMP3','krelMMP1TIMP3','krelMMP3','krelMMP3TIMP3','krelOSMOSMR','krelOSMOSMRa','krelSOCS3OSMR','krelSP1TIMP1DNA','krelTRAF6','krelTRAF6PP4','ksynADAMTS4','ksynADAMTS4mRNA','ksynADAMTS4mRNAcJun','ksynbasalcJunmRNA','ksynbasalTIMP1mRNA','ksynbasalTIMP3mRNA','ksyncFos','ksyncFosmRNA','ksyncFosmRNAStat3','ksyncJun','ksyncJunmRNA','ksyncJunmRNAcJun','ksynDUSP16','ksynDUSP16cJun','ksynMatriptase','ksynMKP1','ksynMKP1cJun','ksynMMP1','ksynMMP13','ksynMMP13mRNA','ksynMMP13mRNAcJun','ksynMMP1mRNA','ksynMMP1mRNAcJun','ksynMMP3','ksynMMP3mRNA','ksynMMP3mRNAcJun','ksynPP4','ksynPP4cJun','ksynPTPRT','ksynSOCS3','ksynSOCS3mRNA','ksynSP1','ksynTIMP1','ksynTIMP1mRNA','ksynTIMP1mRNAStat3','ksynTIMP3','ksynTIMP3mRNA','ksynTIMP3mRNAStat3','tempDimer');
end

function dy =  ode(t,y) 
  pkactMMP13mmp3 = 1.0;
  pkactMMP1mat = 1.0;
  pkactMMP1mmp3 = 1.0;
  pkactMMP3mat = 1.0;
  pkAP1activity = 1.0;
  pkbincFoscJun = 1.0;
  pkbinIL1IL1R = 1.0;
  pkbinIL1IL1Ra = 1.0;
  pkbinIRAK2 = 1.0;
  pkbinOSMOSMR = 1.0;
  pkbinOSMOSMRa = 1.0;
  pkbinSOCS3OSMR = 1.0;
  pkbinSP1TIMP1DNA = 1.0;
  pkbinTRAF6 = 1.0;
  pkcyt2nucSTAT3 = 1.0;
  pkdedimercJun = 1.0;
  pkdegADAMTS4 = 1.0;
  pkdegADAMTS4mRNA = 1.0;
  pkdegAggrecan = 1.0;
  pkdegcFos = 1.0;
  pkdegcFosmRNA = 1.0;
  pkdegcJun = 1.0;
  pkdegcJunmRNA = 1.0;
  pkdegCollagen2mmp1 = 1.0;
  pkdegCollagen2mmp13 = 1.0;
  pkdegDUSP16 = 1.0;
  pkdegIL1 = 1.0;
  pkdegMatriptase = 1.0;
  pkdegMKP1 = 1.0;
  pkdegMMP1 = 1.0;
  pkdegMMP13 = 1.0;
  pkdegMMP13mRNA = 1.0;
  pkdegMMP1mRNA = 1.0;
  pkdegMMP3 = 1.0;
  pkdegMMP3mRNA = 1.0;
  pkdegOSM = 1.0;
  pkdegPP4 = 1.0;
  pkdegPTPRT = 1.0;
  pkdegSOCS3 = 1.0;
  pkdegSOCS3mRNA = 1.0;
  pkdegSP1 = 1.0;
  pkdegTIMP1 = 1.0;
  pkdegTIMP1mRNA = 1.0;
  pkdegTIMP3 = 1.0;
  pkdegTIMP3mRNA = 1.0;
  pkdephoscFos = 1.0;
  pkdephoscFosDUSP16 = 1.0;
  pkdephoscJun = 1.0;
  pkdephosJAK1 = 1.0;
  pkdephosJAK1PTPRT = 1.0;
  pkdephosJNK = 1.0;
  pkdephosJNKDUSP16 = 1.0;
  pkdephosp38 = 1.0;
  pkdephosp38MKP1 = 1.0;
  pkdephosSTAT3 = 1.0;
  pkdephosSTAT3nuc = 1.0;
  pkdephosSTAT3nucPTPRT = 1.0;
  pkdephosSTAT3PTPRT = 1.0;
  pkdimercJun = 1.0;
  pkinhibADAMTS4TIMP1 = 1.0;
  pkinhibADAMTS4TIMP3 = 1.0;
  pkinhibMMP13TIMP1 = 1.0;
  pkinhibMMP13TIMP3 = 1.0;
  pkinhibMMP1TIMP1 = 1.0;
  pkinhibMMP1TIMP3 = 1.0;
  pkinhibMMP3TIMP1 = 1.0;
  pkinhibMMP3TIMP3 = 1.0;
  pkinhibTRAF6 = 1.0;
  pknuc2cytSTAT3 = 1.0;
  pkphoscFos = 1.0;
  pkphoscJun = 1.0;
  pkphosJAK1 = 1.0;
  pkphosJNK = 1.0;
  pkphosp38 = 1.0;
  pkphosSTAT3 = 1.0;
  pkrelADAMTS4TIMP1 = 1.0;
  pkrelADAMTS4TIMP3 = 1.0;
  pkrelcFoscJun = 1.0;
  pkrelIL1IL1R = 1.0;
  pkrelIL1IL1Ra = 1.0;
  pkrelIRAK2 = 1.0;
  pkrelMMP1 = 1.0;
  pkrelMMP13 = 1.0;
  pkrelMMP13TIMP3 = 1.0;
  pkrelMMP1TIMP3 = 1.0;
  pkrelMMP3 = 1.0;
  pkrelMMP3TIMP3 = 1.0;
  pkrelOSMOSMR = 1.0;
  pkrelOSMOSMRa = 1.0;
  pkrelSOCS3OSMR = 1.0;
  pkrelSP1TIMP1DNA = 1.0;
  pkrelTRAF6 = 1.0;
  pkrelTRAF6PP4 = 1.0;
  pksynADAMTS4 = 1.0;
  pksynADAMTS4mRNA = 1.0;
  pksynADAMTS4mRNAcJun = 1.0;
  pksynbasalcJunmRNA = 1.0;
  pksynbasalTIMP1mRNA = 1.0;
  pksynbasalTIMP3mRNA = 1.0;
  pksyncFos = 1.0;
  pksyncFosmRNA = 1.0;
  pksyncFosmRNAStat3 = 1.0;
  pksyncJun = 1.0;
  pksyncJunmRNA = 1.0;
  pksyncJunmRNAcJun = 1.0;
  pksynDUSP16 = 1.0;
  pksynDUSP16cJun = 1.0;
  pksynMatriptase = 1.0;
  pksynMKP1 = 1.0;
  pksynMKP1cJun = 1.0;
  pksynMMP1 = 1.0;
  pksynMMP13 = 1.0;
  pksynMMP13mRNA = 1.0;
  pksynMMP13mRNAcJun = 1.0;
  pksynMMP1mRNA = 1.0;
  pksynMMP1mRNAcJun = 1.0;
  pksynMMP3 = 1.0;
  pksynMMP3mRNA = 1.0;
  pksynMMP3mRNAcJun = 1.0;
  pksynPP4 = 1.0;
  pksynPP4cJun = 1.0;
  pksynPTPRT = 1.0;
  pksynSOCS3 = 1.0;
  pksynSOCS3mRNA = 1.0;
  pksynSP1 = 1.0;
  pksynTIMP1 = 1.0;
  pksynTIMP1mRNA = 1.0;
  pksynTIMP1mRNAStat3 = 1.0;
  pksynTIMP3 = 1.0;
  pksynTIMP3mRNA = 1.0;
  pksynTIMP3mRNAStat3 = 1.0;
  ptempDimer = 1.0;

  dy=zeros(207,1);

  dy(1) = pksynADAMTS4mRNA * pkAP1activity*y(65)*y(65)*y(80)*y(170) + pksynADAMTS4mRNAcJun*y(68)*y(68)*y(171) + -pkdegADAMTS4mRNA*y(1)*y(1)*y(75)*y(93);
  dy(2) = pksyncFos*y(3)*y(3)*y(175) + -pkdegcFos*y(2)*y(2)*y(75)*y(95) + -pkphoscFos*y(2)*y(2)*y(20)*y(20)*y(145) + pkdephoscFos*y(66)*y(66)*y(121) + pkdephoscFosDUSP16*y(6)*y(6)*y(66)*y(66)*y(122);
  dy(3) = pksyncFosmRNA * pkAP1activity*y(65)*y(65)*y(80)*y(176) + -pkdegcFosmRNA*y(3)*y(3)*y(75)*y(96) + pksyncFosmRNAStat3*y(72)*y(72)*y(177);
  dy(4) = -pkphoscJun*y(4)*y(4)*y(13)*y(13)*y(146) + pkdephoscJun*y(67)*y(67)*y(123) + pksyncJun*y(5)*y(5)*y(178) + -pkdegcJun*y(4)*y(4)*y(75)*y(97);
  dy(5) = pksyncJunmRNA * pkAP1activity*y(65)*y(65)*y(80)*y(179) + pksyncJunmRNAcJun*y(68)*y(68)*y(180) + pksynbasalcJunmRNA*y(74)*y(74)*y(172) + -pkdegcJunmRNA*y(5)*y(5)*y(75)*y(98);
  dy(6) = pksynDUSP16 * pkAP1activity*y(65)*y(65)*y(80)*y(181) + pksynDUSP16cJun*y(68)*y(68)*y(182) + -pkdegDUSP16*y(6)*y(6)*y(75)*y(101);
  dy(7) = -pkbinIRAK2*y(7)*y(7)*y(55)*y(55)*y(84) + pkrelIRAK2*y(57)*y(57)*y(156) + pkrelTRAF6*y(8)*y(8)*y(167);
  dy(8) = pkbinTRAF6*y(32)*y(32)*y(57)*y(57)*y(89) + -pkrelTRAF6*y(8)*y(8)*y(167) + -pkinhibTRAF6*y(8)*y(8)*y(21)*y(21)*y(143) + pkrelTRAF6PP4*y(9)*y(9)*y(168);
  dy(9) = pkinhibTRAF6*y(8)*y(8)*y(21)*y(21)*y(143) + -pkrelTRAF6PP4*y(9)*y(9)*y(168);
  dy(10) = -pkphosJAK1*y(10)*y(10)*y(60)*y(60)*y(147) + pkdephosJAK1*y(11)*y(11)*y(124) + pkdephosJAK1PTPRT*y(11)*y(11)*y(25)*y(25)*y(125);
  dy(11) = pkphosJAK1*y(10)*y(10)*y(60)*y(60)*y(147) + -pkdephosJAK1*y(11)*y(11)*y(124) + -pkdephosJAK1PTPRT*y(11)*y(11)*y(25)*y(25)*y(125);
  dy(12) = -pkphosJNK*y(8)*y(8)*y(12)*y(12)*y(148) + pkdephosJNK*y(13)*y(13)*y(126) + pkdephosJNKDUSP16*y(6)*y(6)*y(13)*y(13)*y(127);
  dy(13) = pkphosJNK*y(8)*y(8)*y(12)*y(12)*y(148) + -pkdephosJNK*y(13)*y(13)*y(126) + -pkdephosJNKDUSP16*y(6)*y(6)*y(13)*y(13)*y(127);
  dy(14) = pksynMatriptase * pkAP1activity*y(65)*y(65)*y(80)*y(183) + -pkdegMatriptase*y(14)*y(14)*y(75)*y(103);
  dy(15) = pksynMKP1 * pkAP1activity*y(65)*y(65)*y(80)*y(184) + pksynMKP1cJun*y(68)*y(68)*y(185) + -pkdegMKP1*y(15)*y(15)*y(75)*y(104);
  dy(16) = pksynMMP1mRNA * pkAP1activity*y(65)*y(65)*y(80)*y(190) + pksynMMP1mRNAcJun*y(68)*y(68)*y(191) + -pkdegMMP1mRNA*y(16)*y(16)*y(75)*y(108);
  dy(17) = pksynMMP3mRNA * pkAP1activity*y(65)*y(65)*y(80)*y(193) + pksynMMP3mRNAcJun*y(68)*y(68)*y(194) + -pkdegMMP3mRNA*y(17)*y(17)*y(75)*y(110);
  dy(18) = pksynMMP13mRNA * pkAP1activity*y(65)*y(65)*y(80)*y(188) + pksynMMP13mRNAcJun*y(68)*y(68)*y(189) + -pkdegMMP13mRNA*y(18)*y(18)*y(75)*y(107);
  dy(19) = -pkphosp38*y(8)*y(8)*y(19)*y(19)*y(149) + pkdephosp38*y(20)*y(20)*y(128) + pkdephosp38MKP1*y(15)*y(15)*y(20)*y(20)*y(129);
  dy(20) = pkphosp38*y(8)*y(8)*y(19)*y(19)*y(149) + -pkdephosp38*y(20)*y(20)*y(128) + -pkdephosp38MKP1*y(15)*y(15)*y(20)*y(20)*y(129);
  dy(21) = pksynPP4 * pkAP1activity*y(65)*y(65)*y(80)*y(195) + pksynPP4cJun*y(68)*y(68)*y(196) + -pkdegPP4*y(21)*y(21)*y(75)*y(112) + -pkinhibTRAF6*y(21)*y(21)*y(32)*y(32)*y(143) + -pkinhibTRAF6*y(8)*y(8)*y(21)*y(21)*y(143) + pkrelTRAF6PP4*y(33)*y(33)*y(168) + pkrelTRAF6PP4*y(9)*y(9)*y(168);
  dy(22) = pksynMMP1*y(16)*y(16)*y(186) + -pkactMMP1mat*y(14)*y(14)*y(22)*y(22)*y(77) + -pkactMMP1mmp3*y(22)*y(22)*y(46)*y(46)*y(78);
  dy(23) = pksynMMP3*y(17)*y(17)*y(192) + -pkactMMP3mat*y(14)*y(14)*y(23)*y(23)*y(79);
  dy(24) = pksynMMP13*y(18)*y(18)*y(187) + -pkactMMP13mmp3*y(24)*y(24)*y(46)*y(46)*y(76);
  dy(25) = pksynPTPRT*y(72)*y(72)*y(197) + -pkdegPTPRT*y(25)*y(25)*y(75)*y(113);
  dy(26) = pksynSOCS3*y(27)*y(27)*y(198) + -pkdegSOCS3*y(26)*y(26)*y(75)*y(114) + -pkbinSOCS3OSMR*y(26)*y(26)*y(63)*y(63)*y(87) + pkrelSOCS3OSMR*y(62)*y(62)*y(165);
  dy(27) = pksynSOCS3mRNA*y(72)*y(72)*y(199) + -pkdegSOCS3mRNA*y(27)*y(27)*y(75)*y(115);
  dy(28) = -pkphosSTAT3*y(11)*y(11)*y(28)*y(28)*y(150) + pkdephosSTAT3*y(29)*y(29)*y(130) + pkdephosSTAT3PTPRT*y(25)*y(25)*y(29)*y(29)*y(133) + pknuc2cytSTAT3*y(71)*y(71)*y(144);
  dy(29) = pkphosSTAT3*y(11)*y(11)*y(28)*y(28)*y(150) + -pkdephosSTAT3*y(29)*y(29)*y(130) + -pkdephosSTAT3PTPRT*y(25)*y(25)*y(29)*y(29)*y(133) + -pkcyt2nucSTAT3*y(29)*y(29)*y(90);
  dy(30) = -pkdegTIMP1mRNA*y(30)*y(30)*y(75)*y(118) + pksynTIMP1mRNAStat3*y(72)*y(72)*y(73)*y(73)*y(203) + pksynbasalTIMP1mRNA*y(73)*y(73)*y(173) + pksynTIMP1mRNA * pkAP1activity*y(65)*y(65)*y(73)*y(73)*y(80)*y(202);
  dy(31) = pksynbasalTIMP3mRNA*y(74)*y(74)*y(174) + pksynTIMP3mRNA * pkAP1activity*y(65)*y(65)*y(80)*y(205) + pksynTIMP3mRNAStat3 * pkAP1activity*y(72)*y(72)*y(80)*y(206) + -pkdegTIMP3mRNA*y(31)*y(31)*y(75)*y(120);
  dy(32) = -pkbinTRAF6*y(32)*y(32)*y(57)*y(57)*y(89) + pkrelTRAF6*y(8)*y(8)*y(167) + -pkinhibTRAF6*y(21)*y(21)*y(32)*y(32)*y(143) + pkrelTRAF6PP4*y(33)*y(33)*y(168);
  dy(33) = pkinhibTRAF6*y(21)*y(21)*y(32)*y(32)*y(143) + -pkrelTRAF6PP4*y(33)*y(33)*y(168);
  dy(34) = pksynADAMTS4*y(1)*y(1)*y(169) + -pkdegADAMTS4*y(34)*y(34)*y(75)*y(92) + -pkinhibADAMTS4TIMP1*y(34)*y(34)*y(53)*y(53)*y(135) + pkrelADAMTS4TIMP1*y(35)*y(35)*y(151) + -pkinhibADAMTS4TIMP3*y(34)*y(34)*y(54)*y(54)*y(136) + pkrelADAMTS4TIMP3*y(36)*y(36)*y(152);
  dy(35) = pkinhibADAMTS4TIMP1*y(34)*y(34)*y(53)*y(53)*y(135) + -pkrelADAMTS4TIMP1*y(35)*y(35)*y(151);
  dy(36) = pkinhibADAMTS4TIMP3*y(34)*y(34)*y(54)*y(54)*y(136) + -pkrelADAMTS4TIMP3*y(36)*y(36)*y(152);
  dy(37) = 0;
  dy(38) = -pkdegAggrecan*y(34)*y(34)*y(38)*y(38)*y(94);
  dy(39) = pkdegAggrecan*y(34)*y(34)*y(38)*y(38)*y(94);
  dy(40) = pkdegCollagen2mmp1*y(41)*y(41)*y(43)*y(43)*y(99) + pkdegCollagen2mmp13*y(41)*y(41)*y(49)*y(49)*y(100);
  dy(41) = -pkdegCollagen2mmp1*y(41)*y(41)*y(43)*y(43)*y(99) + -pkdegCollagen2mmp13*y(41)*y(41)*y(49)*y(49)*y(100) + pkdegAggrecan*y(34)*y(34)*y(38)*y(38)*y(94);
  dy(42) = -pkbinIL1IL1R*y(42)*y(42)*y(58)*y(58)*y(82) + pkrelIL1IL1R*y(55)*y(55)*y(154) + -pkbinIL1IL1Ra*y(42)*y(42)*y(59)*y(59)*y(83) + pkrelIL1IL1Ra*y(56)*y(56)*y(155) + -pkdegIL1*y(42)*y(42)*y(75)*y(102);
  dy(43) = pkactMMP1mat*y(14)*y(14)*y(22)*y(22)*y(77) + pkactMMP1mmp3*y(22)*y(22)*y(46)*y(46)*y(78) + -pkdegMMP1*y(43)*y(43)*y(75)*y(105) + -pkinhibMMP1TIMP1*y(43)*y(43)*y(53)*y(53)*y(139) + pkrelMMP1*y(44)*y(44)*y(157) + -pkinhibMMP1TIMP3*y(43)*y(43)*y(54)*y(54)*y(140) + pkrelMMP1TIMP3*y(45)*y(45)*y(160);
  dy(44) = pkinhibMMP1TIMP1*y(43)*y(43)*y(53)*y(53)*y(139) + -pkrelMMP1*y(44)*y(44)*y(157);
  dy(45) = pkinhibMMP1TIMP3*y(43)*y(43)*y(54)*y(54)*y(140) + -pkrelMMP1TIMP3*y(45)*y(45)*y(160);
  dy(46) = pkactMMP3mat*y(14)*y(14)*y(23)*y(23)*y(79) + -pkdegMMP3*y(46)*y(46)*y(75)*y(109) + -pkinhibMMP3TIMP1*y(46)*y(46)*y(53)*y(53)*y(141) + pkrelMMP3*y(47)*y(47)*y(161) + -pkinhibMMP3TIMP3*y(46)*y(46)*y(54)*y(54)*y(142) + pkrelMMP3TIMP3*y(48)*y(48)*y(162);
  dy(47) = pkinhibMMP3TIMP1*y(46)*y(46)*y(53)*y(53)*y(141) + -pkrelMMP3*y(47)*y(47)*y(161);
  dy(48) = pkinhibMMP3TIMP3*y(46)*y(46)*y(54)*y(54)*y(142) + -pkrelMMP3TIMP3*y(48)*y(48)*y(162);
  dy(49) = pkactMMP13mmp3*y(24)*y(24)*y(46)*y(46)*y(76) + -pkdegMMP13*y(49)*y(49)*y(75)*y(106) + -pkinhibMMP13TIMP1*y(49)*y(49)*y(53)*y(53)*y(137) + pkrelMMP13*y(50)*y(50)*y(158) + -pkinhibMMP13TIMP3*y(49)*y(49)*y(54)*y(54)*y(138) + pkrelMMP13TIMP3*y(51)*y(51)*y(159);
  dy(50) = pkinhibMMP13TIMP1*y(49)*y(49)*y(53)*y(53)*y(137) + -pkrelMMP13*y(50)*y(50)*y(158);
  dy(51) = pkinhibMMP13TIMP3*y(49)*y(49)*y(54)*y(54)*y(138) + -pkrelMMP13TIMP3*y(51)*y(51)*y(159);
  dy(52) = -pkbinOSMOSMR*y(52)*y(52)*y(63)*y(63)*y(85) + pkrelOSMOSMR*y(60)*y(60)*y(163) + -pkbinOSMOSMRa*y(52)*y(52)*y(64)*y(64)*y(86) + pkrelOSMOSMRa*y(61)*y(61)*y(164) + -pkdegOSM*y(52)*y(52)*y(75)*y(111);
  dy(53) = pksynTIMP1*y(30)*y(30)*y(201) + -pkdegTIMP1*y(53)*y(53)*y(75)*y(117) + -pkinhibMMP1TIMP1*y(43)*y(43)*y(53)*y(53)*y(139) + pkrelMMP1*y(44)*y(44)*y(157) + -pkinhibMMP3TIMP1*y(46)*y(46)*y(53)*y(53)*y(141) + pkrelMMP3*y(47)*y(47)*y(161) + -pkinhibMMP13TIMP1*y(49)*y(49)*y(53)*y(53)*y(137) + pkrelMMP13*y(50)*y(50)*y(158) + -pkinhibADAMTS4TIMP1*y(34)*y(34)*y(53)*y(53)*y(135) + pkrelADAMTS4TIMP1*y(35)*y(35)*y(151);
  dy(54) = pksynTIMP3*y(31)*y(31)*y(204) + -pkdegTIMP3*y(54)*y(54)*y(75)*y(119) + -pkinhibADAMTS4TIMP3*y(34)*y(34)*y(54)*y(54)*y(136) + pkrelADAMTS4TIMP3*y(36)*y(36)*y(152) + -pkinhibMMP1TIMP3*y(43)*y(43)*y(54)*y(54)*y(140) + pkrelMMP1TIMP3*y(45)*y(45)*y(160) + -pkinhibMMP3TIMP3*y(46)*y(46)*y(54)*y(54)*y(142) + pkrelMMP3TIMP3*y(48)*y(48)*y(162) + -pkinhibMMP13TIMP3*y(49)*y(49)*y(54)*y(54)*y(138) + pkrelMMP13TIMP3*y(51)*y(51)*y(159);
  dy(55) = pkbinIL1IL1R*y(42)*y(42)*y(58)*y(58)*y(82) + -pkrelIL1IL1R*y(55)*y(55)*y(154) + -pkbinIRAK2*y(7)*y(7)*y(55)*y(55)*y(84) + pkrelIRAK2*y(57)*y(57)*y(156) + pkbinTRAF6*y(32)*y(32)*y(57)*y(57)*y(89);
  dy(56) = pkbinIL1IL1Ra*y(42)*y(42)*y(59)*y(59)*y(83) + -pkrelIL1IL1Ra*y(56)*y(56)*y(155);
  dy(57) = pkbinIRAK2*y(7)*y(7)*y(55)*y(55)*y(84) + -pkrelIRAK2*y(57)*y(57)*y(156) + -pkbinTRAF6*y(32)*y(32)*y(57)*y(57)*y(89);
  dy(58) = -pkbinIL1IL1R*y(42)*y(42)*y(58)*y(58)*y(82) + pkrelIL1IL1R*y(55)*y(55)*y(154);
  dy(59) = -pkbinIL1IL1Ra*y(42)*y(42)*y(59)*y(59)*y(83) + pkrelIL1IL1Ra*y(56)*y(56)*y(155);
  dy(60) = pkbinOSMOSMR*y(52)*y(52)*y(63)*y(63)*y(85) + -pkrelOSMOSMR*y(60)*y(60)*y(163);
  dy(61) = pkbinOSMOSMRa*y(52)*y(52)*y(64)*y(64)*y(86) + -pkrelOSMOSMRa*y(61)*y(61)*y(164);
  dy(62) = pkbinSOCS3OSMR*y(26)*y(26)*y(63)*y(63)*y(87) + -pkrelSOCS3OSMR*y(62)*y(62)*y(165);
  dy(63) = -pkbinOSMOSMR*y(52)*y(52)*y(63)*y(63)*y(85) + pkrelOSMOSMR*y(60)*y(60)*y(163) + -pkbinSOCS3OSMR*y(26)*y(26)*y(63)*y(63)*y(87) + pkrelSOCS3OSMR*y(62)*y(62)*y(165);
  dy(64) = -pkbinOSMOSMRa*y(52)*y(52)*y(64)*y(64)*y(86) + pkrelOSMOSMRa*y(61)*y(61)*y(164);
  dy(65) = pkbincFoscJun*y(66)*y(66)*y(67)*y(67)*y(81) + -pkrelcFoscJun*y(65)*y(65)*y(153);
  dy(66) = pkphoscFos*y(2)*y(2)*y(20)*y(20)*y(145) + -pkdephoscFos*y(66)*y(66)*y(121) + -pkdephoscFosDUSP16*y(6)*y(6)*y(66)*y(66)*y(122) + -pkbincFoscJun*y(66)*y(66)*y(67)*y(67)*y(81) + pkrelcFoscJun*y(65)*y(65)*y(153);
  dy(67) = pkphoscJun*y(4)*y(4)*y(13)*y(13)*y(146) + -pkdephoscJun*y(67)*y(67)*y(123) + -2*(pkdimercJun*y(67)*y(67)*y(67)*y(134)) + 2*(ptempDimer*y(67)*y(68)*y(207)) + 2*(pkdedimercJun*y(68)*y(68)*y(91)) + -pkbincFoscJun*y(66)*y(66)*y(67)*y(67)*y(81) + pkrelcFoscJun*y(65)*y(65)*y(153);
  dy(68) = pkdimercJun*y(67)*y(67)*y(67)*y(134) + -ptempDimer*y(67)*y(68)*y(207) + -pkdedimercJun*y(68)*y(68)*y(91);
  dy(69) = pksynSP1 * pkAP1activity*y(65)*y(65)*y(80)*y(200) + -pkdegSP1*y(69)*y(69)*y(75)*y(116) + -pkbinSP1TIMP1DNA*y(69)*y(69)*y(73)*y(73)*y(88) + pkrelSP1TIMP1DNA*y(70)*y(70)*y(166);
  dy(70) = pkbinSP1TIMP1DNA*y(69)*y(69)*y(73)*y(73)*y(88) + -pkrelSP1TIMP1DNA*y(70)*y(70)*y(166);
  dy(71) = pkdephosSTAT3nuc*y(72)*y(72)*y(131) + pkdephosSTAT3nucPTPRT*y(25)*y(25)*y(72)*y(72)*y(132) + -pknuc2cytSTAT3*y(71)*y(71)*y(144);
  dy(72) = -pkdephosSTAT3nuc*y(72)*y(72)*y(131) + -pkdephosSTAT3nucPTPRT*y(25)*y(25)*y(72)*y(72)*y(132) + pkcyt2nucSTAT3*y(29)*y(29)*y(90);
  dy(73) = -pkbinSP1TIMP1DNA*y(69)*y(69)*y(73)*y(73)*y(88) + pkrelSP1TIMP1DNA*y(70)*y(70)*y(166);
  dy(74) = 0;
  dy(75) = 0;
  dy(76) = 0;
  dy(77) = 0;
  dy(78) = 0;
  dy(79) = 0;
  dy(80) = 0;
  dy(81) = 0;
  dy(82) = 0;
  dy(83) = 0;
  dy(84) = 0;
  dy(85) = 0;
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
  dy(104) = 0;
  dy(105) = 0;
  dy(106) = 0;
  dy(107) = 0;
  dy(108) = 0;
  dy(109) = 0;
  dy(110) = 0;
  dy(111) = 0;
  dy(112) = 0;
  dy(113) = 0;
  dy(114) = 0;
  dy(115) = 0;
  dy(116) = 0;
  dy(117) = 0;
  dy(118) = 0;
  dy(119) = 0;
  dy(120) = 0;
  dy(121) = 0;
  dy(122) = 0;
  dy(123) = 0;
  dy(124) = 0;
  dy(125) = 0;
  dy(126) = 0;
  dy(127) = 0;
  dy(128) = 0;
  dy(129) = 0;
  dy(130) = 0;
  dy(131) = 0;
  dy(132) = 0;
  dy(133) = 0;
  dy(134) = 0;
  dy(135) = 0;
  dy(136) = 0;
  dy(137) = 0;
  dy(138) = 0;
  dy(139) = 0;
  dy(140) = 0;
  dy(141) = 0;
  dy(142) = 0;
  dy(143) = 0;
  dy(144) = 0;
  dy(145) = 0;
  dy(146) = 0;
  dy(147) = 0;
  dy(148) = 0;
  dy(149) = 0;
  dy(150) = 0;
  dy(151) = 0;
  dy(152) = 0;
  dy(153) = 0;
  dy(154) = 0;
  dy(155) = 0;
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
  dy(204) = 0;
  dy(205) = 0;
  dy(206) = 0;
  dy(207) = 0;
end
