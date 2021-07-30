import numpy as np
import matplotlib.pyplot as plt
import time 

x = np.linspace(-2,4.1,1000)
n = len(x)
u0x = np.empty(n)
u0x[n-1] = 0
a = 1
t = np.arange(0,3.5,0.5)
nt = len(t)
Lambda = 1
vn = np.empty(n)
vn[n-1] = u0x[n-1]
vn[0] = 0


for j in range(0,nt-1):
    
    for i in range(0,n-1):
        if abs(x[i]- a*t[j]) <= 1:
            u0x[i] = 1 - abs(x[i] - a*t[j])
        else:
            u0x[i] = 0

    #for k in range(1,n-1):
     #   vn[k] = uox[k-1] - Lambda*a*(u0x[k+1]-u0x[k-1])
    
    plt.clf()
    plt.plot(x,u0x,x,vn)
    plt.title('Leapfrog scheme',loc = 'center')
    plt.show()
    time.sleep(1)


