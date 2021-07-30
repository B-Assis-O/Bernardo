% IT 383 - Aula 2
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdutório de cálculos simples

% Cálculo das raízes de uma equação do 2o grau (a x^2 + b x + c = 0) pela
% Fórmula de Bhaskara:
clear
clc

% Declaração dos parâmetros:
a=2;
b=7;
c=5;

% Cálculo do Delta:
delta=b^2-4*a*c;

% Cálculo das raízes:
x1=(-b+sqrt(delta))/(2*a);
x2=(-b-sqrt(delta))/(2*a);

% Formas de exibição do resultado:

disp('As raízes são: ')
disp(x1)
disp(x2)

% ou
x1
x2

