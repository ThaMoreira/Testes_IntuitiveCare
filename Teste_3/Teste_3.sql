/* Autor: Thaís Moreira Teixera
   Data: 04/01/2021
   Descrição: Query para criara banco de dados, carregar dados CSV e realizar uma pesquisa */

/*Cria o banco de dados */
CREATE DATABASE IntuitiveCare;
USE IntuitiveCare;

/* Cria a tabela de registros */
CREATE TABLE registros (
	Registro_ANS VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(255),
    Razao_Social VARCHAR(255),
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(255),
    Logradouro VARCHAR(255),
    Numero VARCHAR(255),
    Complemento VARCHAR(255),
    Bairro VARCHAR(255),
    Cidade VARCHAR(255),
    UF VARCHAR(2),
    CEP VARCHAR(255),
    DDD VARCHAR(5),
    Telefone VARCHAR(255),
    Fax VARCHAR(255),
    Endereco_Eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(255),
    Data_Registro_ANS VARCHAR(255),
    PRIMARY KEY (Registro_ANS)
);

/* Copia dos dados do CSV do relatorio para a tabela "Registros"
   Porém existe um problema na importação destes dados - informa que possui dados depois da ultima coluna*/

copy registros(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_Eletronico, Representante, Cargo_Representante, Data_Registro_ANS)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\Relatorio_cadop.csv'
delimiter as ';'
null ''
csv header
quote E'\b'
encoding 'latin1'

/* Cria a tabela de dados */
create table dados(
	dia date,
	reg_ans varchar(50),
	cd_conta_contabil varchar(50),
	descricao varchar(5000),
	vl_saldo_final varchar(500)
);

/* importa com SUCESSO os dados de 2020 e 2021 na tabela "dados" */
copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\1T2020.csv'
delimiter ';'
csv header
encoding 'latin1';

copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\2T2020.csv'
delimiter ';'
csv header
encoding 'latin1';

copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\3T2020.csv'
delimiter ';'
csv header
encoding 'latin1';

copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\4T2020.csv'
delimiter ';'
csv header
encoding 'latin1';

copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\1T2021.csv'
delimiter ';'
csv header
encoding 'latin1';

copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\2T2021.csv'
delimiter ';'
csv header
encoding 'latin1';

copy dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
from 'C:\Users\thamo\Desktop\Processo_Seletivo\Testes_IntuitiveCare\Teste_3\Docs\3T2021.csv'
delimiter ';'
csv header
encoding 'latin1';

/* Altera o caractere de separação na coluna "vl_saldo_final" */
update 
	dados 
set
	vl_saldo_final = replace(vl_saldo_final,',','.');

alter table dados 
alter column vl_saldo_final type numeric using(vl_saldo_final::numeric);
	
	
/* Faz a pesquisa das empresas com maipr despesas no ultimo trimestre */	
select 
	registro_ans,
	cnpj,
	razao_social,
	nome_fantasia,
	sum(vl_saldo_final) as saldo_final
from dados d 
left join registros r 
on d.reg_ans = r.registro_ans
where  descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' and dia >= '01/07/2021' 
group by registro_ans, cnpj, razao_social, nome_fantasia
order by saldo_final desc
limit 10;


/* Faz a pesquisa das empresas com maipr despesas no ultimo ano */	
select 
	registro_ans,
	cnpj,
	razao_social,
	nome_fantasia,
	sum(vl_saldo_final) as saldo_final
from dados d 
left join registros r 
on d.reg_ans = r.registro_ans
where  descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' and date_part('year', dia) = '2021' 
group by registro_ans, cnpj, razao_social, nome_fantasia
order by saldo_final desc
limit 10;


