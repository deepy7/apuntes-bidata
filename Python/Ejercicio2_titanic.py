# -*- coding: utf-8 -*-
"""
Created on Wed Nov  8 09:06:14 2023

@author: USUARIO MAÑANA
"""

import pandas as pd

titanic = pd.read_csv("titanic/train.csv")

# Muestra las primeras 8 filas
print(titanic.head(8))

# Muestra los tipos de datos de cada columna
print(titanic.dtypes)

titanic.to_excel("titanic.xlsx", sheet_name="passengers", index=False)

# Información del dataframe titanic
titanic.info()

# Muestra sólo algunas columnas
print(titanic[["Age", "Sex"]])

# Selecciona sólo los mayores de 35 años
print(titanic.loc[titanic["Age"] > 35,["Age", "Sex"]])

# Pasajeros con edad que no es un numero o es nula
print(titanic[titanic["Age"].isna()])

# Nombres de los mayores de 35 años
print(titanic.loc[titanic["Age"] > 70,["Name", "Age", "Sex", "Fare"]])

# Persona con la mayor edad
print(titanic.loc[(titanic["Age"] > 70) & (titanic["Survived"])])

print(titanic.iloc[9:25, 2:5])
