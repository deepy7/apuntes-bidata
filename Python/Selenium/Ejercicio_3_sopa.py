# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import time

# Inicializar el driver de Selenium
driver = webdriver.Chrome()

# Navegar a la página del video de YouTube
driver.get('https://www.youtube.com/watch?v=1IL4LgKSUzk')

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
comments = soup.find_all('yt-formatted-string', {'class': 'style-scope ytd-comment-renderer'})
for comment in comments:
    print(comment.text)