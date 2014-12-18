===========

Repositorio para el proyecto de la asignatura "Infraestructuras Virtuales"

###Proyecto elegido: Infraestructura virtual para transparencia.
[Link de progreso provisional](https://transnode.herokuapp.com/): en cada ejecución muestra 2 caras aleatorias por pantalla.

Creación de infraestructura virtual para transparencia.ugr.es, con creación de tests para el código, integración continua, descripción de configuración mediante Chef o Ansible y configuración del despliegue automático del mismo en cualquier servicio.
Integrantes del grupo:

Alberto Mesa Navarro.<br />
Jose Carlos Sánchez Hurtado. <br>
Marcos Jiménez Fernández.  <br>
Jesús Navarro Guzmán.  <br>
Francisco Toranzo Santiago. <br>


## ¿Qué es Heroku?

Es un servicio de Hosting en la nube. Esto ayuda a que los clientes no tienen que contar
con infraestructura, el tiempo de procesamiento y almacenamiento, si no que todo esto se le 
renta a un tercero. Es un servicio gratuito hasta los 5 MB de espacio para base de datos y 50 
MB para los archivos incluyendo repositorios Git. Es un servicio basado en la nube de Amazon 
Web Services. La implementación de este servicio se hace a través de GIT y se instala a través 
de un gem.

Las ventajas que nos ofrece usar Heroku es que podemos olvidarnos de usar servidores, pudiendo enfocarnos en la aplicación que queremos desplegar, y es gratuita en cierto modo, puesto que sí se sobrepasan los límites anteriormente mencionados se empezará a pagar una cuota. Heroku puede trabajar con con MySQL, SQLite, PostgreSQL, MongoDB, CouchDB y Memcache a través de un tercero Mongo HQ y Cloudant añadidos como add-ons. 

Para el caso de nuestra aplicación para trasnparente ugr, utilizaremos la base de datos
MongoDB aunque aún no está implementada en la aplicación de ejemplo. Ya que para poder 
añadirla nos pide la verificación de cuenta con la tarjeta de crédito y tenemos dudas sobre ello.


## ¿Qué es transparenteUGR?

<b>transparente.ugr</b> es un portal web dedicado a ofrecer información a la sociedad y en particular a la Comunidad Universitaria, teniendo como objetivo el libre acceso y veracidad de esa información.

Este portal es algo más que un simple tablón de información. Es un conjunto de herramientas accesibles, simples de utilizar e inteligibles y que sean útiles para todos aquellos procesos relacionados con la transparencia y con la demanda de información por parte de los ciudadanos.

Su funcionalidad de podría dividir en:

<b>Administración:</b> todas las cuestiones relacionadas con <i>Personal</i>, <i>Información Económica</i> como presupuestos, auditorías, etc, y toda clase de <i>Servicios</i> tanto de la universidad como de empleo.

<b>Docencia:</b> con amplia información de oferta y demanda académica, el claustro de profesores y estudiantes.

<b>Gestión e investigación:</b> información relacionada con la <i>Misión de la universidad</i>, <i>Plan estratégico</i> para hacer operativa dicha misión, composición del gobierno y estatutos de la universidad, etc.

Y un apartado que incluye la Normativa Legal que rige en la Ley de transparencia, normativas y convenios.


## MongoDB

En este apartado vamos a indicar como crear y usar una base de datos para nuestro proyecto usando <b>MongoDB</b>.

Lo primero que habrá que hacer será crear una base de datos. Para ello, vamos a crear un modelo en un archivo con extensión .js que incluya la información de dicha base de datos. Un ejemplo de este archivo seria:

```sh
var mongoose = require('mongoose'),
    Sch   = mongoose.Sch;

var showSch = new Sch({
  title:    { type: String },
  year:     { type: Number },
  country:  { type: String },    
});

module.exports = mongoose.model('Show', showSch);
```

Con esto ya podríamos implementar la conexión a la BD en el archivo app.js de nuestro proyecto, añadiendole las siguientes lineas:

```sh
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/shows');
```

Para que esto funcione en nuestro entorno local, necesitamos tener instalado MongoDB. Dependiendo de vuestro sistema operativo se hace de una forma u otra. [Aquí podemos encontrar la documentación oficial](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/). Si tenemos un Mac, se instala de la misma manera que Node.js con <b>brief update</b> y <b>brief install mongodb.</b>

Una vez hecho esto, para poder iniciar MongoDB se debe ejecutar en otra terminal mongod. Con Mongo arrancado ya podemos ejecutar la aplicación con <b>node app.js</b> desde la terminal.

Ahora desde otra terminal, podemos entrar al shell de MongoDB y comprobar que la base de datos se ha creado correctamente. Para ello ejecutamos el comando <b>mongo</b>:

```sh
$ mongo
MongoDB shell version: 2.4.1
connecting to: test
> use shows
switched to db shows
> show dbs
local	0.078125GB
shows	(empty)
```

Una vez introducida información en la BD, tenemos que unir las funciones para el manejo de la información que usa mongoDB al proyecto, indicando <b>app.get("funcion");</b> siendo "funcion" la función correspondiente de introducir, modificar o eliminar información.

Para terminar, enlazamos el módulo al archivo principal de la aplicación app.js:

```sh
routes = require('./routes/shows')(app);
```

## Aplicación básica inicial (transparencia - node.js)

Despliegue inicial en node.js con BD postgresql para realizar nuestras primeras pruebas iniciales.
Otra información:

Plantilla de aplicación en Node.js usando [Express 4](http://expressjs.com/).

La aplicación se ha creado apoyada por el siguiente artículo: [Empezando a usar Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs).

## Ejecución Local:

Se necesita instalar [Node.js](http://nodejs.org/) y las herramientas asociadas de Heroku: [Heroku Toolbelt](https://toolbelt.heroku.com/):

```sh
$ git clone git@github.com:heroku/node-js-getting-started.git # o clonar fork propio
$ cd node-js-getting-started
$ npm install
$ npm start
```
Nota: el nombre node-js-getting-started.git variará.

Una vez realizada la ejecución local, la aplicación puede verse en [localhost:5000](http://localhost:5000/).

## Despliegue en Heroku:

Vamos a realizar el despliegue de la aplicación una vez testeado un despligue de una aplicación básica en Heroku. Para ello, lo primero que tenemos que hacer es clonar el repositorio que vamos a desplegar a nuestra máquina. Lo hacemos así:

```
git clone https://github.com/TransparenciaUGR/Proyecto-IV.git
```

El repositorio se descargará a nuestra máquina. Ahora nos movemos a esta carpeta:

```
cd Proyecto-IV
```

Es necesario instalar Heroku en Ubuntu, por ello, lo hacemos con el siguiente comando:

```
wget https://toolbelt.heroku.com/install-ubuntu.sh | sh
chmod 777 install-ubuntu.sh
./install-ubuntu
```
Podemos ver que lo tenemos instalado con:
```
heroku --version
```
En mi caso:<br>
<img src="http://i60.tinypic.com/2hhkdpg.png"></img>

Hecho esto, tenemos que crearnos una cuenta en Heroku porque la necesitaremos para desplegar el proyecto. Hecho esto, entramos a Heroku en Ubuntu haciendo:
```
heroku login
```
Y seguidamente introducimos nuestros credenciales:
<img src="http://i60.tinypic.com/25qysye.png"></img>

Ahora, dentro de la carpeta de nuestro proyecto, hacemos lo siguiente:
```
heroku create
```
E inicializamos nuestro proyecto:
```
git init
```
Seguidamente escribimos lo siguiente:
```
git add .
git commit -am “desp”
git push heroku master
git remote -v
heroku open
```
Al escribir heroku open se nos abrirá el proyecto desplegado en un navegador. Este es el resultado:
<img src="http://i61.tinypic.com/33xbm93.png"></img>

## Test de carga con Apache-Benchmark:

Lo que vamos a hacer ahora es comprobar el rendimiento del proyecto haciendo uso de Apache-Benchmark. Con el proyecto desplegado en Heroku, vamos a comprobar cómo responde la página web al realizar diversos tests de carga. Posteriormente se realizará un test similar pero con el proyecto desplegado en OpenShift:

Si no tenemos instalado Apache-Benchmark escribimos lo siguiente:

```
sudo apt-get install apache2-utils
```
En nuestro caso, vamos a realizar el test haciendo 200 peticiones con un nivel de concurrencia de 5. En la terminal escribimos:

```
ab -n200 -c5 https://mighty-taiga-8049.herokuapp.com/
```
Y estos son los resultados:<br>
<img src="http://i60.tinypic.com/nxv1om.png"></img>

Los datos más relevantes son:

<strong>Peticiones por segundo:</strong> Son las peticiones por segundo atendidas durante la prueba. En nuestro caso ha sido de 6.52 por segundo.<br>
<strong>Tiempo por petición:</strong> Es el tiempo medio que ha empleado el servidor en atender a un grupo de peticiones concurrentes. 767.089 milisegundos ha sido nuestro valor.<br>
<strong>Tiempo por petición (a través de todas las peticiones concurrentes):</strong> Es el tiempo medio que ha tardado el servidor en atender una petición individual. A nosotros nos ha dado 153.418 milisegundos.

##Utilización de keys Heroku-Github:

Para tener una mayor sincronización entre nuestro SaaS en este caso Heroku y git vamos a realizar una conexión entre ambos via ssh.

Para ello es necesario realizar una serie de pasos los cuales vamos a detallar a continuación:

En primer lugar generamos un archivo id_rsa.pub ejecutando el siguiente comando en la terminal:

```
ssh-keygen
```

Una vez generado el archivo correspondiente escrbimos en la terminal lo siguiente:

```
cat ~/.ssh/id_rsa.pub
```

Esto nos genera un tipo de cifrado el cual tenemos que añadir tanto a Heroku como a github.

Pasos para añadir la contraseña a github:

1. Dentro de github nos vamos a settings > SSH Keys > Add Ssh key 
  damos un título a la key y pegamos el código en el cuadro de mayor tamaño que nos aparece y pulsamos en el botón   Add key

Acontinuación recibimos un correo para indicarnos que hemos añadido un key a GitHub

- [Correo key GitHub](http://i61.tinypic.com/3eyah.png)

Pasos para añadir key a Heroku:

1. En la terminar escrbimos:
```
heroku keys:add ~/.ssh/id_rsa.pub
```

Acto y seguido recibiremos un correo para indicarnos que hemos añadido un key a Heroku.

- [Correo key Heroku](http://i62.tinypic.com/5uk7ia.png)

Una vez realizados los paso anteriores verificamos la existencia de la conexión entre git y Heroku, para ello escribimos en la terminal el siguiente comando.
```
 ssh -v git@heroku.com
```

Ahora podemos ver pinchando en la imagen como se ha establecido la conexión: 

- [Conexión establecida Heroku-GitHub](http://i60.tinypic.com/2rfc689.png)

##Estudio sobre Shippable.

Vamos a realizar un estudio sobre la plataforma shippable, esto nos permitirá más adelante realizar test para probar la aplicación transparente ugr.

### ¿Por qué Shippable?

En primer lugar y aprovechando el uso GitHub nos hemos decantado por usar Shippable ya que nos permite de una forma fácil y efectiva realizar un build de nuestro proyecto en menos de 30 segundo, sin la necesidad de realizar un registro previo en Shippable (nos sirve la cuenta que
tenemos en GitHub).

### Test sobre módulos. Integración continua.

Podemos testear los nuevos módulos que se van incorporando a la apliación.
En la plataforma Transparente-UGR es necesario llevar a cabo una labor de intregración continua ya que el proyecto esta llevado a cabo por cinco personas las cuales se encargarán de ir implementado de forma independiente las diversas funcionalidades con las que contará el proyecto, para ello es necesario disponer de una herramienta como Shippable, con esta herramienta podemos ir probando las funciones más críticas de la aplicación y comprobar mediante la realización de test que la apliación sigue funcionando correctamente despues de haber realizados modificaciones sobre ella. Con esto conseguimos una seguridad extra a la hora de incluir los nuevos módulos desarrollados al servidor donde este alojada la apliación con la garantia de que todo funcionará correctamente.

### Pasos para ejecutar una aplicación en Shippable.

1. En primer lugar es necesario identificarse en Shippable, lo podemos hacer usando nuestra cuenta de gitHub.

2. Seleccionamos el respositorio sobre el cuál queremos llevar a cabo la contrucción del proyecto.

3. Es necesario añadir al repositorio sobre el cuál vamos a realizar el build un archivo llamado shippable.yml, aqui pongo un enlace donde podemos ver cual sería el código que contendría el archivo .yml. He seleccionado el .yml de node_js ya que es el lenguaje en el que se encuentra desarrollada la apliación de transparente-ugr.

4. Test Visualizations.

5. Run the Build.

6. Visualización de los resultados de la ejecución de la aplicación.

### Pruebas realizadas con Shippable (aplicación de prueba).

<a href="http://es.tinypic.com?ref=29cwe9z" target="_blank"><img src="http://i60.tinypic.com/29cwe9z.png" border="0" alt="Image and video hosting by TinyPic"></a>
- Imagen 1. Proceso de ejecución de Shippable.

<a href="http://es.tinypic.com?ref=vijyba" target="_blank"><img src="http://i59.tinypic.com/vijyba.png" border="0" alt="Image and video hosting by TinyPic"></a>
- Imagen 2. Proceso de ejecución test Shippable.

## Documentación:

Para más información sobre el uso de Node.js sobre Heroku, ver estos artículos:

- [Empezando con Node.js en Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs)
- [Soporte Node.js en Heroku](https://devcenter.heroku.com/articles/nodejs-support)
- [Node.js sobre Heroku](https://devcenter.heroku.com/categories/nodejs)
- [Prácticas recomendadas para el desarrollo en Node.js](https://devcenter.heroku.com/articles/node-best-practices)
- [Uso WebSockets en Heroku con Node.js](https://devcenter.heroku.com/articles/node-websockets)

Para más información sobre el uso de key entre Heroku y GitHub:

- [Administración de clave SSH Heroku](https://devcenter.heroku.com/articles/keys)
- [Administración de clave SSH GitHub](http://www.cristalab.com/tutoriales/introduccion-a-github-en-linux-ubuntu-c106086l/)
- [Administración claves SSH GitHub](https://help.github.com/articles/generating-ssh-keys/)
- [Administración clves SSH GitHub-Heroku](http://iloo.wordpress.com/2012/06/03/heroku-desplegar-aplicaciones/)

Para más información sobre Shippable:

- [GETTING STARTED](http://docs.shippable.com/en/latest/start.html#step-5-run-the-build)
- [CODE SAMPLES](http://docs.shippable.com/en/latest/samples/index.html#samplesref)

***********************************************************
***********************************************************
