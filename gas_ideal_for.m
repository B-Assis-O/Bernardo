% IT 383 - Aula 3
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdut�rio de c�lculos simples

% Uso da Equa��o dos Gases Ideais: PV=nRT
clear
clc
close all

n=100; % N�mero de moles
V=30; % Volume (m^3)
R=8.314; % Constante dos gases ideais (Nm/mol K)
P=[200,500,750,1000,1500,4500,8000,10000,15000,20000]; % Vetor com v�rios valores de press�o (Pa)

N=length(P);
for i=1:N
%    disp(P(i))
    T(i)=P(i)*V/(n*R); % Calcula o valor de T e armazena os valores em um vetor
%    disp(T(i))
%    disp('---------------------')
end

figure
plot(P,T)
title('Temperatura de um G�s Ideal em Fun��o da Press�o')
xlabel('P (Pa)')
ylabel('T (K)')
