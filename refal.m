global N z k f0
f0=0;
N=3;
z(1)=0.70;
z(2)=0.10;
z(3)=0.20;
k(1)=3.09;
k(2)=0.39;
k(3)=0.093;
be=0.20;
bd=0.80;
fbe=feval('refal1',be);
fbd=feval('refal1',bd);
bnew=bd-(fbd/((fbd-fbe)/(bd-be)));
b0=bnew;
fbnew=feval('refal1',bnew);
f0=fbnew;
if fbnew*fbe<0
bd=bnew;
else
be=bnew;
end
while abs(fbnew)>1e-15
fbe=feval('refal1',be);
fbd=feval('refal1',bd);
bnew=bd-fbd/((fbd-fbe)/(bd-be));
fbnew=feval('refal1',bnew);
if fbnew*fbe<0
bd=bnew;
else
be=bnew;
end
f0=[f0,fbnew];
b0=[b0,bnew];
end
subplot(1,2,1)
plot(f0,'m');
xlabel('Iteração');
ylabel('f(b)');
title(['Flash - Método Regula-Falsi']);
subplot(1,2,2)
plot(b0,'m');
xlabel('Iteração');
ylabel('b(% vaporizada da carga)');
title(['Flash - Método Regula-Falsi']);
