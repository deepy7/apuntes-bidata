fetch("preguntas.json")
    .then(x => x.json())
    .then(y => {
        console.log(y);
        for (let i = 0; i < y.length; i++) {
            let preguntaTitulo = document.createElement("p");
            preguntaTitulo.innerHTML = y[i].pregunta;
            document.getElementById("pregunta").appendChild(preguntaTitulo);
            for(let j=0;j< y[i].respuestas.length;j++){
                let aceptar = document.createElement("input");
                aceptar.type = "radio";
                aceptar.value = 0;
                aceptar.name = y[i].nro;
                if (y[i].respuestas[j].correcto) aceptar.value=1
                let resp = document.createElement("label");
                resp.innerHTML = y[i].respuestas[j].r;
                document.getElementById("pregunta").appendChild(aceptar);
                document.getElementById("pregunta").appendChild(resp);
            }
        }


    });

    document.getElementById("formulario").addEventListener("submit", (e) =>{
        e.preventDefault();
        let formulario = document.getElementById("formulario");
        let formData = new FormData(formulario);
        console.log(formData);
    });