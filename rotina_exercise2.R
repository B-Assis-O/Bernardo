#
#   Bernardo de Assis Oliveira 
#   Exerc�cio 2 Cap 6 Multivariada Manly e Navarro
#Considere os dados na Tabela 6.1 sobre o consumo de prote�na( gramas por pessoa por dia)
# em 25 pa�ses(CN)
##############################################

rm(list=ls(all=TRUE))
setwd("C:/Users/bassi/Documents/)1 IC")
#dados = read.csv("dados_european_protein.csv",header = T)
dados = read.csv("^BVSP.csv",header = T)
#dados = read.table(file.choose(),h=T,skip=3)
country_dados = dados[,1]
dados = dados[, -1]

# PCA

#Verificando se existe correla��o
matcor = cor(dados) 
print(matcor, digits = 3) # matriz de correla��o

# Teste de Bartlet para verificar a correla��o
# Teste de esferecidade de Barttlet

# Hip�teses 
# H0: Vari�veis s�o n�o correlacionadas, sigma � diagonal;
# Ha: Vari�veis s�o correlacionadas.
require(psych)
cortest.bartlett(matcor, n = 48,diag=TRUE)
cortest.bartlett(matcor, n = 48,diag=TRUE)$p.value
# p-value=~0, logo rejeitamos h0 e concluimos que as variaveis s�o correlacionadas

#Padronizando as vari�veis
dados_padro = scale(dados) # Fun��o scale padroniza os dados
round(apply(dados_padro,2,var),4) 

# Verificando se existe correla��o (dados padronizados)
matvar = var(dados_padro) # Matriz covari�ncias dos dados padronizados � igual a matriz de correla��o
print(matvar, digits = 3)
matcor = cor(dados) # Matriz de correla��o
print(matcor, digits = 3)
eigen(matcor)$values # autovalores

#gr�ficos de dispers�o
library(lattice)
x11()
splom(dados, pch = 20, col = "black", xlab = "")

# An�lise componentes principais via matriz de correla��o amostral
# PCA usando a fun��o prcomp
acpcor = prcomp(dados, scale = TRUE) # scale = true (padroni) 
acpcor
#acpcor = prcomp(dados_padro, scale = FALSE) #Quando os dados estao padronizados
acpcor$sdev  #sqrt of eigenvalues
acpcor$sdev^2 # eigenvalues
summary(acpcor)

sum(acpcor$sdev^2) # Soma dos termos da diagonal da matriz de correla��o 

# Screeplot 1
dados = dados
x11()
plot(1:ncol(dados), acpcor$sdev^2, type = "b", xlab = "Componente", ylab = "Vari�ncia", pch = 20, cex.axis = 1.3, cex.lab = 1.3)

library(factoextra) #Screeplot 2
x11()
fviz_eig(acpcor)

#Os coeficientes dos componentes principais (os autovetores e1, e2, ..., ep)
#est�o armazenados no componente rotation
names(acpcor)
acpcor$rotation
acpcor$rotation[, 1:2]

x11()
biplot(acpcor, scale = 0, xlab = "CP1", ylab = "CP2",cex.lab = 1.5, cex.axis = 1.5)
# Using scale = 0
x11()
biplot(acpcor, scale = 0, xlab = "CP1", ylab = "CP2",cex.lab = 1.5, cex.axis = 1.5)
abline(h=-0.876, col = "red")
abline(v=0.4517, col = "blue")
#Interpreta��o
# Primeira componente est� relacionada com o tamanho dos pardais
# Segunda componente est� relacionada com a forma dos pardais

# Contribui��o de cada componente por vari�vel
x11()
fviz_contrib(acpcor,choice = "var", axes = 1)

x11()
fviz_contrib(acpcor,choice = "var", axes = 2)


#As correla��es entre os dois primeiros componentes principais e as vari�veis s�o estimadas abaixo.
#O primeiro componente tem correla��o forte com todas as vari�veis e o segundo
#tem correla��o amostral baixa
print(acpcor$sdev[1:3] * t(acpcor$rotation[, 1:3]), digits = 3)

# o primeiro componente principal representa o tamanho dos pardais
escores1 = acpcor$x[, 1]
names(escores1) = iden_pardal
ordem = order(escores1, decreasing = TRUE)
x11()
barplot(escores1[ordem], ylab = "Escore do CP1", las = 2)
box()

