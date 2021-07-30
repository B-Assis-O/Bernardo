z(1)=0.70;
z(2)=0.10;
z(3)=0.10;
z(4)=0.10;
k(1)=3.09;
k(2)=0.39;
k(3)=0.093;
k(4)=0.065;
global N
N=4
b1=0.20;
b2=0.80;
fb1=feval('scnt1',b1,z,k);
fb2=feval('scnt1',b2,z,k);
bn=b2-(fb2/((fb2-fb1)/(b2-b1)));
fbn=feval('scnt1',bn,z,k);
b0=bn
f0=fbn
while abs(fbn)>1e-15
b1=b2;
b2=bn;
fb1=feval('scnt1',b1,z,k);
fb2=feval('scnt1',b2,z,k);
bn=b2-(fb2/((fb2-fb1)/(b2-b1)));
fbn=feval('scnt1',bn,z,k);
f0=[f0,fbn];
b0=[b0,bn];
end
subplot(1,2,1)
plot(f0,'m');
xlabel('Iteracao');
ylabel('f(b)');
title(['Flash - Metodo da Secante']);
subplot(1,2,2)
plot(b0,'m');
xlabel('Iteracao');
ylabel('b(%vaporizada da carga)');
title(['Flash - Metodo da Secante']);
