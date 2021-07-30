lista = []
n = 0 
#Condicao para criar a lista
while n != 'nao':
#Recebendo a lista:
    n = input('Digite o número desejado para adicionar a lista, caso deseje parar, digite nao:')
    if n != 'nao':
        lista.extend([int(n)])    
    lista


#Definindo funcao para ordenar a lista    
def ordenar_lista(lista):
    i=0 #contador
    #condicao para parar de ordenar 
    while i < len(lista):
        if i==0 or lista[i-1] <= lista[i]:
            i +=1
        else: # Se nao estiver em ordem, este comando serve para "voltar" um passo na lista e refazer o loop
            lista[i], lista[i-1] =  lista[i-1], lista[i]
            i -=1

    return lista
