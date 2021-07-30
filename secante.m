% Esta rotina � usada resolver Eqs. Alg�bricas N�o Lineares pelo M�todo da Secante.
% Deve-se definir os seguintes par�metros:
% 1) A fun��o (equa��o alg�brica), 'eanl'
% 2) As estimativas iniciais, x0 e x-1

% Prof. Luiz Augusto C. Meleiro (meleiro@ufrrj.br)
% DEQ/UFRRJ, maio de 2010.

clear all
clc

% Definindo as estimativas iniciais:
xk_1=0; % x(k-1) ou x0
xk=5; % x(k) ou x1

iter=0; % Itera��o atual
erro=1; % Define o erro inicial
tol=1.e-5; % Define o erro admitido para o crit�rio de converg�ncia

while (erro>tol) % Crit�rio de parada: Erro
    iter=iter+1; % Atualizando a itera��o
    [fxk_1]=fun_cub(xk_1); % Valor da fun��o para x(k-1)
    [fxk]=fun_cub(xk); % Valor da fun��o para x(k)
    
    % Estimativa do pr�ximo valor de x, ou seja, x(k+1):
    xk1=(xk_1*fxk-xk*fxk_1)/(fxk-fxk_1);
    [fxk1]=fun_cub(xk1); % Valor da fun��o para x(k+1)
    
    erro=abs(xk1-xk); % C�lculo do erro
    
    % Atualiza��o das pr�ximas estimativas:
    xk_1=xk;
    xk=xk1;
end

% Exibindo os resultados:
% Exibindo os resultados:
% Raiz da Fun��o:
xk
