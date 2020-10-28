## Universidad Nacional de Colombia
## Diplomado Ciencia de datos
## Reglas de Asociaci√≥n
## Juliana Guerrero

# librerias
library(arules)
library(arulesViz)


# directorio
setwd('C:/Users/Juliana/Desktop/Diplomado/D_2020/Casos/Casos/AssociationRules')


# cargue de datos
compras <-read.csv('compras_mercado.csv', stringsAsFactors = F)
head(compras)

# estructura de datos filas y columnas
print(nrow(compras))
print(ncol(compras))


# items
print(paste('Encontramos en solo esta primer columna',length(unique(compras[,'Product.1'])),'productos dirferentes'))
unique(compras[,'Product.1'])



## transformacion de la tabla para el an√°lisis
trans <- function(){
  lista = list()
  for (i in 1:nrow(compras)) {
    lista[i][1]=as.character(compras[i,1])
    j <- 2
    while(j <= ncol(compras) & compras[i,j] != ""){
        lista[[i]][j]=as.character(compras[i,j])
        if (j < ncol(compras))
          j = j + 1
        else
          break
    } # end while
  } # end i loop
  return(lista)
} # end function



resultado <- trans()
resultado2 <- sapply(resultado, paste, collapse = ",")
resultado2[1:20]


#transacciones
trObj <- as(strsplit(resultado2, ","), "transactions")



# exploracion
summary(trObj)

# histograma 
hist(size(trObj),xlab='numero de Items por compra',main='TamaÒo de canastas')

# compras con solo 1 Item
trObj[size(trObj)==1]
2159*100/9835

# reglas con menos de 10 √?tems
trObj[size(trObj)<10]
8939*100/9835



# reglas de asociacion

association.rules <- apriori(test, parameter = list(supp=0.001,conf=0.5))
inspect(association.rules[1:10])
plot(association.rules)

# reglas ordenadas por confianza 
inspect(head(association.rules, n = 10, by = "confidence"))

i