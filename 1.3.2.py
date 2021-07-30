import numpy as np
import matplotlib.pyplot as plt
import time 

x = np.linspace(-2,4.1,101)
n = len(x)
u0x = np.empty(n)
u0x[n-1] = 0
a = 1
t = np.arange(0,3.5,0.5)
nt = len(t)
Lambda = 1
vn = np.empty(n)
vn[0] = u0x[n-1]

for j in range(0,nt-1):
    
    for i in range(0,n-1):
        if abs(x[i]- a*t[j]) <= 1:
            u0x[i] = 1 - abs(x[i] - a*t[j])
        else:
            u0x[i] = 0

    for k in range(1,n):
        vn[k] = u0x[k] - Lambda*a*(u0x[k]-u0x[k-1])
        
    plt.clf()
    plt.plot(x,u0x,x,vn)
    plt.title('Backward finite difference scheme',loc = 'center')
    plt.show()
    time.sleep(1)


