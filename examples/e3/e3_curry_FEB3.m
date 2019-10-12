

% Automatically generated from e3B3_curry.
% Original number of species: 49.
% Original number of reactions: 156.

% Correspondence with original names:
%     y(1) = Etot
%     y(2) = S0
%     y(3) = S2
%     y(4) = kOnE
%     y(5) = S4
%     y(6) = S3
%     y(7) = kOffE
%     y(8) = kCatE
%     y(9) = S9
%     y(10) = S10
%     y(11) = S6
%     y(12) = S8
%     y(13) = S18
%     y(14) = S20
%     y(15) = S12
%     y(16) = S13
%     y(17) = S15
%     y(18) = S17
%     y(19) = S31
%     y(20) = S32
%     y(21) = S22
%     y(22) = S24
%     y(23) = S27
%     y(24) = S29
%     y(25) = S26
%     y(26) = S44
%     y(27) = S34
%     y(28) = S35
%     y(29) = S39
%     y(30) = S42
%     y(31) = S37
%     y(32) = S41
%     y(33) = S55
%     y(34) = S46
%     y(35) = S53
%     y(36) = S48
%     y(37) = S51
%     y(38) = S56
%     y(39) = S59
%     y(40) = S1
%     y(41) = kOnF
%     y(42) = kOffF
%     y(43) = kCatF
%     y(44) = S49
%     y(45) = S57
%     y(46) = S60
%     y(47) = S62
%     y(48) = S63
%     y(49) = S65


function e3B3_curry
[T,Y]=ode45(@ode,[0 100.0],[  3600.0 300.0 3000.0 0.7 0.0 0.0 3.0 5.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 300.0 0.7 3.0 5.1 0.0 0.0 0.0 0.0 0.0 0.0]);
 function array =  getSpecies(y)
array =  Y(:,y);
end

