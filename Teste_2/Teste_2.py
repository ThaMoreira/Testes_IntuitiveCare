#!pip install tabula-py
#!pip install PyPDF2

#Autor: Thaís Moreira Teixeira
#Data: 30/12/2021
#Descrição: Coletar os quadros 30,31 e 32, transformar em CSV e zipar em um arquivo  

import tabula
import pandas as pd
import zipfile

PDF_geral = tabula.read_pdf('padrao-tiss_componente-organizacional_202111.pdf', pages='all')

PDF_geral

quadro30 = tabula.read_pdf('padrao-tiss_componente-organizacional_202111.pdf', pages=114)

quadro31 = tabula.read_pdf('padrao-tiss_componente-organizacional_202111.pdf',pages =[115,116,117,118,119,120], pandas_options={'header': None})

quadro31[0]
quadro31[5]

bigdata = pd.concat([quadro31[0],quadro31[1],quadro31[2],quadro31[3],quadro31[4],
                     quadro31[5]], ignore_index=True, sort=False)

# https://stackoverflow.com/questions/14162723/replacing-pandas-or-numpy-nan-with-a-none-to-use-with-mysqldb
bigdata = bigdata.where(pd.notnull(bigdata), ' ')
bigdata.columns = [bigdata.iloc[0], bigdata.iloc[1]]
bigdata = bigdata[2:]

bigdata.head()
bigdata.to_csv('Tabela_Categoria_Padrão_TISS.csv', index=False,encoding='iso-8859-1')

#https://github.com/tabulapdf/tabula-java/wiki/Using-the-command-line-tabula-extractor-tool#grab-coordinates-of-the-table-you-want
quadro32 = tabula.read_pdf('padrao-tiss_componente-organizacional_202111.pdf',pages =120, area=[439.899,132.75,514.269,313.47])

quadro32[0]
quadro32[0].to_csv('Tabela_tipo_Solicitacao.csv', index=False, encoding='iso-8859-1')

quadro30[0]
quadro30[0].to_csv('Tabela_tipo_demandante.csv', index=False, encoding='iso-8859-1')

z = zipfile.ZipFile('Teste_Thais_Moreira_Teixeira.zip', 'w', zipfile.ZIP_DEFLATED)
z.write('Tabela_Categoria_Padrão_TISS.csv')
z.write('Tabela_tipo_Solicitacao.csv')
z.write('Tabela_tipo_demandante.csv')
z.close()