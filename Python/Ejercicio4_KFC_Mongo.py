# -*- coding: utf-8 -*-
"""
Created on Wed Nov  8 11:27:03 2023

@author: DOCENTE MAÑANA
"""

import pandas as pd
import pymysql
import matplotlib.pyplot as plt

conn = pymysql.connect(
    host="localhost", port=3306, user="root",
    passwd="", db="videojuegos"
)

consulta = "select 'Norte America' AS region,round(sum(Ventas_Norte_America),2) AS total from ventas union all select 'Europa' AS region,round(sum(Ventas_Europa),2) AS total from ventas union all select 'Japon' AS region,round(sum(Ventas_Japón),2) AS total from ventas union all select 'Otros' AS region,round(sum(Ventas_Otros),2) AS total from ventas"

df = pd.read_sql(consulta, conn)
print(df)

#Definición de los datos a graficar
valores_x = df["region"]
valores_y = df["total"]
plt.bar(valores_x, valores_y)

#Poner un grid de líneas de fondo
plt.grid(axis="y", color="black", alpha=.5, linewidth=.5, linestyle="dotted")

