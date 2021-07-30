% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica o Método de Gauss-Seidel (ou Gauss Acelerado) para
% resolver um Sistema de Equações Algébricas Lineares. 

% ************************************************************** %
% ***** ATENÇÃO: A MATRIZ "A" DEVE SER DIAGONAL DOMINANTE. ***** %
% ************************************************************** %

clear
clc

% Matriz A (coeficientes):
A=[5,1,1;3,4,1;3,3,6];  

% Vetor b (termos independentes):
b=[5;6;0]; 

% Estimativa inicial:
x0=[0;0;0]; 

% Critério de Parada: Tolerância permitida
tol=1.e-5; % 0.00001

% Chamada da sub-rotina com o método de Gauss
x=f_gs(A,b,x0,tol);

% Vetor solução
x
