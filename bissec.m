% Este programa aplica o M�todo da Bissec��o para resolver uma Equa��o
% Alg�brica N�o Linear.
% Deve-se definir os seguintes par�metros:
% 1) A equa��o alg�brica
% 2) Os limites de busca

% Prof. Luiz Augusto C. Meleiro (meleiro@ufrrj.br)
% DEQ/UFRRJ, maio de 2010.

clear all
clc

% Definindo os limites de busca:
% Fun��o C�bica:
xa=0; % Limite de busca inferior
xb=5; % Limite de busca superior

% Executando o algoritmo:
iter=0; % Itera��o atual
erro=xb-xa; % Define o erro inicial
tol=1.e-5; % Define o erro admitido para o crit�rio de converg�ncia

% La�o para o c�lculo da raiz:
while (erro>tol) % Crit�rio de parada: Erro
    iter=iter+1; % Atualizando a itera��o
    erro=abs(xb-xa);
    xc=(xa+xb)/2;
    fc=fun_cub(xc);
    fa=fun_cub(xa);
    if (fa*fc<0)
        xb=xc;
    else
        xa=xc;
    end
end

% Exibindo os resultados:
% Raiz da Fun��o:
xc
