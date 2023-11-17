// Abre el fichero gatos.json
fetch("gatos.json")
    // conviertelo en tipo json
    .then(x => x.json())
    // devuelve los datos convertidos por consola
    .then(datos => {
        console.log(datos);
        for (let i = 0; i < datos.length; i++) {
            let tarjeta = document.createElement("div");
            tarjeta.classList.add("card");
            tarjeta.style.width = "18rem";
            // Cremos la imagen
            let foto = document.createElement("img");
            foto.src = `/imagenes/${datos[i].nombre}.jpg`;
            foto.classList.add("card-img-top");
            tarjeta.appendChild(foto);
            // Creamos el div del contenido
            let contenido = document.createElement("div");
            contenido.classList.add("card-body");
            let titulo = document.createElement("h5");
            titulo.innerHTML = `${datos[i].nro} - ${datos[i].nombre}`
            let texto = document.createElement("p");
            texto.innerHTML = datos[i].comentario;
            contenido.appendChild(titulo);
            contenido.appendChild(texto);
            tarjeta.appendChild(contenido);
            document.getElementById("listado").appendChild(tarjeta);
        }

    })
