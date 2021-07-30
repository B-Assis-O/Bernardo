% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica o Método de Gauss para
% resolver um Sistema de Equações Algébricas Lineares. 

clear
clc

% Matriz A (coeficientes):
A=[0.07,0.18,0.15,0.24
   0.04,0.24,0.10,0.65
   0.54,0.42,0.54,0.10
   0.35,0.16,0.21,0.01];  

% Vetor b de termos independentes (deve ser um vetor coluna):
b=[10.5;17.5;28;14];

% Chamada da sub-rotina com o método de Gauss
x=f_gauss(A,b);

% Vetor solução
x
