## Universidad Nacional de Colombia
## Diplomado Ciencia de datos
## Análisis de clusterización
## Juliana Guerrero

# ruta directorio
setwd('C:/Users/Juliana/Desktop/Diplomado/D_2020/Casos/Casos/Clustering/R') 


# cargue librerias 
library(ggplot2)
library(ggpubr)
library(ggcorrplot)
library(dplyr)
library(factoextra)
library(dbscan)

## Cargue de datos
datos <- read.csv('basketball_19.csv',header=T)

## nombres de las columnas 
names(datos)
head(datos)

## dimension de los datos
ncol(datos)
nrow(datos)


## resumen de los datos
summary(datos)

## visualización de algunas variables
p1 <- ggplot(datos, aes(x=G)) + geom_histogram(color="blue", fill="blue")
p2 <- ggplot(datos, aes(x=W)) + geom_histogram(color="blue", fill="blue")
p3 <- ggplot(datos, aes(x=ADJOE)) + geom_histogram(color="blue", fill="blue")
p4 <- ggplot(datos, aes(x=ADJDE)) + geom_histogram(color="blue", fill="blue")
p5 <- ggplot(datos, aes(x=BARTHAG)) + geom_histogram(color="blue", fill="blue")


ggarrange(p1, p2, p3,p4, p5,ncol = 2, nrow = 3)

p1 <- ggplot(datos, aes(x=EFG_O)) + geom_histogram(color="blue", fill="blue")
p2 <- ggplot(datos, aes(x=EFG_D)) + geom_histogram(color="blue", fill="blue")
p3 <- ggplot(datos, aes(x=TOR)) + geom_histogram(color="blue", fill="blue")
p4 <- ggplot(datos, aes(x=TORD)) + geom_histogram(color="blue", fill="blue")
p5 <- ggplot(datos, aes(x=ORB)) + geom_histogram(color="blue", fill="blue")
p6 <- ggplot(datos, aes(x=DRB)) + geom_histogram(color="blue", fill="blue")

ggarrange(p1, p2, p3,p4, p5,p6,
          ncol = 2, nrow = 3)

p1 <- ggplot(datos, aes(x=FTR)) + geom_histogram(color="blue", fill="blue")
p2 <- ggplot(datos, aes(x=FTRD)) + geom_histogram(color="blue", fill="blue")
p3 <- ggplot(datos, aes(x=X2P_O)) + geom_histogram(color="blue", fill="blue")
p4 <- ggplot(datos, aes(x=X2P_D)) + geom_histogram(color="blue", fill="blue")
p5 <- ggplot(datos, aes(x=X3P_O)) + geom_histogram(color="blue", fill="blue")
p6 <- ggplot(datos, aes(x=X3P_D)) + geom_histogram(color="blue", fill="blue")

ggarrange(p1, p2, p3,p4, p5,p6,
          ncol = 2, nrow = 3)

# partidos ganados vs prob de vencer equipo
ggplot(datos, aes(x=BARTHAG, y=W)) + geom_point() +labs(x = "Probabilidad de ganar",y='Partidos ganados')

# relacion de probabilidad de ganar con otras variables 
p1 <- ggplot(datos, aes(x=ADJOE, y=BARTHAG)) + geom_point() +labs(x = "Efic. Ofensiva",y='Prob ganar')
p2 <- ggplot(datos, aes(x=EFG_O, y=BARTHAG)) + geom_point() +labs(x = "% Tiros efectivos",y='Prob ganar')
p3 <- ggplot(datos, aes(x=ORB, y=BARTHAG)) + geom_point() +labs(x = "% rebote ofensivo",y='Prob ganar')
p4 <- ggplot(datos, aes(x=TOR, y=BARTHAG)) + geom_point() +labs(x = "% rotación",y='Prob ganar')
p5 <- ggplot(datos, aes(x=X2P_O, y=BARTHAG)) + geom_point() +labs(x = "% tiros de 2 puntos hechos",y='Prob ganar')
p6 <- ggplot(datos, aes(x=ADJ_T, y=BARTHAG)) + geom_point() +labs(x = "Posesión del balón",y='Prob ganar')

ggarrange(p1, p2, p3,p4, p5,p6,
          ncol = 2, nrow = 3)


# selección variables numéricas
km_data <- subset(datos, select = -c(TEAM,CONF,POSTSEASON,SEED) )

# matriz de correlacion
ggcorrplot(round(cor(km_data),2))


