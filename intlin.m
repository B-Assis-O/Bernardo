% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica a técnica de interpolação linear para determinar
% valores intermediários de um conjunto de dados experimentais.
 
% Dado um conjunto de pontos experimentais na forma de uma matriz com x e
% f(x) (variável independente e sua função), o valor da função de um ponto
% intermediário "b", f(xb), pode ser obtido através da interpolação linear
% entre os pontos experimentais mais próximos, [xa,f(xa)] e [xc,f(xc)], da
% forma: 
% f(xb)=f(xa)+[(xb-xa)/(xc-xa)]*[f(xc)-f(xa)]
 
clear
clc
 
% Pontos Experimentais - Entrada Através de Arquivo de Dados:
load dadosint.dat;
x=dadosint(:,1);
fx=dadosint(:,2);

% Pontos Experimentais - Entrada Manual:
% x=[0;1;2;3;4;5];
% fx=[0;20;60;68;77;110];

% ----------- Parâmetros definidos pelo usuário: 
xb=2.6; % Ponto onde se deseja obter o valor da função por interpolação
p_xa=3; % Posição do ponto experimental inferior mais próximo de xb no conjunto de dados 
p_xc=4; % Posição do ponto experimental superior mais próximo de xb no conjunto de dados 
% -------------------------------------------- 

f_xb=f_intlin(x,fx,xb,p_xa,p_xc); % Chamada da subrotina para interpolação linear
disp('Valor da função de um ponto xb:')
disp(f_xb)

