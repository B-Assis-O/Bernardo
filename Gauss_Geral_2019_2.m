% Mauricio C. Mancini - 10 de setembro de 2018 - DEQ-UFRRJ
% Este programa aplica os Metodos de Eliminacao de Gauss para
% resolver um Sistema de Equacees Algebricas Lineares. 

% ULTIMA MODIFICACAO: 31/07/2019


% SOLUCOES DOS EXEMPLOS DESTE SEMESTRE

clear
clc

% **********************************
% Escolha do Tipo de Problema
% **********************************

% (1) - Aquecimento em Dois Tanques Continuos
% (2) - Resfriamento em Três Tanques Continuos
% (3) - Resfriamento em Quatro Tanques Continuos
% (4) - Resfriamento em Cinco Tanques Continuos
% (5) - Reacao em 3 CSTR em Serie com Reciclo e ByPass
% (6) - Reacao em 4 CSTR em Serie com Reciclo e ByPass

Prob = 1;

% ********************************
% Escolha do metodo de resolucao
% ********************************

% (1) - Metodo de Eliminacao de Gauss com Retrossubstituicao
% (2) - Metodo de Eliminacao de Gauss com Substituicao Direta
% (3) - Metodo de Gauss-Jordan

Met = 3;

if Prob == 1
  disp('(1) - Aquecimento em Dois Tanques Continuos');
  % ***************************************************
  % Sistema 2X2 - Dois Tanques de Aquecimento em serie
  % ***************************************************

  % Especificacao das Condicoes de Operacao     
  F = 0.10;
  Rho = 2000.0;
  Cp = 3200.0;
  Q1 = 1.0e8;
  Q2 = 1.2e8;
  Tf = 15.0;

  %Matriz de Coeficietes
  A = [-5.0, 3.0
        5.0, -6.0]; 
    
  % Elementos do Vetor de Respostas   
  vr1 = -Q1/F/Rho/Cp-2*Tf;
  vr2 = -Q2/F/Rho/Cp-Tf;
  r = [vr1; vr2];
  
  % Declaracao do nome e da unidade das incognitas
  Inc = "T";
  Unit = "oC";
  
endif

if Prob == 2
  disp('(2) - Resfriamento em Três Tanques Continuos');
  
  % *****************************************************
  % Sistema 3X3 - Três Tanques de Resfriamento em serie
  % *****************************************************

  % Especificacao das Condicoes de Operacao
  F = 0.10;
  Rho = 2000.0;
  Cp = 3200.0;
  Q1 = 4.0e7;
  Q2 = 8.0e7;
  Q3 = 1.0e8;
  Tf = 200.0;

  % Matriz de Coeficietes
  A=[-6.0, 3.0, 2.0
      4.0, -6.0, 1.0
      2.0, 3.0, -5.0]; 
    
  % Elementos do Vetor de Respostas 
  vr1 = Q1/F/Rho/Cp - Tf;
  vr2 = Q2/F/Rho/Cp - Tf;
  vr3 = Q3/F/Rho/Cp;
  r=[vr1; vr2; vr3];
  
  % Declaracao do nome e da unidade das incognitas
  Inc = "T";
  Unit = "oC";
endif

if Prob == 3
  disp('(3) - Resfriamento em Quatro Tanques Continuos');
  
  % ********************************************************
  % Sistema 4X4 - Quatro Tanques de Resfriamento em serie
  % ********************************************************

  % Especificacao das Condicoes de Operacao
  F = 0.12;
  Rho = 2000.0;
  Cp = 3000.0;
  Q1 = 5.0e7;
  Q2 = 2.0e7;
  Q3 = 1.5e8;
  Q4 = 1.2e8;
  Tf = 250.0;

  % Matriz de Coeficietes
  A=[-6.0, 1.0, 2.0, 2.0
      3.0, -6.0, 2.0, 1.0
      2.0, 3.0, -7.0, 1.0
      1.0, 2.0, 3.0,-6.0]; 

  % Elementos do Vetor de Respostas  
  vr1 = Q1/F/Rho/Cp - Tf;
  vr2 = Q2/F/Rho/Cp;
  vr3 = Q3/F/Rho/Cp - Tf;
  vr4 = Q4/F/Rho/Cp;
  r=[vr1; vr2; vr3; vr4];
  
  % Declaracao do nome e da unidade das incognitas
  Inc = "T";
  Unit = "oC";
endif

