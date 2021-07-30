
% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica a t�cnica de interpola��o de Lagrange para determinar
% valores intermedi�rios de um conjunto de dados experimentais.
 
% Este programa usa os pontos MAIS PR�XIMOS do valor desejado para obter a
% interpola��o com o MENOR erro.
  
clear 
clc
 
% Pontos Experimentais - Entrada Atrav�s de Arquivo de Dados:
load dadospc.dat;
x=dadospc(:,1);
fx=dadospc(:,2);

% ------- Par�metros definidos pelo usu�rio --------------------
gp=3; % Grau do Polin�mio Interpolador de Lagrange:
 
xd=28.24; % Ponto onde se deseja obter o valor da fun��o por interpola��o

% Determina��o dos pontos a serem utilizados
% OBS: Usar os pontos mais pr�ximos

for i=1:length(x)
    delta(i,1)=abs(xd-x(i));
end
disp(delta)

x0=4; % Posi��o do 1o ponto no conjunto de dados original
% --------------------------------------------------------------

f=f_lagran(x,fx,gp,xd,x0); % Chamada da subrotina para interpola��o quadr�tica
disp('Valor da fun��o de um ponto x:')
disp(f)

