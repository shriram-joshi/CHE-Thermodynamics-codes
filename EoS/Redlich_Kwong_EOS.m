clc;
clearvars;
disp("Redlich-Kwong EOS");

% INPUT PARAMETERS for |n-Butane|    
TC=33.19;         % in Kelvin
PC=13.13;          % in bars
w=-0.216;

% OPERATING PARAMETERS
T=273.15;            % in K
P=300*101.325;         % in kPa

% CALCULATED PARAMETERS
PCPa=PC*10^2;    %in kPa
R = 8.314;
Pr=P/(PCPa);
Tr=T/TC;
A=(0.4278*Pr)/(Tr^(2.5));
B=(0.08664*Pr)/(Tr);

% SOLVING THE CUBIC EOS
Coeff1=1;
Coeff2=-1;
Coeff3=A-B-B^2;
Coeff4=-(A*B);
Coeff=[Coeff1,Coeff2,Coeff3,Coeff4];
Z=roots(Coeff);
%Z=(R*T/P)*(C)
%g_root=max(spvol)
%gas_vol
gas_vol=(max(Z))*R*T/P;
liq_vol=(min(Z))*R*T/P;

disp("Z= " + Z);
disp("Gas volume= " + gas_vol);
disp("Liquid volume= " + liq_vol);