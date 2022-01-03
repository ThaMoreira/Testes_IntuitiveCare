## 👩‍💻 Teste de nivelamento 1
Neste teste é necessário a criação de um código que execute:<br />
1.1 - Acessar o site [Gov.br](https://www.gov.br/ans/pt-br/assuntos/prestadores/padrao-para-troca-de-informacao-de-saude-suplementar-2013-tiss);<br />
1.2 - Buscar a versão mais recente do Padrão TISS;<br />
1.3 - Baixar o componente organizacional;<br />

## 🛠 Tecnologias
As seguintes ferramentas foram usadas na construção do projeto:
* **[Python](https://www.python.org/)**
* **[Visual Studio Code](https://code.visualstudio.com/?WT.mc_id=javascript-9652-gllemos)**

## 📚 Bibliotecas
* **BeatifulSoup**
* **requests**

## ⚙️ Funcionamento
* Após a exportação das bibliotecas necessárias, a URL será acessada e guardada na variável "req" se o caminho for acesado corretamente (cód 200) o BeatifulSoup entra em ação para buscar a classe "callout" no HTML, assim que encontra a classe busca dentro dela o caminho (uma nova URL) para acessar os documentos na variável "URL_nova". Com a nova URL acessada o BeautifulSoup entra em ação novamente para buscar a classe que contem o arquivo PDF do TISS mais recente, assim que encontra é feito uma nova busca para que o download do arquivo PDF possa ser ralizado.
