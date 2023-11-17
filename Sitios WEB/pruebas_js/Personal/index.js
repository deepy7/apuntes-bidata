// Agregar
document.getElementById("boton").addEventListener("click",function() {
    const elemento = document.createElement("li");
    let edad = document.getElementById("edad").value;
    let respuesta = "";
    if(edad < 18) {
        respuesta = "Menor de edad";
    } else if (edad > 67) {
        respuesta = "Jubilado";
    } else {
        respuesta = "Trabajador";
    }
    elemento.innerHTML = document.getElementById("nombre").value + " es " + respuesta;
    document.getElementById("personal").appendChild(elemento);
})

// Borrar
document.getElementById("boton1").addEventListener("click",function() {
    document.getElementById("personal").innerHTML = "";
})