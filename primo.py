n = int(input("Digite um número inteiro maior que zero: "))

isprime = True
i = 2
while i < n and isprime:
    # Verifica se o resto da divisao eh zero, ou seja, se eh exata
    if (n%i) == 0:
        isprime = False
    i = i + 1

if n != 1 and not isprime:
    print("Não é número primo")
else:
    print("É número primo")
