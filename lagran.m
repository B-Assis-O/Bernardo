
% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica a técnica de interpolação de Lagrange para determinar
% valores intermediários de um conjunto de dados experimentais.
 
% Este programa usa os pontos MAIS PRÓXIMOS do valor desejado para obter a
% interpolação com o MENOR erro.
  
clear 
clc
 
% Pontos Experimentais - Entrada Através de Arquivo de Dados:
load dadospc.dat;
x=dadospc(:,1);
fx=dadospc(:,2);

% ------- Parâmetros definidos pelo usuário --------------------
gp=3; % Grau do Polinômio Interpolador de Lagrange:
 
xd=28.24; % Ponto onde se deseja obter o valor da função por interpolação

% Determinação dos pontos a serem utilizados
% OBS: Usar os pontos mais próximos

for i=1:length(x)
    delta(i,1)=abs(xd-x(i));
end
disp(delta)

x0=4; % Posição do 1o ponto no conjunto de dados original
% --------------------------------------------------------------

f=f_lagran(x,fx,gp,xd,x0); % Chamada da subrotina para interpolação quadrática
disp('Valor da função de um ponto x:')
disp(f)