% Output is restricted to Views.
pEtot = 1.0;
pFtot = 1.0;
pStot = 1.0;
pkOnE = 1.0;
pkOffE = 1.0;
pkCatE = 1.0;
pkOnF = 1.0;
pkOffF = 1.0;
pkCatF = 1.0;
view= getSpecies(24)/2;
plot(T,view);
hold on;
view= getSpecies(44)/1;
plot(T,view);
hold on;
view= getSpecies(17)/2;
plot(T,view);
hold on;
view= getSpecies(48)/2;
plot(T,view);
hold on;
view= getSpecies(47)/1;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(36)/2;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(34)/2;
plot(T,view);
hold on;
view= getSpecies(19)/2;
plot(T,view);
hold on;
view= getSpecies(31)/2;
plot(T,view);
hold on;
view= getSpecies(41)/1;
plot(T,view);
hold on;
view= getSpecies(21)/2;
plot(T,view);
hold on;
view= getSpecies(37)/2;
plot(T,view);
hold on;
view= getSpecies(25)/1;
plot(T,view);
hold on;
view= getSpecies(16)/2;
plot(T,view);
hold on;
view= getSpecies(35)/2;
plot(T,view);
hold on;
view= getSpecies(10)/2;
plot(T,view);
hold on;
view= getSpecies(30)/2;
plot(T,view);
hold on;
view= getSpecies(46)/1;
plot(T,view);
hold on;
view= getSpecies(14)/2;
plot(T,view);
hold on;
view= getSpecies(32)/1;
plot(T,view);
hold on;
view= getSpecies(33)/1;
plot(T,view);
hold on;
view= getSpecies(27)/2;
plot(T,view);
hold on;
view= getSpecies(29)/2;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(49)/1;
plot(T,view);
hold on;
view= getSpecies(5)/2;
plot(T,view);
hold on;
view= getSpecies(39)/2;
plot(T,view);
hold on;
view= getSpecies(1)/3;
plot(T,view);
hold on;
view= getSpecies(23)/2;
plot(T,view);
hold on;
view= getSpecies(13)/2;
plot(T,view);
hold on;
view= getSpecies(38)/1;
plot(T,view);
hold on;
view= getSpecies(20)/1;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(22)/2;
plot(T,view);
hold on;
view= getSpecies(43)/1;
plot(T,view);
hold on;
view= getSpecies(45)/2;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(11)/2;
plot(T,view);
hold on;
view= getSpecies(26)/2;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(9)/1;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vS29','vS49','vS15','vS63','vS62','vS17','vS48','vkCatE','vkOffF','vS35','vkOnE','vS46','vS31','vS37','vkOnF','vS22','vS51','vS26','vS13','vS53','vS10','vS42','vS60','vS20','vS41','vS55','vS34','vS39','vS1','vS8','vS0','vS12','vS65','vS4','vS59','vEtot','vS27','vS18','vS56','vS32','vS3','vS24','vkCatF','vS57','vkOffE','vS6','vS44','vS2','vS9');
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

  dy=zeros(49,1);

  dy(1) = 0;
  dy(2) = -((pkOnE + pkOnE)*y(2)*y(3)*y(4)) + -pkOnE*y(2)*y(3)*y(4) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(5)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(5)) + -((pkOnE + pkOnE)*y(2)*y(4)*y(6)) + -pkOnE*y(2)*y(4)*y(9) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(10)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(10)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(11)) + -((pkOnE + pkOnE)*y(2)*y(4)*y(12)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(13)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(14)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(14)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(16)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(17)) + -((pkOnE + pkOnE)*y(2)*y(4)*y(18)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(19)) + -pkOnE*y(2)*y(4)*y(20) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(22)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(23)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(24)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(26)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(29)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(30)) + -pkOnE*y(2)*y(4)*y(33) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(35)) + ((pkOffE + pkOffE) / 2.0)*y(5)*y(7) + ((pkCatE + pkCatE) / 2.0)*y(5)*y(8) + pkOffE*y(6)*y(7) + pkCatE*y(6)*y(8) + (pkOffE + pkOffE)*y(7)*y(9) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(11) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(11) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(13) + pkOffE*y(7)*y(15) + (pkOffE + pkOffE)*y(7)*y(15) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(16) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(17) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(19) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(21) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(21) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(22) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(24) + (pkOffE + pkOffE)*y(7)*y(25) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(27) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(27) + pkOffE*y(7)*y(28) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(31) + (pkOffE + pkOffE)*y(7)*y(32) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(34) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(36) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(37) + pkOffE*y(7)*y(38) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(39) + (pkCatE + pkCatE)*y(8)*y(9) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(11) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(11) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(13) + (pkCatE + pkCatE)*y(8)*y(15) + pkCatE*y(8)*y(15) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(16) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(17) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(19) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(21) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(21) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(22) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(24) + (pkCatE + pkCatE)*y(8)*y(25) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(27) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(27) + pkCatE*y(8)*y(28) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(31) + (pkCatE + pkCatE)*y(8)*y(32) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(34) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(36) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(37) + pkCatE*y(8)*y(38) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(39);
  dy(3) = -((pkOnE + pkOnE)*y(2)*y(3)*y(4)) + -pkOnE*y(2)*y(3)*y(4) + ((pkOffE + pkOffE) / 2.0)*y(5)*y(7) + pkOffE*y(6)*y(7) + ((pkCatF + pkCatF) / 2.0)*y(14)*y(43) + pkCatF*y(18)*y(43);
  dy(4) = 0;
  dy(5) = (pkOnE + pkOnE)*y(2)*y(3)*y(4) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(5)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(5)) + -(((pkOffE + pkOffE) / 2.0)*y(5)*y(7)) + -(((pkCatE + pkCatE) / 2.0)*y(5)*y(8)) + (pkOffE + pkOffE)*y(7)*y(9) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(11) + ((pkCatF + pkCatF) / 2.0)*y(19)*y(43) + ((pkCatF + pkCatF) / 2.0)*y(24)*y(43);
  dy(6) = pkOnE*y(2)*y(3)*y(4) + -((pkOnE + pkOnE)*y(2)*y(4)*y(6)) + -pkOffE*y(6)*y(7) + -pkCatE*y(6)*y(8) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(11) + ((pkCatF + pkCatF) / 2.0)*y(22)*y(43);
  dy(7) = 0;
  dy(8) = 0;
  dy(9) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(5) + -pkOnE*y(2)*y(4)*y(9) + -((pkOffE + pkOffE)*y(7)*y(9)) + pkOffE*y(7)*y(15) + -((pkCatE + pkCatE)*y(8)*y(9)) + pkCatF*y(32)*y(43);
  dy(10) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(10)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(10)) + ((pkCatE + pkCatE) / 2.0)*y(5)*y(8) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(13) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(16) + -(((pkOnF + pkOnF) / 2.0)*y(10)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(14)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(26)*y(43) + ((pkCatF + pkCatF) / 2.0)*y(30)*y(43);
  dy(11) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(5) + (pkOnE + pkOnE)*y(2)*y(4)*y(6) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(11)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(11)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(11)) + (pkOffE + pkOffE)*y(7)*y(15) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(11)) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(11)) + ((pkCatF + pkCatF) / 2.0)*y(27)*y(43);
  dy(12) = -((pkOnE + pkOnE)*y(2)*y(4)*y(12)) + pkCatE*y(6)*y(8) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(17) + -pkOnF*y(12)*y(40)*y(41) + pkOffF*y(18)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(29)*y(43);
  dy(13) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(10) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(13)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(13)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(21) + (pkCatE + pkCatE)*y(8)*y(9) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(13)) + -(((pkOnF + pkOnF) / 2.0)*y(13)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(19)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(37)*y(43);
  dy(14) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(14)) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(14)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(19) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(22) + ((pkOnF + pkOnF) / 2.0)*y(10)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(14)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(14)*y(43)) + (pkCatF + pkCatF)*y(33)*y(43) + ((pkCatF + pkCatF) / 2.0)*y(35)*y(43);
  dy(15) = pkOnE*y(2)*y(4)*y(9) + ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(11) + -pkOffE*y(7)*y(15) + -((pkOffE + pkOffE)*y(7)*y(15)) + -((pkCatE + pkCatE)*y(8)*y(15)) + -pkCatE*y(8)*y(15);
  dy(16) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(10) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(16)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(16)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(21) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(11) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(16)) + -(((pkOnF + pkOnF) / 2.0)*y(16)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(22)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(34)*y(43);
  dy(17) = (pkOnE + pkOnE)*y(2)*y(4)*y(12) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(17)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(17)) + (pkOffE + pkOffE)*y(7)*y(25) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(11) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(17)) + -(((pkOnF + pkOnF) / 2.0)*y(17)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(24)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(36)*y(43);
  dy(18) = -((pkOnE + pkOnE)*y(2)*y(4)*y(18)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(24) + pkOnF*y(12)*y(40)*y(41) + -pkOffF*y(18)*y(42) + -pkCatF*y(18)*y(43) + ((pkCatF + pkCatF) / 2.0)*y(35)*y(43);
  dy(19) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(14) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(19)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(19)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(27) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(19)) + ((pkOnF + pkOnF) / 2.0)*y(13)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(19)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(19)*y(43)) + ((pkCatF + pkCatF) / 2.0)*y(39)*y(43);
  dy(20) = -pkOnE*y(2)*y(4)*y(20) + pkOffE*y(7)*y(28) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(13) + -((pkOnF + pkOnF)*y(20)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(26)*y(42) + pkCatF*y(43)*y(46);
  dy(21) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(13) + ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(16) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(21)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(21)) + (pkCatE + pkCatE)*y(8)*y(15) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(21)) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(21)) + -(((pkOnF + pkOnF) / 2.0)*y(21)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(27)*y(42);
  dy(22) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(14) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(22)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(22)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(27) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(22)) + ((pkOnF + pkOnF) / 2.0)*y(16)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(22)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(22)*y(43)) + (pkCatF + pkCatF)*y(38)*y(43);
  dy(23) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(23)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(31) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(16) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(17) + -(((pkOnF + pkOnF) / 2.0)*y(23)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(23)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(29)*y(42) + ((pkOffF + pkOffF) / 2.0)*y(30)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(43)*y(45);
  dy(24) = (pkOnE + pkOnE)*y(2)*y(4)*y(18) + -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(24)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(24)) + (pkOffE + pkOffE)*y(7)*y(32) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(24)) + ((pkOnF + pkOnF) / 2.0)*y(17)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(24)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(24)*y(43)) + ((pkCatF + pkCatF) / 2.0)*y(39)*y(43);
  dy(25) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(17) + -((pkOffE + pkOffE)*y(7)*y(25)) + pkCatE*y(8)*y(15) + -((pkCatE + pkCatE)*y(8)*y(25)) + -pkOnF*y(25)*y(40)*y(41) + pkOffF*y(32)*y(42);
  dy(26) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(26)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(34) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(19) + (pkOnF + pkOnF)*y(20)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(26)*y(40)*y(41)) + -(((pkOffF + pkOffF) / 2.0)*y(26)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(26)*y(43)) + (pkOffF + pkOffF)*y(33)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(43)*y(48);
  dy(27) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(19) + ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(22) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(27)) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(27)) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(27)) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(27)) + ((pkOnF + pkOnF) / 2.0)*y(21)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(27)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(27)*y(43));
  dy(28) = pkOnE*y(2)*y(4)*y(20) + -pkOffE*y(7)*y(28) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(21) + -pkCatE*y(8)*y(28) + -((pkOnF + pkOnF)*y(28)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(34)*y(42);
  dy(29) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(29)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(36) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(22) + ((pkOnF + pkOnF) / 2.0)*y(23)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(29)*y(40)*y(41)) + -(((pkOffF + pkOffF) / 2.0)*y(29)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(29)*y(43)) + ((pkOffF + pkOffF) / 2.0)*y(35)*y(42) + (pkCatF + pkCatF)*y(43)*y(47);
  dy(30) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(30)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(37) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(24) + ((pkOnF + pkOnF) / 2.0)*y(23)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(30)*y(40)*y(41)) + -(((pkOffF + pkOffF) / 2.0)*y(30)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(30)*y(43)) + ((pkOffF + pkOffF) / 2.0)*y(35)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(43)*y(48);
  dy(31) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(23) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(31)) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(21) + (pkCatE + pkCatE)*y(8)*y(25) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(31)) + -(((pkOnF + pkOnF) / 2.0)*y(31)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(31)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(36)*y(42) + ((pkOffF + pkOffF) / 2.0)*y(37)*y(42);
  dy(32) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(24) + -((pkOffE + pkOffE)*y(7)*y(32)) + -((pkCatE + pkCatE)*y(8)*y(32)) + pkOnF*y(25)*y(40)*y(41) + -pkOffF*y(32)*y(42) + -pkCatF*y(32)*y(43);
  dy(33) = -pkOnE*y(2)*y(4)*y(33) + pkOffE*y(7)*y(38) + ((pkOnF + pkOnF) / 2.0)*y(26)*y(40)*y(41) + -((pkOffF + pkOffF)*y(33)*y(42)) + -((pkCatF + pkCatF)*y(33)*y(43)) + pkCatF*y(43)*y(49);
  dy(34) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(26) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(34)) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(27) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(34)) + (pkOnF + pkOnF)*y(28)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(34)*y(40)*y(41)) + -(((pkOffF + pkOffF) / 2.0)*y(34)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(34)*y(43)) + (pkOffF + pkOffF)*y(38)*y(42);
  dy(35) = -(((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(35)) + ((pkOffE + pkOffE) / 2.0)*y(7)*y(39) + ((pkOnF + pkOnF) / 2.0)*y(29)*y(40)*y(41) + ((pkOnF + pkOnF) / 2.0)*y(30)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(35)*y(42)) + -(((pkOffF + pkOffF) / 2.0)*y(35)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(35)*y(43)) + -(((pkCatF + pkCatF) / 2.0)*y(35)*y(43)) + (pkCatF + pkCatF)*y(43)*y(49);
  dy(36) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(29) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(36)) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(27) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(36)) + ((pkOnF + pkOnF) / 2.0)*y(31)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(36)*y(40)*y(41)) + -(((pkOffF + pkOffF) / 2.0)*y(36)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(36)*y(43)) + ((pkOffF + pkOffF) / 2.0)*y(39)*y(42);
  dy(37) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(30) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(37)) + (pkCatE + pkCatE)*y(8)*y(32) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(37)) + ((pkOnF + pkOnF) / 2.0)*y(31)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(37)*y(40)*y(41)) + -(((pkOffF + pkOffF) / 2.0)*y(37)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(37)*y(43)) + ((pkOffF + pkOffF) / 2.0)*y(39)*y(42);
  dy(38) = pkOnE*y(2)*y(4)*y(33) + -pkOffE*y(7)*y(38) + -pkCatE*y(8)*y(38) + ((pkOnF + pkOnF) / 2.0)*y(34)*y(40)*y(41) + -((pkOffF + pkOffF)*y(38)*y(42)) + -((pkCatF + pkCatF)*y(38)*y(43));
  dy(39) = ((pkOnE + pkOnE) / 2.0)*y(2)*y(4)*y(35) + -(((pkOffE + pkOffE) / 2.0)*y(7)*y(39)) + -(((pkCatE + pkCatE) / 2.0)*y(8)*y(39)) + ((pkOnF + pkOnF) / 2.0)*y(36)*y(40)*y(41) + ((pkOnF + pkOnF) / 2.0)*y(37)*y(40)*y(41) + -(((pkOffF + pkOffF) / 2.0)*y(39)*y(42)) + -(((pkOffF + pkOffF) / 2.0)*y(39)*y(42)) + -(((pkCatF + pkCatF) / 2.0)*y(39)*y(43)) + -(((pkCatF + pkCatF) / 2.0)*y(39)*y(43));
  dy(40) = -(((pkOnF + pkOnF) / 2.0)*y(10)*y(40)*y(41)) + -pkOnF*y(12)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(13)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(14)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(14)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(16)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(17)*y(40)*y(41)) + pkOffF*y(18)*y(42) + pkCatF*y(18)*y(43) + ((pkOffF + pkOffF) / 2.0)*y(19)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(19)*y(43) + -((pkOnF + pkOnF)*y(20)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(21)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(22)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(22)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(23)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(23)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(24)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(24)*y(43) + -pkOnF*y(25)*y(40)*y(41) + -(((pkOnF + pkOnF) / 2.0)*y(26)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(26)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(26)*y(43) + ((pkOffF + pkOffF) / 2.0)*y(27)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(27)*y(43) + -((pkOnF + pkOnF)*y(28)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(29)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(29)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(29)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(30)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(30)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(30)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(31)*y(40)*y(41)) + -(((pkOnF + pkOnF) / 2.0)*y(31)*y(40)*y(41)) + pkOffF*y(32)*y(42) + pkCatF*y(32)*y(43) + (pkOffF + pkOffF)*y(33)*y(42) + (pkCatF + pkCatF)*y(33)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(34)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(34)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(34)*y(43) + ((pkOffF + pkOffF) / 2.0)*y(35)*y(42) + ((pkOffF + pkOffF) / 2.0)*y(35)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(35)*y(43) + ((pkCatF + pkCatF) / 2.0)*y(35)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(36)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(36)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(36)*y(43) + -(((pkOnF + pkOnF) / 2.0)*y(37)*y(40)*y(41)) + ((pkOffF + pkOffF) / 2.0)*y(37)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(37)*y(43) + (pkOffF + pkOffF)*y(38)*y(42) + (pkCatF + pkCatF)*y(38)*y(43) + ((pkOffF + pkOffF) / 2.0)*y(39)*y(42) + ((pkOffF + pkOffF) / 2.0)*y(39)*y(42) + ((pkCatF + pkCatF) / 2.0)*y(39)*y(43) + ((pkCatF + pkCatF) / 2.0)*y(39)*y(43) + -((pkOnF + pkOnF)*y(40)*y(41)*y(44)) + -pkOnF*y(40)*y(41)*y(44) + -(((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(45)) + -(((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(45)) + -((pkOnF + pkOnF)*y(40)*y(41)*y(46)) + -pkOnF*y(40)*y(41)*y(47) + -(((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(48)) + ((pkOffF + pkOffF) / 2.0)*y(42)*y(45) + pkOffF*y(42)*y(46) + (pkOffF + pkOffF)*y(42)*y(47) + ((pkOffF + pkOffF) / 2.0)*y(42)*y(48) + ((pkOffF + pkOffF) / 2.0)*y(42)*y(48) + pkOffF*y(42)*y(49) + (pkOffF + pkOffF)*y(42)*y(49) + ((pkCatF + pkCatF) / 2.0)*y(43)*y(45) + pkCatF*y(43)*y(46) + (pkCatF + pkCatF)*y(43)*y(47) + ((pkCatF + pkCatF) / 2.0)*y(43)*y(48) + ((pkCatF + pkCatF) / 2.0)*y(43)*y(48) + pkCatF*y(43)*y(49) + (pkCatF + pkCatF)*y(43)*y(49);
  dy(41) = 0;
  dy(42) = 0;
  dy(43) = 0;
  dy(44) = pkCatE*y(8)*y(28) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(31) + -((pkOnF + pkOnF)*y(40)*y(41)*y(44)) + -pkOnF*y(40)*y(41)*y(44) + ((pkOffF + pkOffF) / 2.0)*y(42)*y(45) + pkOffF*y(42)*y(46);
  dy(45) = ((pkCatE + pkCatE) / 2.0)*y(8)*y(34) + ((pkCatE + pkCatE) / 2.0)*y(8)*y(36) + (pkOnF + pkOnF)*y(40)*y(41)*y(44) + -(((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(45)) + -(((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(45)) + -(((pkOffF + pkOffF) / 2.0)*y(42)*y(45)) + (pkOffF + pkOffF)*y(42)*y(47) + ((pkOffF + pkOffF) / 2.0)*y(42)*y(48) + -(((pkCatF + pkCatF) / 2.0)*y(43)*y(45));
  dy(46) = ((pkCatE + pkCatE) / 2.0)*y(8)*y(37) + pkOnF*y(40)*y(41)*y(44) + -((pkOnF + pkOnF)*y(40)*y(41)*y(46)) + -pkOffF*y(42)*y(46) + ((pkOffF + pkOffF) / 2.0)*y(42)*y(48) + -pkCatF*y(43)*y(46);
  dy(47) = pkCatE*y(8)*y(38) + ((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(45) + -pkOnF*y(40)*y(41)*y(47) + -((pkOffF + pkOffF)*y(42)*y(47)) + pkOffF*y(42)*y(49) + -((pkCatF + pkCatF)*y(43)*y(47));
  dy(48) = ((pkCatE + pkCatE) / 2.0)*y(8)*y(39) + ((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(45) + (pkOnF + pkOnF)*y(40)*y(41)*y(46) + -(((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(48)) + -(((pkOffF + pkOffF) / 2.0)*y(42)*y(48)) + -(((pkOffF + pkOffF) / 2.0)*y(42)*y(48)) + (pkOffF + pkOffF)*y(42)*y(49) + -(((pkCatF + pkCatF) / 2.0)*y(43)*y(48)) + -(((pkCatF + pkCatF) / 2.0)*y(43)*y(48));
  dy(49) = pkOnF*y(40)*y(41)*y(47) + ((pkOnF + pkOnF) / 2.0)*y(40)*y(41)*y(48) + -pkOffF*y(42)*y(49) + -((pkOffF + pkOffF)*y(42)*y(49)) + -pkCatF*y(43)*y(49) + -((pkCatF + pkCatF)*y(43)*y(49));
end
