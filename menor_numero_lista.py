lista = []
n = 0 
#Condicao para criar a lista
while n != 'nao':
#Recebendo a lista:
    n = input('Digite o número desejado para adicionar a lista, caso deseje parar, digite nao:')
    if n != 'nao':
        lista.extend([int(n)])    
    lista

def menor_lista(lista):
    i = 1
    menor = lista[0]
    
    while i < len(lista):
        if menor > lista[i]:
            menor = lista[i]
        i = i + 1

    return menor


