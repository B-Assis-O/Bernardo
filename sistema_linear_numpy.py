import numpy as np

#Resolvendo sistemas lineares de equações 

# Duas incognitas:

# 2x + 3y = 5
# x - 2y = 8

A2 = np.array([[2,3],[1,-2]])
B2 = np.array([5,8])

#Soluçao por funcao linalg.solve(A,B)

solucao1 = np.linalg.solve(A2,B2)
x1 = solucao1[0]
y1 = solucao1[1]
print("Solucao do sistema linear com duas incognitas")
print("x=", x1)
print("y=", y1)
# Tres incognitas:
    
#2X+3Y+Z=15

#X-4Y+4Z=8

#-5X+6Y-2Z=10

A3 = np.array([[2,3,1],[1,-4,4],[-5,6,-2]])
B3 = np.array([15,8,10])

solucao3 = np.linalg.solve(A3,B3)

x2 = solucao3[0]
y2 = solucao3[1]
z2 = solucao3[2]
print()
print("Solucao do sistema linear com tres incognitas")
print("x=", x2)
print("y=", y2)
print("z=", z2)


# Para calcular determinante:
    
det_A3 = np.linalg.det(A3)
