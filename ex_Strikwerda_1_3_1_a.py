import numpy as np
import matplotlib.pyplot as plt
import time 


dx = 1/20 #1/10, 1/20 e 1/40
x = np.arange(-1, 3+dx, dx)
a = 1
nx = len(x)
u0x = np.zeros(nx)
vn = np.zeros(nx)
Lambda = 0.8
dt = Lambda*dx
t = np.arange(0, 2.4+dt, dt)
nt = len(t)

for i in range(0,nx):
    if abs(x[i]) <= 0.5:
        u0x[i] = (np.cos(np.pi*x[i]))**2
    else:
        u0x[i] = 0

vn_old = np.copy(u0x)

j = 0
while j <= nt:
    for k in range(1,nx):
        vn[k] = vn_old[k] - a*Lambda*(vn_old[k] - vn_old[k-1])
        
    plt.clf()
    plt.plot(x,u0x,'r--', x,vn, 'b-')
    plt.ylabel('U (x, t)')
    plt.xlabel('x')
    plt.grid()
    plt.title('Forward-time backward-space scheme')
    plt.show()
    time.sleep(0.1)
    vn_old = np.copy(vn)
    j += 1
    