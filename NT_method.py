import numpy as np
import matplotlib.pyplot as plt
import time

##Implementacao do método NT para equacao de adveccao
## U_t + f(U)_x = 0

#Criando a malha 
#Definindo número de pontos
nx = 200
x_j = np.linspace(-1, 4, nx)

#Definindo deltax
dx = x_j[2] - x_j[1]

#Definindo o passo de tempo com a condição CFL #OBS
CFL = 0.3

#DeltaT
dt = CFL*dx

#Definindo o número de passos até o ponto 1.5
t = np.arange(0,1.5 + dt, dt)
nt = len(t)

#Definindo lambda = dt/dx:
Lambda = dt/dx

#Definindo a 
a = 2

#Definindo funcao sinal para calculo do MinMod
def f_sgn(b):
    sgn = 0
    if b < 0:
        sgn = -1
    if b > 0:
        sgn = 1
    
    return sgn

#Definindo minimo para calculo do MinMod
#def Min(b,c):
#    menor = b
#    if menor > c:
#        menor = c
#    return menor

#d = min(1,1)
#a = abs(1-2)
#b = f_sgn(min(abs(2-1),abs(1-2)))

#Criando vetor condicao inicial
u0x = np.zeros(nx)

#Criando vetor f(u) e f(u(xj,t+ deltat/2)):
f_u = np.zeros(nx)
f_v = np.zeros(nx)

for i in range(0, nx):
    if x_j[i] >= 0 and x_j[i] < 1:
        u0x[i] = 1
    else:
        u0x[i] = 0

#Definindo f(u)
#for i in range(0, nx):
#    f_u[i] = (u0x[i]**2)/2


#Definindo uma função para chamar a função da EDP no método:
def f_uj(vetor, n): # n = tamanho do vetor
    f_uj = np.zeros(n)
    for i in range(0, n):
        f_uj[i] = (vetor[i]**2)/2 # (vetor[i]**2)/2 a*vetor[i]
    
    return f_uj



f_u = f_uj(u0x, nx)
#Criando a funcao MinMod para 3.13a e 3.14a        
MinMod_x = np.zeros(nx)
MinMod_f = np.zeros(nx)
#for i in range(1, nx-1):
#    MinMod_x[i] = 0.5*(f_sgn(f_u[i+1]-u0x[i]) + f_sgn(u0x[i]-u0x[i-1]))*(min(abs(u0x[i+1]-u0x[i]), abs(u0x[i]-u0x[i-1])))
#    MinMod_f[i] = 0.5*(f_sgn(f_u[i+1]-f_u[i]) + f_sgn(f_u[i]-f_u[i-1]))*(min(abs(f_u[i+1]-f_u[i]), abs(f_u[i]-f_u[i-1])))


#Construção do método NT
u_j = np.zeros(nx)
u_j1 = np.zeros(nx)
f_v = f_uj(u0x - 0.5*Lambda*MinMod_f, nx)

#Contador
t_1 = 0

while t_1 <= nt:
    
    #Criando o vetor u_{j+1/2}:
    for i in range(1,nx-1):
        MinMod_x[i] = 0.5*(f_sgn(f_u[i+1]-u0x[i]) + f_sgn(u0x[i]-u0x[i-1]))*(min(abs(u0x[i+1]-u0x[i]), abs(u0x[i]-u0x[i-1])))
        MinMod_f[i] = 0.5*(f_sgn(f_u[i+1]-f_u[i]) + f_sgn(f_u[i]-f_u[i-1]))*(min(abs(f_u[i+1]-f_u[i]), abs(f_u[i]-f_u[i-1])))
        u_j[i] = 0.5*(u0x[i+1] + u0x[i]) + 0.125*(MinMod_x[i] - MinMod_x[i+1]) - Lambda*0.5*(f_v[i+1] - f_v[i])
    
    
    f_u = f_uj(u_j, nx)
    f_v = f_uj(u_j - 0.5*Lambda*MinMod_f, nx)
    u0x = np.copy(u_j)
    
    #if t_1%2 == 0:
    plt.clf()
    plt.plot(x_j, u_j)
    # Definindo limite do eixo x
    #plt.xlim(-1, 4.0)
    #plt.xticks(np.arange(-1, 4, 0.5))
    # Definindo limite do eixo y
    #plt.ylim(0, 1)
    #plt.yticks(np.arange(0, 2.0, 0.5))
    plt.show()
    time.sleep(0.05)
    
    u0x = np.copy(u_j)
    #Criando o vetor interpolado para a malha original
    for i in range(1,nx-1):
        MinMod_x[i] = 0.5*(f_sgn(f_u[i+1]-u0x[i]) + f_sgn(u0x[i]-u0x[i-1]))*(min(abs(u0x[i+1]-u0x[i]), abs(u0x[i]-u0x[i-1])))
        MinMod_f[i] = 0.5*(f_sgn(f_u[i+1]-f_u[i]) + f_sgn(f_u[i]-f_u[i-1]))*(min(abs(f_u[i+1]-f_u[i]), abs(f_u[i]-f_u[i-1])))
        u_j1[i+1] = 0.5*(u0x[i+1] + u0x[i]) + 0.125*(MinMod_x[i] - MinMod_x[i+1]) - Lambda*0.5*(f_v[i+1] - f_v[i])
    
    f_u = f_uj(u_j1, nx)
    f_v = f_uj(u_j1 - 0.5*Lambda*MinMod_f, nx)
    u0x = np.copy(u_j1)
    
    t_1 +=1