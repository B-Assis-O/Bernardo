n = int(input("Digite o primeiro número da sequência: "))
i = 0

while n != 0:
    if n%2 == 0:
        i = i + 1
    n = int(input("Digite o próximo número da sequência(digite 0 se desejar  terminar a sequência): "))
    
print("A sequência tem ", i," números pares")        
