FROM ubuntu

RUN sudo apt-get update
RUN sudo apt-get install -y g++
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y python
RUN sudo apt-get install -y git
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y gnome-core xfce4 firefox #Ver portal web desde firefox
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN sudo apt-get update
RUN sudo apt-get install -y mongodb-org
RUN sudo apt-get install -y firefox
RUN git clone https://github.com/TransparenciaUGR/Proyecto-IV.git
RUN cd Proyecto-IV && npm install
#Solucionando erro en Shippable al intentar conectat con base de datos
Run cd Proyecto-IV && start mongod
RUN cd Proyecto-IV && npm install -g grunt-cli
RUN cd Proyecto-IV && npm install -g mocha
RUN cd Proyecto-IV && npm install mocha chai supertest

#COPY package.json /home/
#EXPOSE 3000
#RUN cd /home; npm install; npm install -g mocha;npm install mocha chai supertest
#CMD ["nohup","/usr/bin/nodejs", "ugr-transparente-servidor/lanzarTransparente.sh"]
