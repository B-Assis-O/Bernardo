% IT 383 - Aula 2
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdut�rio de c�lculos simples

% C�lculo das ra�zes de uma equa��o do 2o grau (a x^2 + b x + c = 0) pela
% F�rmula de Bhaskara:
clear
clc

% Declara��o dos par�metros:
a=2;
b=7;
c=5;

% C�lculo do Delta:
delta=b^2-4*a*c;

% C�lculo das ra�zes:
x1=(-b+sqrt(delta))/(2*a);
x2=(-b-sqrt(delta))/(2*a);

% Formas de exibi��o do resultado:

disp('As ra�zes s�o: ')
disp(x1)
disp(x2)

% ou
x1
x2

