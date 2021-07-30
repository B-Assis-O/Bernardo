import numpy as n
import matplotlib.pyplot as plt

x = n.arange(-1,2.1,0.1)
y = x**3 - 1

plt.plot(x,y,'-')
plt.xlabel('x')
plt.ylabel('x^3 - 1')
plt.grid(True)


plt.legend(('Gráfico de y = x^3 - 1'),loc = 0)

plt.show()