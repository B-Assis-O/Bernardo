#############################
# Bernardo de Assis Oliveira
# exercicio pcr

#install.packages("pls")
library(pls)

#Dataset
rm(list=ls(all=TRUE))
setwd("C:/Users/bassi/Documents/)1 IC")
dados = read.csv("dados_european_protein.csv",header = T)
#dados = read.table(file.choose(),h=T,skip=3)
country_dados = dados[,1]
dados = dados[, -1]
View(dados)


head(dados)
set.seed(1)
#escolhendo o numero de componentes -> 4 componentes white.meat, fish, milk, fruit and vegetables
model <- pcr(Total ~ White.Meat+Milk+Fish+Fruit.and.vegetables, data=dados, scale=TRUE, validation="CV")
summary(model)

validationplot(model)
validationplot(model, val.type="MSEP")
validationplot(model, val.type="R2")

train <- dados[1:12, c("Total", "White.Meat", "Milk", "Fish", "Fruit.and.vegetables")]
y_test <- dados[12:nrow(dados), c("Total")]
test <- dados[12:nrow(dados), c("Total", "White.Meat", "Milk", "Fish", "Fruit.and.vegetables")]

model <- pcr(Total ~ White.Meat+Milk+Fish+Fruit.and.vegetables, data=dados, scale=TRUE, validation="CV")
pcr_pred <- predict(model, test, ncomp=2)

sqrt(mean((pcr_pred - y_test)^2))
