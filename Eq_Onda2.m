%DISCRETIZAÇÃO DE 2 ORDEM NO ESPAÇO

clear all;
clc;

Nt = 100;
Np = 101;
x0 = 0.0;
x1 = 1.0;
cfl = 0.01;  %o aumento da precisão diminuiu bastante a estabilidade
c = 1.0;

% Inicializando os vetores
x = zeros(Np);
u0 = zeros(Np);

x = linspace(x0,x1,Np);
u0 = exp(-100*(x-0.1).^2);

%dx = x(2) - x(1);
%dt = 2.0*cfl*dx/c;

for k = 1:Nt
  for i = 3:Np
   u0(i) = u0(i) - cfl*(-3*u0(i) + 4*u0(i-1) - u0(i-2));  
  endfor
  u0(2) = u0(2) - cfl*(u0(2) + u0(1)); %discretização de 1 ordem 
  u0(1) = 0.0;

  plot(x,u0);
  pause(0.5);
endfor


