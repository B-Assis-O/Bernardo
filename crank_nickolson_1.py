import numpy as np
import matplotlib.pyplot as plt
import time

dx = 1/40
x = np.arange(-2,6 + dx, dx)
nx = len(x)
a = 1
u0x = np.zeros(nx)
u0x1 = np.zeros(nx)
u0x_16 = np.zeros(nx)
vn = np.zeros(nx)
Lambda = 0.8
teta = Lambda*a*0.25 # a*lambda/4
dt = Lambda*dx
t = np.arange(0,1.6 + dt, dt)
nt = len(t)

n = 0

A = np.eye(nx-2)
B = np.zeros((nx-2,1))

for k in range(0, nx-3):
    A[k, k+1] = teta
    A[k+1, k] = -teta


for i in range(0,nx):
    if abs(x[i]) <= 1:        # Solucao no tempo 1.6 --> abs(x[i] - 1.6)
        u0x[i] = 1 - abs(x[i]) # abs(x[i] - 1.6)
    else:
        u0x[i] = 0
        
for i in range(0,nx):
    if abs(x[i]- 1.6) <= 1:        # Solucao no tempo 1.6 --> abs(x[i] - 1.6)
        u0x_16[i] = 1 - abs(x[i]- 1.6) # abs(x[i] - 1.6)
    else:
        u0x_16[i] = 0
        
u0x1 = np.copy(u0x)

while n <= nt:
    for j in range(1,nx-1):
#   if j == 0:
#       B1[j,0] = -teta*u0x[j+1] + u0x[j]
#   if j == 4:
#       B1[j,0] = u0x[j] + teta*u0x[j-1] 
    
       B[j-1,0] = -teta*u0x[j+1] + u0x[j] + teta*u0x[j-1]


    solucao = np.linalg.solve(A,B)

    for i in range(1,nx-1):
        vn[i] = solucao[i-1]
    
    plt.clf()    
    plt.plot(x, u0x_16, x, u0x, x, vn)
    plt.grid()
    plt.ylabel('U (x, t)')
    plt.xlabel('x')
    plt.title('Solução de U (x, t) x Solução por Método de Crank-Nickolson')
    plt.show()
    time.sleep(0.1)
    
    u0x = np.copy(vn)
    n += 1
              
