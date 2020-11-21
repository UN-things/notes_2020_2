# Docker

[Documentación](https://docs.docker.com/get-started/)

## Es necesario usar?

### Python

```
import keras
model = keras.Sequential()
```

### R

```
library(keras)
install_keras()
model <- keras_model_sequential()
```
## Instalación

[Descargar](https://www.docker.com/products/docker-desktop)

```
docker pull monitarb/rstudio_keras_lab
docker image ls
```

## Ejecutar contenedor

```
docker run -d -p 8787:8787 -d -e ROOT:TRUE -e PASSWORD=admin123 monitarb/rstudio_keras_lab
```
## Detener contenedor

```
docker ps
docker stop NAME
docker rm CONTAINER ID
```