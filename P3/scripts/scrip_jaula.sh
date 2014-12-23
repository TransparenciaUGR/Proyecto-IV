#!/bin/bash

# Instalar debootstrap, programa para crear jaulas
apt-get install debootstrap

# Crear la jaula
mkdir /home/jaulas

debootstrap --arch=amd64 trusty /home/jaulas/jaula-iv/ http://archive.ubuntu.com/ubuntu

# Descargar el script de instalación automática
wget "-----"

# Le damos permisos de ejecución
chmod +x scrip_jaula.sh

# Ejecutar la jaula usando el script automático de instalación y ejecución
# Cuando el script llegue al final tendremos la aplicación funcionando sin tener que tocar nada

chroot /home/jaulas/jaula-iv/ < scrip_jaula.sh 
