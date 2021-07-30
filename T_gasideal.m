% IT 383 - Aula 2
% Prof. Luiz Augusto C. Meleiro
% Exemplo introdut�rio de c�lculos simples

% Uso da Equa��o dos Gases Ideais: PV=nRT
clear
clc

P=20000; % Pa
n=100; % Moles
V=30; % m^3
R=8.314; % Nm/mol K

T=P*V/(n*R);
 
disp('A temperatura (K) �: ')
disp(T)
