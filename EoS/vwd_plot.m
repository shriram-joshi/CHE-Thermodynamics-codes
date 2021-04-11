clc;
TC=568.9;        % in Kelvin
PC=24.9;         % in bars
% OPERATING PARAMETERS
T=427.85;         %K
P=215;            %kPa
%T=568.9         %K
%P=2490            %kPa

% CALCULATED PARAMETERS
PCPa=PC*10^2;    %in kPa
R = 8.314;
a=(27*R*R*TC*TC)/(64*PCPa);
b=(R*TC)/(8*PCPa);
A=(a*P)/(R*R*T*T);
B=(b*P)/(R*T);
Z=0;
for i=1:20
Z=Z+0.1;
FZ=(Z^3)-(1+B)*(Z^2)+(A*Z)-(A*B);
plot(Z,FZ)
axis([0 1.5 -0.2 1]);
xlabel('Z');
ylabel('FZ');
hold on;
end