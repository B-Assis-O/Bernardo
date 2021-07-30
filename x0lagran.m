% Determina��o dos pontos a serem utilizados na interpola��o de Lagrange
% OBS: Usar os pontos mais pr�ximos

clear 
clc
 
% Pontos Experimentais - Entrada Atrav�s de Arquivo de Dados:
load dadospc.dat;
x=dadospc(:,1);
fx=dadospc(:,2);

xd=28.24; % Ponto onde se deseja obter o valor da fun��o por interpola��o


for i=1:length(x)
    delta(i,1)=abs(xd-x(i));
end
disp('Dist�ncias entre xd e os pontos do arquivo de dados:')
disp(delta)
