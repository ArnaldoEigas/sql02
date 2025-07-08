---indica o uso do banco de dados
use bd_16_byciclon
---consulta as colunas da tabela 
select * from temporaria


---remover uma coluna da tabela

ALTER TABLE temporaria
DROP COLUMN coluna02

--- consultar as alterações

select * from temporaria;

---excluir a tabela temporaria
drop table temporaria;

ALTER TABLE tb_itens_pedidos
add idproduto int

insert into tb_cliente(idendereco, idregional, nome, email, cpf) values
(1,1, 'Jonas', 'jonas@gmail.com', '38745849644'),
(2,2, 'Dona', 'dona@gmail.com', '38745849633');

insert into tb_cliente values
('Pedro','Belfo Roxo'),
('Juan','Rio de Janeiro')
