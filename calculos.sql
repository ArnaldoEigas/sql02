use bd_16_byciclon

---Tabelas do Banco de dados
SELECT name FROM sys.tables ORDER BY name;

---Campo da tabela pedidos
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tb_pedidos'

---total de clientes pro estado.
SELECT e.uf, COUNT(*) AS total_clientes
FROM tb_cliente c
JOIN tb_enderecos e ON c.idendereco = e.idendereco
GROUP BY e.uf
ORDER BY total_clientes DESC;

---Nome dos clientes e valor total que cada um ja gastou
SELECT 
	c.nome As cliente,
	sum(p.valortotal) As TotalGasto
from tb_cliente c
JOIN tb_pedidos p ON c.idcliente = p .idcliente
group by c.nome 
order by TotalGasto DESC;

---valor total de pedidos por cliente e estatistica de calculo
select
c.nome AS Cliente,
sum(p.valortotal) AS TotalGasto,
avg(p.valortotal) AS MediaporPedido,
min(p.valortotal) AS PedidomaisBarato,
max(p.valortotal) AS Pedidomaiscaro
from tb_cliente c
join TB_PEDIDOS p ON c.idcliente = p.idcliente
group by c.nome

---Pedidos por mes com media de valor
---para ano uso year() e para dia uso day()
select 
MONTH(datapedido) AS Mes,
COUNT(*) AS TotaldePedidos,
avg(valortotal) AS MediaPedido
from TB_PEDIDOS
group by MONTH(datapedido)
order by Mes;



SELECT TOP 3
     c.nome AS Cliente,
	 sum(p.valortotal) AS 'Total Gasto'
	 FROM tb_cliente c
	 JOIN TB_PEDIDOS p ON c.idcliente = p.idcliente
	 GROUP BY c.nome
	 ORDER BY 'Total Gasto' DESC;

---/* Qual o cliente comprou o maior numero de produtos no mês passado, 
e quanto ele gastou no total */


SELECT c.nome AS Cliente,
SUM(i.quantidade) AS TotalComprado,
FORMAT(sum ((i.precounitario * i.quantidade)- i.desconto), 'C', 'pt-br') AS ValorGasto
FROM TB_PEDIDOS p
	 JOIN tb_cliente c ON p.idcliente = c.idcliente
	 JOIN tb_itens_pedidos i ON p.idpedido = i.idpedido
	 WHERE 
	 p.datapedido BETWEEN '2025-07-01' AND '2025-07-30'
	 GROUP BY c.nome
	 ORDER BY TotalComprado DESC;
---
---listar todas as FK  de uma tabela
EXEC sp_fkeys 'tb_cliente';