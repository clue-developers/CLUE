

% Automatically generated from e3_curry.
% Original number of species: 75.
% Original number of reactions: 288.

% Correspondence with original names:
%     y(1) = S0
%     y(2) = S1
%     y(3) = S2
%     y(4) = S3
%     y(5) = S4
%     y(6) = S5
%     y(7) = S6
%     y(8) = S7
%     y(9) = S8
%     y(10) = S9
%     y(11) = S10
%     y(12) = S11
%     y(13) = S12
%     y(14) = S13
%     y(15) = S14
%     y(16) = S15
%     y(17) = S16
%     y(18) = S17
%     y(19) = S18
%     y(20) = S19
%     y(21) = S20
%     y(22) = S21
%     y(23) = S22
%     y(24) = S23
%     y(25) = S24
%     y(26) = S25
%     y(27) = S26
%     y(28) = S27
%     y(29) = S28
%     y(30) = S29
%     y(31) = S30
%     y(32) = S31
%     y(33) = S32
%     y(34) = S33
%     y(35) = S34
%     y(36) = S35
%     y(37) = S36
%     y(38) = S37
%     y(39) = S38
%     y(40) = S39
%     y(41) = S40
%     y(42) = S41
%     y(43) = S42
%     y(44) = S43
%     y(45) = S44
%     y(46) = S45
%     y(47) = S46
%     y(48) = S47
%     y(49) = S48
%     y(50) = S49
%     y(51) = S50
%     y(52) = S51
%     y(53) = S52
%     y(54) = S53
%     y(55) = S54
%     y(56) = S55
%     y(57) = S56
%     y(58) = S57
%     y(59) = S58
%     y(60) = S59
%     y(61) = S60
%     y(62) = S61
%     y(63) = S62
%     y(64) = S63
%     y(65) = S64
%     y(66) = S65
%     y(67) = Etot
%     y(68) = Ftot
%     y(69) = Stot
%     y(70) = kOnE
%     y(71) = kOffE
%     y(72) = kCatE
%     y(73) = kOnF
%     y(74) = kOffF
%     y(75) = kCatF


function e3_curry
[T,Y]=ode45(@ode,[0 100.0],[  300.0 300.0 3000.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 300.0 300.0 3000.0 0.7 3.0 5.0 0.7 3.0 5.1]);
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
xlabel('time');
ylabel('value');
legend('S0','S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','S11','S12','S13','S14','S15','S16','S17','S18','S19','S20','S21','S22','S23','S24','S25','S26','S27','S28','S29','S30','S31','S32','S33','S34','S35','S36','S37','S38','S39','S40','S41','S42','S43','S44','S45','S46','S47','S48','S49','S50','S51','S52','S53','S54','S55','S56','S57','S58','S59','S60','S61','S62','S63','S64','S65','Etot','Ftot','Stot','kOnE','kOffE','kCatE','kOnF','kOffF','kCatF');
end

