
# Testes de Nivelamento Intuitive Care
Esta etapa do processo seletivo consiste na realização de testes de nivelamento. Estes testes foram desenhados em função de tarefas realizadas no dia a dia da empresa e têm como objetivo avaliar:

·      Conhecimentos básicos de programação

·      Organização do código

## Teste de nivelamento 1
Neste teste é necessário a criação de um código que execute:<br />
1.1 - Acessar o site: https://www.gov.br/ans/pt-br/assuntos/prestadores/padrao-para-troca-de-informacao-de-saude-suplementar-2013-tiss;<br />
1.2 - Buscar a versão mais recente do Padrão TISS;<br />
1.3 - Baixar o componente organizacional;<br />

## Teste de nivelamento 2
Neste teste é necessário a criação de um código que execute:<br />
2.1 - Extraia do pdf do teste 1 os dados dos Quadros 30,31,32 (Tabela de categoria do Padrão TISS);<br />
2.2 - Salve os dados em tabelas estruturadas, em csvs;<br />
2.3 - Zipar todos os csvs num arquivo "Teste_{seu_nome}.zip".<br />

## Teste de nivelamento 3
Neste teste é necessário a criação de scripts sql (MySQL 8. ou Postgres >10.0) que execute: 

Tarefas de Preparação:<br />
*Baixar os arquivos dos últimos 2 anos no repositório público : http://ftp.dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/ (pode ser feito manualmente)<br />
Baixar csv do link: https://www.gov.br/ans/pt-br/assuntos/prestadores/padrao-para-troca-de-informacao-de-saude-suplementar-2013-tiss (pode ser feito manualmente)*

3.1 - Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação num banco MySQL ou Postgres (Atenção ao encoding dos arquivos!)<br />
3.2 - Montar uma query analítica que traga a resposta para as seguintes perguntas:<br />
*Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?<br />
Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?*
