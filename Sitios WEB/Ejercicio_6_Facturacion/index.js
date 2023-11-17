// Variable que contenga el json
var facturacion;
// Define un array con los nombres de los meses
var meses = [
    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
];

// Abre la api
fetch("https://api-facturacion.onrender.com/")
    // conviertelo en tipo json
    .then((res) => res.json())
    // devuelve los datos convertidos por consola
    .then((listado) => 
    { 
        console.log(listado); 
        facturacion = listado;
        carga(listado.slice(0,8));
    })

    function carga(datos)
    {
        document.getElementById("listado").innerHTML="";
        for (let i = 0; i < datos.length; i++)
        {
            let tarjeta = document.createElement("div");
            tarjeta.classList.add("card");
            tarjeta.style.width = "18rem";
            tarjeta.style.height = "11rem";
            tarjeta.style.backgroundColor = "#BEDFDA";
            // Creamos el div del contenido
            let contenido = document.createElement("div");
            contenido.classList.add("card-body");
            let titulo = document.createElement("h5");
            titulo.innerHTML = `Cliente: ${datos[i].cliente}`;
            // Declarar numeroMes y calcularlo
            let nroMes = parseInt(datos[i].mes);
            // Acceder al nombre del mes en el array
            let nombreMes = meses[nroMes - 1];
            let texto = document.createElement("p");
            texto.innerHTML = `Fecha: ${nombreMes} / ${datos[i].año}`;
            // Formatea el total como una cantidad en euros
            let totalEuros = parseFloat(datos[i].total).toLocaleString('es-ES', { style: 'currency', currency: 'EUR' });
            let texto2 = document.createElement("p");
            texto2.innerHTML = `Total: ${totalEuros}`;
            contenido.appendChild(titulo);
            contenido.appendChild(texto);
            contenido.appendChild(texto2);
            tarjeta.appendChild(contenido);
            document.getElementById("listado").appendChild(tarjeta);
        }
    }

    document.getElementById("a").addEventListener("click",()=>{
        cambiaPagina(document.getElementById("a"));
    })

    document.getElementById("b").addEventListener("click",()=>{
        cambiaPagina(document.getElementById("b"));
    })

    document.getElementById("c").addEventListener("click",()=>{
        cambiaPagina(document.getElementById("c"));
    })

    function cambiaPagina(objeto)
    {
        pagina = objeto.innerHTML;
        // Elimino el fondo de los tres botones
        document.getElementById("lia").classList.remove("active");
        document.getElementById("lib").classList.remove("active");
        document.getElementById("lic").classList.remove("active");
        // Le pongo el fondo al botón seleccionado
        document.getElementById("li"+objeto.id).classList.add("active");
        
        carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
    }

    document.getElementById("siguiente").addEventListener("click",()=>{
        if(document.getElementById("lia").classList.contains("active"))
        {
            document.getElementById("lia").classList.remove("active");
            document.getElementById("lib").classList.add("active");
            pagina = document.getElementById("b").innerHTML;
            carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
        }
        else if(document.getElementById("lib").classList.contains("active"))
        {
            document.getElementById("lib").classList.remove("active");
            document.getElementById("lic").classList.add("active");
            pagina = document.getElementById("c").innerHTML;
            carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
        }
        else
        {
            // Aqui llegamos si esta activo el tercer boton de paginas
            document.getElementById("lic").classList.remove("active");
            // Activo el primero
            document.getElementById("lia").classList.add("active");
            // Paso al siguiente grupo de paginas
            document.getElementById("a").innerHTML = parseInt(document.getElementById("a").innerHTML) + 3;
            document.getElementById("b").innerHTML = parseInt(document.getElementById("b").innerHTML) + 3;
            document.getElementById("c").innerHTML = parseInt(document.getElementById("c").innerHTML) + 3;
            pagina = document.getElementById("a").innerHTML;
            carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
            document.getElementById("liant").classList.remove("disabled");
        }
    })

    document.getElementById("anterior").addEventListener("click",()=>{
        if(document.getElementById("lic").classList.contains("active"))
        {
            document.getElementById("lic").classList.remove("active");
            document.getElementById("lib").classList.add("active");
            pagina = document.getElementById("b").innerHTML;
            carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
        }
        else if(document.getElementById("lib").classList.contains("active"))
        {
            document.getElementById("lib").classList.add("active");
            document.getElementById("lib").classList.remove("active");
            document.getElementById("lia").classList.add("active");
            pagina = document.getElementById("a").innerHTML;
            carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
        }
        // Aqui llegamos si esta activo el primer boton de paginas
        else if(document.getElementById("a").innerHTML == "1")
        {
            document.getElementById("anterior").classList.add("disabled");
        }

        else
        {
            // Resto 3 a cada página
            document.getElementById("a").innerHTML = parseInt(document.getElementById("a").innerHTML) - 3;
            document.getElementById("b").innerHTML = parseInt(document.getElementById("b").innerHTML) - 3;
            document.getElementById("c").innerHTML = parseInt(document.getElementById("c").innerHTML) - 3;
            // Desactivo la página 1 y activo la 3
            document.getElementById("lia").classList.remove("active");
            document.getElementById("lic").classList.add("active");
            pagina = document.getElementById("c").innerHTML;
            carga(facturacion.slice((pagina-1)*8,((pagina-1)*8)+8));
        }
    })