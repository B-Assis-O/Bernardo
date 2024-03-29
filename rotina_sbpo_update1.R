#
#   Bernardo de Assis Oliveira 
#   Rotina para pca spbo
#   Anu�rio estatistico de energia eletrica 2021
##############################################
#V1 - Consumo de energia el�trica residencial(GWh)
#V2 - Consumo de energia el�trica industrial(GWh)
#V3 - Consumo de energia el�trica comercial(GWh)
#V4 - Consumo de energia el�trica rural(GWh)
#V5 - Consumo de energia el�trica do poder p�blico(GWh)
#V6 - Consumo de energia el�trica de ilumina��o p�blica(GWh)
#V7 - Consumo de energia el�trica do servi�o p�blico(GWh)
#V8 - Consumo de energia el�trica pr�prio(GWh)
#V9 - N�mero de consumidores por unidade
#V10 - Popula��o por mil
#V11 - Tarifa m�dia por regi�o
#

rm(list=ls(all=TRUE))
setwd("C:/Users/bassi/Documents/)1 IC/SBPO")
#setwd("~/R_felipe/Bernardo - IC")
dados1 = read.csv("dados_sbpo.csv",header = T)
names(dados1)[c(2:12)] = c("V1","V2","V3", "V4", "V5", "V6", "V7", "V8","V9","V10","V11")
estados_dados = dados1[1:27,1]
dados = dados1[1:27, -1]
#View(dados)

#names(dados)[c(2:12)] = c("V1","V2","V3", "V4", "V5", "V6", "V7", "V8","V9","V10","V11")
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
s = summary(acpcor)

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
biplot(acpcor,scale = 0, xlab = "CP1", ylab = "CP2",cex.lab = 1.5, cex.axis = 1.5)
# Using scale = 0 choices = 2:3
x11()
biplot(acpcor, scale = 0, xlab = "CP1", ylab = "CP2",cex.lab = 1.5, cex.axis = 1.5)
#abline(h=-0.876, col = "red")
#abline(v=0.4517, col = "blue")

# Contribui��o de cada componente por vari�vel
x11()
fviz_contrib(acpcor,choice = "var", axes = 1)

x11()
fviz_contrib(acpcor,choice = "var", axes = 2)


#As correla��es entre os dois primeiros componentes principais e as vari�veis s�o estimadas abaixo.
#O primeiro componente tem correla��o forte com as vari�veis v1,v2,v3,v4,v5,v6,v7,v9,v10 
#e o segundo componente tem correla��o forte com a variavel v11

print(acpcor$sdev[1:3] * t(acpcor$rotation[, 1:3]), digits = 3)

# o primeiro componente principal representa o tamanho dos pardais
escores1 = acpcor$x[, 1]
names(escores1) = estados_dados
ordem = order(escores1, decreasing = TRUE)
x11()
barplot(escores1[ordem], ylab = "Escore do CP1", las = 2)
box()


# rascunhos factoextra
res.pca <- prcomp(dados,  scale = TRUE)
x11()
#fviz_pca_ind(res.pca)
#fviz_pca_var(res.pca)
#fviz_pca_var(res.pca, geom = c("point", "text"))
#fviz_pca_biplot(res.pca)

# Select the top 5 contributions
#fviz_pca_biplot(res.pca, select.ind = list(contrib = 5))
fviz_contrib(res.pca, choice = 'ind', axes = 1)
#
x11();fviz_pca_ind(acpcor, col.ind = "cos2",
                   gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
                   repel = TRUE # Avoid text overlapping (slow if many points)
)

# Total contribution on PC1 and PC2
x11();fviz_contrib(acpcor, choice = "ind", axes = 1:2)

x11();fviz_pca_biplot(acpcor, repel = TRUE,
                      col.var = "#2E9FDF", # Variables color
                      col.ind = "#696969" # Individuals color
)


library(ggfortify)
x11();autoplot(acpcor)
x11();autoplot(acpcor,loadings = TRUE,loadings.colour = 'blue',
               loadings.label = TRUE, loadings.label.size = 3)
x11();autoplot(acpcor, data = dados1[1:27,], colour = 'Estado',loadings = TRUE,loadings.colour = 'blue',
               loadings.label = TRUE, loadings.label.size = 3)



# Rascunho

# Create groups
pch.group <- c(rep(21, times=16), rep(22, times=14), rep(24, times=3))
col.group <- c(rep("skyblue2", times=16), rep("gold", times=14), rep("green2", times=3))
# Plot individuals
x11();plot(acpcor$x[,1], acpcor$x[,2], xlab=paste("PCA 1 (", round(s$importance[2]*100, 1), "%)", sep = ""), ylab=paste("PCA 2 (", round(s$importance[5]*100, 1), "%)", sep = ""), pch=pch.group, col="black", bg=col.group, cex=2, las=1, asp=1)
# Add grid lines
abline(v=0, lty=2, col="grey50")
abline(h=0, lty=2, col="grey50")
# Add labels
text(acpcor$x[,1], acpcor$x[,2], labels=row.names(acpcor$x), pos=c(1,3,4,2), font=2)
# Get co-ordinates of variables (loadings), and multiply by 10
l.x <- acpcor$rotation[,1]*10
l.y <- acpcor$rotation[,2]*10
# Draw arrows
arrows(x0=0, x1=l.x, y0=0, y1=l.y, col="red", length=0.15, lwd=1.5)
# Label position
l.pos <- l.y # Create a vector of y axis coordinates
lo <- which(l.y < 0) # Get the variables on the bottom half of the plot
hi <- which(l.y > 0) # Get variables on the top half
# Replace values in the vector
l.pos <- replace(l.pos, lo, "1")
l.pos <- replace(l.pos, hi, "3")
# Variable labels
text(l.x, l.y, labels=row.names(acpcor$rotation), col="red", pos=l.pos)
# Add legend
legend("topleft", legend=c("Tislit", "Sidi Ali", "Michliffen"), col="black", pt.bg=c("skyblue2", "gold", "green2"), pch=c(21, 22, 24), pt.cex=1.5)


