

% Automatically generated from e3B2.
% Original number of species: 22.
% Original number of reactions: 60.

% Correspondence with original names:
%     y(1) = S49
%     y(2) = S1
%     y(3) = S0
%     y(4) = S2
%     y(5) = S3
%     y(6) = S6
%     y(7) = S12
%     y(8) = S57
%     y(9) = S62
%     y(10) = S65
%     y(11) = S35
%     y(12) = S8
%     y(13) = S13
%     y(14) = S17
%     y(15) = S22
%     y(16) = S27
%     y(17) = S24
%     y(18) = S39
%     y(19) = S34
%     y(20) = S46
%     y(21) = S53
%     y(22) = S56


function e3B2
[T,Y]=ode45(@ode,[0 100.0],[  0.0 300.0 300.0 3000.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0]);
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
view= getSpecies(15)/3;
plot(T,view);
hold on;
view= getSpecies(1)/1;
plot(T,view);
hold on;
view= getSpecies(4)/1;
plot(T,view);
hold on;
view= getSpecies(18)/6;
plot(T,view);
hold on;
view= getSpecies(14)/3;
plot(T,view);
hold on;
view= getSpecies(21)/3;
plot(T,view);
hold on;
view= getSpecies(9)/3;
plot(T,view);
hold on;
view= getSpecies(22)/3;
plot(T,view);
hold on;
view= getSpecies(8)/3;
plot(T,view);
hold on;
view= getSpecies(3)/1;
plot(T,view);
hold on;
view= getSpecies(12)/3;
plot(T,view);
hold on;
view= getSpecies(13)/6;
plot(T,view);
hold on;
view= getSpecies(5)/3;
plot(T,view);
hold on;
view= getSpecies(17)/6;
plot(T,view);
hold on;
view= getSpecies(7)/1;
plot(T,view);
hold on;
view= getSpecies(16)/3;
plot(T,view);
hold on;
view= getSpecies(19)/3;
plot(T,view);
hold on;
view= getSpecies(11)/3;
plot(T,view);
hold on;
view= getSpecies(20)/6;
plot(T,view);
hold on;
view= getSpecies(6)/3;
plot(T,view);
hold on;
view= getSpecies(2)/1;
plot(T,view);
hold on;
view= getSpecies(10)/1;
plot(T,view);
hold on;
xlabel('time');
ylabel('value');
legend('vS22','vS49','vS2','vS39','vS17','vS53','vS62','vS56','vS57','vS0','vS8','vS13','vS3','vS24','vS12','vS27','vS34','vS35','vS46','vS6','vS1','vS65');
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

  dy=zeros(22,1);

  dy(1) = -(((kOnF + kOnF) + kOnF)*y(1)*y(2)) + (((kOffF + kOffF) + kOffF) / 3.0)*y(8) + (((kCatE + kCatE) + kCatE) / 3.0)*y(11);
  dy(2) = -(((kOnF + kOnF) + kOnF)*y(1)*y(2)) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(8)) + -((((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(9)) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(11)) + -((((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(12)) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(13)) + -((((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(15)) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(16)) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(18)) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(20)) + (((kOffF + kOffF) + kOffF) / 3.0)*y(8) + (((kCatF + kCatF) + kCatF) / 3.0)*y(8) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(9) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(9) + ((kOffF + kOffF) + kOffF)*y(10) + ((kCatF + kCatF) + kCatF)*y(10) + (((kCatF + kCatF) + kCatF) / 3.0)*y(14) + (((kOffF + kOffF) + kOffF) / 3.0)*y(14) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(17) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(17) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(18) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(18) + (((kCatF + kCatF) + kCatF) / 3.0)*y(19) + (((kOffF + kOffF) + kOffF) / 3.0)*y(19) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(20) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(20) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(21) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(21) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(22) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(22);
  dy(3) = -(((kOnE + kOnE) + kOnE)*y(3)*y(4)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(5)) + -((((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(6)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(12)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(13)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(14)) + -((((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(16)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(17)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(18)) + -((((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(21)) + (((kOffE + kOffE) + kOffE) / 3.0)*y(5) + (((kCatE + kCatE) + kCatE) / 3.0)*y(5) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(6) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(6) + ((kOffE + kOffE) + kOffE)*y(7) + ((kCatE + kCatE) + kCatE)*y(7) + (((kCatE + kCatE) + kCatE) / 3.0)*y(11) + (((kOffE + kOffE) + kOffE) / 3.0)*y(11) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(13) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(13) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(15) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(15) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(17) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(17) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(19) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(19) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(20) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(20) + (((kCatE + kCatE) + kCatE) / 3.0)*y(22) + (((kOffE + kOffE) + kOffE) / 3.0)*y(22);
  dy(4) = -(((kOnE + kOnE) + kOnE)*y(3)*y(4)) + (((kOffE + kOffE) + kOffE) / 3.0)*y(5) + (((kCatF + kCatF) + kCatF) / 3.0)*y(14);
  dy(5) = ((kOnE + kOnE) + kOnE)*y(3)*y(4) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(5)) + -((((kOffE + kOffE) + kOffE) / 3.0)*y(5)) + -((((kCatE + kCatE) + kCatE) / 3.0)*y(5)) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(6) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(17);
  dy(6) = ((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(5) + -((((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(6)) + -(((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(6)) + -(((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(6)) + ((kOffE + kOffE) + kOffE)*y(7) + (((kCatF + kCatF) + kCatF) / 3.0)*y(19);
  dy(7) = (((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(6) + -(((kOffE + kOffE) + kOffE)*y(7)) + -(((kCatE + kCatE) + kCatE)*y(7));
  dy(8) = ((kOnF + kOnF) + kOnF)*y(1)*y(2) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(8)) + -((((kOffF + kOffF) + kOffF) / 3.0)*y(8)) + -((((kCatF + kCatF) + kCatF) / 3.0)*y(8)) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(9) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(20);
  dy(9) = ((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(8) + -((((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(9)) + -(((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(9)) + -(((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(9)) + ((kOffF + kOffF) + kOffF)*y(10) + (((kCatE + kCatE) + kCatE) / 3.0)*y(22);
  dy(10) = (((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(9) + -(((kOffF + kOffF) + kOffF)*y(10)) + -(((kCatF + kCatF) + kCatF)*y(10));
  dy(11) = -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(11)) + (((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(16) + -((((kCatE + kCatE) + kCatE) / 3.0)*y(11)) + -((((kOffE + kOffE) + kOffE) / 3.0)*y(11)) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(15) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(20);
  dy(12) = -((((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(12)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(12)) + (((kCatE + kCatE) + kCatE) / 3.0)*y(5) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(13) + (((kOffF + kOffF) + kOffF) / 3.0)*y(14) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(18);
  dy(13) = -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(13)) + ((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(12) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(13)) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(6) + -(((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(13)) + -(((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(13)) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(15) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(17) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(20);
  dy(14) = (((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(12) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(14)) + -((((kCatF + kCatF) + kCatF) / 3.0)*y(14)) + -((((kOffF + kOffF) + kOffF) / 3.0)*y(14)) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(17) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(21);
  dy(15) = -((((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(15)) + ((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(13) + ((kCatE + kCatE) + kCatE)*y(7) + -(((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(15)) + -(((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(15)) + (((kOffF + kOffF) + kOffF) / 3.0)*y(19);
  dy(16) = -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(16)) + -((((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(16)) + (((kCatF + kCatF) + kCatF) / 3.0)*y(8) + (((kOffE + kOffE) + kOffE) / 3.0)*y(11) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(13) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(18);
  dy(17) = ((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(13) + ((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 3.0)*y(3)*y(14) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(17)) + -(((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(17)) + -(((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(17)) + -(((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(17)) + -(((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(17)) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(19) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(22);
  dy(18) = ((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(16) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(18)) + -(((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(18)) + ((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(9) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(17) + -(((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(18)) + -(((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(18)) + ((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(20) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(21);
  dy(19) = (((kOnF + kOnF) + kOnF) / 3.0)*y(2)*y(15) + ((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(17) + -((((kCatF + kCatF) + kCatF) / 3.0)*y(19)) + -((((kOffF + kOffF) + kOffF) / 3.0)*y(19)) + -(((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 3.0)*y(19)) + -(((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(19));
  dy(20) = ((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 3.0)*y(2)*y(11) + -(((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(20)) + ((((((kOnE + kOnE) + kOnE) + kOnE) + kOnE) + kOnE) / 6.0)*y(3)*y(18) + ((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 3.0)*y(19) + -(((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 6.0)*y(20)) + -(((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 6.0)*y(20)) + -(((((((kCatE + kCatE) + kCatE) + kCatE) + kCatE) + kCatE) / 6.0)*y(20)) + -(((((((kOffE + kOffE) + kOffE) + kOffE) + kOffE) + kOffE) / 6.0)*y(20)) + ((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(22);
  dy(21) = ((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(18) + -((((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(21)) + ((kCatF + kCatF) + kCatF)*y(10) + -(((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(21)) + -(((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(21)) + (((kOffE + kOffE) + kOffE) / 3.0)*y(22);
  dy(22) = ((((((kOnF + kOnF) + kOnF) + kOnF) + kOnF) + kOnF) / 6.0)*y(2)*y(20) + (((kOnE + kOnE) + kOnE) / 3.0)*y(3)*y(21) + -(((((((kCatF + kCatF) + kCatF) + kCatF) + kCatF) + kCatF) / 3.0)*y(22)) + -(((((((kOffF + kOffF) + kOffF) + kOffF) + kOffF) + kOffF) / 3.0)*y(22)) + -((((kCatE + kCatE) + kCatE) / 3.0)*y(22)) + -((((kOffE + kOffE) + kOffE) / 3.0)*y(22));
end
