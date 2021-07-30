% IT 383 - Aula 2
% Prof. Luiz Augusto C. Meleiro

% Uso do comando plot
clear
clc
close all

x=[-10:0.1:10];
y1=x.^3;
y2=x.^3+50*x;
y3=x.^3-25*x+10;
y4=sin(x); 
y5=cos(x);


figure
% plot(var. independente,var. dependente,tipo de curva)
plot(x,y1)
title('Gráficos')
legend('y=x^3')
xlabel('x')
ylabel('y=x^3')

figure
% plot(var. independente,var. dependente,tipo de curva)
plot(x,y4,'b',x,y5,'r-.')
title('Gráficos')
legend('y=sen(x)','y=cos(x)')
xlabel('x')
ylabel('Funções de x')

% Alternativamente, pode-se usar o comando "hold" para traçar mais de uma 
% curva na mesma figura
figure
plot(x,y1,'b')
hold % Para traçar mais de uma curva na mesma figura
plot(x,y2,'r-.')
plot(x,y3,'g--')
title('Gráficos')
legend('y=x^3','y=x^3+50x','y=x^3-25x+10')
xlabel('x')
ylabel('Funções de x')

% Traçando mais de uma curva na mesma figura:
figure
subplot(3,1,1) % (No. Linhas,No. Colunas,Ordem de Plotagem)
plot(x,y1,'b')
xlabel('x')
ylabel('y1=x^3')

subplot(3,1,2)
plot(x,y2,'r')
xlabel('x')
ylabel('y=x^3+50x')

subplot(3,1,3)
plot(x,y3,'g')
xlabel('x')
ylabel('y=x^3-25x+2')


figure
subplot(2,2,1)
plot(x,y1,'b')
xlabel('x')
ylabel('x^3')
subplot(2,2,2)
plot(x,y2,'r')
xlabel('x')
ylabel('x^3+50x')
subplot(2,2,3)
plot(x,y3,'g')
xlabel('x')
ylabel('x^3-25x+2')
subplot(2,2,4)
plot(x,y4,'k')
xlabel('x')
ylabel('seno(x)')








