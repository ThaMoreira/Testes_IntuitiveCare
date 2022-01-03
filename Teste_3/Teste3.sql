#Referências
#https://docs.microsoft.com/pt-br/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-ver15
#https://docs.microsoft.com/pt-br/sql/relational-databases/import-export/import-data-from-excel-to-sql?view=sql-server-ver15#bulk-insert
#https://docs.microsoft.com/pt-br/sql/relational-databases/import-export/import-data-from-excel-to-sql?view=sql-server-ver15
#https://www.webmundi.com/banco-de-dados/ms-sql-server/importando-uma-planilha-excel-para-o-sql-server/

CREATE DATABASE Teste3;

USE Teste3

/*Creates table for the trimesters CSVs*/
CREATE TABLE Despesas
(
	"DATA" DATE DEFAULT NULL,
    REG_ANS VARCHAR(255) NOT NULL,
    CD_CONTA_CONTABIL VARCHAR(255),
    DESCRICAO VARCHAR(255),
    VL_SALDO_FINAL DECIMAL(12,2) 
);

/*Creates table for the ANS registration*/
CREATE TABLE Registro
(
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
    Data_Registro_ANS VARCHAR(255), #DATE
    PRIMARY KEY (Registro_ANS)
);

#Modo_1
BULK INSERT Registro FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/Relatorio_cadop.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\r\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/1T2020.csv' WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK);
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/2T2020.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', FIRSTROW = 1, CODEPAGE = 'acp')
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2020.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/4T2020.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/1T2021.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/2T2021.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2021.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
#fim_do_Modo_1

#modo_2
INSERT INTO Despesas SELECT
* FROM OPENROWSET ('Microsoft.Jet.OleDB.4.0',
'EXCEL 8.0;Database=C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2021.csv'
,Plan1$)
#fim_do_Modo_2

#Modo_3
sp_configure 'show advanced options', 1;
RECONFIGURE;
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

USE ImportFromExcel;
INSERT INTO Despesas
SELECT * FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0; Database=C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2021.csv', [Sheet1$]);
#fim_do_Modo_3

#Modo_4
USE ImportFromExcel;
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2021.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
#fim_do_Modo_4

#Modo_5
LOAD DATA LOCAL INFILE 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/Relatorio_cadop.csv'
INTO TABLE Registro
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 3 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, @Data_Registro_ANS)
SET Data_Registro_ANS = STR_TO_DATE(@Data_Registro_ANS, '%d/%m/%Y');

LOAD DATA LOCAL INFILE 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2021'
INTO TABLE Despesas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@DATA,REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_FINAL)
SET DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
VL_SALDO_FINAL = replace(@VL_SALDO_FINAL, ',', '.');
#Fim_Modo_5

#Consulta_No_Banco_de_dados
SELECT Despesas."REG_ANS", "Registro"."Razao_Social", SUM(Despesas."VL_SALDO_FINAL") as despesa_total_3t2021
	FROM Despesas
	JOIN Registro
		ON Despesas."REG_ANS" = "Registro"."Registro_ANS"
WHERE (("DESCRICAO" LIKE 'EVENTOS%') and ("DESCRICAO" LIKE '%HOSPITALAR '))
	AND ("DATA" BETWEEN '01/07/2021' AND '30/09/2021')
	AND ("VL_SALDO_FINAL" < 0)
GROUP BY "REG_ANS", "Razao_Social" 
ORDER BY despesa_total_3t2021
LIMIT 10;

SELECT Despesas."REG_ANS", "Registro"."Razao_Social", SUM(Despesas."VL_SALDO_FINAL") as despesa_total_2020
	FROM Despesas
	JOIN Registro
		ON Despesas."REG_ANS" = Registro."Registro_ANS"
WHERE (("DESCRICAO" LIKE 'EVENTOS%') and ("DESCRICAO" LIKE '%HOSPITALAR '))
	AND ("DATA" BETWEEN '01/01/2020' AND '31/12/2020')
	AND ("VL_SALDO_FINAL" < 0)
GROUP BY "REG_ANS", "Razao_Social" 
ORDER BY despesa_total_2020
LIMIT 10;
