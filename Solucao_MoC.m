clear all;
clc;

Np = 1001;
xL = 0.0;
xR = 10.0;
c = 1;

x = linspace(xL,xR,Np);

% Condicao Inicial
for t = 0:0.1:5
  fi = exp(-50*((x-c*t)-0.5).^2)/2;
  plot(x,fi)
  xlabel("x")
  ylabel("u(x)")
  title("Solucao Equacao da Onda")
  ylim([0 0.6])
  xlim([0 5])
  pause(0.1)
endfor