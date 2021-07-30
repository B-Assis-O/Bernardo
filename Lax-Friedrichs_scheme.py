import numpy as np
import matplotlib.pyplot as plt
import time

x = np.linspace(-2,4,71)
n = len(x)
#Adicionar a variavel A
u0x = np.zeros(n)
vn = np.zeros(n)
#vn_old = np.copy(u0x)
j=0
Lambda = 0.8 # dt/dx
for i in range(0,n):
    if abs(x[i]) <= 1:        # Solucao no tempo 1.6 --> abs(x[i] - 1.6)
        u0x[i] = 1 - abs(x[i]) # abs(x[i] - 1.6)
    else:
        u0x[i] = 0


vn_old = np.copy(u0x)

while j <=10:
    for k in range(1,n-1):
        vn[k] = (vn_old[k-1] + vn_old[k+1])*(0.5) - Lambda*(vn_old[k+1] - vn_old[k-1])*(0.5)
        #vn[0] = 0
        #vn[n-1] = 0 

    plt.clf()
    plt.plot(x,u0x,x,vn,x,vn_old)
    plt.show()
    time.sleep(1)
    vn_old = np.copy(vn)
    #vn = np.zeros(n)
    j += 1
    
    
    # Fazer 1.3.1 do strikwerda
    # Fazer 1.6.1 com f = 0