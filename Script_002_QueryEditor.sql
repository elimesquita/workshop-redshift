--## Execute Consultas de Teste
Query Editor V1
SELECT * FROM sales LIMIT 5;
SELECT * FROM users LIMIT 3;


#### Obter informações dos metadados ####
-- Consultar Tabelas do Sistema
SELECT * FROM information_schema.tables

SELECT * FROM information_schema.tables
WHERE table_schema = 'public';

-- Consultar os bancos de dados existentes
SELECT 
	database_name,
    database_owner,
    database_type
FROM svv_redshift_databases;

--Listar todos os esquemas do Amazon Redshift de todos os bancos de dados no cluster.
SELECT 
    database_name, 
    schema_name, 
    schema_owner, 
    schema_type
FROM svv_redshift_schemas;

--Listar todas as tabelas ou views do Amazon Redshift de todos os bancos de dados no cluster.
SELECT 
    database_name,
    schema_name,
    table_name,
    table_type
FROM svv_redshift_tables
where database_name in ('dev') and schema_name in ('public');

--Listar todas as colunas de uma tabela
SELECT 
	database_name,
    schema_name,
    table_name,
    column_name,
    data_type,
    numeric_precision
FROM svv_all_columns
WHERE database_name = 'dev'
AND table_name = 'sales'
ORDER BY column_name, schema_name
LIMIT 5; 

## Guia do desenvolvedor de banco de dados (Amazon Redshift)
https://docs.aws.amazon.com/pt_br/redshift/latest/dg/redshift-dg.pdf

