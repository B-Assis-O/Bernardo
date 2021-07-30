% Subrotina para realizar uma interpolacao de Lagrange
% Ultima modificacao: 15/10/2018

function [L,P,stat]=f_MCM_Lagran(Ox,Ofx,gp,xd)

% Documentacao
% Ox - Vetor de dados tabelados da Variavel Independente
% Ofx - Vetor de dados tabelados da Variavel Dependente
% gp - grau do polinomio interpolador
% xd - valor de x para interpolar f(xd)

% Valores e vetores de retorno da funcao
% P - Valor de f(xd) interpolado
% L - Vetor de polinomios de Lagrande em xd: Li(xd)
% stat - Estado da execucao: Bem sucedido = 1, Mal sucedido = 0


% Definicao dos vetores xo e fxo com os dados gerais
xo = Ox;
fxo = Ofx;

NP = length(xo);

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

for i=1:NP
    delta(i)=abs(xd-xo(i));
end

fprintf("\nDados de trabalho e delta\n");
for i = 1:NP
  fprintf("x(%3d) = %8.4f;  fx(%3d) = %8.4f;  delta(%3d) = %8.4f;\n",
          i, xo(i),i, fxo(i), i, delta(i));
endfor 
[delta,id] = sort(delta);
ndados = gp+1;

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

% Calculo do valor interpolado

L=ones(ndados,1);

P=0;
for i=1:ndados
    for j=1:ndados
        if i~=j
            L(i)=L(i)*(xd-x(j))/(x(i)-x(j));
        endif
    endfor % Fecha o loop for de construcao dos Li(xd)
    
    P=P+fx(i)*L(i);
endfor % Fecha o loop for de calculo do valor interpolado de f(xd)
stat = 1;
