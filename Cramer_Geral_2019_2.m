% Mauricio C. Mancini - 10 de setembro de 2018 - DEQ-UFRRJ
% Este programa aplica a Regra de Carmer para
% resolver um Sistema de Equacoes Algebricas Lineares.

% ULTIMA MODIFICACAO: 25/03/2019 



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

Prob = 6;

% Deseja imprimir Resultados Intermediarios das Matrizes Ai?
% (1) - Nao
% (2) - Sim

ReInt = 2;

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
  Inc = "T"; % Nome das Incognitas
  Unit = "oC"; % Unidade das Incognitas
endif

if Prob == 2
  disp('(2) - Resfriamento em Tres Tanques Continuos');
  
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
  Inc = "T"; % Nome das Incognitas
  Unit = "oC"; % Unidade das Incognitas
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
  Inc = "T"; % Nome das Incognitas
  Unit = "oC"; % Unidade das Incognitas
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
  Inc = "T"; % Nome das Incognitas
  Unit = "oC"; % Unidade das Incognitas
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
  Inc = "Ca"; % Nome das Incognitas
  Unit = "gmol/L"; % Unidade das Incognitas

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
  Inc = "Ca"; % Nome das Incognitas
  Unit = "gmol/L"; % Unidade das Incognitas
endif

% Matriz A (coeficientes):
disp('Matriz de Coeficientes:');
A

% Vetor r (termos independentes):
disp('Vetor de Respostas:');
r



% Chamada da sub-rotina para a Regra de Cramer
fprintf("Solucao pela Regra de Cramer\n");
[DetAi,x]=f_Cramer(A,r,ReInt,Inc,Unit);

% ********************************
%
% Fim do Programa 
%
% ********************************