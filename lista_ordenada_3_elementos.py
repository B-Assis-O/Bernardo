a = int(input("Digite um número: "))
b = int(input("Digite um número: "))
c = int(input("Digite um número: "))

v = [a,b,c]
i = 0
d = 1
maior = v[0]
menor = v[2]

while i < (len(v) - 1):
    if maior > v[i+1]:
        maior = maior 
    else:
        maior = v[i+1]
    if menor > v[2-d]:
        menor = v[2-d]
    else:
        menor = menor
    i = i + 1
    d = d + 1


e = [menor ,0, maior]
if (maior == v[0] and menor == v[2]) or (maior == v[2] and menor == v[0]):
    e[1] = v[1]
elif (maior == v[1] and menor == v[2]) or (maior == v[2] and menor == v[1]):
    e[1] = v[0]
else:
    e[1] = v[2]

print(e)
    


        
