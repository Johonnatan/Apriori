#Remove objetos da memória do R
rm(list=ls(all=TRUE)) 

#Instala bibliotecas
install.packages('arules') #Biblioteca para utilizar o apriori
install.packages('arulesViz') #Biblioteca para gera o grafo

#Carrega bibliotecas
library(arules)
library(arulesViz)

#Carrega conjunto de dados Groceries na memoria
data(Groceries)

#Visualiza top cinto itens mais frequentes
itemFrequencyPlot(Groceries,top =5)

## Encontrando as regras de associação com o algoritmo Apriori
rule <- apriori(
  Groceries,
  parameter = list(support = 0.01,
                   confidence = 0.20,
                   minlen = 2,
                   maxlen = 2)
)
#cria um scatterplot interativo
plot(rule, method = "scatter", engine = "htmlwidget",max = 300)

#Grafo interativo
plot(rule, method = "graph", engine = "htmlwidget",max = 100)
