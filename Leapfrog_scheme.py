import numpy as np
import matplotlib.pyplot as plt
import time

x = np.linspace(-2,4,101)
n = len(x)
u0x = np.empty(n)
vn = np.empty(n)
vn_old = np.empty(n)
j=0
Lambda = 0.8
u0x_old = np.empty(n)
for i in range(0,n):
    if abs(x[i]) <= 1:
        u0x[i] = 1 - abs(x[i])
    else:
        u0x[i] = 0

u0x_old =np.copy(u0x)

for k in range(1,n-1):
    vn_old[k] = u0x[k-1]
    vn_old[0] = 0
    vn_old[n-1] = 0
    
    
while j <= 15:
    for k in range(1,n-1):
        vn[k] = u0x[k] - Lambda*(vn_old[k+1] - vn_old[k-1])
        vn[0] = 0
        vn[n-1] = 0
        
    
    plt.clf()
    plt.plot(x,u0x_old,x,vn,x,vn_old)
    plt.show()
    time.sleep(1)
    u0x = np.copy(vn_old)
    vn_old = np.copy(vn)
    j += 1
