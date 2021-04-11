clc;
clearvars;

disp("VDW EOS");
% SOLVE van der Waals EOS : CHE F213
% DEVELOPED FOR ONLINE COVID LECTURE

% INPUT PARAMETERS for |n-octane|
TC= 568.8;        % in Kelvin
PC= 24.86;         % in bars

% OPERATING PARAMETERS
T=427;         %K
P=215;            %kPa

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

Z1 = max(Z);
lnphi=Z1-1-log(Z1*(1-b/gas_vol))-(a/(R*T*gas_vol));
fugacity_coeff = exp(lnphi);
disp("phi = " + fugacity_coeff);
fugacity=fugacity_coeff*P;   %kPa
disp("fugacity = " + fugacity + " kPa");     

%RESIDUAL PROPERTIES
gibbs_residual = (R*T)*lnphi;
disp("Gibbs Residual energy = " + gibbs_residual);
enthalpy_residual = (P*gas_vol)-(R*T)-(a/gas_vol);
disp("Residual enthalpy = " + enthalpy_residual);
entropy_residual = R*log(P*(gas_vol-b)/(R*T));
disp("Residual entropy = " + entropy_residual);
Function = gibbs_residual - enthalpy_residual+(T*entropy_residual);
disp("Function - " + Function);