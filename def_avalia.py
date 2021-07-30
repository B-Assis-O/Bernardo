
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(-1,1.1,0.1)

def avalia(x):
    n = len(x)
    y = np.zeros(n)
    for i in np.arange(n):    
      
        if  x[i] < 0:
            y[i] = 1
        else:
            y[i] = 2
            
            
    plt.plot(x,y)
    plt.show()        
    return y

