Proyecto-IV
===========

Repositorio para el proyecto de la asignatura "Infraestructuras Virtuales"

###Proyecto elegido: Infraestructura virtual para transparencia.

Creación de infraestructura virtual para transparencia.ugr.es, con creación de tests para el código, integración continua, descripción de configuración mediante Chef o Ansible y configuración del despliegue automático del mismo en cualquier servicio.
Integrantes del grupo:

Alberto Mesa Navarro.<br />
Jose Carlos Sánchez Hurtado. <br>
Marcos Jiménez Fernández.  <br>
Jesús Navarro Guzmán.  <br>
Francisco Toranzo Santiago. <br>

## Aplicación básica inicial transnode (transparencia - node.js)

Despliegue inicial en node.js con BD postgresql para realizar nuestras primeras pruebas iniciales.
Otra información:

Plantilla de aplicación en Node.js usando [Express 4](http://expressjs.com/).

La aplicación se ha creado apoyada por el siguiente artículo: [Empezando a usar Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs).

## Ejecución Local:

Se necesita instalar [Node.js](http://nodejs.org/) y las herramientas asociadas de Heroku: [Heroku Toolbelt](https://toolbelt.heroku.com/):

```sh
$ git clone git@github.com:heroku/node-js-getting-started.git # or clone your own fork
$ cd node-js-getting-started
$ npm install
$ npm start
```

Una vez realizada la ejecución local, la aplicación puede verse en [localhost:5000](http://localhost:5000/).

## Despliegue en Heroku:

```
$ heroku create
$ git push heroku master
$ heroku open
```

## Documentación:

Para más información sobre el uso de Node.js sobre Heroku, ver estos artículos:

- [Empezando con Node.js en Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs)
- [Soporte Node.js en Heroku](https://devcenter.heroku.com/articles/nodejs-support)
- [Node.js sobre Heroku](https://devcenter.heroku.com/categories/nodejs)
- [Prácticas recomendadas para el desarrollo en Node.js](https://devcenter.heroku.com/articles/node-best-practices)
- [Uso WebSockets en Heroku con Node.js](https://devcenter.heroku.com/articles/node-websockets)

***********************************************************
***********************************************************
