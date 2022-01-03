## Teste de nivelamento 3
Neste teste é necessário a criação de scripts sql (MySQL 8. ou Postgres >10.0) que execute: 

Tarefas de Preparação:<br />
*Baixar os arquivos dos últimos 2 anos no repositório público do [Gov.br](http://ftp.dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/) (pode ser feito manualmente)<br />
Baixar csv do link [Padrão Tiss](https://www.gov.br/ans/pt-br/assuntos/prestadores/padrao-para-troca-de-informacao-de-saude-suplementar-2013-tiss) (pode ser feito manualmente)*

3.1 - Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação num banco MySQL ou Postgres (Atenção ao encoding dos arquivos!)<br />
3.2 - Montar uma query analítica que traga a resposta para as seguintes perguntas:<br />
*Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?<br />
Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?*
