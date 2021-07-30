lista = []
n = 0 
#Condicao para criar a lista
while n != 'nao':
#Recebendo a lista:
    n = input('Digite o número desejado para adicionar a lista, caso deseje parar, digite nao:')
    if n != 'nao':
        lista.extend([int(n)])    
    lista
def maior_lista(lista):
    i = 1
    maior = lista[0]
    while i < len(lista):
        if maior < lista[i]:
            maior = lista[i]
        i = i+1
    return maior


# Funçao que recebe uma lista

# def maior(a)
