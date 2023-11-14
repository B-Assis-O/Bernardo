#
#   Bernardo de Assis Oliveira 
#   Rotina para factor analysis simpep
#   Anuário estatistico de energia eletrica 2021
##############################################
#V1 - Consumo de energia elétrica residencial(GWh)
#V2 - Consumo de energia elétrica industrial(GWh)
#V3 - Consumo de energia elétrica comercial(GWh)
#V4 - Consumo de energia elétrica rural(GWh)
#V5 - Consumo de energia elétrica do poder público(GWh)
#V6 - Consumo de energia elétrica de iluminação pública(GWh)
#V7 - Consumo de energia elétrica do serviço público(GWh)
#V8 - Consumo de energia elétrica próprio(GWh)
#V9 - Número de consumidores por unidade
#V10 - População por mil
#V11 - Tarifa média por região
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
