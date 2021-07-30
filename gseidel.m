% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica o M�todo de Gauss-Seidel (ou Gauss Acelerado) para
% resolver um Sistema de Equa��es Alg�bricas Lineares. 

% ************************************************************** %
% ***** ATEN��O: A MATRIZ "A" DEVE SER DIAGONAL DOMINANTE. ***** %
% ************************************************************** %

clear
clc

% Matriz A (coeficientes):
A=[5,1,1;3,4,1;3,3,6];  

% Vetor b (termos independentes):
b=[5;6;0]; 

% Estimativa inicial:
x0=[0;0;0]; 

% Crit�rio de Parada: Toler�ncia permitida
tol=1.e-5; % 0.00001

% Chamada da sub-rotina com o m�todo de Gauss
x=f_gs(A,b,x0,tol);

% Vetor solu��o
x
