####
## Universidad Nacional de Colombia
## Diplomado ciencia de datos
## Juliana Guerrero
## Oct 20 2020
## Análisis descriptivo y exploratorio


# librerias
library(ggplot2)
library(dplyr)
library(reshape)

# directorio
setwd('C:/Users/Juliana/Desktop/Diplomado/D_2020/Casos/Casos/EDA/R') 


# cargar datos 
accidentes <- read.csv('accidents.csv',header=T,sep=';')
head(accidentes)

# estructura de datos filas y columnas
print(nrow(accidentes))
print(ncol(accidentes))

# dar formato fecha
accidentes$DATE <-as.Date(accidentes$DATE,'%m/%d/%Y')
# extraer mes-año
accidentes$m_y <- strftime(accidentes$DATE,'%y-%m')


# accidentes por mes
accidentes_mes <- as.data.frame(accidentes %>% count(m_y))
ggplot(accidentes_mes, aes(x=m_y, y=n,group=1)) +
  geom_line()+xlab("Mes")+ylab("Accidentes")


# formato fecha a hora
accidentes$TIME <-strptime(accidentes$TIME,'%H:%M')
# extraer hora
accidentes$HORA <- strftime(accidentes$TIME,'%H')

# accidentes por horas
accidentes_hora <- as.data.frame(accidentes %>% count(HORA))

ggplot(accidentes_hora, aes(x=HORA, y=n,group=1)) +
  geom_bar(stat="identity")+xlab("Hora")+ylab("Accidentes")

# extraer dia de la fecha
accidentes$dia <- weekdays(as.Date(accidentes$DATE,'%m/%d/%Y'))
# accidentes por dia
accidentes_dia <- as.data.frame(accidentes %>% count(dia))

ggplot(accidentes_dia, aes(x=factor(dia,level=c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')),
                           y=n,group=1)) +
  geom_bar(stat="identity")+xlab("Dia")+ylab("Accidentes")


# accidentes por vecindario
vec <- as.data.frame(accidentes %>% count(BOROUGH))
ggplot(vec, aes(x=BOROUGH,y=n,group=1)) +
  geom_bar(stat="identity")+xlab("Vecindario")+ylab("Accidentes")

# cargar datos de los vecindarios
borough_data <- read.csv('borough_data.csv',header=T)
  
# valores de los vecindarios
table(borough_data$borough)
# transformar a mayúsulas y como caracter
borough_data$borough <- as.character(toupper(borough_data$borough))
# reemplazar el valor the bronx por bronx
borough_data$borough[borough_data$borough =='THE BRONX'] <- 'BRONX'

# pegar informacion del vecindario a los accidentes
borough_frame = merge(vec,borough_data,by.x='BOROUGH',by.y='borough')
# calcular accidentes por area
borough_frame$accidentes_por_area = borough_frame$n/borough_frame$area

ggplot(borough_frame, aes(x=BOROUGH,y=accidentes_por_area,group=1)) +
  geom_bar(stat="identity")+xlab("Vecindario")+ylab("Accidentes por area")


# accidentes por hora por vecindario
accidentes_hora_borough <- as.data.frame(accidentes %>% count(BOROUGH,HORA))

mt <- ggplot(accidentes_hora_borough, aes(HORA, n, colour = factor(BOROUGH))) +
  geom_bar(stat="identity")+ylab("Accidentes por area")

mt + facet_grid(vars(BOROUGH), scales = "free")



# transformar columnas de factores como un solo vector
factors_df <- melt(accidentes[,c('CONTRIBUTING.FACTOR.VEHICLE.1','CONTRIBUTING.FACTOR.VEHICLE.2','CONTRIBUTING.FACTOR.VEHICLE.3',
                                 'CONTRIBUTING.FACTOR.VEHICLE.4','CONTRIBUTING.FACTOR.VEHICLE.5','COLLISION_ID')],
                   id='COLLISION_ID')
# eliminar las filas sin factor
factors_df <- factors_df[factors_df$value !='',]
# agrupar por id y factor
no_rep_factors <- as.data.frame(factors_df %>% count(COLLISION_ID,value))

# total accidentes por factor
final_df <- as.data.frame(no_rep_factors %>% count(value))
head(final_df[order(-final_df$n),])



#  transformar columnas de vehiculos como un solo vector
vehicle_df <- melt(accidentes[,c('VEHICLE.TYPE.CODE.1','VEHICLE.TYPE.CODE.2','VEHICLE.TYPE.CODE.3',
                                 'VEHICLE.TYPE.CODE.4','VEHICLE.TYPE.CODE.5','COLLISION_ID')],
                   id='COLLISION_ID')
# eliminar filas sin vehiculo
vehicle_df <- vehicle_df[vehicle_df$value !='',]
# agrupar por id y vehiculo
no_rep_vehicle <- as.data.frame(vehicle_df %>% count(COLLISION_ID,value))
# total accidentes por vehiculo
final_dfv <- as.data.frame(no_rep_vehicle %>% count(value))
head(final_dfv[order(-final_dfv$n),])


# accidentes por factores - vecindario
factors_df <- melt(accidentes[,c('CONTRIBUTING.FACTOR.VEHICLE.1','CONTRIBUTING.FACTOR.VEHICLE.2','CONTRIBUTING.FACTOR.VEHICLE.3',
                                 'CONTRIBUTING.FACTOR.VEHICLE.4','CONTRIBUTING.FACTOR.VEHICLE.5','COLLISION_ID','BOROUGH')],
                   id=c('COLLISION_ID','BOROUGH'))

factors_df <- factors_df[factors_df$value !='',]

no_rep_factors <- as.data.frame(factors_df %>% count(COLLISION_ID,BOROUGH,value))


final_df <- as.data.frame(no_rep_factors %>% count(BOROUGH,value))

head(final_df[order(-final_df$n),])


# accidentes por vehiculo - vecindario
vehicle_df <- melt(accidentes[,c('VEHICLE.TYPE.CODE.1','VEHICLE.TYPE.CODE.2','VEHICLE.TYPE.CODE.3',
                                 'VEHICLE.TYPE.CODE.4','VEHICLE.TYPE.CODE.5','COLLISION_ID','BOROUGH')],
                   id=c('COLLISION_ID','BOROUGH'))
vehicle_df <- vehicle_df[vehicle_df$value !='',]

no_rep_vehicle <- as.data.frame(vehicle_df %>% count(COLLISION_ID,BOROUGH,value))


final_dfv <- as.data.frame(no_rep_vehicle %>% count(BOROUGH,value))
head(final_dfv[order(-final_dfv$n),])
