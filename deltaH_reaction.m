% Calculation of deltaH of reaction for non standard temperature.
% Made by |SHRIRAM JOSHI|

clc;
clearvars;

% Operating parameters for the reaction | N2 + 3H2 --> 2NH3 | 
R = 8.314;                  % in kJ/(kmol.K) or J/(mol.K)
deltaH_298 = -92220;        % in J
T0 = 298.15;                % in K (standard temperature)
T = 873.15;                % in K

% Enter A,B,C & D corresponding to the species with stoichiometric coeff in array v
v = [-1,-3,2];             % Stoichiometric coeff
A = [3.280,3.249,3.578];
B = [0.593,0.422,3.020];   % B*10^3
C = [0,0,0];           % C*10^6
D = [0.040,0.831,0.186];      % D*10^(-5)

% Initializing
deltaA=0;
deltaB=0;
deltaC=0;
deltaD=0;
% Multiplying B, C and D with respective multipliers
for i = 1:length(B)
    B(i) = B(i)*10^(-3);
    C(i) = C(i)*10^(-6);
    D(i) = D(i)*10^(5);
    %A(i) = A(i)*R;
    %B(i) = B(i)*R;
    %C(i) = C(i)*R;
    %D(i) = D(i)*R;
end

% Uncomment to display matrix
M = [v;A;B;C;D];
disp("      v        A          B         C         D")    
disp(M.');

% Checking if eneterd data is correct
if (length(v) == length(A)) && (length(A) == length(B)) && (length(B) == length(C)) && (length(C) == length(D))
    for i = 1:length(v)
        if (C(i) ~= 0 && D(i) ~= 0)
           disp("You eneterd something wrong! For every species in a reaction C and D both cannot be non-zero.")
           return
        end
    end
else
    disp("You entered something wrong! Check if all arrays have same number of elements.")
    return
end

% If data enetered is correct performing calculations
for i = 1:length(v)
    deltaA =  deltaA + v(i)*A(i);
    deltaB =  deltaB + v(i)*B(i);
    deltaC =  deltaC + v(i)*C(i);
    deltaD =  deltaD + v(i)*D(i);
end

disp("deltaA = " + deltaA);
disp("deltaB = " + deltaB);
disp("deltaC = " + deltaC);
disp("deltaD = " + deltaD);

integral = deltaA*(T-T0) + deltaB*(T^(2) - T0^(2))./2 + deltaC*(T^(3) - T0^(3))./3 + deltaD*(T-T0)./(T*T0);
deltaH_T = deltaH_298 + R*integral;
disp("deltaH_T = " + deltaH_298 + " + " + R + "x(" + integral + ")");
disp("= " + deltaH_T + " J");
disp("= " + deltaH_T/1000 + " kJ");
disp("= " + deltaH_T/4.184 + " cal");
disp("= " + deltaH_T/(4184) + " kcal");

