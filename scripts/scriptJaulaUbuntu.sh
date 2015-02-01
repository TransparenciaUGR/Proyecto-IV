#!/bin/bash
#Scipt desarrollado por @Jesux11 mi contribución desaparecio al realizar modificaciones en las carpetas.

#En primer lugar vamos a crear un sistema, tal y como hemos visto en
#la práctica.

#Creación del sistemas usando debootstrap

sudo apt-get install debootstrap

#Creamos la jaula
sudo debootstrap --arch=i386 saucy /home/jaulas/saucy32/

#Accedemos a la jaula
sudo chroot /home/jaulas/saucy32/

#Montamos el sistema
mount -t proc /proc

#Insaltalamos las herramientas necesarias para ejecutar la aplicación

apt-get install -y git
apt-get install -y wget
apt-get install -y zip
apt-get install -y curl

#Accedemos a nuestro directorio home
cd /home

#Descargamos la apliación
git clone https://github.com/TransparenciaUGR/Proyecto-IV
