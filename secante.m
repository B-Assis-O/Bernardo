% Esta rotina é usada resolver Eqs. Algébricas Não Lineares pelo Método da Secante.
% Deve-se definir os seguintes parâmetros:
% 1) A função (equação algébrica), 'eanl'
% 2) As estimativas iniciais, x0 e x-1

% Prof. Luiz Augusto C. Meleiro (meleiro@ufrrj.br)
% DEQ/UFRRJ, maio de 2010.

clear all
clc

% Definindo as estimativas iniciais:
xk_1=0; % x(k-1) ou x0
xk=5; % x(k) ou x1

iter=0; % Iteração atual
erro=1; % Define o erro inicial
tol=1.e-5; % Define o erro admitido para o critério de convergência

while (erro>tol) % Critério de parada: Erro
    iter=iter+1; % Atualizando a iteração
    [fxk_1]=fun_cub(xk_1); % Valor da função para x(k-1)
    [fxk]=fun_cub(xk); % Valor da função para x(k)
    
    % Estimativa do próximo valor de x, ou seja, x(k+1):
    xk1=(xk_1*fxk-xk*fxk_1)/(fxk-fxk_1);
    [fxk1]=fun_cub(xk1); % Valor da função para x(k+1)
    
    erro=abs(xk1-xk); % Cálculo do erro
    
    % Atualização das próximas estimativas:
    xk_1=xk;
    xk=xk1;
end

% Exibindo os resultados:
% Exibindo os resultados:
% Raiz da Função:
xk
