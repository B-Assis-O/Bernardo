% Determinação dos pontos a serem utilizados na interpolação de Lagrange
% OBS: Usar os pontos mais próximos

clear 
clc
 
% Pontos Experimentais - Entrada Através de Arquivo de Dados:
load dadospc.dat;
x=dadospc(:,1);
fx=dadospc(:,2);

xd=28.24; % Ponto onde se deseja obter o valor da função por interpolação


for i=1:length(x)
    delta(i,1)=abs(xd-x(i));
end
disp('Distâncias entre xd e os pontos do arquivo de dados:')
disp(delta)
