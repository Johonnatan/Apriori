#Instala bibliotecas necessarias
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
regras <- apriori(
  Groceries,
  parameter = list(support = 0.01,
                   confidence = 0.20,
                   minlen = 2,
                   maxlen = 2)
)
#Scatterplot interativo. Passe o mouse sobre os pontos para visualizar as metricas
plot(regras, method = "scatter", engine = "htmlwidget",max = 300)

#Grafo interativo
plot(regras, method = "graph", engine = "htmlwidget",max = 100)

#Convertendo as regras para data frame
df <- as(regras, "data.frame")
View(df)
