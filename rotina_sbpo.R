#
#   Bernardo de Assis Oliveira 
#   Rotina para pca spbo
#   Anuário estatistico de energia eletrica 2021
##############################################

rm(list=ls(all=TRUE))
setwd("C:/Users/bassi/Documents/)1 IC/SBPO")
dados = read.csv("dados_sbpo.csv",header = T)
estados_dados = dados[1:27,1]
dados = dados[1:27, -1]
View(estados_dados)
# PCA

#Verificando se existe correlação
matcor = cor(dados)
print(matcor, digits = 3) # matriz de correlação

# Teste de Bartlet para verificar a correlação
# Teste de esferecidade de Barttlet

# Hipóteses 
# H0: Variáveis são não correlacionadas, sigma é diagonal;
# Ha: Variáveis são correlacionadas.
require(psych)
cortest.bartlett(matcor, n = 48,diag=TRUE)
cortest.bartlett(matcor, n = 48,diag=TRUE)$p.value
# p-value=~0, logo rejeitamos h0 e concluimos que as variaveis são correlacionadas

#Padronizando as variáveis
dados_padro = scale(dados) # Função scale padroniza os dados
round(apply(dados_padro,2,var),4) 

# Verificando se existe correlação (dados padronizados)
matvar = var(dados_padro) # Matriz covariâncias dos dados padronizados é igual a matriz de correlação
print(matvar, digits = 3)
matcor = cor(dados) # Matriz de correlação
print(matcor, digits = 3)
eigen(matcor)$values # autovalores

#gráficos de dispersão
library(lattice)
x11()
splom(dados, pch = 20, col = "black", xlab = "")

# Análise componentes principais via matriz de correlação amostral
# PCA usando a função prcomp
acpcor = prcomp(dados, scale = TRUE) # scale = true (padroni) 
acpcor
#acpcor = prcomp(dados_padro, scale = FALSE) #Quando os dados estao padronizados
acpcor$sdev  #sqrt of eigenvalues
acpcor$sdev^2 # eigenvalues
summary(acpcor)

sum(acpcor$sdev^2) # Soma dos termos da diagonal da matriz de correlação 

# Screeplot 1
dados = dados
x11()
plot(1:ncol(dados), acpcor$sdev^2, type = "b", xlab = "Componente", ylab = "Variância", pch = 20, cex.axis = 1.3, cex.lab = 1.3)

library(factoextra) #Screeplot 2
x11()
fviz_eig(acpcor)

#Os coeficientes dos componentes principais (os autovetores e1, e2, ..., ep)
#estão armazenados no componente rotation
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
#Interpretação


# Contribuição de cada componente por variável
x11()
fviz_contrib(acpcor,choice = "var", axes = 1)

x11()
fviz_contrib(acpcor,choice = "var", axes = 2)


#As correlações entre os dois primeiros componentes principais e as variáveis são estimadas abaixo.
#O primeiro componente tem correlação forte com todas as variáveis e o segundo
#tem correlação amostral baixa
print(acpcor$sdev[1:3] * t(acpcor$rotation[, 1:3]), digits = 3)

# o primeiro componente principal
escores1 = acpcor$x[, 1]
names(escores1) = estados_dados
ordem = order(escores1, decreasing = TRUE)
x11()
barplot(escores1[ordem], ylab = "Escore do CP1", las = 2)
box()
