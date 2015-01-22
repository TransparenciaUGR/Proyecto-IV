FROM ubuntu

#RUN sudo apt-get install -y g++
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y git
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get install -y nodejs
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN sudo apt-get update
RUN sudo apt-get install -y mongodb-org
RUN sudo apt-get install -y firefox
RUN git clone https://github.com/TransparenciaUGR/Proyecto-IV.git
RUN cd Proyecto-IV/P3
#RUN cd P3
RUN npm install
RUN node app.js
RUN firefox localhost:3000
