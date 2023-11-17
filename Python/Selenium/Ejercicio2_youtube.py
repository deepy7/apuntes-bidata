# -*- coding: utf-8 -*-
# -*- coding: utf-8 -*-
"""
Created on Thu Nov  9 11:44:49 2023

@author: DOCENTE MAÑANA
"""
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import pandas as pd
import time
options = webdriver.ChromeOptions()
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.add_argument("--headless")
driver = webdriver.Chrome(options=options)

# Me defino una variable tiempo de espera de 60 segundos
wait = WebDriverWait(driver,60)

# Cargo el video de Iker de la entrevista de the wild proyect
driver.get('https://www.youtube.com/watch?v=1IL4LgKSUzk')

# Cargo 7 paginas de comentarios
SCROLL_PAUSE_TIME = 2
paginas = 7
html = driver.find_element(By.TAG_NAME,'html')
html.send_keys(Keys.PAGE_DOWN)   
html.send_keys(Keys.PAGE_DOWN)   
time.sleep(SCROLL_PAUSE_TIME * 3)
for i in range(paginas):
    html.send_keys(Keys.END)
    time.sleep(SCROLL_PAUSE_TIME)

# Busco la tabla que contiene los comentarios
comentarios = driver.find_elements(By.XPATH,'/html/body/ytd-app/div[1]/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[2]/ytd-comments/ytd-item-section-renderer/div[3]')
all_comments = [elem.text for elem in comentarios]
print(all_comments)



# driver.quit()

