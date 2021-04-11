clc;
clearvars;

disp("VDW EOS");
% SOLVE van der Waals EOS : CHE F213
% DEVELOPED FOR ONLINE COVID LECTURE

% INPUT PARAMETERS for |n-octane|
TC= 568.8;        % in Kelvin
PC= 24.86;         % in bars

% OPERATING PARAMETERS
T=323.15;         %K
P=1500;            %kPa

% CALCULATED PARAMETERS
PCPa=PC*10^2;    %in kPa
R = 8.314;
a=(27*R*R*TC*TC)/(64*PCPa);
b=(R*TC)/(8*PCPa);
A=(a*P)/(R*R*T*T);
B=(b*P)/(R*T);

% SOLVING THE CUBIC EOS
Coeff1=1;
Coeff2=-(1+B);
Coeff3=A;
Coeff4=-(A*B);
Coeff=[Coeff1,Coeff2,Coeff3,Coeff4];

% YIELDS THE COMPRESSIBILITY FAC
Z=roots(Coeff);

% CHOOSES LARGEST AND SMALLEST Z FOR VAPOR AND LIQUID ROOTS AND CALCULATES THE SP VOLUME

gas_vol=(max(Z))*R*T/P;
liq_vol=(min(Z))*R*T/P;
disp("Gas vol= " + gas_vol);
disp("Liq vol= " + liq_vol);
disp("Z= " + Z);