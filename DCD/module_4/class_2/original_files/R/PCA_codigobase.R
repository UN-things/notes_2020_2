## Universidad Nacional de Colombia
## Diplomado Ciencia de datos
## Análisis de componentes principales
## Juliana Guerrero

# ruta directorio
setwd('C:/Users/Juliana/Desktop/Diplomado/D_2020/Casos/PCA/R') 


# cargue librerias 
library(factoextra)
library(ggcorrplot)

## Cargue de datos
data <- read.csv('houses_to_rent_v2.csv',header=T,encoding='latin')
head(data)

## Pre procesamiento y limpieza
# modificar valor - por 0 
class(data$floor)
levels(data$floor)[1]<-0 # modificar - por el 0 como ground floor
data$floor <- as.numeric(as.character(data$floor))

## Seleccionamos Sao Paulo para el análisis, dejamos por fuera animal y furnished
# filtrar columnas y filas para analisis
data_acp <- data[data$city=='SÃ£o Paulo',c('area','rooms','bathroom','parking.spaces','floor','hoa','rent','property_tax',
                                           'fire_insurance','total')]

# resumen datos
summary(data_acp)

# matriz de correlacion
ggcorrplot(round(cor(data_acp),2))

# variables de analisis acp
data_acp = data_acp[,c('area','rooms','bathroom','parking.spaces','floor','hoa','rent')]


## estandarización de variables
# calculamos la media de la variable
media_renta <- mean(data_acp$rent)
# Calculamos la desviación estándar
ds_renta <- sd(data_acp$rent)
# a cada valor restamos la media y dividimos por la desviación estándar
data_acp$renta_std1 <- (data_acp$rent - media_renta)/(ds_renta)
# Revisemos el resultado
head(data_acp[,c('rent','renta_std1')])
summary(data_acp[,c('rent','renta_std1')])


data_acp$renta_std2 <- scale(data_acp$rent)
head(data_acp[,c('rent','renta_std1','renta_std2')])
summary(data_acp[,c('rent','renta_std1','renta_std2')])


# omitimos las dos ultimas creadas
data_acp <- data_acp[,c('area','rooms','bathroom','parking.spaces','floor','hoa','rent')]


## Ajustamos el pca, utulizamos la opcion scale=TRUE
pca_renta <- prcomp(data_acp,scale=TRUE)
summary(pca_renta)

# nombres del objeto
names(pca_renta)

pca_renta$center
pca_renta$sdev
# componentes
pca_renta$rotation
# puntos en las nuevas dimensiones
head(pca_renta$x)

# revisamos los valores propios 
fviz_eig(pca_renta)

# biplot componentes 1 y 2 
fviz_pca_var(pca_renta,axes = c(1, 2),
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

# biplot componentes 1 y 3 
fviz_pca_var(pca_renta,axes = c(1, 3),
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)


# biplot con las primeras 150 observaciones
fviz_pca_ind(pca_renta, select.ind = list(name = rownames(data_acp)[1:120]),col.ind = 'steelblue',geom='point')

