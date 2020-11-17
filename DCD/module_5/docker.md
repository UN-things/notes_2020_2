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
## Stop

```
docker ps
docker stop NAME
docker rm CONTAINER ID
```





```
apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

```