

% Automatically generated from MODEL8262229752_curry.
% Original number of species: 47.
% Original number of reactions: 25.

% Correspondence with original names:
%     y(1) = Nutrients
%     y(2) = Met
%     y(3) = SAM
%     y(4) = SAH
%     y(5) = Decarb_SAM
%     y(6) = Putrescine
%     y(7) = Pfs_mRNA
%     y(8) = pfs_gene
%     y(9) = Pfs_prot
%     y(10) = Adenine
%     y(11) = SRH
%     y(12) = LuxS_gene
%     y(13) = LuxS_mRNA
%     y(14) = LuxS_prot
%     y(15) = DPD
%     y(16) = Homocys
%     y(17) = MTA
%     y(18) = Spermidine
%     y(19) = MTR
%     y(20) = AI2_intra
%     y(21) = AI2_extra
%     y(22) = SINK
%     y(23) = AI2_trans_r
%     y(24) = AI2_phos_r
%     y(25) = AI2_excret_r
%     y(26) = AI2_syn_r
%     y(27) = AdoMet_r
%     y(28) = DPD_deg_r
%     y(29) = LuxS_mRNA_d
%     y(30) = LuxS_prot_d
%     y(31) = LuxS_transc
%     y(32) = LuxS_transl
%     y(33) = MTR_e
%     y(34) = MTR_syn_r
%     y(35) = Met_recov
%     y(36) = Methy_trans
%     y(37) = Pfs_prot_d
%     y(38) = Polyamine_uti
%     y(39) = SAH_Hydro_r
%     y(40) = SAM_Dec
%     y(41) = SRH_cleav
%     y(42) = SpeE_syn_r
%     y(43) = Spermi_uti
%     y(44) = b_reac_r
%     y(45) = pfs_mRNA_d
%     y(46) = pfs_transc
%     y(47) = pfs_transl


function MODEL8262229752_curry
[T,Y]=ode45(@ode,[0 100.0],[  28350.0 2248.0 10000.0 320.0 220.0 4400.0 32.0 1.0 800.0 596.0 300.0 1.0 16.0 400.0 300.0 300.0 296.0 940.0 180.0 60.0 60.0 0.0 0.0 0.0 0.25 0.00067 0.962 0.005 0.03 0.012 1.25 0.74 0.02 0.0000221 0.35 0.15 0.003 0.15 0.00055 0.055 0.00224 0.00000403 0.0208 0.01 0.022 2.1 0.54]);
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
xlabel('time');
ylabel('value');
legend('Nutrients','Met','SAM','SAH','Decarb_SAM','Putrescine','Pfs_mRNA','pfs_gene','Pfs_prot','Adenine','SRH','LuxS_gene','LuxS_mRNA','LuxS_prot','DPD','Homocys','MTA','Spermidine','MTR','AI2_intra','AI2_extra','SINK','AI2_trans_r','AI2_phos_r','AI2_excret_r','AI2_syn_r','AdoMet_r','DPD_deg_r','LuxS_mRNA_d','LuxS_prot_d','LuxS_transc','LuxS_transl','MTR_e','MTR_syn_r','Met_recov','Methy_trans','Pfs_prot_d','Polyamine_uti','SAH_Hydro_r','SAM_Dec','SRH_cleav','SpeE_syn_r','Spermi_uti','b_reac_r','pfs_mRNA_d','pfs_transc','pfs_transl');
end

