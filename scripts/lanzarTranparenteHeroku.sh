#!/bin/bash

sudo apt-get install -y wget

sudo apt-get install git

wget -q0- https://toolbelt.heroku.com/install-ubuntu.sh | sh

git clone https://github.com/TransparenciaUGR/Proyecto-IV.git

heroku create

git init

git add .

git commit -am "herokuapp"

git push heroku master

git remote -v

heroku open
