# Analisis de los comentarios del video de the sild project de Iker Jimenez
from matplotlib.pyplot import clf
from pandas import read_csv, set_option
from pymongo.mongo_client import MongoClient
import pandas as pd

client = MongoClient("mongodb+srv://deepy:nlcfty228@cluster0.qyi23q2.mongodb.net/")

# Datos de la base de datos y la consulta o collection
db = client.youtube
comentarios = db["division_en_palabras"]

comentarios = comentarios.find()

df = pd.DataFrame(list(comentarios))

print(df)

from sklearn.model_selection import train_test_split

#Visitar la pagina scikit-learn.org/stable

train,test = train_test_split(df,test_size=0.33,random_state=42)

train_x = train['comentario'].to_list()
train_y = train['nota'].to_list()

test_x = test['comentario'].to_list()
test_y = test['nota'].to_list()

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




