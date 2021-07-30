
% Mauricio Cordeiro Mancini - 11/10/2018 - DEQ-UFRRJ
% Este programa aplica a técnica de interpolacao de Polinomial para determinar
% valores intermediarios de um conjunto de dados tabelados.
% Ultima modificacao: 25/09/2019
 
% Este programa usa os pontos MAIS PRÓXIMOS do valor desejado para obter a
% interpolacao com o MENOR erro.
  
clear 
clc
 
% Pontos Experimentais Originais - Entrada Atraves de Arquivo de Dados:
ODados = load("IT383_T01_2019_2.dat");

% Cria os vetores Ox, com todos os dados tabelados da Variavel Independente,
% e Ofx, com todos os dados tabelados da Variavel Dependente
Ox = ODados(:,1);
Ofx = ODados(:,2);

% ------- Parametros definidos pelo usuario --------------------
gp = 4; % Define o Grau do Polinomio Interpolador:
 
xd = 4.75; % Ponto onde se deseja obter o valor da funcao por interpolacao

% Chamada da subrotina para Interpolação Polinomial
[An,P,stat]=f_MCM_Poln(Ox,Ofx,gp,xd); 

if (stat == 1)
  fprintf("\n\n Polinomio Interpolador de grau %2d\n",gp);
  fprintf("\n Coeficientes do Polinomio interpolador");
  for i = 1:gp+1
    fprintf("\n A(%2d) = %10.3e",gp+1-i,An(i));
  endfor  
  fprintf("\n\nResultado da Interpolacao Polinomial Simples\n");
  fprintf("xd = %8.5f; f(xd) = %8.5f\n",xd,P);
endif 
if (stat == 0)
  disp("\n\nNao foi possivel interpolar\n");
  fprintf("\nVerifique mensagem de erro\n"); 
endif  



