# Video de origen
# https://www.youtube.com/watch?v=afFf55jR50M
from matplotlib.pyplot import clf
from pandas import read_csv, set_option
import pandas as pd
df = read_csv('Eopinions.csv')
# print(df)

#Linea para que no corte el campo comentario
# pd:set_option("display.max_colwidth",None)

# Devuelve el total de palabras de cada comentario
print(df['text'].str.split().str.len())

# Devuelve largo promedio de los comentarios
print(df['text'].str.split().str.len().mean())

# Devuelve datos ampliados de los comentarios
print(df['text'].str.split().str.len().describe())

#Devuelve la cantidad de cada una de las opiniones (camara o auto)
print(df['class'].value_counts())

from sklearn.model_selection import train_test_split

#Visitar la pagina scikit-learn.org/stable

train,test = train_test_split(df,test_size=0.33,random_state=42)

train_x = train['text'].to_list()
train_y = train['class'].to_list()

test_x = test['text'].to_list()
test_y = test['class'].to_list()

# Vamos a usar el modelo bag of words (bolsa de palabras)

from sklearn.feature_extraction.text import CountVectorizer
vectorizer = CountVectorizer()

train_x_vectors = vectorizer.fit_transform(train_x)
test_x_vectors = vectorizer.transform(test_x)

# Devuelve la lista de palabras encontradas
print(train_x_vectors.shape)

from sklearn.tree import DecisionTreeClassifier
clf_dec = DecisionTreeClassifier()
clf_dec.fit(train_x_vectors,train_y)
DecisionTreeClassifier()

# Devuelve el primer elemento de test si es o no camara
print(clf_dec.predict(test_x_vectors[0]))
print(test_y[0]) # Comprobacion de acierto

# Seguridad en la prediccion
print(clf_dec.score(test_x_vectors,test_y)) # 99.49 % de precision




