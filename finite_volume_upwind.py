import numpy as np
import matplotlib.pyplot as plt
import time

#Definindo o número de pontos e criando a malha
nx = 200
x = np.linspace(-1,3,nx)
dx = x[2] - x[1] # definindo o passo delta x

#Calculando os pontos médios de x em cada volume de controle
xmid = np.zeros(nx)
xmid[nx-1] = x[nx -1]
for i in range(0, nx - 1):
    xmid[i] = 0.5*(x[i] + x[i+1])

#Definindo velocidade
a = 1

#Definindo o passo de tempo com a condição CFL
CFL = 0.5
dt = CFL*dx/a
#Definindo o número de passos até o ponto 1.6
# 1) 
t = np.arange(0,1.6 + dt, dt)
nt = len(t)/a

# 2) 
#t = np.arange(0,2.4 + dt, dt)
#nt = len(t)/a


#Definindo função U0(x) - condição inicial
# e calculando nos pontos médios da malha
# U0(x) = 1 - abs(x) if x <= 1
#         0          if x >= 1
u0x = np.zeros(nx)

# 1)
#for j in range(0, nx - 1):
#    if abs(xmid[j])<= 1:
#        u0x[j] = 1 - abs(xmid[j])
#    else:
#        u0x[j] = 0

# 2)
for j in range(0, nx - 1):
    if abs(xmid[j])<= 0.5:
        u0x[j] = (np.cos(np.pi*xmid[j]))**2
    else:
        u0x[j] = 0

# Copiando o vetor u0x para plotar o gráfico
u0x_old = np.copy(u0x)
u0x_new = np.zeros(nx)

# Definindo contador
z = 0 

# Montando o loop
while z <= nt:
    # Implementando o método numerico Upwind
    if a > 0:
        for k in range(1,nx-1):
            u0x_new[k] = u0x_old[k] - (CFL)*(u0x_old[k] - u0x_old[k-1])
    else:
        for k in range(1,nx-1):
            u0x_new[k] = u0x_old[k] - CFL*(u0x_old[k+1] - u0x_old[k])   
        # Condicao de contorno
        # u0x_new[0] = 0
        # u0x_new[n-1] = 0
    
    #Plotando o grafico
    plt.clf()
    plt.plot(xmid, u0x, xmid, u0x_new, xmid, u0x_old)
    plt.show()
    time.sleep(0.05)
    u0x_old = np.copy(u0x_new)
    # Somando um passo de tempo no contador    
    z += 1



