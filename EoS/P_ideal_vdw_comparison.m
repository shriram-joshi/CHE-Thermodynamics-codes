% Data
clc;
n=1;              %kmol
V=15.6738;            %m3
vol=V/n;         %m3/kmol
TC=568.8;        % in Kelvin
PC=24.86;        % in bars
T=473;            %K
R = 8.314;

% Calculations
PCPa=PC*10^2;    %in Pa
P_ideal = (n*R*T)/V;
disp("P(Ideal)= " + P_ideal + " kPa");
P_ideal=P_ideal/100; %bar
disp("P(Ideal)= " + P_ideal + " bar");
a=(27*R*R*TC*TC)/(64*PCPa);
b=(R*TC)/(8*PCPa);
disp("a= " + a + " kPam^6/(kmol^2)");
disp("b= " + b + " (m^3)/kmol");
P_vwd=((R*T)/(vol-b))-(a/(vol^2));
disp("P(Van der Walls)= " + P_vwd + " kPa");
P_vwd=P_vwd/100; %bar
disp("P(Van der Walls)= " + P_vwd + " bar");
e = (P_ideal-P_vwd)./P_ideal * 100;
disp("% Error= " + e);