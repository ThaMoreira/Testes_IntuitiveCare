## 👩‍💻 Teste de nivelamento 2
Neste teste é necessário a criação de um código que execute:<br />
2.1 - Extraia do pdf do teste 1 os dados dos Quadros 30,31,32 (Tabela de categoria do Padrão TISS);<br />
2.2 - Salve os dados em tabelas estruturadas, em csvs;<br />
2.3 - Zipar todos os csvs num arquivo "Teste_Thaís_Moreira_Teixeira.zip".<br />

## 🛠 Tecnologias
As seguintes ferramentas foram usadas na construção do projeto:
* **[Python](https://www.python.org/)**
* **[Visual Studio Code](https://code.visualstudio.com/?WT.mc_id=javascript-9652-gllemos)**

## 📚 Bibliotecas
* **Pandas**
* **Tabula**
* **ZipFile**

## ⚙️ Funcionamento
Após a exportação das bibliotecas necessárias, o tabula realiza a leitura do PDF "Padrão Tiss".<br /> 
<br />
Quadro 30: <br />
Após a leitura o Tabula faz a leitura do quadro na página 114 do pdf e o armazena na varíavel "quadro30".<br />
<br />
Quadro 31:<br />
O tabula realiza a leitura do PDF atrás de quadros localizados nas páginas 115,116,117,118,119,120, excluindo headers pois o quadro 31 ocupa mais do que uma página armazenando na variável "quadro31" utilizando o "bigdata" para concatenar e juntar os quadros encontrados nas páginas 115 à 120 em um quadro só, além de atualizar o quadro para ser lido no sql (função futura). <br />
<br />
Quadro 32: <br />
O tabula realiza a leitura do PDF atrás de quadros localizado na página 120, porém por ter mais de um quadro neste página foi utilizado o app Tabula que extrai a área exata de um quadro em um PDF, salvando na variável "quadro32". <br />
<br />
Zipar<br />
Após toda a extração dos quadros é utilizado o ZipFile para zipar os quadros 30,31 e 32 em um arquivo (Teste_Thaís_Moreira_Teixeira)
 
