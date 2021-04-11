%clc;
clearvars;
disp("PR EOS");

% INPUT PARAMETERS for |ethane|
TC=305.3;  % in Kelvin
PC=48.72;  % in bars
w=0.100;

% OPERATING PARAMETERS
T=323.15;         %K
P=1500;            %kPa

% CALCULATED PARAMETERS
PCPa=PC*10^2;    %in kPa
R = 8.314;
Pr=P/(PCPa);
Tr=T/TC;
term1=0.37464+1.54226*w-(0.26992*w*w);
term2=1-Tr^0.5;
alpha=(1+(term1*term2))^2;
A=(0.4572*Pr*alpha)/(Tr^(2));
B=(0.07780*Pr)/(Tr);

% SOLVING THE CUBIC EOS
Coeff1=1;
Coeff2=-(1-B);
Coeff3=A-(3*B^2)-(2*B);
Coeff4=-((A*B)-(B*B)-(B*B*B));
Coeff=[Coeff1,Coeff2,Coeff3,Coeff4];
Z=roots (Coeff);
%Z=(R*T/P)*(C)
%g_root=max(spvol)
gas_vol=(max(Z))*R*T/P;
liq_vol=(min(Z))*R*T/P;

disp("Z= " + Z);
disp("Gas volume= " + gas_vol);
disp("Liquid volume= " + liq_vol);