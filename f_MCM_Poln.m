% Subrotina para realizar a interpolacao de Polinomial Simples
% Data da ultima modificacao: 11/10/2018

function [An,P,stat]=f_MCM_Poln(Ox,Ofx,gp,xd)

% Documentacao
% Ox - Vetor de dados tabelados da Variavel Independente
% Ofx - Vetor de dados tabelados da Variavel Dependente
% gp - grau do polinomio interpolador
% xd - valor de x para interpolar f(xd)

% Valores e vetores de retorno da funcao
% P - Valor interpolado de f(xd) 
% An - Vetor de coeficientes do polinomio interpolador: Ani
% stat - Estado da execucao: Bem sucedido = 1, Mal sucedido = 0

% Definicao dos vetores xo e fxo com os dados gerais
xo = Ox;
fxo = Ofx;

NP = length(xo);
fprintf("\n Numero de pontos tabelados: %3d\n",NP);

% Verificacao de viabilidade de interporlacao
if (NP < gp+1)
  fprintf("\nPontos insuficientes: gp = %3d > NP-1 = %3d\n",gp,NP-1);
  stat = 0;
  P = 0.0;
  return;
endif 
if (xd < min(xo))
  fprintf("\n xd = %6.2f fora da faixa: (%6.2f,%6.2f)",xd, xo(1),xo(NP));
  stat = 0;
  P = 0.0;
  return;
endif 
if (xd > max(xo))
  fprintf("\n xd = %6.2f fora da faixa: (%6.2f,%6.2f)",xd, xo(1),xo(NP));
  stat = 0;
  P = 0.0;
  return;
endif  

% Determinacao dos pontos interpoladores
% OBS: Usar os pontos mais próximos

fprintf("\nDados de trabalho e delta\n");

for i = 1:NP
  delta(i)= abs(xd-xo(i));
  fprintf("x(%3d) = %7.4f;  fx(%3d) = %7.4f;  delta(%3d) = %7.4f;\n",
          i, xo(i),i, fxo(i), i, delta(i));
endfor       

% Ordenacao de delta em ordem crescente
% id - vetor com os indices das linhas de delta original

[delta,id] = sort(delta);

ndados = gp + 1;

% Selecao dos pontos mais proximos de xd para a interpolacao
% Pxo - Vetor de variaveis independentes dos pontos interpoladores
% Pfo - Vetor de variaveis dependentes dos pontos interpoladores
exc = 0;
for i = 1:ndados
  if ndados > 2
    Pxo(i) = xo(id(i));
    Pfo(i) = fxo(id(i));
  endif

  if ndados == 2
    if ((xd < xo(id(1)) && xd < xo(id(2)))||(xd > xo(id(1)) && xd > xo(id(2)))&& exc ~= 0)
     Pxo(i) = xo(id(3));
     Pfo(i) = fxo(id(3));
    else
      Pxo(i) = xo(id(i));
      Pfo(i) = fxo(id(i));
      exc = 1;
    endif
  endif  

endfor

 % Ordenacao de x dos ponto interpoladores em ordem decrescente
 % Px - Vetor de variaveis independentes em ordem decrescente
 % Pf - Vetor de variaveis dependentes pareadas com Px
 % fi - vetor com os indices das linhas de Pxo originais
 
 [Px,fi] = sort(Pxo,"descend");
 
 % Pareamento de f(x) com x
 for i = 1:ndados
  Pf(i) = Pfo(fi(i));
 endfor
 
% Cria os vetores relativos aos pontos interpoladores

fprintf("\nPontos Interpoladores em ordem decrescente de x\n");
% Ordenacao dos pontos em ordem decrescente de x
for i = 1:ndados
  x(i) = Px(i);
  fx(i) = Pf(i);
  fprintf("x(%3d) = %7.4f;  fx(%3d) = %7.4f\n", i, x(i),i, fx(i));
endfor

% Criar a Matriz A e vetor r para o Método de Gauss Jordan

A = zeros(ndados,ndados);
r = zeros(ndados,1);
xx = zeros(ndados,1);

for i=1:ndados
  r(i) = fx(i);
  xdec = x(i);
  A(i,ndados) = 1.0;
    for j = 1:gp
      A(i,j) = (xdec^(ndados-j));  
    endfor % fim do for j
endfor % fim do for i
A;
r;
xx;

% Solucao do sistema de equacoes algebricas lineares pelo 
% Metodo de Gauss-Jordan
[AA,rr,xx] = f_Gauss_Jordan(A,r);

% Determinacao do valor interpolado
P = 0;
for i = 1:ndados
  P = P + xx(i)*(xd^(ndados-i));
endfor

An = xx;
stat = 1;
return;
