
% Mauricio Cordeiro Mancini - 11/10/2018 - DEQ-UFRRJ
% Este programa aplica a técnica de interpolacao de Lagrange para determinar
% valores intermediarios de um conjunto de dados experimentais.
% Ultima modificacao: 25/09/2019
 
% Este programa usa os pontos MAIS PRÓXIMOS do valor desejado para obter a
% interpolacao com o MENOR erro.
  
clear 
clc
 
% Pontos Experimentais Originais - Entrada Atraves de Arquivo de Dados:
ODados = load("IT383_T01_2019_2.dat");
%ODados

% Cria os vetores Ox, com todos os dados tabelados da Variavel Independente,
% e Ofx, com todos os dados tabelados da Variavel Dependente
Ox = ODados(:,1);
Ofx = ODados(:,2);

% ------- Parametros definidos pelo usuario --------------------
gp = 4; % Grau do Polinomio Interpolador de Lagrange:
 
xd = 4.75; % Ponto onde se deseja obter o valor da funcao por interpolacao

% Chamada da subrotina para interpolação de Lagrange
[L,P,stat]=f_MCM_Lagran(Ox,Ofx,gp,xd); 

if (stat == 1)
   fprintf("\n\n Polinomio Interpolador de Lagrande de Grau %2d\n",gp);
  fprintf("\n Polinomios de Lagrange: Li(xd)");
  for i = 1:gp+1
    fprintf("\n L(%2d) = %8.5f",i-1,L(i));
  endfor  
  fprintf("\n\nResultado da Interpolacao Polinomial Simples\n");
  fprintf("xd = %8.5f; f(xd) = %8.5f\n",xd,P);
endif 
if (stat == 0)
  disp("\n\nNao foi possivel interpolar\n");
  fprintf("\nVerifique mensagem de erro\n"); 
endif  



