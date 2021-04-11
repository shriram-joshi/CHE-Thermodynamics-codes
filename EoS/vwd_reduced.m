clc;
Vr = 0.1:0.1:5;
Tr=2;
for i=1:20
Tr = Tr-0.1;
Pr = (8*Tr)./(3*Vr-1)-(3./Vr.^2);
plot(Vr,Pr)
axis([0 5 -1.5 3]);
xlabel('Vr');
ylabel('Pr');
hold on;
end