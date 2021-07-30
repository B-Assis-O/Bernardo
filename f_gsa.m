% Subrotina para resolver um sistema de equacees algebricas lineares
% pelo metodo de Gauss-Seidel Acelerado

% ULTIMA MODIFICACAO: 10/09/2018

function [XN,x,n]=f_gsa(A,r,x0,tol)

[nl,nc]=size(A);


% Definicao dos parametros e valores iniciais de x
% Matriz x (solucao) na iteracao k
xk = x0;
xk1 = x0;
xnn = x0;

% Variaveis auxiliares:

erro = 1;
iter = 1;

% Resolvendo o Sistema Linear A*x=b pelo Metodo de Gauss-Seidel Acelerado
while erro > tol % Criterio de parada
   soma0 = 0;
   soma1 = 0;   
   for i=1:nc;
     for j=1:i-1;
       soma0=soma0+A(i,j)*xk1(j);
     endfor %fim do for j 
     for k=i+1:nl;
          soma1=soma1+A(i,k)*xk(k);
     endfor %fim do for k    
     xk1(i)=(r(i)-(soma0 + soma1))/A(i,i);
     soma0 = 0;
     soma1 = 0;
   endfor % fim do for i
    xnn = [xnn,xk1];
    teste=abs(xk1(:)-xk(:));
    erro=max(teste);    
    iter = iter+1;
    xk = xk1;
end

% Resposta: "Vetor Solucao"
x = xk1;
XN = xnn;
n = iter;