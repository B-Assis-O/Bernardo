import numpy as np
import matplotlib.pyplot as plt


x_inicial = 0
x_final = 10
n = 50 #n = len(x)
x = np.linspace(x_inicial,x_final,n) #criando uma malha


fx = x**2 #funcao de x
dfx = 2*x #derivada analitica
dfx1 = np.empty(n) #criando um array para a formulação avançada do metodo das diferencas finitas

dx = (x_final - x_inicial)/n #criando o passo

#preenchendo o array da derivada aproximada
for i in range(0, n-1):
    dfx1[i] = (fx[i+1]-fx[i])/dx

#definindo o ponto no problema de contorno
dfx1[n-1] = dfx[n-1]
#plotando e comparando as derivadas

plt.plot(x,dfx,'--k',x,dfx1,'-.b')
plt.legend(['analitica','aproximada'])
plt.grid()
plt.show()    
