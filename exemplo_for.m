% IT 383 - Aula 3
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdut�rio de la�os e controladores de fluxo

% Exemplos de aplica��o do comando "for"
clear
clc

disp('Exemplo 1:')

for n=1:5 % N�mero de vezes que as opera��es ser�o repetidas
  n       % Mostra o valor de n
  a=n+1   % Calcula o valor de a
  b=a^2   % Calcula o valor de b
end

disp('-------------------------------------------')
disp('Exemplo 2:')
clc
v=[2,10,50,157,789];
y=0;
for n=v % n assume os valores de v
  n       % Mostra o valor de n
  y=y+n   % Calcula o valor de y
end
