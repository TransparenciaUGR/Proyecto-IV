#!/bin/bash

# Instalamos debootstrap, programa para crear jaulas
apt-get install debootstrap

# Creamos el repositorio donde se almacenaran las jaula
mkdir /home/jaulas

debootstrap --arch=amd64 trusty /home/jaulas/jaula-iv/ http://archive.ubuntu.com/ubuntu

# Descargamos el script preparar_app.sh para realizar la instalación automática
wget https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/P3/scripts/preparar_app.sh

# Le damos permisos de ejecución
chmod +x preparar_app.sh

# Ejecutamos la jaula usando el script. Una vez hecho esto ya tendremos nuestra aplicación funcionando.
chroot /home/jaulas/jaula-iv/ < script_jaula.sh 
