% Calculation of T when delta H is known.
% Made by |SHRIRAM JOSHI|.

clc;
clearvars;

% Operating parameters for |Ammonia| (Example 4.3 8th Edition)
T0 = 298;       %K
Q = -400*10^3;   %kJ
n = 11;         %kmol
deltaH = -400;   %kJ/kmol
R = 8.314;      %kJ/(kmol.K)

Tmax = 1800;        %K for selecting valid value of T
A = 4982.98;          %dimensionless
B = 1.884;  %K^-1
C = -0.372*10^(-3);      %K^-2
D = 0*10^5;    %K^2

if D == 0 && C ~= 0
    coeff1 = C/3;
    coeff2 = B/2;
    coeff3 = A;
    coeff4 = -((deltaH/R) + A*T0 + (B*T0^2)./2 + (C*T0^3)./3);   
elseif C == 0 && D ~= 0
    coeff1 = B/2;
    coeff2 = A;
    coeff3 = (D./T0 - A*T0 - (B*T0^2)./2 - deltaH./R);
    coeff4 = D;
else
    disp("You eneterd something wrong! Both C and D both cannot be zero.");
    return
end

coeff = [coeff1,coeff2,coeff3,coeff4];
T = roots(coeff);
disp("T= " + T + " K");

disp("The valid value(s) for T is/are ")
for i = 1:length(T)
    if T(i) < Tmax && T(i) > 0
        disp(T(i) + " K")
    end
end


