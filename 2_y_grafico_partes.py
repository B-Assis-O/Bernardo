import numpy as np
import matplotlib.pyplot as plt


# x1 . voce pode usar linspace -- outra opçãõ.


x1 = np.arange(-1,0.1,0.1)
x2 = np.arange(0,1.1,0.1)
y1 = np.ones(11)
y2 = 2*y1

# voce pode agora concatenar: 
#    (1, 2)   (3, 4)

#concatenar significa:   (1, 2, 3, 4)

x = np.concatenate([x1,x2])
y = np.concatenate([y1, y2])
plt.plot(x, y)
    
#plt.plot(x1,y1,x2,y2)
plt.grid(True)
plt.legend(('y = 1 se x<0',' y= 2 se x>= 0'),loc = 0)

plt.show()


#def avaliaf(x):   # e retorna y
#   n = x.size
#    y = zeros(n)
#    for i in arange(n):
#        y(i) = valor de f em x(i)
#        
#        if (x(i)<0):
#            y(i) = XXXf
#        else:
#            y(i) = YYYY
#    
#    return y


        