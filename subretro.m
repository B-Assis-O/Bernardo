% Luiz Augusto C. Meleiro - 03/2010 - DEQ-UFRRJ
% Este programa aplica o Método da Substituição Retroativa para resolver um
% Sistema de Equações Algébricas Lineares.
%
clear
clc

% Matriz dos coeficientes:
A=[3,4,-5,1;0,1,1,-2;0,0,4,-5;0,0,0,2];

% Vetor dos termos independentes:
b=[-10;-1;3;2];

[n,m]=size(A);

x(n)=b(n)/A(n,n);
soma=0;
for k=(n-1):-1:1
    soma=b(k);
    for j=(k+1):n
        soma=soma-(A(k,j)*x(j));
    end
    x(k)=soma/A(k,k);
end

% Mostrando o resultado (Vetor Solução):
x
