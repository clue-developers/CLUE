

% Automatically generated from e3B2_curry.
% Original number of species: 29.
% Original number of reactions: 60.

% Correspondence with original names:
%     y(1) = S49
%     y(2) = S1
%     y(3) = Etot
%     y(4) = S0
%     y(5) = S2
%     y(6) = kOnE
%     y(7) = S3
%     y(8) = kOffE
%     y(9) = S6
%     y(10) = S12
%     y(11) = kCatE
%     y(12) = S57
%     y(13) = kCatF
%     y(14) = S62
%     y(15) = S65
%     y(16) = S35
%     y(17) = kOnF
%     y(18) = kOffF
%     y(19) = S8
%     y(20) = S13
%     y(21) = S17
%     y(22) = S22
%     y(23) = S27
%     y(24) = S24
%     y(25) = S39
%     y(26) = S34
%     y(27) = S46
%     y(28) = S53
%     y(29) = S56


function e3B2_curry
[T,Y]=ode45(@ode,[0 100.0],[  0.0 300.0 3600.0 300.0 3000.0 0.7 0.0 3.0 0.0 0.0 5.0 0.0 5.1 0.0 0.0 0.0 0.7 3.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0]);
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
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(16)/3;
plot(T,view);
hold on;
view= getSpecies(18)/1;
plot(T,view);
hold on;
view= getSpecies(27)/6;
plot(T,view);
hold on;
view= getSpecies(12)/3;
plot(T,view);
hold on;
view= getSpecies(24)/6;
plot(T,view);
hold on;
view= getSpecies(28)/3;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(22)/3;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(19)/3;
plot(T,view);
hold on;
view= getSpecies(23)/3;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(9)/3;
plot(T,view);
hold on;
view= getSpecies(8)/1;
plot(T,view);
hold on;
view= getSpecies(20)/6;
plot(T,view);
hold on;
view= getSpecies(11)/1;
plot(T,view);
hold on;
view= getSpecies(1)/1;
plot(T,view);
hold on;
view= getSpecies(26)/3;
plot(T,view);
hold on;
view= getSpecies(7)/3;
plot(T,view);
hold on;
view= getSpecies(14)/3;
plot(T,view);
hold on;
view= getSpecies(29)/3;
plot(T,view);
hold on;
view= getSpecies(3)/3;
plot(T,view);
hold on;
view= getSpecies(21)/3;
plot(T,view);
hold on;
view= getSpecies(25)/6;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vkOnE','vS65','vkOnF','vS1','vS35','vkOffF','vS46','vS57','vS24','vS53','vkCatF','vS22','vS12','vS0','vS8','vS27','vS2','vS6','vkOffE','vS13','vkCatE','vS49','vS34','vS3','vS62','vS56','vEtot','vS17','vS39');
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

  dy=zeros(29,1);

  dy(1) = -(((pkOnF + pkOnF) + pkOnF)*y(1)*y(2)*y(17)) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(16) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(12)*y(18);
  dy(2) = -(((pkOnF + pkOnF) + pkOnF)*y(1)*y(2)*y(17)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(12)*y(17)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(14)*y(17)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(16)*y(17)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(19)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(20)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(22)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(23)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(25)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(27)) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(13) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(12)*y(18) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(14) + ((pkCatF + pkCatF) + pkCatF)*y(13)*y(15) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(13)*y(21) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(24) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(25) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(13)*y(26) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(27) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(28) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(29) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(14)*y(18) + ((pkOffF + pkOffF) + pkOffF)*y(15)*y(18) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(18)*y(21) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(24) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(25) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(18)*y(26) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(27) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(18)*y(28) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(18)*y(29);
  dy(3) = 0;
  dy(4) = -(((pkOnE + pkOnE) + pkOnE)*y(4)*y(5)*y(6)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(7)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(9)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(19)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(20)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(21)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(23)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(24)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(25)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(28)) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(7)*y(8) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(7)*y(11) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(9) + ((pkOffE + pkOffE) + pkOffE)*y(8)*y(10) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(8)*y(16) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(20) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(22) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(24) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(26) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(27) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(8)*y(29) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(9)*y(11) + ((pkCatE + pkCatE) + pkCatE)*y(10)*y(11) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(16) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(20) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(11)*y(22) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(24) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(11)*y(26) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(27) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(29);
  dy(5) = -(((pkOnE + pkOnE) + pkOnE)*y(4)*y(5)*y(6)) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(7)*y(8) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(13)*y(21);
  dy(6) = 0;
  dy(7) = ((pkOnE + pkOnE) + pkOnE)*y(4)*y(5)*y(6) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(7)) + -((((pkOffE + pkOffE) + pkOffE) / 3.0)*y(7)*y(8)) + -((((pkCatE + pkCatE) + pkCatE) / 3.0)*y(7)*y(11)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(9) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(24);
  dy(8) = 0;
  dy(9) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(7) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(9)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(9)) + ((pkOffE + pkOffE) + pkOffE)*y(8)*y(10) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(9)*y(11)) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(13)*y(26);
  dy(10) = (((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(9) + -(((pkOffE + pkOffE) + pkOffE)*y(8)*y(10)) + -(((pkCatE + pkCatE) + pkCatE)*y(10)*y(11));
  dy(11) = 0;
  dy(12) = ((pkOnF + pkOnF) + pkOnF)*y(1)*y(2)*y(17) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(12)*y(17)) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(27) + -((((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(13)) + -((((pkOffF + pkOffF) + pkOffF) / 3.0)*y(12)*y(18)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(14)*y(18);
  dy(13) = 0;
  dy(14) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(12)*y(17) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(14)*y(17)) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(29) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(14)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(14)*y(18)) + ((pkOffF + pkOffF) + pkOffF)*y(15)*y(18);
  dy(15) = (((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(14)*y(17) + -(((pkCatF + pkCatF) + pkCatF)*y(13)*y(15)) + -(((pkOffF + pkOffF) + pkOffF)*y(15)*y(18));
  dy(16) = -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(16)*y(17)) + (((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(23) + -((((pkOffE + pkOffE) + pkOffE) / 3.0)*y(8)*y(16)) + -((((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(16)) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(11)*y(22) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(27);
  dy(17) = 0;
  dy(18) = 0;
  dy(19) = -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(19)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(19)) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(7)*y(11) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(20) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(25) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(18)*y(21);
  dy(20) = -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(20)) + ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(19) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(20)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(20)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(22) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(9)*y(11) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(20)) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(27) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(24);
  dy(21) = (((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(19) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(21)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(24) + -((((pkCatF + pkCatF) + pkCatF) / 3.0)*y(13)*y(21)) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(28) + -((((pkOffF + pkOffF) + pkOffF) / 3.0)*y(18)*y(21));
  dy(22) = -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(22)) + ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(20) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(22)) + ((pkCatE + pkCatE) + pkCatE)*y(10)*y(11) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(11)*y(22)) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(18)*y(26);
  dy(23) = -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(23)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(23)) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(8)*y(16) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(20) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(13) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(25);
  dy(24) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(20) + ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(21) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(24)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(24)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(26) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(24)) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(24)) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(29) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(24));
  dy(25) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(23) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(25)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(25)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(27) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(24) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(14) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(25)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(25)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(18)*y(28);
  dy(26) = (((pkOnF + pkOnF) + pkOnF) / 3.0)*y(2)*y(17)*y(22) + ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(24) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(8)*y(26)) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(11)*y(26)) + -((((pkCatF + pkCatF) + pkCatF) / 3.0)*y(13)*y(26)) + -((((pkOffF + pkOffF) + pkOffF) / 3.0)*y(18)*y(26));
  dy(27) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(2)*y(16)*y(17) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(27)) + ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(4)*y(6)*y(25) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(8)*y(27)) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(11)*y(26) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(11)*y(27)) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(13)*y(27)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(18)*y(27)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(18)*y(29);
  dy(28) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(25) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(28)) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(8)*y(29) + ((pkCatF + pkCatF) + pkCatF)*y(13)*y(15) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(28)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(18)*y(28));
  dy(29) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(2)*y(17)*y(27) + (((pkOnE + pkOnE) + pkOnE) / 3.0)*y(4)*y(6)*y(28) + -((((pkOffE + pkOffE) + pkOffE) / 3.0)*y(8)*y(29)) + -((((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(29)) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(13)*y(29)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(18)*y(29));
end
