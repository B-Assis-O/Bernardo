% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica a t�cnica de interpola��o linear para determinar
% valores intermedi�rios de um conjunto de dados experimentais.
 
% Dado um conjunto de pontos experimentais na forma de uma matriz com x e
% f(x) (vari�vel independente e sua fun��o), o valor da fun��o de um ponto
% intermedi�rio "b", f(xb), pode ser obtido atrav�s da interpola��o linear
% entre os pontos experimentais mais pr�ximos, [xa,f(xa)] e [xc,f(xc)], da
% forma: 
% f(xb)=f(xa)+[(xb-xa)/(xc-xa)]*[f(xc)-f(xa)]
 
clear
clc
 
% Pontos Experimentais - Entrada Atrav�s de Arquivo de Dados:
load dadosint.dat;
x=dadosint(:,1);
fx=dadosint(:,2);

% Pontos Experimentais - Entrada Manual:
% x=[0;1;2;3;4;5];
% fx=[0;20;60;68;77;110];

% ----------- Par�metros definidos pelo usu�rio: 
xb=2.6; % Ponto onde se deseja obter o valor da fun��o por interpola��o
p_xa=3; % Posi��o do ponto experimental inferior mais pr�ximo de xb no conjunto de dados 
p_xc=4; % Posi��o do ponto experimental superior mais pr�ximo de xb no conjunto de dados 
% -------------------------------------------- 

f_xb=f_intlin(x,fx,xb,p_xa,p_xc); % Chamada da subrotina para interpola��o linear
disp('Valor da fun��o de um ponto xb:')
disp(f_xb)

