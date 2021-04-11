v = 19:1:200;
T=300;
b=14;
a=80000;
for i=1:20
T = T-10;
R = 8.314;
P = R*T./(v-b)-(a./v.^2);
plot(v,P)
axis([10 200 0 50]);
xlabel('v');
ylabel('p');
hold on;
end