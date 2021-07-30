% Luiz Augusto C. Meleiro - 08/2013 - DEQ-UFRRJ
% Este programa aplica o Método dos Mínimos Quadrados para realizar uma 
% regressão linear MULTIVARIÁVEL.
% Exemplos da Avalação Continuada do Mancini: Equação de Secagem

clear all
close all
clc

t=[0.5;1;1.5;2;2.5;3];
PA=[0.4741;6.7062;27.2158;58.5834;79.6637;84.3663];
x=t;
y=PA;

% MODELO POLINOMIAL
% ymod=a0+a1*t+a2*t.^2+a3*t.^3;

% Determinando os elementos da matriz A e do vetor b, segundo o Método dos
% Mínimos Quadrados
sx=0;
sx2=0;
sx3=0;
sx4=0;
sx5=0;
sx6=0;
sy=0;
sy2=0;
syx=0;
syx2=0;
syx3=0;
np=length(x);
for i=1:np
    sx=sx+x(i);
    sx2=sx2+x(i)^2;
    sx3=sx3+x(i)^3;
    sx4=sx4+x(i)^4;
    sx5=sx5+x(i)^5;
    sx6=sx6+x(i)^6;
    sy=sy+y(i);
    sy2=sy2+(y(i)^2);
    syx=syx+y(i)*x(i);
    syx2=syx2+y(i)*x(i)^2;
    syx3=syx3+y(i)*x(i)^3;
end


A=[np,sx,sx2,sx3;
   sx,sx2,sx3,sx4;
   sx2,sx3,sx4,sx5;
   sx3,sx4,sx5,sx6];
b=[sy;syx;syx2;syx3];

X=f_gauss(A,b);

a0=X(1);
a1=X(2);
a2=X(3);
a3=X(4);

disp('Parâmetros do Modelo Polinomial: a0, a1, a2 e a3')
par=[a0,a1,a2,a3];
disp(par)

% Modelo polinomial do processo:
for i=1:np
    y_calc(i)=a0+a1*x(i)+a2*x(i)^2+a3*x(i)^3;
end

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

