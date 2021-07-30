function [DetAi, x] = f_Cramer(A,r,ReInt,Inc,Unit)
% Professor: Mauricio Mancini - Data de Modificacao: 03/09/2018  
% Subrotina para resolver um sistema de equacoes algebricas lineares
% pela Regra de Cramer 

n=length(r);
[nr,nc]=size(A);

% Verificacao da matriz A e do vetor r
if nr ~= nc
    error('Matriz dos coeficientes nao e quadrada.')
    exit;
end
if nr ~= n
    error('Matriz A e vetor r tem dimensoes diferentes.')
    exit;
end

% Verificando se a matriz A e singular (estima o numero de equacees
% linearmente independentes)
if det(A) == 0
    fprintf('\n Rank=%7.3g\n',rank(A))
    error('A matriz A e singular.')
    exit;
end


% Calculo do Determinandte da Matriz de Coeficientes
DetAo = det(A);
fprintf("\nDeterminante da matriz A\n")
fprintf("\n DetA = %9.2f\n", DetAo);

fprintf("\nDeterminantes das Matrizes Ai e Vetor de Incognitas\n");

% Geracao das Matrizes Ai, 
for i = 1:nr
  Ai(:,:,i) = A(:,:);
  Ai(:,i,i) = r;
  DetAi(i) = det(Ai(:,:,i));
  x(i) = DetAi(i)/DetAo;
  
  fprintf("\nDetAi(%2d) = %9.2f, \t\t %s(%2d) = %7.4f %s\n", 
            i,DetAi(i),Inc,i, x(i),Unit); 
endfor
if ReInt == 2
    fprintf("\nMatrizes Ai\n");
    Ai
  endif  
% Fim da Rotina Regra de Cramer