if Prob == 4
  disp('(4) - Resfriamento em Cinco Tanques Continuos');
  
  % *****************************************************
  % Sistema 5X5 - Cinco Tanques de Resfriamento em serie
  % *****************************************************

  % Especificacao das Condicoes de Operacao
  F = 0.12;
  Rho = 2000.0;
  Cp = 4000.0;
  Q1 = 5.0e7;
  Q2 = 4.0e7;
  Q3 = 1.2e8;
  Q4 = 4.0e7;
  Q5 = 1.0e8;
  Tf = 180.0;

  % Matriz de Coeficietes
  A=[-4.0, 0.0, 2.0, 0.0, 1.0
      2.0, -5.0, 0.0, 2.0, 1.0
      1.0, 4.0, -8.0, 0.0, 1.0
      1.0, 1.0, 6.0, -9.0, 1.0
      0.0, 0.0, 0.0, 7.0, -7.0];

  % Elementos do Vetor de Respostas 
  vr1 = Q1/F/Rho/Cp - Tf;
  vr2 = Q2/F/Rho/Cp;
  vr3 = Q3/F/Rho/Cp - 2*Tf;
  vr4 = Q4/F/Rho/Cp; 
  vr5 = Q5/F/Rho/Cp;    
  r=[vr1; vr2; vr3; vr4; vr5];
  
  % Declaracao do nome e da unidade das incognitas
  Inc = "T";
  Unit = "oC";
endif

if Prob == 5
  disp('(5) - Reacao em 3 CSTR em Serie com Reciclo e ByPass');
  
  % **********************************
  % Sistema 3X3 - Três CSTR em serie
  % **********************************

  % Especificacao das Condicoes de Operacao
  F = 100.0;
  k = 0.06;
  V1 = 20000.0;
  V2 = 20000.0;
  V3 = 22000.0;
  Caf = 6.0;

  % Matriz de coeficientes
  A=[-(5.0+V1*k/F), 2.0, 1.0
      3.0, -(6.0+V2*k/F), 2.0
      2.0, 4.0, -(6.0+V3*k/F)];
    
  % Elementos do Vetor de Respostas    
  r=[-2*Caf; -Caf; 0.0];
  
  % Declaracao do nome e da unidade das incognitas
  Inc = "Ca";
  Unit = "gmol/L";
endif

if Prob == 6
  disp('(6) - Reacao em 4 CSTR em Serie com Reciclo e ByPass');
  
  % ***********************************
  % Sistema 4X4 - Quatro CSTR em serie
  % ***********************************

  % Especificacao das Condicoes de Operacao
  F = 100.0;
  k = 0.08;
  V1 = 12000.0;
  V2 = 15000.0;
  V3 = 18000.0;
  V4 = 24000.0;
  Caf = 10.0;
  
  % Matriz de Coeficietes
  A=[-(5+V1*k/F), 1.0, 1.0, 1.0
      3.0, -(5+V2*k/F), 1.0, 1.0
      1.0, 2.0, -(5+V3*k/F), 1.0
      1.0, 2.0, 3.0,-(6+V4*k/F)]; 

  % Elementos do Vetor de Respostas  
  r=[-2*Caf; 0.0; -Caf; 0.0];
  
  % Declaracao do nome e da unidade das incognitas
  Inc = "Ca";
  Unit = "gmol/L";
endif


% Apresentacao da Matriz de Coeficientes Original
disp('Matriz de Coeficientes');
A
    

% Apresentacao do Vetor r (Vetor de Respostas Original):
disp('Vetor de Respostas');
r

if Met == 1
% Chamada da sub-rotina com o metodo de Gauss com Retrossubstituicao
[AA, rr, x] = f_Gauss_Retro(A,r);
endif

if Met == 2
% Chamada da sub-rotina com o metodo de Gauss com Substituicao Direta
[AA, rr, x] = f_Gauss_Direta(A,r);
endif

if Met == 3
% Chamada da sub-rotina com o metodo de Gauss-Jordan
[AA, rr, x] = f_Gauss_Jordan(A,r);
endif

disp('Execucao bem sucedida!');

disp('Nova Matriz de Coeficientes');

% Matriz A (Nova Matriz de Coeficientes):
AA  

% Vetor r (Novo Vetor de Respostas):
disp('Novo Vetor de Respostas');
rr

disp('Matriz aumentada');
Ar = [AA,rr]

% Apresentacao do vetor x (Vetor de Incognitas = Solucao)
fprintf("\nResultados Finais do Problema %d\n",Prob);

nx = length(x);

for i = 1:nx
  fprintf("\n%s(%2d) = %9.5f %s\n",Inc,i,x(i),Unit);
endfor  
