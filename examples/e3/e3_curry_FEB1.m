

% Automatically generated from e3B1_curry.
% Original number of species: 29.
% Original number of reactions: 60.

% Correspondence with original names:
%     y(1) = S2
%     y(2) = S0
%     y(3) = Etot
%     y(4) = S1
%     y(5) = kOnF
%     y(6) = kOffF
%     y(7) = S49
%     y(8) = S57
%     y(9) = S62
%     y(10) = S65
%     y(11) = S3
%     y(12) = kCatF
%     y(13) = kCatE
%     y(14) = S6
%     y(15) = S12
%     y(16) = kOnE
%     y(17) = kOffE
%     y(18) = S17
%     y(19) = S8
%     y(20) = S13
%     y(21) = S24
%     y(22) = S27
%     y(23) = S22
%     y(24) = S39
%     y(25) = S34
%     y(26) = S35
%     y(27) = S53
%     y(28) = S46
%     y(29) = S56


function e3B1_curry
[T,Y]=ode45(@ode,[0 100.0],[  3000.0 300.0 3600.0 300.0 0.7 3.0 0.0 0.0 0.0 0.0 0.0 5.1 5.0 0.0 0.0 0.7 3.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0]);
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
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(14)/3;
plot(T,view);
hold on;
view= getSpecies(3)/3;
plot(T,view);
hold on;
view= getSpecies(16)/1;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(9)/3;
plot(T,view);
hold on;
view= getSpecies(15)/1;
plot(T,view);
hold on;
view= getSpecies(6)/1;
plot(T,view);
hold on;
view= getSpecies(26)/3;
plot(T,view);
hold on;
view= getSpecies(19)/3;
plot(T,view);
hold on;
view= getSpecies(17)/1;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
view= getSpecies(28)/6;
plot(T,view);
hold on;
view= getSpecies(20)/6;
plot(T,view);
hold on;
view= getSpecies(12)/1;
plot(T,view);
hold on;
view= getSpecies(8)/3;
plot(T,view);
hold on;
view= getSpecies(21)/6;
plot(T,view);
hold on;
view= getSpecies(13)/1;
plot(T,view);
hold on;
view= getSpecies(27)/3;
plot(T,view);
hold on;
view= getSpecies(23)/3;
plot(T,view);
hold on;
view= getSpecies(22)/3;
plot(T,view);
hold on;
view= getSpecies(24)/6;
plot(T,view);
hold on;
view= getSpecies(29)/3;
plot(T,view);
hold on;
view= getSpecies(5)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(1)/1;
plot(T,view);
hold on;
view= getSpecies(18)/3;
plot(T,view);
hold on;
view= getSpecies(11)/3;
plot(T,view);
hold on;
view= getSpecies(25)/3;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vS49','vS6','vEtot','vkOnE','vS0','vS62','vS12','vkOffF','vS35','vS8','vkOffE','vS65','vS46','vS13','vkCatF','vS57','vS24','vkCatE','vS53','vS22','vS27','vS39','vS56','vkOnF','vS1','vS2','vS17','vS3','vS34');
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

  dy(1) = -(((pkOnE + pkOnE) + pkOnE)*y(1)*y(2)*y(16)) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(11)*y(17) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(18);
  dy(2) = -(((pkOnE + pkOnE) + pkOnE)*y(1)*y(2)*y(16)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(11)*y(16)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(14)*y(16)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(18)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(19)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(20)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(21)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(22)) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(24)) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(27)) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(13) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(11)*y(17) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(14) + ((pkCatE + pkCatE) + pkCatE)*y(13)*y(15) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(20) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(21) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(23) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(25) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(13)*y(26) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(28) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(13)*y(29) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(14)*y(17) + ((pkOffE + pkOffE) + pkOffE)*y(15)*y(17) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(20) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(21) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(17)*y(23) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(17)*y(25) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(17)*y(26) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(28) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(17)*y(29);
  dy(3) = 0;
  dy(4) = -(((pkOnF + pkOnF) + pkOnF)*y(4)*y(5)*y(7)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(8)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(9)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(19)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(20)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(22)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(23)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(24)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(26)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(28)) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(8) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(9) + ((pkOffF + pkOffF) + pkOffF)*y(6)*y(10) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(18) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(21) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(24) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(25) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(27) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(28) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(29) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(8)*y(12) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(9)*y(12) + ((pkCatF + pkCatF) + pkCatF)*y(10)*y(12) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(18) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(21) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(24) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(25) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(12)*y(27) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(28) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(12)*y(29);
  dy(5) = 0;
  dy(6) = 0;
  dy(7) = -(((pkOnF + pkOnF) + pkOnF)*y(4)*y(5)*y(7)) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(8) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(13)*y(26);
  dy(8) = ((pkOnF + pkOnF) + pkOnF)*y(4)*y(5)*y(7) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(8)) + -((((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(8)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(9) + -((((pkCatF + pkCatF) + pkCatF) / 3.0)*y(8)*y(12)) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(28);
  dy(9) = ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(8) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(9)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(9)) + ((pkOffF + pkOffF) + pkOffF)*y(6)*y(10) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(9)*y(12)) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(13)*y(29);
  dy(10) = (((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(9) + -(((pkOffF + pkOffF) + pkOffF)*y(6)*y(10)) + -(((pkCatF + pkCatF) + pkCatF)*y(10)*y(12));
  dy(11) = ((pkOnE + pkOnE) + pkOnE)*y(1)*y(2)*y(16) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(11)*y(16)) + -((((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(13)) + -((((pkOffE + pkOffE) + pkOffE) / 3.0)*y(11)*y(17)) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(21) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(14)*y(17);
  dy(12) = 0;
  dy(13) = 0;
  dy(14) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(11)*y(16) + -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(14)*y(16)) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(25) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(14)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(14)*y(17)) + ((pkOffE + pkOffE) + pkOffE)*y(15)*y(17);
  dy(15) = (((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(14)*y(16) + -(((pkCatE + pkCatE) + pkCatE)*y(13)*y(15)) + -(((pkOffE + pkOffE) + pkOffE)*y(15)*y(17));
  dy(16) = 0;
  dy(17) = 0;
  dy(18) = -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(18)) + (((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(19) + -((((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(18)) + -((((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(18)) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(12)*y(27) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(21);
  dy(19) = -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(19)) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(19)) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(18) + (((pkCatE + pkCatE) + pkCatE) / 3.0)*y(11)*y(13) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(24) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(20);
  dy(20) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(19) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(20)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(20)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(21) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(28) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(14) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(20)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(20)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(17)*y(23);
  dy(21) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(18) + -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(21)) + ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(20) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(21)) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(21)) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(12)*y(29) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(21)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(21)) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(17)*y(25);
  dy(22) = -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(22)) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(22)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(24) + (((pkCatF + pkCatF) + pkCatF) / 3.0)*y(8)*y(12) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(20) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(17)*y(26);
  dy(23) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(20) + -((((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(23)) + (((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(25) + ((pkCatE + pkCatE) + pkCatE)*y(13)*y(15) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(23)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(17)*y(23));
  dy(24) = -(((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(24)) + ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(22) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(24)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(24)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(27) + ((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(9)*y(12) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(24)) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(21) + ((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(28);
  dy(25) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(21) + (((pkOnF + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(23) + -((((pkOffF + pkOffF) + pkOffF) / 3.0)*y(6)*y(25)) + -((((pkCatF + pkCatF) + pkCatF) / 3.0)*y(12)*y(25)) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(25)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 3.0)*y(17)*y(25));
  dy(26) = (((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(22) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(26)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(28) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(23) + -((((pkCatE + pkCatE) + pkCatE) / 3.0)*y(13)*y(26)) + -((((pkOffE + pkOffE) + pkOffE) / 3.0)*y(17)*y(26));
  dy(27) = -((((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(27)) + ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(24) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(27)) + ((pkCatF + pkCatF) + pkCatF)*y(10)*y(12) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(12)*y(27)) + (((pkOffE + pkOffE) + pkOffE) / 3.0)*y(17)*y(29);
  dy(28) = ((((((pkOnE + pkOnE) + pkOnE) + pkOnE) + pkOnE) + pkOnE) / 6.0)*y(2)*y(16)*y(24) + ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 3.0)*y(4)*y(5)*y(26) + -(((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(28)) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 6.0)*y(6)*y(28)) + ((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(29) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 6.0)*y(12)*y(28)) + ((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 3.0)*y(13)*y(25) + -(((((((pkCatE + pkCatE) + pkCatE) + pkCatE) + pkCatE) + pkCatE) / 6.0)*y(13)*y(28)) + -(((((((pkOffE + pkOffE) + pkOffE) + pkOffE) + pkOffE) + pkOffE) / 6.0)*y(17)*y(28));
  dy(29) = (((pkOnE + pkOnE) + pkOnE) / 3.0)*y(2)*y(16)*y(27) + ((((((pkOnF + pkOnF) + pkOnF) + pkOnF) + pkOnF) + pkOnF) / 6.0)*y(4)*y(5)*y(28) + -(((((((pkOffF + pkOffF) + pkOffF) + pkOffF) + pkOffF) + pkOffF) / 3.0)*y(6)*y(29)) + -(((((((pkCatF + pkCatF) + pkCatF) + pkCatF) + pkCatF) + pkCatF) / 3.0)*y(12)*y(29)) + -((((pkCatE + pkCatE) + pkCatE) / 3.0)*y(13)*y(29)) + -((((pkOffE + pkOffE) + pkOffE) / 3.0)*y(17)*y(29));
end
