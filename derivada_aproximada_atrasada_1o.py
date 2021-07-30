import numpy as np
import matplotlib.pyplot as plt


x_inicial = 0
x_final = 10
n = 10 #n = len(x)
x = np.linspace(x_inicial,x_final,n) #criando uma malha


fx = x**3 #funcao de x
dfx = 3*x**2 #derivada analitica
dfx1 = np.empty(n) #criando um array para a formulação avançada do metodo das diferencas finitas

dx = (x_final - x_inicial)/n #criando o passo

#preenchendo o array da derivada aproximada
for i in range(1,n):
    dfx1[i] = (fx[i]-fx[i-1])/dx

#definindo o ponto no problema de contorno
dfx1[0] = dfx[0]
#plotando e comparando as derivadas

plt.plot(x,dfx,'--k',x,dfx1,'-.b')
plt.legend(['analitica','aproximada'])
plt.grid()
plt.show()    

