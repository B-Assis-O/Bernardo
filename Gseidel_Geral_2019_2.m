% Mauricio C. Mancini - 30 de agosto de 2018 - DEQ-UFRRJ
% Este programa aplica o Metodo de Gauss-Seidel (ou Gauss Acelerado) para
% resolver um Sistema de Equacees Algebricas Lineares.

% ULTIMA MODIFICACAO: 18/03/2019



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

% ********************************
% Escolha do metodo de resolucao
% ********************************

% (1) - Metodo de Gauss-Seidel Original
% (2) - Metodo de Gauss-Seidel Acelerado

Met = 1;

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

  % Vetor de Estimativas Iniciais
  x0=[110.0;130.0];
  
  % Criterio de Parada: Tolerancia permitida
  tol=1.e-4; % 0.0001
  
  Inc = "T"; % Nome da Incognita
  Unit = "oC" % Unidade da Incognita;
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

  % Vetor de Estimativas Iniciais
  x0=[60.0;60.0;30.0]; 
  
  % Criterio de Parada: Tolerancia permitida
  tol=1.e-4; % 0.0001
  
  Inc = "T"; % Nome da Incognita
  Unit = "oC" % Unidade da Incognita;
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

  % Vetor de Estimativas Iniciais
  x0=[55.0;38.0;39.0;15.0];
  
  % Criterio de Parada: Tolerancia permitida
  tol=1.e-4; % 0.0001
  
  Inc = "T"; % Nome da Incognita
  Unit = "oC" % Unidade da Incognita;
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

  % Vetor de Estimativas Iniciais
  x0=[85.0;65.0;80.0;75.0;60.0];
  
  % Criterio de Parada: Tolerancia permitida
  tol=1.e-4; % 0.0001
  
  Inc = "T"; % Nome da Incognita
  Unit = "oC" % Unidade da Incognita;

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

  % Vetor de Estimativas Iniciais
  x0=[1.0;0.5;0.25];
  
  % Criterio de Parada: Tolerancia permitida
  tol=1.e-5; % 0.00001
  
  Inc = "Ca"; % Nome da Incognita
  Unit = "gmol/L" % Unidade da Incognita;

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

  % Vetor de Estimativas Iniciais
  x0=[1.5;0.5;1.0; 0.2];
  
  % Criterio de Parada: Tolerancia permitida
  tol=1.e-6; % 0.000001
  
  Inc = "Ca"; % Nome da Incognita
  Unit = "gmol/L" % Unidade da Incognita; 
endif

% Matriz A (coeficientes):
disp('Matriz de Coeficientes:');
A

% Vetor b (termos independentes):
disp('Vetor de Respostas:');
r

% Estimativa inicial:
disp('Vetor de Estimativas Iniciais - x(0):');
x0



if Met == 1
% Chamada da sub-rotina com o metodo de Gauss-Seidel Original
fprintf("Solucao pelo Metodo de Gauss-Seidel Original\n\n");
[XN,x,n]=f_gs(A,r,x0,tol);
endif
if Met == 2
% Chamada da sub-rotina com o metodo de Gauss-Seidel Acelerado
fprintf("Solucao pelo Metodo de Gauss-Seidel Acelerado\n\n");
[XN,x,n]=f_gsa(A,r,x0,tol);
endif

Lx = length(r);

% Respostas intermediarias

if Prob == 1
  fprintf("   n \t %s(1)(%s) \t %s(2)(%s)\n",Inc, Unit, Inc, Unit);
  for i = 1:n
    fprintf('%4d \t %7.3f \t %7.3f\n',i,XN(1,i),XN(2,i));
  endfor 
 % Vetor solucao
  fprintf('\n Resultados finais\n');
  for j = 1:Lx
    fprintf("\n %s(%2d) = %6.3f %s\n",Inc,j,XN(j,n),Unit);
  endfor
 endif   

 if Prob == 2
  fprintf("   n \t% s(1)(%s)\t %s(2)(%s) \t %s(3)(%s)\n",
  Inc, Unit, Inc, Unit, Inc, Unit);
  for i = 1:n
    fprintf('%4d \t %7.3f \t%7.3f \t %7.3f\n',i,XN(1,i),XN(2,i),XN(3,i));
   endfor
% Vetor solucao
  fprintf('\n Resultados finais\n');
  for j = 1:Lx
    fprintf("\n %s(%2d) = %6.3f %s\n",Inc,j,XN(j,n),Unit);
  endfor
 endif           

 if Prob == 3
  fprintf("   n \t %s(1)(%s) \t %s(2)(%s) \t %s(3)(%s) \t %s(4)(%s)\n",
  Inc, Unit, Inc, Unit, Inc, Unit, Inc, Unit);
  for i = 1:n
    fprintf("%4d \t %7.3f \t %7.3f \t%7.3f \t %7.3f\n",
           i,XN(1,i),XN(2,i),XN(3,i), XN(4,i));
  endfor 
% Vetor solucao
  fprintf('\n Resultados finais\n');
  for j = 1:Lx
    fprintf("\n %s(%2d) = %6.3f %s\n",Inc,j,XN(j,n),Unit);
  endfor
endif                     

if Prob == 4
  fprintf("   n \t %s(1)(%s) \t %s(2)(%s) \t %s(3)(%s) \t %s(4)(%s) \t %s(5)(%s)\n",
  Inc, Unit, Inc, Unit, Inc, Unit, Inc, Unit, Inc, Unit);
  for i = 1:n
    fprintf('%4d \t %8.3f \t %8.3f \t %8.3f \t %8.3f \t %8.3f\n',
           i,XN(1,i),XN(2,i),XN(3,i), XN(4,i), XN(5,i));
  endfor
% Vetor solucao
  fprintf('\n Resultados finais\n');
  for j = 1:Lx
    fprintf("\n %s(%2d) = %6.3f %s\n",Inc,j,XN(j,n),Unit);
  endfor
endif  

if Prob == 5
  fprintf("   n \t% s(1)(%s)\t %s(2)(%s) \t %s(3)(%s)\n",
  Inc, Unit, Inc, Unit, Inc, Unit);
  for i = 1:n
    fprintf('%4d \t %7.4f \t%7.4f \t %7.4f\n',i,XN(1,i),XN(2,i),XN(3,i));
   endfor
% Vetor solucao
  fprintf('\n Resultados finais\n');
  for j = 1:Lx
    fprintf("\n %s(%2d) = %6.4f %s\n",Inc,j,XN(j,n),Unit);
  endfor
 endif    

if Prob == 6
  fprintf("   n \t %s(1)(%s) \t %s(2)(%s) \t %s(3)(%s) \t %s(4)(%s)\n",
  Inc, Unit, Inc, Unit, Inc, Unit, Inc, Unit);
  for i = 1:n
    fprintf("%4d \t %7.4f \t %7.4f \t%7.4f \t %7.4f\n",
           i,XN(1,i),XN(2,i),XN(3,i), XN(4,i));
  endfor 
% Vetor solucao
  fprintf('\n Resultados finais\n');
  for j = 1:Lx
    fprintf("\n %s(%2d) = %6.4f %s\n",Inc,j,XN(j,n),Unit);
  endfor
endif                     
 