## Universidad Nacional de Colombia
## Diplomado Ciencia de datos
## Análisis de clusterización - validación
## Juliana Guerrero

# ruta directorio
setwd('C:/Users/Juliana/Desktop/Diplomado/D_2020/Casos/Casos/Cluster_validation') 


# cargue librerias 
library(ggplot2)
library(ggpubr)
library(ggcorrplot)
library(dplyr)
library(factoextra)
library(rgl)
library(cluster)

## Cargue de datos
datos <- read.csv('basketball_19.csv',header=T)

## Exploración de datos
## resumen de los datos
summary(datos)

## visualización de algunas variables
p1 <- ggplot(datos, aes(x=G)) + geom_histogram(color="blue", fill="blue")
p2 <- ggplot(datos, aes(x=W)) + geom_histogram(color="blue", fill="blue")
p3 <- ggplot(datos, aes(x=ADJOE)) + geom_histogram(color="blue", fill="blue")
p4 <- ggplot(datos, aes(x=ADJDE)) + geom_histogram(color="blue", fill="blue")
p5 <- ggplot(datos, aes(x=BARTHAG)) + geom_histogram(color="blue", fill="blue")


ggarrange(p1, p2, p3,p4, p5,ncol = 2, nrow = 3)

## Selección de variables para kmeans
# selección variables numéricas
km_data <- subset(datos, select = -c(TEAM,CONF,POSTSEASON,SEED) )
# selección variables de interés
km <- km_data[,c('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB')]
head(km)

# estandarizar variables 
km_scale <-scale(km)
head(km_scale)


## Gráfico de Agrupamiento jerárquico
# matriz de distancias
mat_dist <- dist(km_scale, method='euclidean') # la función hclust necesita como insumo una matriz de distancias
# dendograma
dend <- hclust(mat_dist,method='ward.D')
plot(dend)

### kmeans con 3, 4 y 5 clusters
set.seed(42)
kmeans_3k <- kmeans(km_scale, centers = 3) #k=3

kmeans_4k <- kmeans(km_scale, centers = 4) # k=4





# comparación suma de cuadrados dentro
# inercia o suma de cuadrados dentro total --> cohesion
kmeans_3k$tot.withinss
kmeans_4k$tot.withinss

# suma de cuadrados entre clusters -->separación
kmeans_3k$betweenss
kmeans_4k$betweenss



# Silhouette
sil3 <- silhouette(kmeans_3k$cluster,dist(km_scale))
plot(sil3, main ="Silhouette plot - K-means 3 clusters")

sil4 <- silhouette(kmeans_4k$cluster,dist(km_scale))
plot(sil4, main ="Silhouette plot - K-means 4 clusters")


# elección de k 
set.seed(123)
# método del codo
fviz_nbclust(km_scale, kmeans, method = "wss")

## ¿Cuál consideran sería el valor óptimo para k según el método del codo

# método de silhouette
fviz_nbclust(km_scale, kmeans, method = "silhouette")

# validacion estructura clusters

# etiquetas de clusters
datos$cluster_3k <- kmeans_3k$cluster
datos$cluster_4k <- kmeans_4k$cluster

# distribución
table(datos$cluster_3k)
barplot(table(datos$cluster_3k),main='Solución de 3 clusters')

table(datos$cluster_4k)
barplot(table(datos$cluster_4k),main='Solución de 4 clusters')


# relación con variables
# 3 clusters
p1 <- ggplot(datos, aes(x=ADJOE, y=BARTHAG)) + geom_point(aes(color = factor(cluster_3k))) +labs(x = "Efic. Ofensiva",y='Prob ganar')
p2 <- ggplot(datos, aes(x=EFG_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster_3k))) +labs(x = "% Tiros efectivos",y='Prob ganar')
ggarrange(p1, p2,ncol = 2, nrow = 1)

# 3d plot
plot3d(datos$ADJOE,datos$BARTHAG,datos$EFG_O,col=datos$cluster_3k,
       xlab='Eficiencia Ofensiva',ylab='Probabilidad de ganar',zlab='Tiros efectivos')


# 4 cluster
p1 <- ggplot(datos, aes(x=ADJOE, y=BARTHAG)) + geom_point(aes(color = factor(cluster_4k))) +labs(x = "Efic. Ofensiva",y='Prob ganar')
p2 <- ggplot(datos, aes(x=EFG_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster_4k))) +labs(x = "% Tiros efectivos",y='Prob ganar')
ggarrange(p1, p2,ncol = 2, nrow = 1)

#3d plot
plot3d(datos$ADJOE,datos$BARTHAG,datos$EFG_O,col=datos$cluster_4k,
       xlab='Eficiencia Ofensiva',ylab='Probabilidad de ganar',zlab='Tiros efectivos')

# comparación correspondencia clusters
table(datos$cluster_3k,datos$cluster_4k)


# por 3 clusters
datos %>%
  group_by(cluster_3k) %>% 
  summarise_at(vars('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB'), mean)  

# total
datos %>%
  summarise_at(vars('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB'), mean)  

# por 4 clusters
datos %>%
  group_by(cluster_4k) %>% 
  summarise_at(vars('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB'), mean)



## ACP y kmeans
## Ajustamos el pca, utilizamos la opcion scale=TRUE
pca <- prcomp(km,scale=TRUE)
summary(pca)

# revisamos los valores propios 
fviz_eig(pca)

# puntos en las nuevas dimensiones
datos$CP1 <- pca$x[,1] 
datos$CP2 <- pca$x[,2] 
datos$CP3 <- pca$x[,3] 

# método del codo
fviz_nbclust(datos[,c('CP1','CP2','CP3')], kmeans, method = "wss")
  
# kmeans  
acp_km <- kmeans(datos[,c('CP1','CP2','CP3')], centers = 4) # k=4  
datos$cluster_acp <- acp_km$cluster

## comparacion
# cohesion
acp_km$tot.withinss
kmeans_4k$tot.withinss

# separacion
acp_km$betweenss
kmeans_4k$betweenss

#silhouette
sil_acp <- silhouette(acp_km$cluster,dist(datos[,c('CP1','CP2','CP3')]))
plot(sil_acp, main ="Silhouette plot - K-means 4 clusters a partir de ACP")

sil4 <- silhouette(kmeans_4k$cluster,dist(km_scale))
plot(sil4, main ="Silhouette plot - K-means 4 clusters")



# tamaños
table(datos$cluster_acp)
barplot(table(datos$cluster_acp),main='Solución desde ACP')
table(datos$cluster_4k,datos$cluster_acp)



# relación con variables
p1 <- ggplot(datos, aes(x=ADJOE, y=BARTHAG)) + geom_point(aes(color = factor(cluster_acp))) +labs(x = "Efic. Ofensiva",y='Prob ganar')
p2 <- ggplot(datos, aes(x=EFG_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster_acp))) +labs(x = "% Tiros efectivos",y='Prob ganar')
ggarrange(p1, p2,ncol = 2, nrow = 1)

plot3d(datos$ADJOE,datos$BARTHAG,datos$EFG_O,col=datos$cluster_acp,
       xlab='Eficiencia Ofensiva',ylab='Probabilidad de ganar',zlab='Tiros efectivos')


