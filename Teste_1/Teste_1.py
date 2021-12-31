import os.path
from bs4 import BeautifulSoup
import requests

#Referências ded estudo
# https://stackoverflow.com/questions/5815747/beautifulsoup-getting-href
# Como baixar pdf com BeautifulSoup https://www.youtube.com/watch?v=ye1oi8Lcobc

#Autor: Thaís Moreira Teixeira
#Data: 30/12/2021
#Descrição: Acessar a URL especificada e baixar o pdf do TISS mais recente   

headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Max-Age': '3600',
    'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'
}

url = "https://www.gov.br/ans/pt-br/assuntos/prestadores/padrao-para-troca-de-informacao-de-saude-suplementar-2013-tiss"
req = requests.get(url, headers)
if req.status_code == 200:
    soup = BeautifulSoup(req.content, 'html.parser')
    raw = soup.find(class_="callout")
    url_nova = raw.find('a')['href']
    req = requests.get(url_nova, headers)
    if req.status_code == 200:
        soup = BeautifulSoup(req.content, 'html.parser')
        raw = soup.find(class_="btn btn-primary btn-sm center-block internal-link")
        url_pdf = raw['href']  # não tem que fazer find pois é apenas um elemento encontrado
        req = requests.get(url_pdf, headers)
        if req.status_code == 200:
            file_path = os.path.join('.\\LatestTiss', os.path.basename(url_pdf))
            with open(file_path, 'wb') as f:
                f.write(req.content)
        else: 
            print("Documento não encontrado")
