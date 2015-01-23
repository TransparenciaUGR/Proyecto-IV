ugr-transparente
================

Repositorio para el proyecto de la asignatura "Infraestructuras Virtuales"

Proyecto elegido: Infraestructura virtual para transparencia.
[Link de progreso provisional:](https://transparente-ugr.herokuapp.com/) en cada ejecución muestra 2 caras aleatorias por pantalla.

Creación de infraestructura virtual para transparencia.ugr.es, con creación de tests para el código, integración continua, descripción de configuración mediante Chef o Ansible y configuración del despliegue automático del mismo en cualquier servicio.

Portal de transaparencia de la [UGR](http://www.ugr.es/) para públicar los datos y hacerlos accesibles y tratables. La aplicación web está diseñada en [node.js](http://nodejs.org/) junto con [express](http://expressjs.com/) y [jade](http://jade-lang.com/). [Express](http://expressjs.com/) es un framwork para desarrollar aplicaciones web mientras que [jade](http://jade-lang.com/) es un modulo para trabajar con plantillas y poder implementar la arquitectura Model Vista Controlador.

La web está publicada en [transparente.ugr.es](http://transparente.ugr.es).

Integrantes del grupo:

Jose Carlos Sánchez Hurtado.<br>
Alberto Mesa Navarro.<br>
Jesus Navarro Guzmán.<br>
Marcos Jiménez Fernández.<br>
Francico Toranzo Santiago.<br>

##¿Qué es Heroku?##
Es un servicio de Hosting en la nube. Esto ayuda a que los clientes no tienen que contar con infraestructura, el tiempo de procesamiento y almacenamiento, si no que todo esto se le renta a un tercero. Es un servicio gratuito hasta los 5 MB de espacio para base de datos y 50 MB para los archivos incluyendo repositorios Git. Es un servicio basado en la nube de Amazon Web Services. La implementación de este servicio se hace a través de GIT y se instala a través de un gem.

Las ventajas que nos ofrece usar Heroku es que podemos olvidarnos de usar servidores, pudiendo enfocarnos en la aplicación que queremos desplegar, y es gratuita en cierto modo, puesto que sí se sobrepasan los límites anteriormente mencionados se empezará a pagar una cuota. Heroku puede trabajar con con MySQL, SQLite, PostgreSQL, MongoDB, CouchDB y Memcache a través de un tercero Mongo HQ y Cloudant añadidos como add-ons.

Para el caso de nuestra aplicación para trasnparente ugr, utilizaremos la base de datos MongoDB aunque aún no está implementada en la aplicación de ejemplo. Ya que para poder añadirla nos pide la verificación de cuenta con la tarjeta de crédito y tenemos dudas sobre ello.

##¿Qué es transparenteUGR?##
<b>transparente.ugr</b> es un portal web dedicado a ofrecer información a la sociedad y en particular a la Comunidad Universitaria, teniendo como objetivo el libre acceso y veracidad de esa información.

Este portal es algo más que un simple tablón de información. Es un conjunto de herramientas accesibles, simples de utilizar e inteligibles y que sean útiles para todos aquellos procesos relacionados con la transparencia y con la demanda de información por parte de los ciudadanos.

Su funcionalidad de podría dividir en:

<b>Administración:</b> todas las cuestiones relacionadas con <i>Personal</i>, <i>Información Económica</i> como presupuestos, auditorías, etc, y toda clase de <i>Servicios</i> tanto de la universidad como de empleo.

<b>Docencia:</b> con amplia información de oferta y demanda académica, el claustro de profesores y estudiantes.

<b>Gestión e investigación:</b> información relacionada con la <i>Misión de la universidad</i>, <i>Plan estratégico</i> para hacer operativa dicha misión, composición del gobierno y estatutos de la universidad, etc.

Y un apartado que incluye la Normativa Legal que rige en la Ley de transparencia, normativas y convenios.

##MongoDB##
En este apartado vamos a indicar como crear y usar una base de datos para nuestro proyecto usando <b>MongoDB</b>.

Lo primero que habrá que hacer será crear una base de datos. Para ello, vamos a crear un modelo en un archivo con extensión .js que incluya la información de dicha base de datos. Un ejemplo de este archivo seria:

```sh var mongoose = require('mongoose'), Sch = mongoose.Sch;

var showSch = new Sch({ title: { type: String }, year: { type: Number }, country: { type: String }, 
});

module.exports = mongoose.model('Show', showSch); ```

Con esto ya podríamos implementar la conexión a la BD en el archivo app.js de nuestro proyecto, añadiendole las siguientes lineas:

sh var mongoose = require('mongoose'); mongoose.connect('mongodb://localhost/shows');

Para que esto funcione en nuestro entorno local, necesitamos tener instalado MongoDB. Dependiendo de vuestro sistema operativo se hace de una forma u otra. [Aquí podemos encontrar la documentación oficial](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/). Si tenemos un Mac, se instala de la misma manera que Node.js con <b>brief update</b> y <b>brief install mongodb.</b>

Una vez hecho esto, para poder iniciar MongoDB se debe ejecutar en otra terminal mongod. Con Mongo arrancado ya podemos ejecutar la aplicación con <b>node app.js</b> desde la terminal.

Ahora desde otra terminal, podemos entrar al shell de MongoDB y comprobar que la base de datos se ha creado correctamente. Para ello ejecutamos el comando <b>mongo</b>:

```sh $ mongo MongoDB shell version: 2.4.1 connecting to: test

use shows switched to db shows show dbs local 0.078125GB shows (empty) ```

Una vez introducida información en la BD, tenemos que unir las funciones para el manejo de la información que usa mongoDB al proyecto, indicando <b>app.get("funcion");</b> siendo "funcion" la función correspondiente de introducir, modificar o eliminar información.

Para terminar, enlazamos el módulo al archivo principal de la aplicación app.js:

sh routes = require('./routes/shows')(app);

##Aplicación básica inicial (transparencia - node.js)##
Despliegue inicial en node.js con BD postgresql para realizar nuestras primeras pruebas iniciales. Otra información:

Plantilla de aplicación en Node.js usando [Express 4](http://expressjs.com/).

La aplicación se ha creado apoyada por el siguiente artículo: [Empezando a usar Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction).

##Ejecución Local:##
Se necesita instalar [Node.js](http://nodejs.org/) y las herramientas asociadas de Heroku: [Heroku Toolbelt:](https://toolbelt.heroku.com/)

sh $ git clone git@github.com:heroku/node-js-getting-started.git # o clonar fork propio $ cd node-js-getting-started $ npm install $ npm start Nota: el nombre node-js-getting-started.git variará.

Una vez realizada la ejecución local, la aplicación puede verse en [localhost:3000.](http://localhost:3000/)

##Despliegue en Heroku:##
Vamos a realizar el despliegue de la aplicación una vez testeado un despligue de una aplicación básica en Heroku. Para ello, lo primero que tenemos que hacer es clonar el repositorio que vamos a desplegar a nuestra máquina. Lo hacemos así:

git clone https://github.com/TransparenciaUGR/Proyecto-IV.git

El repositorio se descargará a nuestra máquina. Ahora nos movemos a esta carpeta:

cd Proyecto-IV

Es necesario instalar Heroku en Ubuntu, por ello, lo hacemos con el siguiente comando:

wget https://toolbelt.heroku.com/install-ubuntu.sh | sh chmod 777 install-ubuntu.sh ./install-ubuntu Podemos ver que lo tenemos instalado con: heroku --version En mi caso:<br> <img src="http://i60.tinypic.com/2hhkdpg.png"></img>

Hecho esto, tenemos que crearnos una cuenta en Heroku porque la necesitaremos para desplegar el proyecto. Hecho esto, entramos a Heroku en Ubuntu haciendo: heroku login Y seguidamente introducimos nuestros credenciales: <img src="http://i60.tinypic.com/25qysye.png"></img>

Ahora, dentro de la carpeta de nuestro proyecto, hacemos lo siguiente: heroku create E inicializamos nuestro proyecto: git init Seguidamente escribimos lo siguiente: git add . git commit -am “desp” git push heroku master git remote -v heroku open Al escribir heroku open se nos abrirá el proyecto desplegado en un navegador. Este es el resultado: <img src="http://i61.tinypic.com/33xbm93.png"></img>

##Test de carga con Apache-Benchmark:##
Lo que vamos a hacer ahora es comprobar el rendimiento del proyecto haciendo uso de Apache-Benchmark. Con el proyecto desplegado en Heroku, vamos a comprobar cómo responde la página web al realizar diversos tests de carga. Posteriormente se realizará un test similar pero con el proyecto desplegado en OpenShift:

Si no tenemos instalado Apache-Benchmark escribimos lo siguiente:

sudo apt-get install apache2-utils En nuestro caso, vamos a realizar el test haciendo 200 peticiones con un nivel de concurrencia de 5. En la terminal escribimos:

ab -n200 -c5 https://mighty-taiga-8049.herokuapp.com/ Y estos son los resultados:<br> <img src="http://i60.tinypic.com/nxv1om.png"></img>

Los datos más relevantes son:

<strong>Peticiones por segundo:</strong> Son las peticiones por segundo atendidas durante la prueba. En nuestro caso ha sido de 6.52 por segundo.<br> <strong>Tiempo por petición:</strong> Es el tiempo medio que ha empleado el servidor en atender a un grupo de peticiones concurrentes. 767.089 milisegundos ha sido nuestro valor.<br> <strong>Tiempo por petición (a través de todas las peticiones concurrentes):</strong> Es el tiempo medio que ha tardado el servidor en atender una petición individual. A nosotros nos ha dado 153.418 milisegundos.

##Utilización de keys Heroku-Github:##
Para tener una mayor sincronización entre nuestro SaaS en este caso Heroku y git vamos a realizar una conexión entre ambos via ssh.

Para ello es necesario realizar una serie de pasos los cuales vamos a detallar a continuación:

En primer lugar generamos un archivo id_rsa.pub ejecutando el siguiente comando en la terminal:

ssh-keygen

Una vez generado el archivo correspondiente escrbimos en la terminal lo siguiente:

cat ~/.ssh/id_rsa.pub

Esto nos genera un tipo de cifrado el cual tenemos que añadir tanto a Heroku como a github.

Pasos para añadir la contraseña a github:

Dentro de github nos vamos a settings > SSH Keys > Add Ssh key damos un título a la key y pegamos el código en el cuadro de mayor tamaño que nos aparece y pulsamos en el botón Add key
Acontinuación recibimos un correo para indicarnos que hemos añadido un key a GitHub

Correo key GitHub
<a href="http://es.tinypic.com?ref=3eyah" target="_blank"><img src="http://i61.tinypic.com/3eyah.jpg" border="0" alt="Image and video hosting by TinyPic"></a>
Pasos para añadir key a Heroku:

En la terminar escrbimos: heroku keys:add ~/.ssh/id_rsa.pub
Acto y seguido recibiremos un correo para indicarnos que hemos añadido un key a Heroku.

Correo key Heroku
Una vez realizados los paso anteriores verificamos la existencia de la conexión entre git y Heroku, para ello escribimos en la terminal el siguiente comando. ssh -v git@heroku.com

Ahora podemos ver pinchando en la imagen como se ha establecido la conexión:

Conexión establecida Heroku-GitHub

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

RUN sudo apt-get update
RUN sudo apt-get install -y g++
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
RUN npm install
RUN node app.js
RUN firefox localhost:3000
```

##Instalar Docker

En primer lugar actualizamos los repositorios e instalamos docker. Lo hacemos con:

```shell
sudo apt-get update
sudo apt-get install -y docker.io
```

Es posible que al ejecutar docker nos de un error con el fichero docker.pid. Para ello, tenemos que eliminarlo de la siguiente forma:

```shell
sudo rm /var/run/docker.pid
```

Ahora sí, ejecutamos docker:

```shell
docker -d &
```

Instalación de la imagen del contenedor, en este caso hemos elegido ubuntu

```shell
docker pull ubuntu
```

##Preparar jaula sin Docker

Instalamos debootstrap, programa para crear jaulas

```shell
apt-get install debootstrap
```

Creamos el repositorio donde se almacenaran las jaula

```shell
mkdir /home/jaulas
debootstrap --arch=amd64 trusty /home/jaulas/jaula-iv/ http://archive.ubuntu.com/ubuntu
```

Preparar el entorno para la app y la ejecutamos

```shell
apt-get install -y curl
apt-get install -y wget
apt-get install -y zip
apt-get install -y git
```

Puede darse el caso de que el repositorio ya esté clonado. Para no tener que realizar la clonación en cada paso podemos hacer un simple if que comprueba si la carpeta de clonación ha sido creada.

```shell
if [ ! -d Proyecto-IV ]; then
	git clone https://github.com/TransparenciaUGR/Proyecto-IV
fi

cd Proyecto-IV
git pull
cd P3

chmod +x lanzarTransparente.sh
sh lanzarTransparente.sh
```
