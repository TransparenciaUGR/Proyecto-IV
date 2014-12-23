#!/bin/bash

# Script para preparar el entorno y ejecutar la app
# Instalamos dependencias
# Bajamos repo
# Ejecutamos

apt-get install -y curl
apt-get install -y wget
apt-get install -y zip
apt-get install -y git

#Puede darse el caso de que el repositorio ya esté clonado. Para no tener que realizar la clonación en cada paso podemos hacer
#un simple if que comprueba si la carpeta de clonación ha sido creada.
if [ ! -d Proyecto-IV ]; then
	git clone https://github.com/TransparenciaUGR/Proyecto-IV
fi

cd Proyecto-IV
git pull
cd P3

chmod +x run.sh
sh run.sh
