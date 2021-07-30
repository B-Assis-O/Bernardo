% Este programa aplica o M�todo de Newton-Raphson para resolver uma Equa��o
% Alg�brica N�o Linear.
% Deve-se definir os seguintes par�metros:
% 1) A fun��o (equa��o alg�brica), y=f(x)
% 2) A derivada da fun��o, y'=f'(x)
% 3) A estimativa inicial, x0

% Prof. Luiz Augusto C. Meleiro (meleiro@ufrrj.br)
% DEQ/UFRRJ, maio de 2010.

clear all
clc

x0=5; % Estimativa inicial

iter=0; % Itera��o atual
erro=1; % Define o erro inicial
tol=1.e-5; % Define o erro admitido para o crit�rio de converg�ncia
xk=x0;

% while iter<itmax % Crit�rio de parada: N�mero de itera��es
while (erro>tol) % Crit�rio de parada: Erro
    iter=iter+1;
    fx=fun_cub(xk); % Valor da fun��o para x(k)
    der_fx=dfun_cub(xk); % Valor da derivada da fun��o para x(k)
    xk1=xk-(fx/der_fx); % Estimativa do pr�ximo valor de x, ou seja, x(k+1)
    fxk1=fun_cub(xk1); % Valor da fun��o para x(k+1)
    erro=abs(xk1-xk);
    xk=xk1;
end;

% Exibindo os resultados:
% Raiz da Fun��o:
xk
