ugr-transparente
================

Portal de transaparencia de la [UGR](http://www.ugr.es/) para públicar los datos y hacerlos accesibles y tratables. La aplicación web está diseñada en [node.js](http://nodejs.org/) junto con [express](http://expressjs.com/) y [jade](http://jade-lang.com/). [Express](http://expressjs.com/) es un framwork para desarrollar aplicaciones web mientras que [jade](http://jade-lang.com/) es un modulo para trabajar con plantillas y poder implementar la arquitectura Model Vista Controlador.

La web está publicada en [transparente.ugr.es](http://transparente.ugr.es).

Integrantes del grupo:

Jose Carlos Sánchez Hurtado.<br>
Alberto Mesa Navarro.<br>
Jesus Navarro Guzmán.<br>
Marcos Jiménez Fernández.<br>
Francico Toranzo Santiago.<br>

##¿Qué es Docker?##

Docker es un proyeto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores software, proporcionando una capa adicional de abstracción y automatización de la virtualización a nivel de sistema operativo de Linux. Docker utiliza características de aislamiento de recursos del kernel de Linux, como cgroups.

##¿Por qué usamos Docker?##
+ Es fácil de instalar
+ Es más seguro que otros métodos (para la máquina anfitriona) ya que los usuarios que acceden a la aplicación solo pueden acceder al entorno creado en el contenedor
+ Permite integración continua
+ Podemos basarnos en otro contenedor ya creado para ahorranos trabajo
+ Gracias a que los contenedores quedan publicados en su web, si alguien quiere hacer una colaboración para mejorar nuestro sistema de virtualización, puede hacerlo
+ Estos "tapers" pueden usarse tanto para pruebas como para producción (desde la versión 1 de Docker, ya que las anteriores no eran lo suficientemente maduras)

##Dockerfile##
Para generar este contenedor, creamos el  [Dockerfile](https://github.com/TransparenciaUGR/Proyecto-IV/blob/master/P3/Dockerfile), que es el que toma Docker para generar un contenedor. En él, se indican distintas órdenes que permiten al sistema saber qué queremos que se instale. 

El contenido de dicho fichero:

```shell
FROM ubuntu

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN service mongod start
RUN apt-get install -y nodejs
RUN apt-get install npm git git-core -y
ADD test /home/test
COPY package.json /home/
EXPOSE 3000
RUN cd /home; npm install; npm install -g mocha;npm install mocha chai supertest
CMD ["nohup","/usr/bin/nodejs", "ugr-transparente-servidor/lanzarTransparente.sh"]
```
