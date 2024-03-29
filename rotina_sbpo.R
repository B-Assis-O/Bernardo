#
#   Bernardo de Assis Oliveira 
#   Rotina para pca spbo
#   Anu�rio estatistico de energia eletrica 2021
##############################################

rm(list=ls(all=TRUE))
setwd("C:/Users/bassi/Documents/)1 IC/SBPO")
dados = read.csv("dados_sbpo.csv",header = T)
estados_dados = dados[1:27,1]
dados = dados[1:27, -1]
View(estados_dados)
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


# Contribui��o de cada componente por vari�vel
x11()
fviz_contrib(acpcor,choice = "var", axes = 1)

x11()
fviz_contrib(acpcor,choice = "var", axes = 2)


#As correla��es entre os dois primeiros componentes principais e as vari�veis s�o estimadas abaixo.
#O primeiro componente tem correla��o forte com todas as vari�veis e o segundo
#tem correla��o amostral baixa
print(acpcor$sdev[1:3] * t(acpcor$rotation[, 1:3]), digits = 3)

# o primeiro componente principal
escores1 = acpcor$x[, 1]
names(escores1) = estados_dados
ordem = order(escores1, decreasing = TRUE)
x11()
barplot(escores1[ordem], ylab = "Escore do CP1", las = 2)
box()
