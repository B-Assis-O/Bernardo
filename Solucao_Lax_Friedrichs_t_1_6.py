import numpy as np
import matplotlib.pyplot as plt
import time

dx = 1/40
x = np.arange(-2,4+dx,dx)
nx = len(x)
#Adicionar a variavel A
a = 1
u0x = np.zeros(nx)
u0x_1_6= np.zeros(nx)
vn = np.zeros(nx)
#vn_old = np.copy(u0x)
Lambda = 0.8  # dt/dx
dt = Lambda*dx
t = np.arange(0, 1.6+dt, dt)
nt = len(t)

for i in range(0,nx):
    if abs(x[i]) <= 1:        # Solucao no tempo 1.6 --> abs(x[i] - 1.6)
        u0x[i] = 1 - abs(x[i]) # abs(x[i] - 1.6)
    else:
        u0x[i] = 0

for i in range(0,nx):
    if abs(x[i]- 1.6) <= 1:        # Solucao no tempo 1.6 --> abs(x[i] - 1.6)
        u0x_1_6[i] = 1 - abs(x[i]- 1.6) # abs(x[i] - 1.6)
    else:
        u0x_1_6[i] = 0

vn_old = np.copy(u0x)
j = 0
while j <= nt:
    for k in range(1,nx-1):
        vn[k] = (vn_old[k-1] + vn_old[k+1])*(0.5) - Lambda*(vn_old[k+1] - vn_old[k-1])*(0.5)
        #vn[0] = 0
        #vn[n-1] = 0 

    plt.clf()
    plt.plot(x, u0x_1_6,'b-' ,x , vn, 'r-.')
    plt.grid()
    plt.ylabel('U (x, t)')
    plt.xlabel('x')
    plt.title('Solução de U (x, t) x Solução por esquema de Lax-Friedrichs ambos no tempo 1.6')
    plt.show()
    time.sleep(0.1)
    vn_old = np.copy(vn)
    #vn = np.zeros(n)
    j += 1