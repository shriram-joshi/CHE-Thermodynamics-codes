clc;
clearvars;
disp("Less Kesler Method");

%Operating conditions
P = 5000; %in kPa
T = 873.15; %in K
R = 8.314;

%critical const values are for |Ethanol|
Pc = 6148;      %in kPa from internet
Tc = 513.9;       %in K from internet
w = 0.645;         %search from the internet

Pr = P/Pc;
Tr = T/Tc;

B0 = 0.083 - 0.422/(Tr^1.6);
B1 = 0.139 - 0.172/(Tr^4.2);

Z0 = 1 + B0*Pr/Tr;
Z1 = B1*Pr/Tr;

Z = Z0 + w*Z1;

V = R*T*Z./P;

disp("Pr= " + Pr);
disp("Tr= " + Tr);
disp("B0= " + B0);
disp("B1= " + B1);
disp("Z0= " + Z0);
disp("Z1= " + Z1);
disp("Z= " + Z);
disp("V= " + V + " m^3/kmol");