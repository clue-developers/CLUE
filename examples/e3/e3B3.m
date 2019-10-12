

% Automatically generated from e3B3.
% Original number of species: 42.
% Original number of reactions: 156.

% Correspondence with original names:
%     y(1) = S0
%     y(2) = S2
%     y(3) = S4
%     y(4) = S3
%     y(5) = S9
%     y(6) = S10
%     y(7) = S6
%     y(8) = S8
%     y(9) = S18
%     y(10) = S20
%     y(11) = S12
%     y(12) = S13
%     y(13) = S15
%     y(14) = S17
%     y(15) = S31
%     y(16) = S32
%     y(17) = S22
%     y(18) = S24
%     y(19) = S27
%     y(20) = S29
%     y(21) = S26
%     y(22) = S44
%     y(23) = S34
%     y(24) = S35
%     y(25) = S39
%     y(26) = S42
%     y(27) = S37
%     y(28) = S41
%     y(29) = S55
%     y(30) = S46
%     y(31) = S53
%     y(32) = S48
%     y(33) = S51
%     y(34) = S56
%     y(35) = S59
%     y(36) = S1
%     y(37) = S49
%     y(38) = S57
%     y(39) = S60
%     y(40) = S62
%     y(41) = S63
%     y(42) = S65


function e3B3
[T,Y]=ode45(@ode,[0 100.0],[  300.0 3000.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 300.0 0.0 0.0 0.0 0.0 0.0 0.0]);
 function array =  getSpecies(y)
array =  Y(:,y);
end

% Output is restricted to Views.
Etot = 300.0;
Ftot = 300.0;
Stot = 3000.0;
kOnE = 0.7;
kOffE = 3.0;
kCatE = 5.0;
kOnF = 0.7;
kOffF = 3.0;
kCatF = 5.1;
view= getSpecies(42)/1;
plot(T,view);
hold on;
view= getSpecies(22)/2;
plot(T,view);
hold on;
view= getSpecies(17)/2;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(3)/2;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(38)/2;
plot(T,view);
hold on;
view= getSpecies(12)/2;
plot(T,view);
hold on;
view= getSpecies(21)/1;
plot(T,view);
hold on;
view= getSpecies(39)/1;
plot(T,view);
hold on;
view= getSpecies(31)/2;
plot(T,view);
hold on;
view= getSpecies(35)/2;
plot(T,view);
hold on;
view= getSpecies(19)/2;
plot(T,view);
hold on;
view= getSpecies(34)/1;
plot(T,view);
hold on;
view= getSpecies(6)/2;
plot(T,view);
hold on;
view= getSpecies(37)/1;
plot(T,view);
hold on;
view= getSpecies(10)/2;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(20)/2;
plot(T,view);
hold on;
view= getSpecies(7)/2;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(41)/2;
plot(T,view);
hold on;
view= getSpecies(25)/2;
plot(T,view);
hold on;
view= getSpecies(15)/2;
plot(T,view);
hold on;
view= getSpecies(14)/1;
plot(T,view);
hold on;
view= getSpecies(29)/1;
plot(T,view);
hold on;
view= getSpecies(32)/2;
plot(T,view);
hold on;
view= getSpecies(36)/1;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(40)/1;
plot(T,view);
hold on;
view= getSpecies(27)/2;
plot(T,view);
hold on;
view= getSpecies(33)/2;
plot(T,view);
hold on;
view= getSpecies(1)/1;
plot(T,view);
hold on;
view= getSpecies(13)/2;
plot(T,view);
hold on;
view= getSpecies(30)/2;
plot(T,view);
hold on;
view= getSpecies(9)/2;
plot(T,view);
hold on;
view= getSpecies(23)/2;
plot(T,view);
hold on;
view= getSpecies(24)/1;
plot(T,view);
hold on;
view= getSpecies(28)/1;
plot(T,view);
hold on;
view= getSpecies(18)/2;
plot(T,view);
hold on;
view= getSpecies(26)/2;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vS65','vS44','vS22','vS9','vS2','vS4','vS3','vS57','vS13','vS26','vS60','vS53','vS59','vS27','vS56','vS10','vS49','vS20','vS12','vS29','vS6','vS32','vS63','vS39','vS31','vS17','vS55','vS48','vS1','vS8','vS62','vS37','vS51','vS0','vS15','vS46','vS18','vS34','vS35','vS41','vS24','vS42');
end

