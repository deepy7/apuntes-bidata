# -*- coding: utf-8 -*-
"""
Created on Thu Nov  9 11:44:49 2023

@author: DOCENTE MAÑANA
"""

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import pandas as pd

# Opciones de navegación
options =  webdriver.ChromeOptions()
options.add_argument('--start-minimized')
options.add_argument('--disable-extensions')
options.add_argument("--headless")

# Conexión con Webdriver
driver = webdriver.Chrome(options=options)

# Abro la pagina web con chrome
driver.get('https://www.eltiempo.es')

# Me defino una variable tiempo de espera de 5 segundos
wait = WebDriverWait(driver, 20)

# Doy click al boton con el metodo xpath
wait.until(EC.element_to_be_clickable((By.XPATH,
                                      '/html/body/div[1]/div/div/div/div/div/div[3]/button[2]')))\
    .click()

# doy click al boton a travez de su css selector
# wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR,
#                                       'button.didomi-components-button didomi-button didomi-dismiss-button didomi-components-button--color didomi-button-highlight highlight-button'.replace(' ', '.'))))\
#     .click()


# Entramos en la caja de texto el texto Santa Cruz de Tenerife
wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR,
                                      'input#term')))\
    .send_keys('Santa Cruz de Tenerife')
    
# Damos click al primer elemento de la lista de Santa Cruz de Tenerife
wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR,
                                      'i.icon.icon-sm.icon-city')))\
    .click()

wait.until(EC.element_to_be_clickable((By.XPATH,
                                      '//html/body/div[8]/div[1]/div[4]/div/main/section[3]/section/section/ul[1]/li[3]/h2/a')))\
    .click()
    
wait.until(EC.element_to_be_clickable((By.XPATH,
                                      '/html/body/div[8]/div[1]/div[4]/div/main/section[3]/section/div/div/table')))
    
texto_columnas = driver.find_element('xpath','/html/body/div[8]/div[1]/div[4]/div/main/section[3]/section/div/div/table').get_attribute('outerHTML')
tablas  = pd.read_html(texto_columnas)
for i, tabla in enumerate(tablas):
    tabla.to_excel("datos.xlsx", index=False)
    # tabla.to_csv('test{}.csv'.format(i),'a')
print(tablas)  
driver.quit()
