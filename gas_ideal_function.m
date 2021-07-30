% IT 383 - Aula 5
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdutório de uso de Sub-Rotinas
% Uso da Equação dos Gases Ideais: PV=nRT

clear
clc
close all

n=100; % Número de moles
V=30; % Volume (m^3)
R=8.314; % Constante dos gases ideais (Nm/mol K)
P=[200,500,750,1000,1500,4500,8000,10000,15000,20000]; % Vetor com vários valores de pressão (Pa)

N=length(P);
for i=1:N
  [T(i)]=f_Tgasideal(P(i),V,n,R); % Chamada da subrotina
%    disp(P(i))
%    disp(T(i))
%    disp('---------------------')
end

figure
plot(P,T)
title('Temperatura de um Gás Ideal em Função da Pressão')
xlabel('P (Pa)')
ylabel('T (K)')
