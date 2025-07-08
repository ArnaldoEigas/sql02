EXEC sp_help 'tb_produtos'

select COLUMN_NAME,
       DATA_TYPE,
	   CHARACTER_MAXIMUM_LENGTH,
	   IS_NULLABLE
	   FROM INFORMATION_SCHEMA.COLUMNS
	   WHERE TABLE_NAME = 'tb_produtos';
---Chave primaria da tabella
exec sp_pkeys 'tb_pedidos'

---Chave estrangeira  da tabela.

exec sp_fkeys 'tb_pedidos'


---ver todas as tabelas do banco de dados
select name
from sys.tables
order by name desc; --- ASC para ascendente e DESC para descendente.

select cidade, count(*) AS total
from tb_enderecos
group by cidade
order by total desc;

--por estado
select uf, count(*) AS total
from tb_enderecos
group by uf
order by total desc;
