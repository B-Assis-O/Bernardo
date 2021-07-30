import numpy as np
import matplotlib.pyplot as plt
import time

x = np.arange(-2,2.1,0.1)
n = len(x)
y = np.zeros(n)
#Mudando o array
for i in np.arange(n):
    if x[i] < 0:
        y[i] = 1

plt.ion()
plt.plot(x,y)
plt.show()

time.sleep(3)

for k in np.arange(5):
    for i in np.arange(n-1,0,-1):
        y[i] = y[i-1]
    y[0] = 1
    
    plt.clf()
    plt.plot(x,y)
    plt.show()
    time.sleep(1)

