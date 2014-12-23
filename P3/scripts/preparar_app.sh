#!/bin/bash

# Script para preparar el entorno y ejecutar la app
# Instalamos dependencias
# Bajamos repo
# Ejecutamos

apt-get install -y curl
apt-get install -y wget
apt-get install -y zip
apt-get install -y git

git clone https://github.com/TransparenciaUGR/Proyecto-IV

cd Proyecto-IV
git pull
cd P3

chmod +x run.sh
sh run.sh
