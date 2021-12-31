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
    Data_Registro_ANS VARCHAR(255),
    PRIMARY KEY (Registro_ANS)
);


BULK INSERT Registro FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/Relatorio_cadop.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\r\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/1T2020.csv' WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK);
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/2T2020.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2020.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/4T2020.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/1T2021.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/2T2021.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)
BULK INSERT Despesas FROM 'C:\Users\thamo\Desktop\Processo_Seletivo\Teste_3\Docs/3T2021.csv' WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n', TABLOCK)





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