CREATE TABLE departamento(
    id_departamento int PRIMARY KEY,
    nome_departamento varchar(80)
)

--Sintaxe 001
CREATE TABLE usuario(
    id_usuario int PRIMARY KEY,
    nome_usuario varchar(120),
    email_usuario varchar(120),
    id_departamento int,
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

--Sintaxe 002
CREATE TABLE IF NOT EXISTS usuario(
    id_usuario int ,
    nome_usuario varchar(120),
    email_usuario varchar(120),
    id_departamento int,
PRIMARY KEY (id_usuario),
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- DDL da Tabela
SHOW TABLE usuario;

--Validando as tabelas
SELECT * FROM departamento;
SELECT * FROM usuario;


--Inserindo Dados nas Tabelas:
--Tabela de Departamento

--Tabela de Departamento - Opção 01
INSERT INTO departamento(id_departamento,nome_departamento) VALUES(1,'Engenharia de Dados');
INSERT INTO departamento(id_departamento,nome_departamento) VALUES(1,'Arquitetura de Dados');

INSERT INTO departamento(id_departamento,nome_departamento) VALUES(3,'Ciência de Dados');
INSERT INTO departamento VALUES(4,'Devops');
INSERT INTO departamento VALUES(5,'Vendas');

--Tabela de Departamento - Opção 02
INSERT INTO departamento(id_departamento,nome_departamento)
VALUES(1,'Engenharia de Dados'),
      (1,'Arquitetura de Dados'),
      (3,'Ciência de Dados'),
      (3,'Ciência de Dados'),
      (4,'Devops'),
      (5,'Vendas');

--Tabela de Usuário - Opção 01
INSERT INTO usuario(id_usuario, nome_usuario, email_usuario,id_departamento) VALUES (1,'Eliezio Mesquita', 'eliezio.mesquita@ia16.com.br','1');
INSERT INTO usuario(id_usuario, nome_usuario, email_usuario,id_departamento) VALUES (1,'Jose Silva', 'jose.silva@ia16.com.br','2');
INSERT INTO usuario(id_usuario, nome_usuario, email_usuario,id_departamento) VALUES (1,'Carlos Souza', 'calos.souza@ia16.com.br','3');
INSERT INTO usuario VALUES (4,'Maria Mendes', 'maria.mendes@ia16.com.br','4');
INSERT INTO usuario VALUES (5,'Joao Machado', 'joao.machado@ia16.com.br','6');


--Tabela de Usuário - Opção 02
INSERT INTO usuario(id_usuario, nome_usuario, email_usuario,id_departamento) 
VALUES (1,'Eliezio Mesquita', 'eliezio.mesquita@ia16.com.br','1'),
       (1,'Jose Silva', 'jose.silva@ia16.com.br','2'),
       (1,'Carlos Souza', 'calos.souza@ia16.com.br','3'),
       (4,'Maria Mendes', 'maria.mendes@ia16.com.br','4'),
        (5,'Joao Machado', 'joao.machado@ia16.com.br','6');


--Atualizando Dados
-- Atualizando uma coluna por update
UPDATE departamento SET id_departamento = 2 WHERE nome_departamento = 'Arquitetura de Dados';
UPDATE usuario SET id_usuario=2 WHERE nome_usuario = 'Jose Silva';

-- Atualizando mais de uma coluna por update
UPDATE usuario
SET id_usuario = 3, email_usuario = 'carlos.souza@ia16.com.br'
WHERE nome_usuario = 'Carlos Souza'; 

## Importante
As restrições de chave externa são somente informativas. 
Elas não são impostas pelo sistema, mas são usadas pelo 
planejador. (Executor de Query)

--https://docs.aws.amazon.com/pt_br/redshift/latest/dg/r_CREATE_TABLE_NEW.html

--Validando as Constraint
SELECT 
    table_name,
    constraint_name, 
    constraint_type
FROM information_schema.table_constraints;

SELECT 
    constraint_name, 
    constraint_type
FROM information_schema.table_constraints
WHERE constraint_schema ='public'
AND table_name = 'usuario';

-- Deletando Linhas
DROP TABLE departamento;
DELETE FROM departamento where id_departamento = 1;
SELECT * FROM departamento;

-- Drop e Validação de Constraint
ALTER TABLE usuario DROP CONSTRAINT usuario_id_departamento_fkey;

-- Drop de Tabela e Constraint
DROP TABLE departamento;
DROP TABLE departamento CASCADE;

DROP TABLE usuario;
DROP TABLE usuario CASCADE;

-- Excluir dados das tabelas do Redshift
DELETE FROM usuario WHERE id_usuario = 5;

-- Excluir todas as linhas
DELETE FROM usuario;

BEGIN;
DELETE usuario;
ROLLBACK ;

TRUNCATE TABLE usuario;
TRUNCATE usuario;

--NOTA
Depois de excluir um grande número de linhas de uma tabela:
• Limpe a tabela para recuperar espaço e reclassificar as linhas.
• ANALYZE a tabela para atualizar as estatísticas do planejador de consulta.

--NOTA
Por padrão, as operações individuais do Amazon Redshift (consultas, instruções de DDL, cargas) são
confirmadas automaticamente no banco de dados.

-- START TRANSACTION
BEGIN;
DELETE FROM usuario WHERE id_usuario = 5;
SELECT * FROM usuario;
END;


BEGIN;
DELETE FROM usuario WHERE id_usuario = 5;
ROLLBACK;



BEGIN;
insert into tstdel values (1,'teste', current_timestamp);
ROLLBACK;

--Pausa redshift
-- Nota Associar a Role ao Cluster
Role_Administracao_RDFT_ia16_v1