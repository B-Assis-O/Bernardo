% Subrotina para resolver um sistema de equa��es alg�bricas lineares
% pelo m�todo de Gauss-Seidel

function x=f_gs(A,b,x0,tol)

[nl,nc]=size(A);

% Defini��o dos par�metros e valores iniciais de x
x_k=x0;   % Vetor x (solu��o) na itera��o k
x_k1=x0;  % Vetor x (solu��o) na itera��o k+1

% Vari�veis auxiliares:
somatorio=0;
erro=1;

% Resolvendo o Sistema Linear A*x=b pelo M�todo de Gauss-Seidel
while erro > tol % Crit�rio de parada
    for i=1:nl;
        for j=1:nc;
            if i ~= j
                somatorio=somatorio+(A(i,j)*x_k1(j,1));
            end           
        end;
        x_k1(i,1)=(b(i,1)/A(i,i))-(somatorio/A(i,i));
        somatorio=0;
    end;
    teste=abs(x_k1-x_k);
    erro=max(teste);
    x_k=x_k1; % Atualiza a estimativa de x para a pr�xima itera��o
end

% Resposta: "Vetor Solu��o"
x=x_k;

endfunction
