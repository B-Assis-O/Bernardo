n = int(input("Digite o número de termos desejado para a sequência de Fibonacci: "))
i = 1
b = 0
c = 1
a = 0
lista_fib = [0,1]
while  i <= (n - 2):
    a = c + b
    b = c
    c = a
    lista_fib.extend([int(a)])
    i = i + 1

print(lista_fib)
    
    

