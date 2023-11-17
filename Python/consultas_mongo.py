9. Escribe una consulta en MongoDB para encontrar los restaurantes que obtuvieron una puntuación superior a 80 pero inferior a 100.
{"grades.score":{gt:80}}

9b. Escribe una consulta en MongoDB para encontrar los restaurantes que obtuvieron una puntuación superior a 80 o inferior a 100.
{$or:[{"grades.score":{$gt:80}},{"grades.score":{$lt:100}}]}

10. Escriba una consulta MongoDB para encontrar los restaurantes que se ubican en un valor de latitud inferior a -95,754168.
{"address.coord.0":{$lt:-95.754168}}

11. Escriba una consulta MongoDB para encontrar los restaurantes que no preparan ninguna cocina "estadounidense" y su calificación sea superior a 70 y su latitud sea inferior a -65,754168.
{$and:[{cuisine:{$ne:"American"}},{"grades.score":{$gt:90}},{"address.coord.0":{$lt:-65.754168}}]}

12. Escriba una consulta MongoDB para encontrar los restaurantes que no preparan ninguna cocina 'americana' y obtuvieron una puntuación superior a 70 y están ubicados en una longitud inferior a -65,754168.
Nota: Realice esta consulta sin utilizar el operador $and.

13.  Escriba una consulta MongoDB para encontrar los restaurantes que no preparan ninguna cocina "americana" y obtuvieron una calificación "A" que no pertenece al distrito de Brooklyn. El documento deberá visualizarse según la cocina en orden descendente.
{$and:[{cuisine:{$ne:"American"}},{"grades.grade":"A"},{borough:{$ne:"Brooklyn"}}]}

14. Escriba una consulta MongoDB para encontrar el ID del restaurante, el nombre, la ciudad y la cocina de aquellos restaurantes que contienen 'Wil' como las primeras tres letras de su nombre.
Find:{name: /^Wil/}
Project:{restaurant_id:1,name:1,borough:1,cuisine:1}

15. Cantidad de restaurantes por barrio
Project: {name:1, borough:1, id:0}
Group: {_id: "$borough", cantidad: { $count: {} }}
Project: {barrio:"$_id", cantidad:1, _id:0}

Liberías a incluir en Spyder para graficar desde MongoDB:
import pymongo
import pandas as pd
import matplotlib.pyplot as plt

#Conexión a MongoDB
bases = pymongo.MongoClient('mongodb+srv://deepy:nlcfty228@cluster0.qyi23q2.mongodb.net/')

#Conectar con la base de datos
db = bases.sample_restaurants

#Conectar con la colección/vista
restaurantesPorZona = db.cantidadxzona.find()

#Conectar el Dataframe de la colección
pandasDF = pd.DataFrame(restaurantesPorZona)

#Mostrar los campos del dataframe
print(pandasDF)

16. Cantiadd de restaurantes por tipo
Project: {name:1, cuisine:1, _id:0}
Group: {_id: "$cuisine", cantidad: { $count: {} }}
Project: {tipo:"$_id", cantidad:1, _id:0}
Sort: {cantidad: -1,}
Limit: 5

17. Promedio de puntuaciones (5 mejores)
Unwind: {path: "$grades"}
Group: {_id: {clave:"$_id",nombre:"$name",barrio:"$borough",cocina:"$cuisine"}, promedio: {$avg: "$grades.score"}}
Project: {nombre: "$_id.nombre",barrio: "$_id.barrio",cocina: "$_id.cocina",puntuacion: "$promedio",_id:0}
Sort: {puntuacion: -1,}
Limit: 5

18. Total ventas por producto (nombre,cantidad)
- Vista MongoDB


- Power Query