function dy =  ode(t,y) 
  pEtot = 1.0;
  pFtot = 1.0;
  pStot = 1.0;
  pkOnE = 1.0;
  pkOffE = 1.0;
  pkCatE = 1.0;
  pkOnF = 1.0;
  pkOffF = 1.0;
  pkCatF = 1.0;

  dy=zeros(75,1);

  dy(1) = -pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(5)*y(70) + -pkOnE*y(1)*y(6)*y(70) + pkOffE*y(4)*y(71) + pkCatE*y(4)*y(72) + -pkOnE*y(1)*y(4)*y(70) + -pkOnE*y(1)*y(6)*y(70) + pkOffE*y(5)*y(71) + pkCatE*y(5)*y(72) + -pkOnE*y(1)*y(4)*y(70) + -pkOnE*y(1)*y(5)*y(70) + pkOffE*y(6)*y(71) + pkCatE*y(6)*y(72) + -pkOnE*y(1)*y(10)*y(70) + -pkOnE*y(1)*y(11)*y(70) + -pkOnE*y(1)*y(12)*y(70) + pkOffE*y(7)*y(71) + pkOffE*y(8)*y(71) + pkCatE*y(7)*y(72) + pkCatE*y(8)*y(72) + -pkOnE*y(1)*y(8)*y(70) + -pkOnE*y(1)*y(9)*y(70) + -pkOnE*y(1)*y(12)*y(70) + pkOffE*y(7)*y(71) + pkOffE*y(10)*y(71) + pkCatE*y(7)*y(72) + pkCatE*y(10)*y(72) + -pkOnE*y(1)*y(7)*y(70) + -pkOnE*y(1)*y(9)*y(70) + -pkOnE*y(1)*y(11)*y(70) + pkOffE*y(8)*y(71) + pkOffE*y(10)*y(71) + pkCatE*y(8)*y(72) + pkCatE*y(10)*y(72) + -pkOnE*y(1)*y(19)*y(70) + -pkOnE*y(1)*y(20)*y(70) + -pkOnE*y(1)*y(21)*y(70) + -pkOnE*y(1)*y(22)*y(70) + pkOffE*y(13)*y(71) + pkOffE*y(14)*y(71) + pkOffE*y(15)*y(71) + pkCatE*y(13)*y(72) + pkCatE*y(14)*y(72) + pkCatE*y(15)*y(72) + -pkOnE*y(1)*y(15)*y(70) + -pkOnE*y(1)*y(17)*y(70) + -pkOnE*y(1)*y(18)*y(70) + -pkOnE*y(1)*y(22)*y(70) + pkOffE*y(13)*y(71) + pkOffE*y(16)*y(71) + pkOffE*y(19)*y(71) + pkCatE*y(13)*y(72) + pkCatE*y(16)*y(72) + pkCatE*y(19)*y(72) + -pkOnE*y(1)*y(14)*y(70) + -pkOnE*y(1)*y(16)*y(70) + -pkOnE*y(1)*y(18)*y(70) + -pkOnE*y(1)*y(21)*y(70) + pkOffE*y(13)*y(71) + pkOffE*y(17)*y(71) + pkOffE*y(20)*y(71) + pkCatE*y(13)*y(72) + pkCatE*y(17)*y(72) + pkCatE*y(20)*y(72) + -pkOnE*y(1)*y(32)*y(70) + -pkOnE*y(1)*y(33)*y(70) + -pkOnE*y(1)*y(34)*y(70) + pkOffE*y(23)*y(71) + pkOffE*y(24)*y(71) + pkOffE*y(25)*y(71) + pkOffE*y(26)*y(71) + pkCatE*y(23)*y(72) + pkCatE*y(24)*y(72) + pkCatE*y(25)*y(72) + pkCatE*y(26)*y(72) + -pkOnE*y(1)*y(26)*y(70) + -pkOnE*y(1)*y(29)*y(70) + -pkOnE*y(1)*y(31)*y(70) + pkOffE*y(23)*y(71) + pkOffE*y(27)*y(71) + pkOffE*y(30)*y(71) + pkOffE*y(32)*y(71) + pkCatE*y(23)*y(72) + pkCatE*y(27)*y(72) + pkCatE*y(30)*y(72) + pkCatE*y(32)*y(72) + -pkOnE*y(1)*y(25)*y(70) + -pkOnE*y(1)*y(28)*y(70) + -pkOnE*y(1)*y(30)*y(70) + pkOffE*y(24)*y(71) + pkOffE*y(27)*y(71) + pkOffE*y(31)*y(71) + pkOffE*y(34)*y(71) + pkCatE*y(24)*y(72) + pkCatE*y(27)*y(72) + pkCatE*y(31)*y(72) + pkCatE*y(34)*y(72) + -pkOnE*y(1)*y(45)*y(70) + -pkOnE*y(1)*y(46)*y(70) + pkOffE*y(35)*y(71) + pkOffE*y(36)*y(71) + pkOffE*y(37)*y(71) + pkCatE*y(35)*y(72) + pkCatE*y(36)*y(72) + pkCatE*y(37)*y(72) + -pkOnE*y(1)*y(41)*y(70) + -pkOnE*y(1)*y(44)*y(70) + pkOffE*y(35)*y(71) + pkOffE*y(38)*y(71) + pkOffE*y(42)*y(71) + pkCatE*y(35)*y(72) + pkCatE*y(38)*y(72) + pkCatE*y(42)*y(72) + -pkOnE*y(1)*y(40)*y(70) + -pkOnE*y(1)*y(43)*y(70) + pkOffE*y(37)*y(71) + pkOffE*y(39)*y(71) + pkOffE*y(42)*y(71) + pkCatE*y(37)*y(72) + pkCatE*y(39)*y(72) + pkCatE*y(42)*y(72) + -pkOnE*y(1)*y(56)*y(70) + pkOffE*y(47)*y(71) + pkOffE*y(48)*y(71) + pkCatE*y(47)*y(72) + pkCatE*y(48)*y(72) + -pkOnE*y(1)*y(55)*y(70) + pkOffE*y(49)*y(71) + pkOffE*y(52)*y(71) + pkCatE*y(49)*y(72) + pkCatE*y(52)*y(72) + -pkOnE*y(1)*y(54)*y(70) + pkOffE*y(51)*y(71) + pkOffE*y(53)*y(71) + pkCatE*y(51)*y(72) + pkCatE*y(53)*y(72) + pkOffE*y(57)*y(71) + pkCatE*y(57)*y(72) + pkOffE*y(60)*y(71) + pkCatE*y(60)*y(72) + pkOffE*y(62)*y(71) + pkCatE*y(62)*y(72);
  dy(2) = -pkOnF*y(2)*y(9)*y(73) + -pkOnF*y(2)*y(11)*y(73) + -pkOnF*y(2)*y(12)*y(73) + -pkOnF*y(2)*y(16)*y(73) + -pkOnF*y(2)*y(17)*y(73) + pkOffF*y(18)*y(74) + pkCatF*y(18)*y(75) + -pkOnF*y(2)*y(14)*y(73) + -pkOnF*y(2)*y(20)*y(73) + pkOffF*y(21)*y(74) + pkCatF*y(21)*y(75) + -pkOnF*y(2)*y(15)*y(73) + -pkOnF*y(2)*y(19)*y(73) + pkOffF*y(22)*y(74) + pkCatF*y(22)*y(75) + -pkOnF*y(2)*y(27)*y(73) + -pkOnF*y(2)*y(28)*y(73) + -pkOnF*y(2)*y(29)*y(73) + pkOffF*y(30)*y(74) + pkOffF*y(31)*y(74) + pkCatF*y(30)*y(75) + pkCatF*y(31)*y(75) + -pkOnF*y(2)*y(24)*y(73) + -pkOnF*y(2)*y(28)*y(73) + -pkOnF*y(2)*y(33)*y(73) + pkOffF*y(25)*y(74) + pkOffF*y(34)*y(74) + pkCatF*y(25)*y(75) + pkCatF*y(34)*y(75) + -pkOnF*y(2)*y(23)*y(73) + -pkOnF*y(2)*y(29)*y(73) + -pkOnF*y(2)*y(33)*y(73) + pkOffF*y(26)*y(74) + pkOffF*y(32)*y(74) + pkCatF*y(26)*y(75) + pkCatF*y(32)*y(75) + -pkOnF*y(2)*y(38)*y(73) + -pkOnF*y(2)*y(39)*y(73) + -pkOnF*y(2)*y(40)*y(73) + -pkOnF*y(2)*y(41)*y(73) + pkOffF*y(42)*y(74) + pkOffF*y(43)*y(74) + pkOffF*y(44)*y(74) + pkCatF*y(42)*y(75) + pkCatF*y(43)*y(75) + pkCatF*y(44)*y(75) + -pkOnF*y(2)*y(36)*y(73) + -pkOnF*y(2)*y(39)*y(73) + -pkOnF*y(2)*y(43)*y(73) + -pkOnF*y(2)*y(45)*y(73) + pkOffF*y(37)*y(74) + pkOffF*y(40)*y(74) + pkOffF*y(46)*y(74) + pkCatF*y(37)*y(75) + pkCatF*y(40)*y(75) + pkCatF*y(46)*y(75) + -pkOnF*y(2)*y(36)*y(73) + -pkOnF*y(2)*y(38)*y(73) + -pkOnF*y(2)*y(44)*y(73) + -pkOnF*y(2)*y(46)*y(73) + pkOffF*y(35)*y(74) + pkOffF*y(41)*y(74) + pkOffF*y(45)*y(74) + pkCatF*y(35)*y(75) + pkCatF*y(41)*y(75) + pkCatF*y(45)*y(75) + -pkOnF*y(2)*y(49)*y(73) + -pkOnF*y(2)*y(50)*y(73) + -pkOnF*y(2)*y(51)*y(73) + pkOffF*y(52)*y(74) + pkOffF*y(53)*y(74) + pkOffF*y(54)*y(74) + pkOffF*y(55)*y(74) + pkCatF*y(52)*y(75) + pkCatF*y(53)*y(75) + pkCatF*y(54)*y(75) + pkCatF*y(55)*y(75) + -pkOnF*y(2)*y(47)*y(73) + -pkOnF*y(2)*y(50)*y(73) + -pkOnF*y(2)*y(53)*y(73) + pkOffF*y(48)*y(74) + pkOffF*y(51)*y(74) + pkOffF*y(54)*y(74) + pkOffF*y(56)*y(74) + pkCatF*y(48)*y(75) + pkCatF*y(51)*y(75) + pkCatF*y(54)*y(75) + pkCatF*y(56)*y(75) + -pkOnF*y(2)*y(48)*y(73) + -pkOnF*y(2)*y(50)*y(73) + -pkOnF*y(2)*y(52)*y(73) + pkOffF*y(47)*y(74) + pkOffF*y(49)*y(74) + pkOffF*y(55)*y(74) + pkOffF*y(56)*y(74) + pkCatF*y(47)*y(75) + pkCatF*y(49)*y(75) + pkCatF*y(55)*y(75) + pkCatF*y(56)*y(75) + -pkOnF*y(2)*y(58)*y(73) + -pkOnF*y(2)*y(59)*y(73) + pkOffF*y(60)*y(74) + pkOffF*y(61)*y(74) + pkOffF*y(62)*y(74) + pkCatF*y(60)*y(75) + pkCatF*y(61)*y(75) + pkCatF*y(62)*y(75) + -pkOnF*y(2)*y(58)*y(73) + -pkOnF*y(2)*y(61)*y(73) + pkOffF*y(57)*y(74) + pkOffF*y(59)*y(74) + pkOffF*y(62)*y(74) + pkCatF*y(57)*y(75) + pkCatF*y(59)*y(75) + pkCatF*y(62)*y(75) + -pkOnF*y(2)*y(59)*y(73) + -pkOnF*y(2)*y(61)*y(73) + pkOffF*y(57)*y(74) + pkOffF*y(58)*y(74) + pkOffF*y(60)*y(74) + pkCatF*y(57)*y(75) + pkCatF*y(58)*y(75) + pkCatF*y(60)*y(75) + -pkOnF*y(2)*y(63)*y(73) + pkOffF*y(64)*y(74) + pkOffF*y(65)*y(74) + pkCatF*y(64)*y(75) + pkCatF*y(65)*y(75) + -pkOnF*y(2)*y(64)*y(73) + pkOffF*y(63)*y(74) + pkOffF*y(65)*y(74) + pkCatF*y(63)*y(75) + pkCatF*y(65)*y(75) + -pkOnF*y(2)*y(65)*y(73) + pkOffF*y(63)*y(74) + pkOffF*y(64)*y(74) + pkCatF*y(63)*y(75) + pkCatF*y(64)*y(75) + pkOffF*y(66)*y(74) + pkCatF*y(66)*y(75) + pkOffF*y(66)*y(74) + pkCatF*y(66)*y(75) + pkOffF*y(66)*y(74) + pkCatF*y(66)*y(75);
  dy(3) = -pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(3)*y(70) + pkOffE*y(4)*y(71) + pkOffE*y(5)*y(71) + pkOffE*y(6)*y(71) + pkCatF*y(18)*y(75) + pkCatF*y(21)*y(75) + pkCatF*y(22)*y(75);
  dy(4) = pkOnE*y(1)*y(3)*y(70) + -pkOffE*y(4)*y(71) + -pkCatE*y(4)*y(72) + -pkOnE*y(1)*y(4)*y(70) + -pkOnE*y(1)*y(4)*y(70) + pkOffE*y(7)*y(71) + pkOffE*y(8)*y(71) + pkCatF*y(25)*y(75) + pkCatF*y(26)*y(75);
  dy(5) = pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(5)*y(70) + -pkOffE*y(5)*y(71) + -pkCatE*y(5)*y(72) + -pkOnE*y(1)*y(5)*y(70) + pkOffE*y(7)*y(71) + pkOffE*y(10)*y(71) + pkCatF*y(30)*y(75) + pkCatF*y(32)*y(75);
  dy(6) = pkOnE*y(1)*y(3)*y(70) + -pkOnE*y(1)*y(6)*y(70) + -pkOnE*y(1)*y(6)*y(70) + -pkOffE*y(6)*y(71) + -pkCatE*y(6)*y(72) + pkOffE*y(8)*y(71) + pkOffE*y(10)*y(71) + pkCatF*y(31)*y(75) + pkCatF*y(34)*y(75);
  dy(7) = pkOnE*y(1)*y(5)*y(70) + pkOnE*y(1)*y(4)*y(70) + -pkOffE*y(7)*y(71) + -pkCatE*y(7)*y(72) + -pkOffE*y(7)*y(71) + -pkCatE*y(7)*y(72) + -pkOnE*y(1)*y(7)*y(70) + pkOffE*y(13)*y(71) + pkCatF*y(35)*y(75);
  dy(8) = pkOnE*y(1)*y(6)*y(70) + pkOnE*y(1)*y(4)*y(70) + -pkOffE*y(8)*y(71) + -pkCatE*y(8)*y(72) + -pkOnE*y(1)*y(8)*y(70) + -pkOffE*y(8)*y(71) + -pkCatE*y(8)*y(72) + pkOffE*y(13)*y(71) + pkCatF*y(37)*y(75);
  dy(9) = pkCatE*y(4)*y(72) + -pkOnF*y(2)*y(9)*y(73) + -pkOnE*y(1)*y(9)*y(70) + -pkOnE*y(1)*y(9)*y(70) + pkOffF*y(18)*y(74) + pkOffE*y(16)*y(71) + pkOffE*y(17)*y(71) + pkCatF*y(40)*y(75) + pkCatF*y(41)*y(75);
  dy(10) = pkOnE*y(1)*y(6)*y(70) + pkOnE*y(1)*y(5)*y(70) + -pkOnE*y(1)*y(10)*y(70) + -pkOffE*y(10)*y(71) + -pkCatE*y(10)*y(72) + -pkOffE*y(10)*y(71) + -pkCatE*y(10)*y(72) + pkOffE*y(13)*y(71) + pkCatF*y(42)*y(75);
  dy(11) = pkCatE*y(5)*y(72) + -pkOnE*y(1)*y(11)*y(70) + -pkOnF*y(2)*y(11)*y(73) + -pkOnE*y(1)*y(11)*y(70) + pkOffE*y(14)*y(71) + pkOffF*y(21)*y(74) + pkOffE*y(20)*y(71) + pkCatF*y(43)*y(75) + pkCatF*y(45)*y(75);
  dy(12) = pkCatE*y(6)*y(72) + -pkOnE*y(1)*y(12)*y(70) + -pkOnE*y(1)*y(12)*y(70) + -pkOnF*y(2)*y(12)*y(73) + pkOffE*y(15)*y(71) + pkOffE*y(19)*y(71) + pkOffF*y(22)*y(74) + pkCatF*y(44)*y(75) + pkCatF*y(46)*y(75);
  dy(13) = pkOnE*y(1)*y(10)*y(70) + pkOnE*y(1)*y(8)*y(70) + pkOnE*y(1)*y(7)*y(70) + -pkOffE*y(13)*y(71) + -pkCatE*y(13)*y(72) + -pkOffE*y(13)*y(71) + -pkCatE*y(13)*y(72) + -pkOffE*y(13)*y(71) + -pkCatE*y(13)*y(72);
  dy(14) = pkOnE*y(1)*y(11)*y(70) + pkCatE*y(7)*y(72) + -pkOffE*y(14)*y(71) + -pkCatE*y(14)*y(72) + -pkOnF*y(2)*y(14)*y(73) + -pkOnE*y(1)*y(14)*y(70) + pkOffF*y(25)*y(74) + pkOffE*y(24)*y(71) + pkCatF*y(47)*y(75);
  dy(15) = pkOnE*y(1)*y(12)*y(70) + pkCatE*y(8)*y(72) + -pkOffE*y(15)*y(71) + -pkCatE*y(15)*y(72) + -pkOnE*y(1)*y(15)*y(70) + -pkOnF*y(2)*y(15)*y(73) + pkOffE*y(23)*y(71) + pkOffF*y(26)*y(74) + pkCatF*y(48)*y(75);
  dy(16) = pkCatE*y(7)*y(72) + pkOnE*y(1)*y(9)*y(70) + -pkOnF*y(2)*y(16)*y(73) + -pkOffE*y(16)*y(71) + -pkCatE*y(16)*y(72) + -pkOnE*y(1)*y(16)*y(70) + pkOffF*y(30)*y(74) + pkOffE*y(27)*y(71) + pkCatF*y(49)*y(75);
  dy(17) = pkCatE*y(8)*y(72) + pkOnE*y(1)*y(9)*y(70) + -pkOnF*y(2)*y(17)*y(73) + -pkOnE*y(1)*y(17)*y(70) + -pkOffE*y(17)*y(71) + -pkCatE*y(17)*y(72) + pkOffF*y(31)*y(74) + pkOffE*y(27)*y(71) + pkCatF*y(51)*y(75);
  dy(18) = pkOnF*y(2)*y(9)*y(73) + -pkOffF*y(18)*y(74) + -pkCatF*y(18)*y(75) + -pkOnE*y(1)*y(18)*y(70) + -pkOnE*y(1)*y(18)*y(70) + pkOffE*y(30)*y(71) + pkOffE*y(31)*y(71) + pkCatF*y(54)*y(75) + pkCatF*y(55)*y(75);
  dy(19) = pkOnE*y(1)*y(12)*y(70) + pkCatE*y(10)*y(72) + -pkOnE*y(1)*y(19)*y(70) + -pkOffE*y(19)*y(71) + -pkCatE*y(19)*y(72) + -pkOnF*y(2)*y(19)*y(73) + pkOffE*y(23)*y(71) + pkOffF*y(32)*y(74) + pkCatF*y(52)*y(75);
  dy(20) = pkCatE*y(10)*y(72) + pkOnE*y(1)*y(11)*y(70) + -pkOnE*y(1)*y(20)*y(70) + -pkOnF*y(2)*y(20)*y(73) + -pkOffE*y(20)*y(71) + -pkCatE*y(20)*y(72) + pkOffE*y(24)*y(71) + pkOffF*y(34)*y(74) + pkCatF*y(53)*y(75);
  dy(21) = pkOnF*y(2)*y(11)*y(73) + -pkOnE*y(1)*y(21)*y(70) + -pkOffF*y(21)*y(74) + -pkCatF*y(21)*y(75) + -pkOnE*y(1)*y(21)*y(70) + pkOffE*y(25)*y(71) + pkOffE*y(34)*y(71) + pkCatF*y(54)*y(75) + pkCatF*y(56)*y(75);
  dy(22) = pkOnF*y(2)*y(12)*y(73) + -pkOnE*y(1)*y(22)*y(70) + -pkOnE*y(1)*y(22)*y(70) + -pkOffF*y(22)*y(74) + -pkCatF*y(22)*y(75) + pkOffE*y(26)*y(71) + pkOffE*y(32)*y(71) + pkCatF*y(55)*y(75) + pkCatF*y(56)*y(75);
  dy(23) = pkOnE*y(1)*y(19)*y(70) + pkOnE*y(1)*y(15)*y(70) + pkCatE*y(13)*y(72) + -pkOffE*y(23)*y(71) + -pkCatE*y(23)*y(72) + -pkOffE*y(23)*y(71) + -pkCatE*y(23)*y(72) + -pkOnF*y(2)*y(23)*y(73) + pkOffF*y(35)*y(74);
  dy(24) = pkOnE*y(1)*y(20)*y(70) + pkCatE*y(13)*y(72) + pkOnE*y(1)*y(14)*y(70) + -pkOffE*y(24)*y(71) + -pkCatE*y(24)*y(72) + -pkOnF*y(2)*y(24)*y(73) + -pkOffE*y(24)*y(71) + -pkCatE*y(24)*y(72) + pkOffF*y(37)*y(74);
  dy(25) = pkOnE*y(1)*y(21)*y(70) + pkOnF*y(2)*y(14)*y(73) + -pkOffE*y(25)*y(71) + -pkCatE*y(25)*y(72) + -pkOffF*y(25)*y(74) + -pkCatF*y(25)*y(75) + -pkOnE*y(1)*y(25)*y(70) + pkOffE*y(37)*y(71) + pkCatF*y(57)*y(75);
  dy(26) = pkOnE*y(1)*y(22)*y(70) + pkOnF*y(2)*y(15)*y(73) + -pkOffE*y(26)*y(71) + -pkCatE*y(26)*y(72) + -pkOnE*y(1)*y(26)*y(70) + -pkOffF*y(26)*y(74) + -pkCatF*y(26)*y(75) + pkOffE*y(35)*y(71) + pkCatF*y(57)*y(75);
  dy(27) = pkCatE*y(13)*y(72) + pkOnE*y(1)*y(17)*y(70) + pkOnE*y(1)*y(16)*y(70) + -pkOnF*y(2)*y(27)*y(73) + -pkOffE*y(27)*y(71) + -pkCatE*y(27)*y(72) + -pkOffE*y(27)*y(71) + -pkCatE*y(27)*y(72) + pkOffF*y(42)*y(74);
  dy(28) = pkCatE*y(14)*y(72) + pkCatE*y(16)*y(72) + -pkOnF*y(2)*y(28)*y(73) + -pkOnF*y(2)*y(28)*y(73) + -pkOnE*y(1)*y(28)*y(70) + pkOffF*y(43)*y(74) + pkOffF*y(40)*y(74) + pkOffE*y(39)*y(71) + pkCatF*y(58)*y(75);
  dy(29) = pkCatE*y(15)*y(72) + pkCatE*y(17)*y(72) + -pkOnF*y(2)*y(29)*y(73) + -pkOnE*y(1)*y(29)*y(70) + -pkOnF*y(2)*y(29)*y(73) + pkOffF*y(44)*y(74) + pkOffE*y(38)*y(71) + pkOffF*y(41)*y(74) + pkCatF*y(59)*y(75);
  dy(30) = pkOnF*y(2)*y(16)*y(73) + pkOnE*y(1)*y(18)*y(70) + -pkOffF*y(30)*y(74) + -pkCatF*y(30)*y(75) + -pkOffE*y(30)*y(71) + -pkCatE*y(30)*y(72) + -pkOnE*y(1)*y(30)*y(70) + pkOffE*y(42)*y(71) + pkCatF*y(60)*y(75);
  dy(31) = pkOnF*y(2)*y(17)*y(73) + pkOnE*y(1)*y(18)*y(70) + -pkOffF*y(31)*y(74) + -pkCatF*y(31)*y(75) + -pkOnE*y(1)*y(31)*y(70) + -pkOffE*y(31)*y(71) + -pkCatE*y(31)*y(72) + pkOffE*y(42)*y(71) + pkCatF*y(62)*y(75);
  dy(32) = pkOnE*y(1)*y(22)*y(70) + pkOnF*y(2)*y(19)*y(73) + -pkOnE*y(1)*y(32)*y(70) + -pkOffE*y(32)*y(71) + -pkCatE*y(32)*y(72) + -pkOffF*y(32)*y(74) + -pkCatF*y(32)*y(75) + pkOffE*y(35)*y(71) + pkCatF*y(60)*y(75);
  dy(33) = pkCatE*y(19)*y(72) + pkCatE*y(20)*y(72) + -pkOnE*y(1)*y(33)*y(70) + -pkOnF*y(2)*y(33)*y(73) + -pkOnF*y(2)*y(33)*y(73) + pkOffE*y(36)*y(71) + pkOffF*y(46)*y(74) + pkOffF*y(45)*y(74) + pkCatF*y(61)*y(75);
  dy(34) = pkOnF*y(2)*y(20)*y(73) + pkOnE*y(1)*y(21)*y(70) + -pkOnE*y(1)*y(34)*y(70) + -pkOffF*y(34)*y(74) + -pkCatF*y(34)*y(75) + -pkOffE*y(34)*y(71) + -pkCatE*y(34)*y(72) + pkOffE*y(37)*y(71) + pkCatF*y(62)*y(75);
  dy(35) = pkOnE*y(1)*y(32)*y(70) + pkOnE*y(1)*y(26)*y(70) + pkOnF*y(2)*y(23)*y(73) + -pkOffE*y(35)*y(71) + -pkCatE*y(35)*y(72) + -pkOffE*y(35)*y(71) + -pkCatE*y(35)*y(72) + -pkOffF*y(35)*y(74) + -pkCatF*y(35)*y(75);
  dy(36) = pkOnE*y(1)*y(33)*y(70) + pkCatE*y(23)*y(72) + pkCatE*y(24)*y(72) + -pkOffE*y(36)*y(71) + -pkCatE*y(36)*y(72) + -pkOnF*y(2)*y(36)*y(73) + -pkOnF*y(2)*y(36)*y(73) + pkOffF*y(48)*y(74) + pkOffF*y(47)*y(74);
  dy(37) = pkOnE*y(1)*y(34)*y(70) + pkOnF*y(2)*y(24)*y(73) + pkOnE*y(1)*y(25)*y(70) + -pkOffE*y(37)*y(71) + -pkCatE*y(37)*y(72) + -pkOffF*y(37)*y(74) + -pkCatF*y(37)*y(75) + -pkOffE*y(37)*y(71) + -pkCatE*y(37)*y(72);
  dy(38) = pkCatE*y(23)*y(72) + pkOnE*y(1)*y(29)*y(70) + pkCatE*y(27)*y(72) + -pkOnF*y(2)*y(38)*y(73) + -pkOffE*y(38)*y(71) + -pkCatE*y(38)*y(72) + -pkOnF*y(2)*y(38)*y(73) + pkOffF*y(52)*y(74) + pkOffF*y(49)*y(74);
  dy(39) = pkCatE*y(24)*y(72) + pkCatE*y(27)*y(72) + pkOnE*y(1)*y(28)*y(70) + -pkOnF*y(2)*y(39)*y(73) + -pkOnF*y(2)*y(39)*y(73) + -pkOffE*y(39)*y(71) + -pkCatE*y(39)*y(72) + pkOffF*y(53)*y(74) + pkOffF*y(51)*y(74);
  dy(40) = pkCatE*y(25)*y(72) + pkOnF*y(2)*y(28)*y(73) + -pkOnF*y(2)*y(40)*y(73) + -pkOffF*y(40)*y(74) + -pkCatF*y(40)*y(75) + -pkOnE*y(1)*y(40)*y(70) + pkOffF*y(54)*y(74) + pkOffE*y(51)*y(71) + pkCatF*y(63)*y(75);
  dy(41) = pkCatE*y(26)*y(72) + pkOnF*y(2)*y(29)*y(73) + -pkOnF*y(2)*y(41)*y(73) + -pkOnE*y(1)*y(41)*y(70) + -pkOffF*y(41)*y(74) + -pkCatF*y(41)*y(75) + pkOffF*y(55)*y(74) + pkOffE*y(49)*y(71) + pkCatF*y(63)*y(75);
  dy(42) = pkOnF*y(2)*y(27)*y(73) + pkOnE*y(1)*y(31)*y(70) + pkOnE*y(1)*y(30)*y(70) + -pkOffF*y(42)*y(74) + -pkCatF*y(42)*y(75) + -pkOffE*y(42)*y(71) + -pkCatE*y(42)*y(72) + -pkOffE*y(42)*y(71) + -pkCatE*y(42)*y(72);
  dy(43) = pkOnF*y(2)*y(28)*y(73) + pkCatE*y(30)*y(72) + -pkOffF*y(43)*y(74) + -pkCatF*y(43)*y(75) + -pkOnF*y(2)*y(43)*y(73) + -pkOnE*y(1)*y(43)*y(70) + pkOffF*y(54)*y(74) + pkOffE*y(53)*y(71) + pkCatF*y(64)*y(75);
  dy(44) = pkOnF*y(2)*y(29)*y(73) + pkCatE*y(31)*y(72) + -pkOffF*y(44)*y(74) + -pkCatF*y(44)*y(75) + -pkOnE*y(1)*y(44)*y(70) + -pkOnF*y(2)*y(44)*y(73) + pkOffE*y(52)*y(71) + pkOffF*y(55)*y(74) + pkCatF*y(65)*y(75);
  dy(45) = pkCatE*y(32)*y(72) + pkOnF*y(2)*y(33)*y(73) + -pkOnE*y(1)*y(45)*y(70) + -pkOnF*y(2)*y(45)*y(73) + -pkOffF*y(45)*y(74) + -pkCatF*y(45)*y(75) + pkOffE*y(47)*y(71) + pkOffF*y(56)*y(74) + pkCatF*y(64)*y(75);
  dy(46) = pkOnF*y(2)*y(33)*y(73) + pkCatE*y(34)*y(72) + -pkOnE*y(1)*y(46)*y(70) + -pkOffF*y(46)*y(74) + -pkCatF*y(46)*y(75) + -pkOnF*y(2)*y(46)*y(73) + pkOffE*y(48)*y(71) + pkOffF*y(56)*y(74) + pkCatF*y(65)*y(75);
  dy(47) = pkOnE*y(1)*y(45)*y(70) + pkCatE*y(35)*y(72) + pkOnF*y(2)*y(36)*y(73) + -pkOffE*y(47)*y(71) + -pkCatE*y(47)*y(72) + -pkOnF*y(2)*y(47)*y(73) + -pkOffF*y(47)*y(74) + -pkCatF*y(47)*y(75) + pkOffF*y(57)*y(74);
  dy(48) = pkOnE*y(1)*y(46)*y(70) + pkOnF*y(2)*y(36)*y(73) + pkCatE*y(37)*y(72) + -pkOffE*y(48)*y(71) + -pkCatE*y(48)*y(72) + -pkOffF*y(48)*y(74) + -pkCatF*y(48)*y(75) + -pkOnF*y(2)*y(48)*y(73) + pkOffF*y(57)*y(74);
  dy(49) = pkCatE*y(35)*y(72) + pkOnE*y(1)*y(41)*y(70) + pkOnF*y(2)*y(38)*y(73) + -pkOnF*y(2)*y(49)*y(73) + -pkOffE*y(49)*y(71) + -pkCatE*y(49)*y(72) + -pkOffF*y(49)*y(74) + -pkCatF*y(49)*y(75) + pkOffF*y(60)*y(74);
  dy(50) = pkCatE*y(36)*y(72) + pkCatE*y(38)*y(72) + pkCatE*y(39)*y(72) + -pkOnF*y(2)*y(50)*y(73) + -pkOnF*y(2)*y(50)*y(73) + -pkOnF*y(2)*y(50)*y(73) + pkOffF*y(61)*y(74) + pkOffF*y(59)*y(74) + pkOffF*y(58)*y(74);
  dy(51) = pkCatE*y(37)*y(72) + pkOnF*y(2)*y(39)*y(73) + pkOnE*y(1)*y(40)*y(70) + -pkOnF*y(2)*y(51)*y(73) + -pkOffF*y(51)*y(74) + -pkCatF*y(51)*y(75) + -pkOffE*y(51)*y(71) + -pkCatE*y(51)*y(72) + pkOffF*y(62)*y(74);
  dy(52) = pkOnF*y(2)*y(38)*y(73) + pkOnE*y(1)*y(44)*y(70) + pkCatE*y(42)*y(72) + -pkOffF*y(52)*y(74) + -pkCatF*y(52)*y(75) + -pkOffE*y(52)*y(71) + -pkCatE*y(52)*y(72) + -pkOnF*y(2)*y(52)*y(73) + pkOffF*y(60)*y(74);
  dy(53) = pkOnF*y(2)*y(39)*y(73) + pkCatE*y(42)*y(72) + pkOnE*y(1)*y(43)*y(70) + -pkOffF*y(53)*y(74) + -pkCatF*y(53)*y(75) + -pkOnF*y(2)*y(53)*y(73) + -pkOffE*y(53)*y(71) + -pkCatE*y(53)*y(72) + pkOffF*y(62)*y(74);
  dy(54) = pkOnF*y(2)*y(40)*y(73) + pkOnF*y(2)*y(43)*y(73) + -pkOffF*y(54)*y(74) + -pkCatF*y(54)*y(75) + -pkOffF*y(54)*y(74) + -pkCatF*y(54)*y(75) + -pkOnE*y(1)*y(54)*y(70) + pkOffE*y(62)*y(71) + pkCatF*y(66)*y(75);
  dy(55) = pkOnF*y(2)*y(41)*y(73) + pkOnF*y(2)*y(44)*y(73) + -pkOffF*y(55)*y(74) + -pkCatF*y(55)*y(75) + -pkOnE*y(1)*y(55)*y(70) + -pkOffF*y(55)*y(74) + -pkCatF*y(55)*y(75) + pkOffE*y(60)*y(71) + pkCatF*y(66)*y(75);
  dy(56) = pkOnF*y(2)*y(45)*y(73) + pkOnF*y(2)*y(46)*y(73) + -pkOnE*y(1)*y(56)*y(70) + -pkOffF*y(56)*y(74) + -pkCatF*y(56)*y(75) + -pkOffF*y(56)*y(74) + -pkCatF*y(56)*y(75) + pkOffE*y(57)*y(71) + pkCatF*y(66)*y(75);
  dy(57) = pkOnE*y(1)*y(56)*y(70) + pkOnF*y(2)*y(47)*y(73) + pkOnF*y(2)*y(48)*y(73) + -pkOffE*y(57)*y(71) + -pkCatE*y(57)*y(72) + -pkOffF*y(57)*y(74) + -pkCatF*y(57)*y(75) + -pkOffF*y(57)*y(74) + -pkCatF*y(57)*y(75);
  dy(58) = pkCatE*y(47)*y(72) + pkCatE*y(49)*y(72) + pkOnF*y(2)*y(50)*y(73) + -pkOnF*y(2)*y(58)*y(73) + -pkOnF*y(2)*y(58)*y(73) + -pkOffF*y(58)*y(74) + -pkCatF*y(58)*y(75) + pkOffF*y(64)*y(74) + pkOffF*y(63)*y(74);
  dy(59) = pkCatE*y(48)*y(72) + pkOnF*y(2)*y(50)*y(73) + pkCatE*y(51)*y(72) + -pkOnF*y(2)*y(59)*y(73) + -pkOffF*y(59)*y(74) + -pkCatF*y(59)*y(75) + -pkOnF*y(2)*y(59)*y(73) + pkOffF*y(65)*y(74) + pkOffF*y(63)*y(74);
  dy(60) = pkOnF*y(2)*y(49)*y(73) + pkOnE*y(1)*y(55)*y(70) + pkOnF*y(2)*y(52)*y(73) + -pkOffF*y(60)*y(74) + -pkCatF*y(60)*y(75) + -pkOffE*y(60)*y(71) + -pkCatE*y(60)*y(72) + -pkOffF*y(60)*y(74) + -pkCatF*y(60)*y(75);
  dy(61) = pkOnF*y(2)*y(50)*y(73) + pkCatE*y(52)*y(72) + pkCatE*y(53)*y(72) + -pkOffF*y(61)*y(74) + -pkCatF*y(61)*y(75) + -pkOnF*y(2)*y(61)*y(73) + -pkOnF*y(2)*y(61)*y(73) + pkOffF*y(65)*y(74) + pkOffF*y(64)*y(74);
  dy(62) = pkOnF*y(2)*y(51)*y(73) + pkOnF*y(2)*y(53)*y(73) + pkOnE*y(1)*y(54)*y(70) + -pkOffF*y(62)*y(74) + -pkCatF*y(62)*y(75) + -pkOffF*y(62)*y(74) + -pkCatF*y(62)*y(75) + -pkOffE*y(62)*y(71) + -pkCatE*y(62)*y(72);
  dy(63) = pkCatE*y(57)*y(72) + pkOnF*y(2)*y(58)*y(73) + pkOnF*y(2)*y(59)*y(73) + -pkOnF*y(2)*y(63)*y(73) + -pkOffF*y(63)*y(74) + -pkCatF*y(63)*y(75) + -pkOffF*y(63)*y(74) + -pkCatF*y(63)*y(75) + pkOffF*y(66)*y(74);
  dy(64) = pkOnF*y(2)*y(58)*y(73) + pkCatE*y(60)*y(72) + pkOnF*y(2)*y(61)*y(73) + -pkOffF*y(64)*y(74) + -pkCatF*y(64)*y(75) + -pkOnF*y(2)*y(64)*y(73) + -pkOffF*y(64)*y(74) + -pkCatF*y(64)*y(75) + pkOffF*y(66)*y(74);
  dy(65) = pkOnF*y(2)*y(59)*y(73) + pkOnF*y(2)*y(61)*y(73) + pkCatE*y(62)*y(72) + -pkOffF*y(65)*y(74) + -pkCatF*y(65)*y(75) + -pkOffF*y(65)*y(74) + -pkCatF*y(65)*y(75) + -pkOnF*y(2)*y(65)*y(73) + pkOffF*y(66)*y(74);
  dy(66) = pkOnF*y(2)*y(63)*y(73) + pkOnF*y(2)*y(64)*y(73) + pkOnF*y(2)*y(65)*y(73) + -pkOffF*y(66)*y(74) + -pkCatF*y(66)*y(75) + -pkOffF*y(66)*y(74) + -pkCatF*y(66)*y(75) + -pkOffF*y(66)*y(74) + -pkCatF*y(66)*y(75);
  dy(67) = 0;
  dy(68) = 0;
  dy(69) = 0;
  dy(70) = 0;
  dy(71) = 0;
  dy(72) = 0;
  dy(73) = 0;
  dy(74) = 0;
  dy(75) = 0;
end
