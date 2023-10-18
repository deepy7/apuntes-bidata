# Descripción de la práctica

**1.** Crea en tu entorno de desarrollo una buena estructura de carpetas para un futuro proyecto frontend. El documento HTML debe referenciar a un documento de estilos CSS y a un archivo Javascript, ambos con un contenido mínimo para comprobar que funcionan.


**2.** Inicializa correctamente tanto Git como NPM para tener nuestro proyecto bien configurado. No te olvides que, por norma general, node_modules nunca debería subirse a GitHub.


**3.** Instala Parcel y utilizalo como automatizador. ¿Debes instalarlo como paquete global o como paquete de proyecto? ¿Si lo instalasemos como paquete de proyecto qué debemos tener en cuenta?


**4.** Revisa los scripts de NPM. Hay comandos que, posiblemente, sea mejor escribirlos ahí para evitar tener que escribir comandos largos. Crearemos un script dev o start que se encargará de lanzar el servidor local Parcel como desarrollo (con hot reload), otro script build que se encargará de crear la versión definitiva que irá en el entorno de producción. Por otro lado, también necesitaremos otro script deploy que subirá el contenido adecuado a GitHub Pages.


**5.** Instala y configura ESLint y Prettier para tu proyecto.


**6.** Escribe un buen README.md donde documentarás los pasos realizados para hacer esta práctica.
  
# Resolución de la práctica

* Estructura de carpetas del entorno de desarrollo creado


  ![estructura](https://user-images.githubusercontent.com/32529688/77570059-1a786f80-6ec3-11ea-96b6-a4f7ebc7f5be.png)

* Inicialización de Git y NPM en el proyecto, además de la exclusión de node_modules en el ***".gitignore"***
  
  ~~~
      $ git init
      $ git remote add origin ...
      $ touch .gitignore
      $ touch README.md
      $ npm init -y
  ~~~

  ![inicializacion](https://user-images.githubusercontent.com/32529688/77570716-2284df00-6ec4-11ea-98e6-23469c015d6c.png)

* Instalación de Parcel
  
  ~~~
      $ npm install -D parcel-bundler
  ~~~

  ![parcel](https://user-images.githubusercontent.com/32529688/77574326-bd33ec80-6ec9-11ea-883d-7b15c3165723.png)

  ***¿Debes instalarlo como paquete global o como paquete de proyecto?***
    > _En principio no importa demasiado cómo instalarlo, en esta ocasión se ha instalado como paquete de proyecto porque
    daba algún error al intentar hacerlo de forma global._
    
  ***¿Si lo instalasemos como paquete de proyecto qué debemos tener en cuenta?***
    > _Debemos tener en cuenta si lo va a utilizar sólo el programador o si la va a tener que usar el usuario en la versión
    final del proyecto, osea en la web. En caso de que la utilice solamente el programador, se instalaría como dependencia de
    desarrollo y en el caso de que tenga que utilizarla el usuario, se instalaría como dependencia a secas.
    Además, hay que tener en cuenta que será necesario volver a instalar Parcel en nuevos proyectos._
    
* Scripts NPM añadidos
  
  
  ![scripts](https://user-images.githubusercontent.com/32529688/77577155-346b7f80-6ece-11ea-9616-64e485875abd.png)

  - ***start:*** Inicia el servicio
    
    
    ![start](https://user-images.githubusercontent.com/32529688/77578297-39313300-6ed0-11ea-96bd-24d3507dac20.png)
    
  - ***build:*** Construye la aplicación
  
  
    ![build](https://user-images.githubusercontent.com/32529688/77578388-5f56d300-6ed0-11ea-816b-8449978750e4.png)
    
  - ***deploy:*** Despliega la aplicación en GitHub Pages
  
  
    ![deploy](https://user-images.githubusercontent.com/32529688/77578503-8e6d4480-6ed0-11ea-9166-ce38c97ab43f.png)
  
* Instalación y configuración de ESLint
  
  ~~~
      $ npm install -D eslint
  ~~~
  
  ![eslint](https://user-images.githubusercontent.com/32529688/77579361-17d14680-6ed2-11ea-8e69-c8911c9e78e9.png)
  
  - Corrección de errores en nuestro proyecto con ESLint
    
    
    ![fix](https://user-images.githubusercontent.com/32529688/77579575-739bcf80-6ed2-11ea-8928-9584f0c8820a.png)
    
  - Configuración de reglas de ESLint
  
    
    ![reglas](https://user-images.githubusercontent.com/32529688/77580065-3f74de80-6ed3-11ea-9a25-3da260c2960d.png)

* Instalación y configuración de Prettier
  
  ~~~
      $ npm install -D prettier
  ~~~
  
* Plugin para evitar conflictos entre Prettier y ESLint  
    
  ~~~
      $ npm install -D eslint-config-prettier eslint-plugin-prettier
  ~~~
  
# Retos
Los siguientes retos pueden enfocarse como páginas individuales adicionales que pueden enlazarse desde la página HTML principal.

* Vinilo: Crea un disco de vinilo lo más realista posible haciendo uso de HTML y CSS. Intenta no utilizar imágenes. Esta parte la podremos utilizar de base para la próxima práctica.

* Assets con Parcel: Investiga como importar assets (recursos estáticos) para utilizarlos en nuestra página con Parcel.

<div class="footer">
  &copy; 2020 Michael Brian Santana Mon.
</div>