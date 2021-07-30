% Este programa aplica o Método da Bissecção para resolver uma Equação
% Algébrica Não Linear.
% Deve-se definir os seguintes parâmetros:
% 1) A equação algébrica
% 2) Os limites de busca

% Prof. Luiz Augusto C. Meleiro (meleiro@ufrrj.br)
% DEQ/UFRRJ, maio de 2010.

clear all
clc

% Definindo os limites de busca:
% Função Cúbica:
xa=0; % Limite de busca inferior
xb=5; % Limite de busca superior

% Executando o algoritmo:
iter=0; % Iteração atual
erro=xb-xa; % Define o erro inicial
tol=1.e-5; % Define o erro admitido para o critério de convergência

% Laço para o cálculo da raiz:
while (erro>tol) % Critério de parada: Erro
    iter=iter+1; % Atualizando a iteração
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
% Raiz da Função:
xc
