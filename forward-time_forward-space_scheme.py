import numpy as np
import matplotlib.pyplot as plt
import time

x = np.linspace(-2,4,101)
n = len(x)
u0x = np.empty(n)
vn = np.empty(n)
vn_old = u0x
j=0
Lambda = 0.5
for i in range(0,n):
    if abs(x[i]) <= 1:
        u0x[i] = 1 - abs(x[i])
    else:
        u0x[i] = 0


while j <= 8:
    for k in range(0,n-1):
        vn[k] = vn_old[k] - Lambda*(vn_old[k+1] - vn_old[k])
        vn[0] = 0
        vn[n-1] = 0
        
    
    plt.clf()
    plt.plot(x,u0x,x,vn,x,vn_old)
    plt.show()
    time.sleep(1)
    vn_old = vn
    vn = np.zeros(n)
    j += 1