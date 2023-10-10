--Filtrando dados usando AWS Redshift SQL
--Filtrando de dados usando AND no Redshift SQL

--Usando a cláusual WHERE
'Nota:' -- A Cláusula WHERE vai fazer um filtro e exibir como resultado, somente as linhas
-- que atenderem a condição, ou seja, a cláusual WHERE impoe uma condição(uma regra). 

SELECT * 
FROM date 
WHERE month = 'JAN';

SELECT
    salesid,
    qtysold,
    pricepaid,
    commission
FROM sales
WHERE qtysold > 4;

--Calculo de comissão
SELECT
    salesid,
    qtysold,
    pricepaid,
    commission,
    (commission/pricepaid)*100 as Percomission
FROM sales
WHERE qtysold > 4;

--Usando a cláusual AND 
'Nota:' -- A Cláusula AND vai fazer um filtro e exibir como resultado, somente as linhas
-- que atenderem a condição, ou seja, a cláusual AND impoe uma segunda condição(uma regra).

SELECT * 
FROM date 
WHERE month = 'JAN'
AND holiday ='TRUE'

SELECT * 
FROM date 
WHERE month = 'JAN'
AND holiday ='FALSE'
AND day = 'MO'

--Usando a cláusual OR 
'Nota:' -- A Cláusula OR vai fazer um filtro e exibir como resultado, as linhas 
-- que atenderem uma condição ou outra.


SELECT 
    qtysold,
    pricepaid
FROM sales
WHERE qtysold = 8
OR pricepaid > 9000


SELECT 
    firstname,
    city,
state 
FROM users
WHERE city = 'Alameda'
OR state = 'TX';

--Usando o OPERADOR IN
SELECT 
    day,
    week,
    month 
FROM date
WHERE month IN ('OCT', 'NOV', 'DEC');

SELECT 
    day,
    week,
    month 
FROM date
WHERE month NOT IN ('OCT', 'NOV', 'DEC');

SELECT 
    firstname,
    city,
state 
FROM users
WHERE city IN('Alameda','Lomita');


--Filtrando dados usando o operador LIKE no Redshift SQL

--Todas as cidades que iniciam com a Letra E
SELECT 
    city 
FROM users
WHERE city like 'E%';


--Todas as cidades que iniciam com a Letra E e a terceira letra é um i.
SELECT 
    city 
FROM users
WHERE city like 'E_i%';


--Todas as cidades tem a letra i na segunda posição (%) o que foi depois não importa
SELECT 
    city 
FROM users
WHERE city like '_i%';


--Todas as cidades que tem a letra a em seu nome
SELECT 
    city 
FROM users
WHERE city like '%a%';


--Todas as cidades que terminam com a letra a
SELECT 
    city 
FROM users
WHERE city like '%a';
