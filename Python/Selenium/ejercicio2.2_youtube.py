# -*- coding: utf-8 -*-
"""
Created on Fri Nov 10 13:43:32 2023

@author: USUARIO MAÑANA
"""

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import time

# Inicializar el driver de Selenium
driver = webdriver.Chrome()

# Navegar a la página del video de YouTube
driver.get('https://www.youtube.com/watch?v=CwxN_qkbPKk')

# Esperar a que se cargue la página
time.sleep(5)

# Hacer scroll en la página para cargar los comentarios
driver.execute_script('window.scrollTo(1, 500);')
time.sleep(3)
driver.execute_script('window.scrollTo(1, 1000);')
time.sleep(3)

# Hacer click en "Mostrar más" para cargar más comentarios si está presente
try:
    more_button = driver.find_element(By.XPATH, "//yt-formatted-string[contains(text(),'Mostrar más')]")
    more_button.click()
    time.sleep(3)
except:
    pass

# Obtener el HTML de la sección de comentarios y analizarlo con Beautiful Soup
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')

# Encontrar todos los elementos de comentario y extraer la información
comments = soup.find_all('ytd-comment-renderer', {'class': 'style-scope ytd-comment-thread-renderer'})

for comment in comments:
    author = comment.find('a', {'id': 'author-text'}).text
    date = comment.find('yt-formatted-string', {'class': 'published-time-text'}).text
    content = comment.find('yt-formatted-string', {'id': 'content-text'}).text

    print(f"Author: {author}")
    print(f"Date: {date}")
    print(f"Comment: {content}")
    print("---")

    # Obtener respuestas a los comentarios
    replies = comment.find_all('ytd-comment-renderer', {'class': 'style-scope ytd-comment-thread-renderer'})
    for reply in replies:
        reply_author = reply.find('a', {'id': 'author-text'}).text
        reply_date = reply.find('yt-formatted-string', {'class': 'published-time-text'}).text
        reply_content = reply.find('yt-formatted-string', {'id': 'content-text'}).text

        print(f"  Reply Author: {reply_author}")
        print(f"  Reply Date: {reply_date}")
        print(f"  Reply: {reply_content}")
        print("  ---")

# Cerrar el navegador al final
driver.quit()
