% IT 383 - Aula 3
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdutório de cálculos simples

% Uso da Equação dos Gases Ideais: PV=nRT
clear
clc
close all

n=100; % Número de moles
V=30; % Volume (m^3)
R=8.314; % Constante dos gases ideais (Nm/mol K)
P=100; % Pressão do sistema (Pa)
T=10; % K

while P<=20000
    T=T+10;
    P=n*R*T/V;
%    [T,P]
    T
    P
end