function dy =  ode(t,y) 
  pAI2_trans_r = 1.0;
  pAI2_phos_r = 1.0;
  pAI2_excret_r = 1.0;
  pAI2_syn_r = 1.0;
  pAdoMet_r = 1.0;
  pDPD_deg_r = 1.0;
  pLuxS_mRNA_d = 1.0;
  pLuxS_prot_d = 1.0;
  pLuxS_transc = 1.0;
  pLuxS_transl = 1.0;
  pMTR_e = 1.0;
  pMTR_syn_r = 1.0;
  pMet_recov = 1.0;
  pMethy_trans = 1.0;
  pPfs_prot_d = 1.0;
  pPolyamine_uti = 1.0;
  pSAH_Hydro_r = 1.0;
  pSAM_Dec = 1.0;
  pSRH_cleav = 1.0;
  pSpeE_syn_r = 1.0;
  pSpermi_uti = 1.0;
  pb_reac_r = 1.0;
  ppfs_mRNA_d = 1.0;
  ppfs_transc = 1.0;
  ppfs_transl = 1.0;

  dy=zeros(47,1);

  dy(1) = -pb_reac_r*y(1)*y(44);
  dy(2) = pb_reac_r*y(1)*y(44) + -pAdoMet_r*y(2)*y(27) + pMet_recov*y(16)*y(35);
  dy(3) = pAdoMet_r*y(2)*y(27) + -pMethy_trans*y(3)*y(36) + -pSAM_Dec*y(3)*y(40);
  dy(4) = pMethy_trans*y(3)*y(36) + -pSAH_Hydro_r*y(4)*y(9)*y(39);
  dy(5) = pSAM_Dec*y(3)*y(40) + -pSpeE_syn_r*y(5)*y(6)*y(42);
  dy(6) = -pSpeE_syn_r*y(5)*y(6)*y(42);
  dy(7) = -ppfs_mRNA_d*y(7)*y(45) + ppfs_transc*y(8)*y(46);
  dy(8) = 0;
  dy(9) = -pPfs_prot_d*y(9)*y(37) + ppfs_transl*y(7)*y(47);
  dy(10) = pMTR_syn_r*y(9)*y(17)*y(34) + -pPolyamine_uti*y(10)*y(38) + pSAH_Hydro_r*y(4)*y(9)*y(39);
  dy(11) = pSAH_Hydro_r*y(4)*y(9)*y(39) + -pSRH_cleav*y(11)*y(14)*y(41);
  dy(12) = 0;
  dy(13) = -pLuxS_mRNA_d*y(13)*y(29) + pLuxS_transc*y(12)*y(31);
  dy(14) = -pLuxS_prot_d*y(14)*y(30) + pLuxS_transl*y(13)*y(32);
  dy(15) = pSRH_cleav*y(11)*y(14)*y(41) + -pDPD_deg_r*y(15)*y(28) + -pAI2_syn_r*y(15)*y(26);
  dy(16) = pSRH_cleav*y(11)*y(14)*y(41) + -pMet_recov*y(16)*y(35);
  dy(17) = pSpeE_syn_r*y(5)*y(6)*y(42) + -pMTR_syn_r*y(9)*y(17)*y(34);
  dy(18) = pSpeE_syn_r*y(5)*y(6)*y(42) + -pSpermi_uti*y(18)*y(43);
  dy(19) = pMTR_syn_r*y(9)*y(17)*y(34) + -pMTR_e*y(19)*y(33);
  dy(20) = pAI2_syn_r*y(15)*y(26) + -pAI2_excret_r*y(20)*y(25) + pAI2_trans_r*y(21)*y(23) + -pAI2_phos_r*y(20)*y(24);
  dy(21) = pAI2_excret_r*y(20)*y(25) + -pAI2_trans_r*y(21)*y(23);
  dy(22) = pSpermi_uti*y(18)*y(43) + pMTR_e*y(19)*y(33) + pPolyamine_uti*y(10)*y(38) + pPfs_prot_d*y(9)*y(37) + ppfs_mRNA_d*y(7)*y(45) + pDPD_deg_r*y(15)*y(28) + pLuxS_prot_d*y(14)*y(30) + pLuxS_mRNA_d*y(13)*y(29) + pAI2_phos_r*y(20)*y(24);
  dy(23) = 0;
  dy(24) = 0;
  dy(25) = 0;
  dy(26) = 0;
  dy(27) = 0;
  dy(28) = 0;
  dy(29) = 0;
  dy(30) = 0;
  dy(31) = 0;
  dy(32) = 0;
  dy(33) = 0;
  dy(34) = 0;
  dy(35) = 0;
  dy(36) = 0;
  dy(37) = 0;
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
end
