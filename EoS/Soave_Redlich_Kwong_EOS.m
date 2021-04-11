%clc;
clearvars;
disp("SRK EOS");

% INPUT PARAMETERS for |Ethane|
TC=305.3;  % in Kelvin
PC=48.72;  % in bars
w=0.100;

% OPERATING PARAMETERS
T=323.15;  %K
P=1500;  %kPa

% CALCULATED PARAMETERS
PCPa=PC*10^2;    %in kPa
R = 8.314;
S=0.48+(1.574*w)-(0.176*w*w);
Tr=T/TC;
alpha=(1+S*(1-sqrt(Tr)))^2;
a=(0.4278*R*R*TC*TC)/(PCPa);
b=(0.0867*R*TC)/(PCPa);
A=(a*alpha*P)/(R*R*T*T);
B=(b*P)/(R*T);

% SOLVING THE CUBIC EOS
Coeff1=1;
Coeff2=-1;
Coeff3=A-B-B^2;
Coeff4=-(A*B);
FZ=[Coeff1,Coeff2,Coeff3,Coeff4];
Z=roots (FZ);
%Z=(R*T/P)*(C)
%g_root=max(spvol)
gas_vol=(max(Z))*R*T/P;
liq_vol=(min(Z))*R*T/P;

disp("Z= " + Z);
disp("Gas volume= " + gas_vol);
disp("Liquid volume= " + liq_vol);