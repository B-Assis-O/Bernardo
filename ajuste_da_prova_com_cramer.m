T=[0 50 100 150 200]';
k=[573 647 684 690 668]';
Y=k
g0=ones(1,length(k))';
g1=T;
g2=T.^2;
g3=T.^3;
G=[g0 g1 g2 g3];
GTG=G'*G
GTY=G'*Y

%usando regra de Cramer
r=GTY
g0=[r GTG(:,2) GTG(:,3) GTG(:,4)];
g1=[GTG(:,1) r GTG(:,3) GTG(:,4)];
g2=[GTG(:,1) GTG(:,3) r GTG(:,4)];
g3=[GTG(:,1) GTG(:,3) GTG(:,4) r];
b0=det(g0)/det(GTG);
b1=det(g1)/det(GTG);
b2=det(g2)/det(GTG);
b3=det(g3)/det(GTG);
b=[b3 b2 b1 b0]

% Comparando com polyfit
X= polyfit(T,k,3)
Ycalc= b0+b1*T+b2*T.^2+b3*T.^3

plot(T,k,'*m')
title(['Ajuste por regressão linear'])
xlabel('Temperatura °C')
ylabel('k')
hold on
plot(T,Ycalc,'b')
