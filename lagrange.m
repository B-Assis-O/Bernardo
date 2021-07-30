A=[1 -1.2681] %conv2 só pode ser feito de dois em dois polinômios
B=[1 -1.5362]
con1=conv2(A,B)
C=[1 -1.7239]
con2=conv2(con1,C)
L0t=con2/((1-1.2681)*(1-1.5362)*(1-1.7239)) %Matriz com os coeficientes em T no L0(T)

A=[1 -1]
B=[1 -1.5362]
con1=conv2(A,B)
C=[1 -1.7239]
con2=conv2(con1,C)
L1t=con2/((1.2681-1)*(1.2681-1.5362)*(1.2681-1.7239))

A=[1 -1]
B=[1 -1.2681]
con1=conv2(A,B)
C=[1 -1.7239]
con2=conv2(con1,C)
L2t=con2/((1.5362-1)*(1.5362-1.2681)*(1.5362-1.7239))

A=[1 -1]
B=[1 -1.2681]
con1=conv2(A,B)
C=[1 -1.5362]
con2=conv2(con1,C)
L3t=con2/((1.7239-1)*(1.7239-1.2681)*(1.7239-1.5362))

cp3=2257*L0t+1939*L1t+1406*L2t+462*L3t   %Matriz com os coeficientes do polinômio intepolado de lagrange cT³+c'T²+ c''T+ c0 
%T=512
p3_512=cp3(1,1)*(512/373)^3+cp3(1,2)*(512/373)^2+cp3(1,3)*(512/373)+cp3(1,4)