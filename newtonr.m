% Este programa aplica o Método de Newton-Raphson para resolver uma Equação
% Algébrica Não Linear.
% Deve-se definir os seguintes parâmetros:
% 1) A função (equação algébrica), y=f(x)
% 2) A derivada da função, y'=f'(x)
% 3) A estimativa inicial, x0

% Prof. Luiz Augusto C. Meleiro (meleiro@ufrrj.br)
% DEQ/UFRRJ, maio de 2010.

clear all
clc

x0=5; % Estimativa inicial

iter=0; % Iteração atual
erro=1; % Define o erro inicial
tol=1.e-5; % Define o erro admitido para o critério de convergência
xk=x0;

% while iter<itmax % Critério de parada: Número de iterações
while (erro>tol) % Critério de parada: Erro
    iter=iter+1;
    fx=fun_cub(xk); % Valor da função para x(k)
    der_fx=dfun_cub(xk); % Valor da derivada da função para x(k)
    xk1=xk-(fx/der_fx); % Estimativa do próximo valor de x, ou seja, x(k+1)
    fxk1=fun_cub(xk1); % Valor da função para x(k+1)
    erro=abs(xk1-xk);
    xk=xk1;
end;

% Exibindo os resultados:
% Raiz da Função:
xk