# selección variables de interés
km <- km_data[,c('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB')]
head(km)


# estandarizar variables 
km_scale <-scale(km)
head(km_scale)


### k-means 
set.seed(42)
kmeans <- kmeans(km_scale, centers = 3)
# resultados
names(kmeans)

# inercia o suma de cuadrados dentro total
kmeans$tot.withinss
# centroides
kmeans$centers
# etiquetas de clusters
datos$cluster <- kmeans$cluster

## exploración de clusters
ggplot(datos, aes(x=as.factor(cluster), y=W, fill=cluster)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")


# resumen variables por cluster

datos %>%
  group_by(cluster) %>% 
  summarise_at(vars('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB'), mean)



# relacion de probabilidad de ganar con otras variables 
p1 <- ggplot(datos, aes(x=ADJOE, y=BARTHAG)) + geom_point(aes(color = factor(cluster))) +labs(x = "Efic. Ofensiva",y='Prob ganar')
p2 <- ggplot(datos, aes(x=EFG_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster))) +labs(x = "% Tiros efectivos",y='Prob ganar')
p3 <- ggplot(datos, aes(x=ORB, y=BARTHAG)) + geom_point(aes(color = factor(cluster))) +labs(x = "% rebote ofensivo",y='Prob ganar')
p4 <- ggplot(datos, aes(x=TOR, y=BARTHAG)) + geom_point(aes(color = factor(cluster))) +labs(x = "% rotación",y='Prob ganar')
p5 <- ggplot(datos, aes(x=X2P_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster))) +labs(x = "% tiros de 2 puntos hechos",y='Prob ganar')
p6 <- ggplot(datos, aes(x=ADJ_T, y=BARTHAG)) + geom_point(aes(color = factor(cluster))) +labs(x = "Posesión del balón",y='Prob ganar')

ggarrange(p1, p2, p3,p4, p5,p6,
          ncol = 2, nrow = 3)


### Agrupamiento jerárquico

# matriz de distancias
mat_dist <- dist(km_scale, method='euclidean') # la función hclust necesita como insumo una matriz de distancias

# dendograma
dend <- hclust(mat_dist,method='ward.D')
plot(dend)

# clustering
jer <- cutree(dend,k=3)
#visualizacion de los clusters
plot(dend)
rect.hclust(dend , k = 3, border = 2:6)
abline(h = 3, col = 'red')

# guardar etiqueta de cluster
datos$cluster_j <- jer

# cruce de clusters
table(datos$cluster,datos$cluster_j)


## exploración de clusters
ggplot(datos, aes(x=as.factor(cluster_j), y=W, fill=cluster)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")


# resumen variables por cluster

datos %>%
  group_by(cluster_j) %>% 
  summarise_at(vars('W','ADJOE','BARTHAG','EFG_O','X2P_O','WAB'), mean)


# relacion de probabilidad de ganar con otras variables 
p1 <- ggplot(datos, aes(x=ADJOE, y=BARTHAG)) + geom_point(aes(color = factor(cluster_j))) +labs(x = "Efic. Ofensiva",y='Prob ganar')
p2 <- ggplot(datos, aes(x=EFG_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster_j))) +labs(x = "% Tiros efectivos",y='Prob ganar')
p3 <- ggplot(datos, aes(x=ORB, y=BARTHAG)) + geom_point(aes(color = factor(cluster_j))) +labs(x = "% rebote ofensivo",y='Prob ganar')
p4 <- ggplot(datos, aes(x=TOR, y=BARTHAG)) + geom_point(aes(color = factor(cluster_j))) +labs(x = "% rotación",y='Prob ganar')
p5 <- ggplot(datos, aes(x=X2P_O, y=BARTHAG)) + geom_point(aes(color = factor(cluster_j))) +labs(x = "% tiros de 2 puntos hechos",y='Prob ganar')
p6 <- ggplot(datos, aes(x=ADJ_T, y=BARTHAG)) + geom_point(aes(color = factor(cluster_j))) +labs(x = "Posesión del balón",y='Prob ganar')

ggarrange(p1, p2, p3,p4, p5,p6,
          ncol = 2, nrow = 3)


## DBSCAN
cl<-dbscan(km_scale,eps=0.7,minPts = 10)
datos$cluster_den <- cl$cluster
fviz_cluster(cl, km_scale, stand = FALSE, ellipse = TRUE, geom = "point")
table(datos$cluster_den)
