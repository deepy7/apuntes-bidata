# -*- coding: utf-8 -*-
"""
Created on Fri Oct 27 11:13:43 2023

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
restaurantesPorTipo = db.cantidadxtipo.find()

#Conectar el Dataframe de la colección
pandasDF = pd.DataFrame(restaurantesPorTipo)

#Mostrar los campos del dataframe
print(pandasDF)

#Definición del tamaño de la gráfica
plt.figure(figsize=(10,6))

#Definición de los datos a graficar
valores_x = pandasDF.tipo.tolist()
valores_y = pandasDF.cantidad.tolist()
plt.bar(valores_x, valores_y)

#Colocación de un título en el gráfico
plt.title("Cantidad de Restaurantes por tipo")
plt.ylabel("Cantidad")
plt.xlabel("Tipo")

#Poner un grid de líneas de fondo
#plt.grid(axis="x", color="green", alpha=.3, linewidth=.5, linestyle="dotted")
plt.grid(axis="y", color="black", alpha=.5, linewidth=.5, linestyle="dotted")
#plt.tight_layout(pad=1.08)