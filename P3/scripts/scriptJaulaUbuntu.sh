#!/bin/bash

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
