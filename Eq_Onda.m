%DISCRETIZAÇÃO DE 1 ORDEM
clear all;
clc;

Nt = 100;
Np = 101;
x0 = 0.0;
x1 = 1.0;
cfl = 0.8;
c = 1.0;

% Inicializando os vetores
x = zeros(Np);
u0 = zeros(Np);

x = linspace(x0,x1,Np);
u0 = exp(-100*(x-0.1).^2);

%dx = x(2) - x(1);
%dt = cfl*dx/c;

for k = 1:Nt
  for i = 2:Np
   u0(i) = u0(i) - cfl*(u0(i) - u0(i-1));  
  endfor
  u0(1) = 0.0;

  plot(x,u0);
  pause(0.5);
endfor



