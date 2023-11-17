# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup 
import pandas as pd
import time
from sentiment_analysis_spanish import sentiment_analysis

# Hereramienta para el analisis de sentimiento
sentiment = sentiment_analysis.SentimentAnalysisSpanish()

# Inicializar el driver de Selenium
options = webdriver.ChromeOptions()
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.add_argument("--headless")
driver = webdriver.Chrome(options=options)

# Navegar a la página del video de YouTube
driver.get('https://www.youtube.com/watch?v=1IL4LgKSUzk&t=678s')

# Hacer scroll en la página para cargar los comentarios
driver.execute_script('window.scrollTo(1, 500);')
time.sleep(2)
driver.execute_script('window.scrollTo(1, 1000);')
time.sleep(2)

# Encontrar el cuadro de comentarios y hacer click en él
comment_section = driver.find_element(By.XPATH,'//*[@id="comments"]')
# comment_section.click()

# Hacer scroll en la sección de comentarios para cargar más comentarios
last_height = driver.execute_script('return document.documentElement.scrollHeight')
while True:
    driver.execute_script('window.scrollTo(1, document.documentElement.scrollHeight);')
    time.sleep(2)
    new_height = driver.execute_script('return document.documentElement.scrollHeight')
    if new_height == last_height:
        break
    last_height = new_height

# Obtener el HTML de la sección de comentarios y analizarlo con Beautiful Soup
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')

# Encontrar todos los elementos de comentario y extraer el texto
df_new = pd.DataFrame(columns=['author',"fecha","comentario","concepto"]) 
comments = soup.find_all('ytd-comment-renderer', {'class': 'style-scope ytd-comment-thread-renderer'})
for comment in comments:
   author = comment.find('a', {'id': 'author-text'}).text
   date = comment.find('yt-formatted-string', {'class': 'published-time-text'}).text
   content = comment.find('yt-formatted-string', {'id': 'content-text'}).text
   concepto = sentiment.sentiment(content)
   print(author,date,content)
   df_new.loc[len(df_new)] ={'author': author, 'fecha':date,'comentario':content,'concepto':concepto}
df_new.to_excel("salida.xlsx")  