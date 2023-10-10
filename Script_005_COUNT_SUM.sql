---Funções agregadas

--Visão geral do COUNT e SUM usando Redshift SQL

SELECT 
 count(*)
FROM 
 users; 

SELECT 
 count(*)
FROM 
 users 
WHERE state = 'TX';

SELECT
    sum(pricepaid)
FROM
sales;

SELECT 
    sum(venueseats) 
FROM venue
WHERE venuestate = 'TX';

SELECT
    avg(pricepaid)
FROM
sales;

SELECT 
    avg(venueseats) 
FROM venue
WHERE venuestate = 'TX';

--##Usando COUNT e DISTINCT COUNT usando Redshift SQL
--COUNT(*) conta todas as linhas na tabela de destino independente se elas contêm nulls ou não.
--COUNT(expressão) computa o número de linhas com valores não NULL em uma coluna ou expressão específica.
--COUNT(expressão DISTINCT) computa o número de valores distintos não NULL em uma coluna ou expressão.


DROP TABLE departamento CASCADE;
CREATE TABLE departamento(
    id_departamento int PRIMARY KEY,
    nome_departamento varchar(80)
);

SELECT COUNT(*) FROM departamento;

INSERT INTO departamento(id_departamento,nome_departamento)
VALUES(1,'Engenharia de Dados'),
      (1'Arquitetura de Dados'),
      (3,'Ciência de Dados'),
      (3,'Ciência de Dados'),
      (4,'Devops'),
      (5,NULL);

SELECT COUNT(*) FROM departamento;
SELECT * FROM departamento;

SELECT count(*) FROM departamento;      
SELECT count(nome_departamento) FROM departamento;   
SELECT count(DISTINCT nome_departamento ),nome_departamento FROM departamento;   
SELECT count(1) FROM departamento;         

SELECT count(*), 
       MAX(pricepaid),
       MIN(pricepaid), 
       SUM(pricepaid)
FROM   sales
WHERE  department_id = 80;

--Execute agregações totais com base na condição usando Redshift SQL

SELECT
    count(*) as QTD_Vendas, 
    sum(pricepaid) as Total,
    avg(pricepaid) as Preco_Medio,
    max(pricepaid) as Preco_Maximo,
    min(pricepaid) as Preco_Minimo       
FROM sales;

