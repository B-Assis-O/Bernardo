% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica o Método dos Mínimos Quadrados para realizar uma 
% regressão linear de um conjunto de dados experimentais.
 
clear all
clc
 
% Pontos Experimentais:
x=[0;1;2;3;4;5];
y=[0;20;60;68;77;110];
 
np=length(x);

% Determinando os elementos da matriz A e do vetor b, segundo o Método dos
% Mínimos Quadrados
sx=0;
sx2=0;
sy=0;
syx=0;

for i=1:np
    sx=sx+x(i);
    sx2=sx2+x(i)^2;
    sy=sy+y(i);
    syx=syx+y(i)*x(i);
end

A=[sx2,sx;
   sx,np]; 

b=[syx;sy];

X=f_gauss(A,b);
a=X(1);
b=X(2);

disp('Parâmetros do Modelo Linear: a, b')
disp('Coeficiente Angular: a')
disp(a)
disp('Coeficiente Linear: b')
disp(b)

% Modelo polinomial do processo:
y_calc=b+a*x;

% Cálculo das Médias:
y_medio=mean(y);
ycalc_medio=mean(y_calc);

% Coeficiente de Determinação:
eq_yexp=0;
eq_ycalc=0;
for i=1:np
    eq_yexp=eq_yexp+(y(i)-y_medio)^2;
    eq_ycalc=eq_ycalc+(y_calc(i)-ycalc_medio)^2;
end
R2=eq_ycalc/eq_yexp;
disp('Coeficiente de Determinação: R^2')
disp(R2)

