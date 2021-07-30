import numpy as np
import matplotlib.pyplot as plt
import time

#OBS:
#Construir para burgers e condição Rankine - Hugoniot - função por partes com um salto
#Funçao lambda Q -> f(Q)

# Burgers Equation:
# U_y + f(U)_x = 0

# Criando a malha:
nx = 200
x = np.linspace(-4,4,nx)
dx = x[2] - x[1] # definindo o passo delta x

#Calculando os pontos médios de x em cada volume de controle
xmid = np.zeros(nx)
xmid[nx-1] = x[nx -1]
for i in range(0, nx - 1):
    xmid[i] = 0.5*(x[i] + x[i+1])
    
    
#Definindo o passo de tempo com a condição CFL #OBS
CFL = 0.5
dt = CFL*dx
#Definindo o número de passos até o ponto 1.6
t = np.arange(0,1.6 + dt, dt)
nt = len(t)

#Definindo função U0(x) - condição inicial
# e calculando nos pontos médios da malha
# U0(x) = 2        if x < 0
#         1        if 0 <= x < 2
#         0        if x > 2
u0x = np.zeros(nx)

# 1)
for i in range(0, nx-1):
    if xmid[i] >= 0 and xmid[i] < 1:
        u0x[i] = 1
    else:
        u0x[i] = 0

# 2)
#for i in range(0, nx-1):
#    if xmid[i] < 0:
#        u0x[i] = 2
#    if xmid[i] >= 0 and xmid[i] < 2:
#        u0x[i] = 1 
#    if xmid[i] >= 2: 
#        u0x[i] = 0
        
# Criando o vetor para definir f(U):
# f(U) = U^2/2
f_u = np.zeros(nx)

for i in range(0, nx-1):
    f_u[i] = 0.5*(u0x[i]**2)
    
    ####### Definir uma função
    
# Copiando o vetor u0x para plotar o gráfico
u0x_old = np.copy(u0x)
u0x_new = np.zeros(nx)

# Definindo contador
z = 0

# Definindo o loop:
while z <= nt:
    #Definindo f(U):
    for i in range(0, nx-1):
        f_u[i] = 0.5*(u0x_old[i]**2)
    
    # Implementando o método numerico de Lax-Friedrichs
    for k in range(1,nx-1):
        u0x_new[k] = (u0x_old[k-1] + u0x_old[k+1])*(0.5) - (dt/dx)*(0.5)*(f_u[k+1] - f_u[k-1])
        # Condicao de contorno
        # u0x_new[0] = 0
        # u0x_new[n-1] = 0

    #Plotando o grafico
    plt.clf()
    plt.plot(xmid, u0x, xmid ,u0x_old, xmid, u0x_new)
    #plt.plot(xmid, u0x, color="blue", linewidth=1.0, linestyle="-")
    #plt.plot(xmid, u0x_old, color="green", linewidth=1.5, linestyle=":")
    #plt.plot(xmid, u0x_new, color="red", linewidth=2.0, linestyle="-.")
    # Definindo limite do eixo x
    plt.xlim(-1, 4.0)
    plt.xticks(np.arange(-1, 3, 0.5))
    # Definindo limite do eixo y
    plt.ylim(0, 1)
    plt.yticks(np.arange(0, 2.0, 0.5))
    plt.show()
    time.sleep(0.05)
    u0x_old = np.copy(u0x_new)
    # Somando um passo de tempo no contador    
    z +=1
