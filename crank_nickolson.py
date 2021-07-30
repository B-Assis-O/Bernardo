# -*- coding: utf-8 -*-
"""
Created on Wed Jul 22 10:24:56 2020

@author: bassi
"""

# Crank Nickolson
# v0 = 0 e v6 = 0
# ex 1.4.2 e ex 1.4.1 e usar o mesmo pensamento para obter BS e CS
# Observar a consistencia do metodo

# FAzer relatorio a partir ddo que estiver fazendo

import numpy as np
import matplotlib.pyplot as plt
import time

x = np.arange(0,3.5,0.5)
u0x = np.array([0,0.2,0.4,0.5,0.4,0.2,0])
Lambda = 0.5
a = 1
teta = Lambda*a*0.25 # a*lambda/4
vn = np.zeros(7)
A1 = np.eye(5)
B1 = np.zeros((5,1))
n = 1
#B2 = np.array([[-teta*u0x[2]+ u0x[1]],
#              [-teta*u0x[3] + u0x[2] + teta*u0x[1]],
#              [-teta*u0x[4] + u0x[3] + teta*u0x[2]],   
#              [-teta*u0x[5] + u0x[4] + teta*u0x[3]],
#              [ u0x[5] + teta*u0x[4]] ])

for k in range(0,4):
    A1[k, k+1] = teta
    A1[k+1, k] = -teta


while n <= 5:
    for j in range(1,6):
#   if j == 0:
#       B1[j,0] = -teta*u0x[j+1] + u0x[j]
#   if j == 4:
#       B1[j,0] = u0x[j] + teta*u0x[j-1] 
    
       B1[j-1,0] = -teta*u0x[j+1] + u0x[j] + teta*u0x[j-1]


    solucao1 = np.linalg.solve(A1,B1)

    for i in range(1,6):
        vn[i] = solucao1[i-1]
    
    plt.clf()    
    plt.plot(x, u0x, x, vn)
    plt.grid()
    plt.ylabel('U (x, t)')
    plt.xlabel('x')
    plt.title('Solução de U (x, t) x Solução por Método de Crank-Nickolson')
    plt.show()
    time.sleep(1)
    
    u0x = np.copy(vn)
    n += 1

    