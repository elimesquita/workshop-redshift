--## Criar usuário do banco de dados Redshift 
--## Criar banco de dados Redshift

-- Criar usuário do banco de dados Redshift 
-- Referência: https://docs.aws.amazon.com/pt_br/redshift/latest/dg/r_CREATE_USER.html

--Sintaxi Simplificada
CREATE USER usuario PASSWORD  'password';

-- A senha deve atender às seguintes restrições:

--Deve ter de 8 a 64 caracteres.
--Deve conter pelo menos uma letra maiúscula, uma letra minúscula e um número.
--Pode conter qualquer caractere ASCII com códigos ASCII 33–126, exceto aspas simples ('), aspas duplas ("), \, / ou @.

--Abrir o Query Editor V1 com usuários ia16
--Abrir o Query Editor V1 com usuários usuário do aluno
SELECT usename FROM pg_user;
CREATE USER eliezio PASSWORD 'iA162023';


--## ATENÇÃO--CONECTAR NO QUERY EDITOR COM O NOVO USUÁRIO

SELECT * FROM public.sales LIMIT 5;

--Liberar acesso individual a tabela
GRANT SELECT ON TABLE public.sales TO eliezio; 
SELECT * FROM public.date;

--Liberar acesso a todas as tabelas do Schema(public)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO eliezio; 

