#!/bin/bash
#Script de instalación automática de docker.

#En primer lugar actualizamos los repositorios e instalamos docker. Lo hacemos con:

sudo apt-get update
sudo apt-get install -y docker.io

#Es posible que al ejecutar docker nos de un error con el fichero docker.pid. Para ello, tenemos que eliminarlo de la siguiente forma:

sudo rm /var/run/docker.pid

#Ahora sí, ejecutamos docker:

docker -d &

#Instalación de la imagen del contenedor, en este caso hemos elegido ubuntu
docker pull ubuntu

#Entramos en el contenedor e intalamos lo que vamos a necesitar
sudo docker run -i -t ubuntu /bin/sh -c "apt-get install -y wget; "

