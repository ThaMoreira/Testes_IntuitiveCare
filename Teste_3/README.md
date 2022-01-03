##  👩‍💻 Teste de nivelamento 3
Neste teste é necessário a criação de scripts sql (MySQL 8. ou Postgres >10.0) que execute: 

Tarefas de Preparação:<br />
*Baixar os arquivos dos últimos 2 anos no repositório público do [Gov.br](http://ftp.dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/) (pode ser feito manualmente)<br />
Baixar csv do link [Padrão Tiss](https://www.gov.br/ans/pt-br/assuntos/prestadores/padrao-para-troca-de-informacao-de-saude-suplementar-2013-tiss) (pode ser feito manualmente)*

3.1 - Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação num banco MySQL ou Postgres (Atenção ao encoding dos arquivos!)<br />
3.2 - Montar uma query analítica que traga a resposta para as seguintes perguntas:<br />
*Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?<br />
Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?*

## 🛠 Tecnologias
As seguintes ferramentas foram usadas na construção do projeto:
* **[SSMS](https://docs.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)**


## ⚙️ Funcionamento
O primeiro passo é a criação do banco de dados "Teste3" e o uso do mesmo.<br /> 
<br />
Após a criação do banco de dados são criadas as tabelas "Despesas" e "Registro" com suas devidas colunas.<br />
<br />
Quadro 31:<br />
O tabula realiza a leitura do PDF atrás de quadros localizados nas páginas 115,116,117,118,119,120, excluindo headers pois o quadro 31 ocupa mais do que uma página armazenando na variável "quadro31" utilizando o "bigdata" para concatenar e juntar os quadros encontrados nas páginas 115 à 120 em um quadro só, além de atualizar o quadro para ser lido no sql (função futura). <br />
<br />
Quadro 32: <br />
O tabula realiza a leitura do PDF atrás de quadros localizado na página 120, porém por ter mais de um quadro neste página foi utilizado o app Tabula que extrai a área exata de um quadro em um PDF, salvando na variável "quadro32". <br />
<br />
Zipar<br />
Após toda a extração dos quadros é utilizado o ZipFile para zipar os quadros 30,31 e 32 em um arquivo (Teste_Thaís_Moreira_Teixeira)


