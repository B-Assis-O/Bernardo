% Subrotina para resolver um sistema de equações algébricas lineares
% pelo método de Gauss-Seidel

function x=f_gs(A,b,x0,tol)

[nl,nc]=size(A);

% Definição dos parâmetros e valores iniciais de x
x_k=x0;   % Vetor x (solução) na iteração k
x_k1=x0;  % Vetor x (solução) na iteração k+1

% Variáveis auxiliares:
somatorio=0;
erro=1;

% Resolvendo o Sistema Linear A*x=b pelo Método de Gauss-Seidel
while erro > tol % Critério de parada
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
    x_k=x_k1; % Atualiza a estimativa de x para a próxima iteração
end

% Resposta: "Vetor Solução"
x=x_k;

endfunction