function dy =  ode(t,y) 
  Etot = 300.0;
  Ftot = 300.0;
  Stot = 3000.0;
  kOnE = 0.7;
  kOffE = 3.0;
  kCatE = 5.0;
  kOnF = 0.7;
  kOffF = 3.0;
  kCatF = 5.1;

  dy=zeros(42,1);

  dy(1) = -((kOnE + kOnE)*y(1)*y(2)) + -kOnE*y(1)*y(2) + -(((kOnE + kOnE) / 2.0)*y(1)*y(3)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(3)) + -((kOnE + kOnE)*y(1)*y(4)) + -kOnE*y(1)*y(5) + -(((kOnE + kOnE) / 2.0)*y(1)*y(6)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(6)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(7)) + -((kOnE + kOnE)*y(1)*y(8)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(9)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(10)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(10)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(12)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(13)) + -((kOnE + kOnE)*y(1)*y(14)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(15)) + -kOnE*y(1)*y(16) + -(((kOnE + kOnE) / 2.0)*y(1)*y(18)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(19)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(20)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(22)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(25)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(26)) + -kOnE*y(1)*y(29) + -(((kOnE + kOnE) / 2.0)*y(1)*y(31)) + ((kOffE + kOffE) / 2.0)*y(3) + ((kCatE + kCatE) / 2.0)*y(3) + kOffE*y(4) + kCatE*y(4) + (kOffE + kOffE)*y(5) + (kCatE + kCatE)*y(5) + ((kOffE + kOffE) / 2.0)*y(7) + ((kOffE + kOffE) / 2.0)*y(7) + ((kCatE + kCatE) / 2.0)*y(7) + ((kCatE + kCatE) / 2.0)*y(7) + ((kOffE + kOffE) / 2.0)*y(9) + ((kCatE + kCatE) / 2.0)*y(9) + kOffE*y(11) + (kOffE + kOffE)*y(11) + (kCatE + kCatE)*y(11) + kCatE*y(11) + ((kOffE + kOffE) / 2.0)*y(12) + ((kCatE + kCatE) / 2.0)*y(12) + ((kOffE + kOffE) / 2.0)*y(13) + ((kCatE + kCatE) / 2.0)*y(13) + ((kOffE + kOffE) / 2.0)*y(15) + ((kCatE + kCatE) / 2.0)*y(15) + ((kOffE + kOffE) / 2.0)*y(17) + ((kOffE + kOffE) / 2.0)*y(17) + ((kCatE + kCatE) / 2.0)*y(17) + ((kCatE + kCatE) / 2.0)*y(17) + ((kOffE + kOffE) / 2.0)*y(18) + ((kCatE + kCatE) / 2.0)*y(18) + ((kOffE + kOffE) / 2.0)*y(20) + ((kCatE + kCatE) / 2.0)*y(20) + (kOffE + kOffE)*y(21) + (kCatE + kCatE)*y(21) + ((kOffE + kOffE) / 2.0)*y(23) + ((kOffE + kOffE) / 2.0)*y(23) + ((kCatE + kCatE) / 2.0)*y(23) + ((kCatE + kCatE) / 2.0)*y(23) + kOffE*y(24) + kCatE*y(24) + ((kOffE + kOffE) / 2.0)*y(27) + ((kCatE + kCatE) / 2.0)*y(27) + (kOffE + kOffE)*y(28) + (kCatE + kCatE)*y(28) + ((kOffE + kOffE) / 2.0)*y(30) + ((kCatE + kCatE) / 2.0)*y(30) + ((kOffE + kOffE) / 2.0)*y(32) + ((kCatE + kCatE) / 2.0)*y(32) + ((kOffE + kOffE) / 2.0)*y(33) + ((kCatE + kCatE) / 2.0)*y(33) + kOffE*y(34) + kCatE*y(34) + ((kOffE + kOffE) / 2.0)*y(35) + ((kCatE + kCatE) / 2.0)*y(35);
  dy(2) = -((kOnE + kOnE)*y(1)*y(2)) + -kOnE*y(1)*y(2) + ((kOffE + kOffE) / 2.0)*y(3) + kOffE*y(4) + ((kCatF + kCatF) / 2.0)*y(10) + kCatF*y(14);
  dy(3) = (kOnE + kOnE)*y(1)*y(2) + -(((kOnE + kOnE) / 2.0)*y(1)*y(3)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(3)) + -(((kOffE + kOffE) / 2.0)*y(3)) + -(((kCatE + kCatE) / 2.0)*y(3)) + (kOffE + kOffE)*y(5) + ((kOffE + kOffE) / 2.0)*y(7) + ((kCatF + kCatF) / 2.0)*y(15) + ((kCatF + kCatF) / 2.0)*y(20);
  dy(4) = kOnE*y(1)*y(2) + -((kOnE + kOnE)*y(1)*y(4)) + -kOffE*y(4) + -kCatE*y(4) + ((kOffE + kOffE) / 2.0)*y(7) + ((kCatF + kCatF) / 2.0)*y(18);
  dy(5) = ((kOnE + kOnE) / 2.0)*y(1)*y(3) + -kOnE*y(1)*y(5) + -((kOffE + kOffE)*y(5)) + -((kCatE + kCatE)*y(5)) + kOffE*y(11) + kCatF*y(28);
  dy(6) = -(((kOnE + kOnE) / 2.0)*y(1)*y(6)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(6)) + ((kCatE + kCatE) / 2.0)*y(3) + -(((kOnF + kOnF) / 2.0)*y(6)*y(36)) + ((kOffE + kOffE) / 2.0)*y(9) + ((kOffF + kOffF) / 2.0)*y(10) + ((kOffE + kOffE) / 2.0)*y(12) + ((kCatF + kCatF) / 2.0)*y(22) + ((kCatF + kCatF) / 2.0)*y(26);
  dy(7) = ((kOnE + kOnE) / 2.0)*y(1)*y(3) + (kOnE + kOnE)*y(1)*y(4) + -(((kOnE + kOnE) / 2.0)*y(1)*y(7)) + -(((kOffE + kOffE) / 2.0)*y(7)) + -(((kOffE + kOffE) / 2.0)*y(7)) + -(((kCatE + kCatE) / 2.0)*y(7)) + -(((kCatE + kCatE) / 2.0)*y(7)) + (kOffE + kOffE)*y(11) + ((kCatF + kCatF) / 2.0)*y(23);
  dy(8) = -((kOnE + kOnE)*y(1)*y(8)) + kCatE*y(4) + -kOnF*y(8)*y(36) + ((kOffE + kOffE) / 2.0)*y(13) + kOffF*y(14) + ((kCatF + kCatF) / 2.0)*y(25);
  dy(9) = ((kOnE + kOnE) / 2.0)*y(1)*y(6) + -(((kOnE + kOnE) / 2.0)*y(1)*y(9)) + (kCatE + kCatE)*y(5) + -(((kOffE + kOffE) / 2.0)*y(9)) + -(((kCatE + kCatE) / 2.0)*y(9)) + -(((kOnF + kOnF) / 2.0)*y(9)*y(36)) + ((kOffF + kOffF) / 2.0)*y(15) + ((kOffE + kOffE) / 2.0)*y(17) + ((kCatF + kCatF) / 2.0)*y(33);
  dy(10) = -(((kOnE + kOnE) / 2.0)*y(1)*y(10)) + -(((kOnE + kOnE) / 2.0)*y(1)*y(10)) + ((kOnF + kOnF) / 2.0)*y(6)*y(36) + -(((kCatF + kCatF) / 2.0)*y(10)) + -(((kOffF + kOffF) / 2.0)*y(10)) + ((kOffE + kOffE) / 2.0)*y(15) + ((kOffE + kOffE) / 2.0)*y(18) + (kCatF + kCatF)*y(29) + ((kCatF + kCatF) / 2.0)*y(31);
  dy(11) = kOnE*y(1)*y(5) + ((kOnE + kOnE) / 2.0)*y(1)*y(7) + -kOffE*y(11) + -((kOffE + kOffE)*y(11)) + -((kCatE + kCatE)*y(11)) + -kCatE*y(11);
  dy(12) = ((kOnE + kOnE) / 2.0)*y(1)*y(6) + -(((kOnE + kOnE) / 2.0)*y(1)*y(12)) + ((kCatE + kCatE) / 2.0)*y(7) + -(((kOffE + kOffE) / 2.0)*y(12)) + -(((kCatE + kCatE) / 2.0)*y(12)) + -(((kOnF + kOnF) / 2.0)*y(12)*y(36)) + ((kOffE + kOffE) / 2.0)*y(17) + ((kOffF + kOffF) / 2.0)*y(18) + ((kCatF + kCatF) / 2.0)*y(30);
  dy(13) = (kOnE + kOnE)*y(1)*y(8) + -(((kOnE + kOnE) / 2.0)*y(1)*y(13)) + ((kCatE + kCatE) / 2.0)*y(7) + -(((kOffE + kOffE) / 2.0)*y(13)) + -(((kCatE + kCatE) / 2.0)*y(13)) + -(((kOnF + kOnF) / 2.0)*y(13)*y(36)) + ((kOffF + kOffF) / 2.0)*y(20) + (kOffE + kOffE)*y(21) + ((kCatF + kCatF) / 2.0)*y(32);
  dy(14) = -((kOnE + kOnE)*y(1)*y(14)) + kOnF*y(8)*y(36) + -kCatF*y(14) + -kOffF*y(14) + ((kOffE + kOffE) / 2.0)*y(20) + ((kCatF + kCatF) / 2.0)*y(31);
  dy(15) = ((kOnE + kOnE) / 2.0)*y(1)*y(10) + -(((kOnE + kOnE) / 2.0)*y(1)*y(15)) + ((kOnF + kOnF) / 2.0)*y(9)*y(36) + -(((kOffE + kOffE) / 2.0)*y(15)) + -(((kCatE + kCatE) / 2.0)*y(15)) + -(((kCatF + kCatF) / 2.0)*y(15)) + -(((kOffF + kOffF) / 2.0)*y(15)) + ((kOffE + kOffE) / 2.0)*y(23) + ((kCatF + kCatF) / 2.0)*y(35);
  dy(16) = -kOnE*y(1)*y(16) + ((kCatE + kCatE) / 2.0)*y(9) + -((kOnF + kOnF)*y(16)*y(36)) + ((kOffF + kOffF) / 2.0)*y(22) + kOffE*y(24) + kCatF*y(39);
  dy(17) = ((kOnE + kOnE) / 2.0)*y(1)*y(9) + ((kOnE + kOnE) / 2.0)*y(1)*y(12) + (kCatE + kCatE)*y(11) + -(((kOffE + kOffE) / 2.0)*y(17)) + -(((kOffE + kOffE) / 2.0)*y(17)) + -(((kCatE + kCatE) / 2.0)*y(17)) + -(((kCatE + kCatE) / 2.0)*y(17)) + -(((kOnF + kOnF) / 2.0)*y(17)*y(36)) + ((kOffF + kOffF) / 2.0)*y(23);
  dy(18) = ((kOnE + kOnE) / 2.0)*y(1)*y(10) + -(((kOnE + kOnE) / 2.0)*y(1)*y(18)) + ((kOnF + kOnF) / 2.0)*y(12)*y(36) + -(((kOffE + kOffE) / 2.0)*y(18)) + -(((kCatE + kCatE) / 2.0)*y(18)) + -(((kCatF + kCatF) / 2.0)*y(18)) + -(((kOffF + kOffF) / 2.0)*y(18)) + ((kOffE + kOffE) / 2.0)*y(23) + (kCatF + kCatF)*y(34);
  dy(19) = -(((kOnE + kOnE) / 2.0)*y(1)*y(19)) + ((kCatE + kCatE) / 2.0)*y(12) + ((kCatE + kCatE) / 2.0)*y(13) + -(((kOnF + kOnF) / 2.0)*y(19)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(19)*y(36)) + ((kOffF + kOffF) / 2.0)*y(25) + ((kOffF + kOffF) / 2.0)*y(26) + ((kOffE + kOffE) / 2.0)*y(27) + ((kCatF + kCatF) / 2.0)*y(38);
  dy(20) = (kOnE + kOnE)*y(1)*y(14) + -(((kOnE + kOnE) / 2.0)*y(1)*y(20)) + ((kOnF + kOnF) / 2.0)*y(13)*y(36) + -(((kOffE + kOffE) / 2.0)*y(20)) + -(((kCatE + kCatE) / 2.0)*y(20)) + -(((kCatF + kCatF) / 2.0)*y(20)) + -(((kOffF + kOffF) / 2.0)*y(20)) + (kOffE + kOffE)*y(28) + ((kCatF + kCatF) / 2.0)*y(35);
  dy(21) = ((kOnE + kOnE) / 2.0)*y(1)*y(13) + kCatE*y(11) + -((kOffE + kOffE)*y(21)) + -((kCatE + kCatE)*y(21)) + -kOnF*y(21)*y(36) + kOffF*y(28);
  dy(22) = -(((kOnE + kOnE) / 2.0)*y(1)*y(22)) + ((kCatE + kCatE) / 2.0)*y(15) + (kOnF + kOnF)*y(16)*y(36) + -(((kCatF + kCatF) / 2.0)*y(22)) + -(((kOffF + kOffF) / 2.0)*y(22)) + -(((kOnF + kOnF) / 2.0)*y(22)*y(36)) + (kOffF + kOffF)*y(29) + ((kOffE + kOffE) / 2.0)*y(30) + ((kCatF + kCatF) / 2.0)*y(41);
  dy(23) = ((kOnE + kOnE) / 2.0)*y(1)*y(15) + ((kOnE + kOnE) / 2.0)*y(1)*y(18) + ((kOnF + kOnF) / 2.0)*y(17)*y(36) + -(((kOffE + kOffE) / 2.0)*y(23)) + -(((kOffE + kOffE) / 2.0)*y(23)) + -(((kCatE + kCatE) / 2.0)*y(23)) + -(((kCatE + kCatE) / 2.0)*y(23)) + -(((kCatF + kCatF) / 2.0)*y(23)) + -(((kOffF + kOffF) / 2.0)*y(23));
  dy(24) = kOnE*y(1)*y(16) + ((kCatE + kCatE) / 2.0)*y(17) + -kOffE*y(24) + -kCatE*y(24) + -((kOnF + kOnF)*y(24)*y(36)) + ((kOffF + kOffF) / 2.0)*y(30);
  dy(25) = -(((kOnE + kOnE) / 2.0)*y(1)*y(25)) + ((kCatE + kCatE) / 2.0)*y(18) + ((kOnF + kOnF) / 2.0)*y(19)*y(36) + -(((kCatF + kCatF) / 2.0)*y(25)) + -(((kOffF + kOffF) / 2.0)*y(25)) + -(((kOnF + kOnF) / 2.0)*y(25)*y(36)) + ((kOffF + kOffF) / 2.0)*y(31) + ((kOffE + kOffE) / 2.0)*y(32) + (kCatF + kCatF)*y(40);
  dy(26) = -(((kOnE + kOnE) / 2.0)*y(1)*y(26)) + ((kOnF + kOnF) / 2.0)*y(19)*y(36) + ((kCatE + kCatE) / 2.0)*y(20) + -(((kCatF + kCatF) / 2.0)*y(26)) + -(((kOffF + kOffF) / 2.0)*y(26)) + -(((kOnF + kOnF) / 2.0)*y(26)*y(36)) + ((kOffF + kOffF) / 2.0)*y(31) + ((kOffE + kOffE) / 2.0)*y(33) + ((kCatF + kCatF) / 2.0)*y(41);
  dy(27) = ((kOnE + kOnE) / 2.0)*y(1)*y(19) + ((kCatE + kCatE) / 2.0)*y(17) + (kCatE + kCatE)*y(21) + -(((kOffE + kOffE) / 2.0)*y(27)) + -(((kCatE + kCatE) / 2.0)*y(27)) + -(((kOnF + kOnF) / 2.0)*y(27)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(27)*y(36)) + ((kOffF + kOffF) / 2.0)*y(32) + ((kOffF + kOffF) / 2.0)*y(33);
  dy(28) = ((kOnE + kOnE) / 2.0)*y(1)*y(20) + kOnF*y(21)*y(36) + -((kOffE + kOffE)*y(28)) + -((kCatE + kCatE)*y(28)) + -kCatF*y(28) + -kOffF*y(28);
  dy(29) = -kOnE*y(1)*y(29) + ((kOnF + kOnF) / 2.0)*y(22)*y(36) + -((kCatF + kCatF)*y(29)) + -((kOffF + kOffF)*y(29)) + kOffE*y(34) + kCatF*y(42);
  dy(30) = ((kOnE + kOnE) / 2.0)*y(1)*y(22) + ((kCatE + kCatE) / 2.0)*y(23) + (kOnF + kOnF)*y(24)*y(36) + -(((kOffE + kOffE) / 2.0)*y(30)) + -(((kCatE + kCatE) / 2.0)*y(30)) + -(((kCatF + kCatF) / 2.0)*y(30)) + -(((kOffF + kOffF) / 2.0)*y(30)) + -(((kOnF + kOnF) / 2.0)*y(30)*y(36)) + (kOffF + kOffF)*y(34);
  dy(31) = -(((kOnE + kOnE) / 2.0)*y(1)*y(31)) + ((kOnF + kOnF) / 2.0)*y(25)*y(36) + ((kOnF + kOnF) / 2.0)*y(26)*y(36) + -(((kCatF + kCatF) / 2.0)*y(31)) + -(((kCatF + kCatF) / 2.0)*y(31)) + -(((kOffF + kOffF) / 2.0)*y(31)) + -(((kOffF + kOffF) / 2.0)*y(31)) + ((kOffE + kOffE) / 2.0)*y(35) + (kCatF + kCatF)*y(42);
  dy(32) = ((kOnE + kOnE) / 2.0)*y(1)*y(25) + ((kCatE + kCatE) / 2.0)*y(23) + ((kOnF + kOnF) / 2.0)*y(27)*y(36) + -(((kOffE + kOffE) / 2.0)*y(32)) + -(((kCatE + kCatE) / 2.0)*y(32)) + -(((kCatF + kCatF) / 2.0)*y(32)) + -(((kOffF + kOffF) / 2.0)*y(32)) + -(((kOnF + kOnF) / 2.0)*y(32)*y(36)) + ((kOffF + kOffF) / 2.0)*y(35);
  dy(33) = ((kOnE + kOnE) / 2.0)*y(1)*y(26) + ((kOnF + kOnF) / 2.0)*y(27)*y(36) + (kCatE + kCatE)*y(28) + -(((kOffE + kOffE) / 2.0)*y(33)) + -(((kCatE + kCatE) / 2.0)*y(33)) + -(((kCatF + kCatF) / 2.0)*y(33)) + -(((kOffF + kOffF) / 2.0)*y(33)) + -(((kOnF + kOnF) / 2.0)*y(33)*y(36)) + ((kOffF + kOffF) / 2.0)*y(35);
  dy(34) = kOnE*y(1)*y(29) + ((kOnF + kOnF) / 2.0)*y(30)*y(36) + -kOffE*y(34) + -kCatE*y(34) + -((kCatF + kCatF)*y(34)) + -((kOffF + kOffF)*y(34));
  dy(35) = ((kOnE + kOnE) / 2.0)*y(1)*y(31) + ((kOnF + kOnF) / 2.0)*y(32)*y(36) + ((kOnF + kOnF) / 2.0)*y(33)*y(36) + -(((kOffE + kOffE) / 2.0)*y(35)) + -(((kCatE + kCatE) / 2.0)*y(35)) + -(((kCatF + kCatF) / 2.0)*y(35)) + -(((kCatF + kCatF) / 2.0)*y(35)) + -(((kOffF + kOffF) / 2.0)*y(35)) + -(((kOffF + kOffF) / 2.0)*y(35));
  dy(36) = -(((kOnF + kOnF) / 2.0)*y(6)*y(36)) + -kOnF*y(8)*y(36) + -(((kOnF + kOnF) / 2.0)*y(9)*y(36)) + ((kCatF + kCatF) / 2.0)*y(10) + ((kOffF + kOffF) / 2.0)*y(10) + -(((kOnF + kOnF) / 2.0)*y(12)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(13)*y(36)) + kCatF*y(14) + kOffF*y(14) + ((kCatF + kCatF) / 2.0)*y(15) + ((kOffF + kOffF) / 2.0)*y(15) + -((kOnF + kOnF)*y(16)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(17)*y(36)) + ((kCatF + kCatF) / 2.0)*y(18) + ((kOffF + kOffF) / 2.0)*y(18) + -(((kOnF + kOnF) / 2.0)*y(19)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(19)*y(36)) + ((kCatF + kCatF) / 2.0)*y(20) + ((kOffF + kOffF) / 2.0)*y(20) + -kOnF*y(21)*y(36) + ((kCatF + kCatF) / 2.0)*y(22) + ((kOffF + kOffF) / 2.0)*y(22) + -(((kOnF + kOnF) / 2.0)*y(22)*y(36)) + ((kCatF + kCatF) / 2.0)*y(23) + ((kOffF + kOffF) / 2.0)*y(23) + -((kOnF + kOnF)*y(24)*y(36)) + ((kCatF + kCatF) / 2.0)*y(25) + ((kOffF + kOffF) / 2.0)*y(25) + -(((kOnF + kOnF) / 2.0)*y(25)*y(36)) + ((kCatF + kCatF) / 2.0)*y(26) + ((kOffF + kOffF) / 2.0)*y(26) + -(((kOnF + kOnF) / 2.0)*y(26)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(27)*y(36)) + -(((kOnF + kOnF) / 2.0)*y(27)*y(36)) + kCatF*y(28) + kOffF*y(28) + (kCatF + kCatF)*y(29) + (kOffF + kOffF)*y(29) + ((kCatF + kCatF) / 2.0)*y(30) + ((kOffF + kOffF) / 2.0)*y(30) + -(((kOnF + kOnF) / 2.0)*y(30)*y(36)) + ((kCatF + kCatF) / 2.0)*y(31) + ((kCatF + kCatF) / 2.0)*y(31) + ((kOffF + kOffF) / 2.0)*y(31) + ((kOffF + kOffF) / 2.0)*y(31) + ((kCatF + kCatF) / 2.0)*y(32) + ((kOffF + kOffF) / 2.0)*y(32) + -(((kOnF + kOnF) / 2.0)*y(32)*y(36)) + ((kCatF + kCatF) / 2.0)*y(33) + ((kOffF + kOffF) / 2.0)*y(33) + -(((kOnF + kOnF) / 2.0)*y(33)*y(36)) + (kCatF + kCatF)*y(34) + (kOffF + kOffF)*y(34) + ((kCatF + kCatF) / 2.0)*y(35) + ((kCatF + kCatF) / 2.0)*y(35) + ((kOffF + kOffF) / 2.0)*y(35) + ((kOffF + kOffF) / 2.0)*y(35) + -((kOnF + kOnF)*y(36)*y(37)) + -kOnF*y(36)*y(37) + -(((kOnF + kOnF) / 2.0)*y(36)*y(38)) + -(((kOnF + kOnF) / 2.0)*y(36)*y(38)) + -((kOnF + kOnF)*y(36)*y(39)) + -kOnF*y(36)*y(40) + -(((kOnF + kOnF) / 2.0)*y(36)*y(41)) + ((kCatF + kCatF) / 2.0)*y(38) + ((kOffF + kOffF) / 2.0)*y(38) + kCatF*y(39) + kOffF*y(39) + (kCatF + kCatF)*y(40) + (kOffF + kOffF)*y(40) + ((kCatF + kCatF) / 2.0)*y(41) + ((kCatF + kCatF) / 2.0)*y(41) + ((kOffF + kOffF) / 2.0)*y(41) + ((kOffF + kOffF) / 2.0)*y(41) + kCatF*y(42) + (kCatF + kCatF)*y(42) + kOffF*y(42) + (kOffF + kOffF)*y(42);
  dy(37) = kCatE*y(24) + ((kCatE + kCatE) / 2.0)*y(27) + -((kOnF + kOnF)*y(36)*y(37)) + -kOnF*y(36)*y(37) + ((kOffF + kOffF) / 2.0)*y(38) + kOffF*y(39);
  dy(38) = ((kCatE + kCatE) / 2.0)*y(30) + ((kCatE + kCatE) / 2.0)*y(32) + (kOnF + kOnF)*y(36)*y(37) + -(((kOnF + kOnF) / 2.0)*y(36)*y(38)) + -(((kOnF + kOnF) / 2.0)*y(36)*y(38)) + -(((kCatF + kCatF) / 2.0)*y(38)) + -(((kOffF + kOffF) / 2.0)*y(38)) + (kOffF + kOffF)*y(40) + ((kOffF + kOffF) / 2.0)*y(41);
  dy(39) = ((kCatE + kCatE) / 2.0)*y(33) + kOnF*y(36)*y(37) + -((kOnF + kOnF)*y(36)*y(39)) + -kCatF*y(39) + -kOffF*y(39) + ((kOffF + kOffF) / 2.0)*y(41);
  dy(40) = kCatE*y(34) + ((kOnF + kOnF) / 2.0)*y(36)*y(38) + -kOnF*y(36)*y(40) + -((kCatF + kCatF)*y(40)) + -((kOffF + kOffF)*y(40)) + kOffF*y(42);
  dy(41) = ((kCatE + kCatE) / 2.0)*y(35) + ((kOnF + kOnF) / 2.0)*y(36)*y(38) + (kOnF + kOnF)*y(36)*y(39) + -(((kOnF + kOnF) / 2.0)*y(36)*y(41)) + -(((kCatF + kCatF) / 2.0)*y(41)) + -(((kCatF + kCatF) / 2.0)*y(41)) + -(((kOffF + kOffF) / 2.0)*y(41)) + -(((kOffF + kOffF) / 2.0)*y(41)) + (kOffF + kOffF)*y(42);
  dy(42) = kOnF*y(36)*y(40) + ((kOnF + kOnF) / 2.0)*y(36)*y(41) + -kCatF*y(42) + -((kCatF + kCatF)*y(42)) + -kOffF*y(42) + -((kOffF + kOffF)*y(42));
end
