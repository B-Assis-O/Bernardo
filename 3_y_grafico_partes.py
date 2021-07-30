import numpy as n
import matplotlib.pyplot as plt

x1 = n.arange(-1,0,0.01)
x2 = n.arange(0,1,0.01)
y1 = x1**2
y2 = x2**2 - 1 

    
plt.plot(x1,y1,x2,y2)
plt.grid(True)
plt.legend(('y = x^2 se x<0',' y= x^2 - 1 se x>= 0'),loc = 0)

plt.show()