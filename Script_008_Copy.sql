-- Visão Geral do Comando COPY

--Comando COPY com CREDENTIALS

-- Criar usuário no IAM
Usuário: naruto
Senha: AB56897

--Criar chave de acesso
 -- Command Line Interface (CLI)

--Adicionar a politica:
-- AmazonS3FullAccess

Access Key: AKIA5JSLL6MLOGUGNPY2
Secret Key: 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


Clone | Donwload o Git

--Criar o bucket e copiar o arquivo
Nome do Bucket: workshop-1010-mesquitav1

--Sintaxe do Comando COPY

COPY nome_da_tabela 
FROM 's3://mybucket/mydata’ 
CREDENTIALS 'aws_access_key_id=<temporary-access-key-id>;aws_secret_access_key=<temporary-secret-access-key>’
cvs|json;

SELECT * FROM orders LIMIT 5;

COPY orders 
FROM 's3://workshop-1010-mesquitav1/part-00000'
CREDENTIALS 'aws_access_key_id=AKIA5JSLL6MLOGUGNPY2;aws_secret_access_key=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' 
csv;


SELECT * FROM orders LIMIT 10;
SELECT count(*) FROM orders;

--Tabela de Logs de Erro
SELECT * FROM stl_load_errors;