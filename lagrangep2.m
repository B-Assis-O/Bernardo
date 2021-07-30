a=[1 -1]
b=[1 -1.2681]
c=[1 -1.5362]
d=[1 -1.7239]

e=conv2(b,c)
f=conv2(e,d)
L0=2257/((1-1.2681)*(1-1.5362)*(1-1.7239))
T0=L0*f
g=conv2(a,c)
h=conv2(g,d)
L1=1939/((1.2681-1)*(1.2681-1.5362)*(1.2681-1.7239))
T1=L1*h
i=conv2(a,b)
j=conv2(i,d)
L2=1406/((1.5362-1)*(1.5362-1.2681)*(1.5362-1.7239))
T2=L2*j
k=conv2(i,c)
L3=462/((1.7239-1)*(1.7239-1.2681)*(1.7239-1.5362))
T3=L3*k
P3=T0+T1+T2+T3
t=512/373 %no nosso exemplo deseja-se saber deltaHvap em 512K e a T dada vale 373k
DHcalc=(P3(1,1)*t^3)+(P3(1,2)*t^2)+(P3(1,3)*t)+P3(1,4)
X =[1 1.2681 1.5362 1.7239]
X1=[1:0.001:1.7239]
Y=[2257 1939 1406 462];
DHF=(P3(1,1)*X1.^3)+(P3(1,2)*X1.^2)+(P3(1,3)*X1)+P3(1,4)
plot(X1,DHF,'-b')
hold
plot(X,Y,'*r')
xlabel('Delta Hvap')
ylabel('t=T/373')
hold 
hold
plot(t,DHcalc,'ow')