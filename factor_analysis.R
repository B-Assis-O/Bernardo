#
#   Bernardo de Assis Oliveira 
#   Rotina para factor analysis simpep
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
#names(dados1)[c(2:12)] = c("V1","V2","V3", "V4", "V5", "V6", "V7", "V8","V9","V10","V11")
#estados_dados = dados1[1:27,1]
dados = dados1[1:27, -1]
row.names(dados) <- dados1[1:27,1]
View(dados)

#install.packages("psych")
require("psych")
#library(GPArotation)
cor_mat <- cor(dados)
FactorLoading <- fa( r = cor_mat, nfactors = 5)
FactorLoading

#x11()
#fa.parallel(cor_mat, fa = "FactorLoading")

#metodo usado no livro Manly e navarro
principal(dados, nfactors = 5, rotate = "varimax")
