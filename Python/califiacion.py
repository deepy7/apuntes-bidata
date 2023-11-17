# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 08:30:50 2023

@author: USUARIO MAÑANA
"""

import pymongo
import pandas as pd
import matplotlib.pyplot as plt

#Conexión a MongoDB
bases = pymongo.MongoClient('mongodb+srv://deepy:nlcfty228@cluster0.qyi23q2.mongodb.net/')

#Conectar con la base de datos
db = bases.sample_restaurants

#Conectar con la colección/vista
calificacion = db.puntuacionPromedio.find()

#Conectar el Dataframe de la colección
scoreDF = pd.DataFrame(calificacion)

#Mostrar los campos del dataframe
print(scoreDF)

#Definición del tamaño de la gráfica
plt.figure(figsize=(10,6))

fig, ax = plt.subplots()

#Definición de los datos a graficar
valores_x = scoreDF.nombre.tolist()
valores_y = scoreDF.puntuacion.tolist()
#plt.bar(valores_x, valores_y)
ax.tick_params(axis='x', rotation=20)
ax.plot(valores_x, valores_y)

#Colocación de un título en el gráfico
plt.title("5 mejores restaurantes")
plt.ylabel("Nombre")
plt.xlabel("Puntuacion")

#Poner un grid de líneas de fondo
#plt.grid(axis="x", color="green", alpha=.3, linewidth=.5, linestyle="dotted")
plt.grid(axis="y", color="black", alpha=.5, linewidth=.5, linestyle="dotted")
#plt.tight_layout(pad=1.08)