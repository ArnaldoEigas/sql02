


---insere uma coluna de estoque com valor padrao em zero

use bd_16_byciclon

ALTER TABLE tb_produtos
ADD estoque int default 0;

---ver todos os produtos dentro da tabela 
select * from tb_produtos

---atualizar os valores da tabela de produtos 
update tb_produtos set estoque = 15 where nome = 'Barra Forte';
update tb_produtos set estoque = 10 where nome = 'Caloi Ceci';
update tb_produtos set estoque = 9 where nome = 'Mountain Bike Specialized';

---confirmar se os dados foram atualizados
select * from tb_produtos

---criar uma coluna com o valor total por item
ALTER TABLE tb_produtos
ADD valortotal int default 0;
--traz o valor de valor em estoque multiplicando a quantidade
select
nome,
valorunitario,
estoque,
(valorunitario * estoque) AS valortotalestoque
from tb_produtos

insert into tb_produtos(nome, linha, valorunitario, estoque) values
('Bike Speed Specialized', 'MTB', 2200.00, 0);

select * from tb_produtos

update tb_produtos set estoque = 20 where nome = 'Bike Speed Specialized';

select * from tb_produtos

select
nome,
valorunitario,
estoque,
(valorunitario * estoque) AS valortotalestoque,
(valorunitario * estoque) * 0.05 AS Desconto,
(valorunitario * estoque) * 0.95 AS Valorfinal

from tb_produtos
where nome = 'Super Speed Specialized';
--ATUALIZAR O ESTOQUE DAS BICICLETAS RECEM ADQUIRIDA

insert into tb_produtos(nome, linha, valorunitario, estoque) values
('Super Speed Specialized', 'MTB', 9000.00, 0);

---só se for imediamente apos o insert

DECLARE @id INT = SCOPE_IDENTITY();
UPDATE tb_produtos set estoque = 16
where idproduto = @id;

select * from tb_produtos

---select com format e join realizando calculos.
select
   i.idpedido,
   p.nome AS Produto,
   i.quantidade,
   FORMAT(i.precounitario, 'C', 'pt-br') AS PrecoUnitario,
   FORMAT(i.desconto, 'C', 'pt-br') AS desconto,
   FORMAT((i.quantidade * i.precounitario)-i.desconto, 'C', 'pt-br') AS valorF
   FROM tb_itens_pedidos i
   JOIN tb_produtos p ON i.idproduto = p.idproduto

   ---select * from tb_produtos

   select * from tb_itens_pedidos

   update tb_itens_pedidos set desconto = 200 where iditem = 1 
--inserindo as informaçoes pendentes.
		   update tb_itens_pedidos set idproduto = 1 where iditem = 1
		   update tb_itens_pedidos set idproduto = 2 where iditem = 2
			update tb_itens_pedidos set idproduto = 3 where iditem = 3
			 
---define um desconto de 10% globalmente
DECLARE @descontoGlobal DECIMAL(5,2) = 0.10;
SELECT 
nome,
FORMAT (valorunitario, 'C', 'pt-br') AS ValorUnitario,
estoque,
FORMAT(valorunitario * estoque, 'C', 'pt-br') AS TotalBruto,
FORMAT(valorunitario * estoque *(1-@descontoGlobal), 'C', 'pt-br') AS TotalComDesconto
FROM tb_produtos

---utilisando a função CASE
SELECT
 nome,
 valorunitario,
 CASE
		WHEN valorunitario >= 4000 THEN 'Premiun'
		WHEN valorunitario >= 3000 THEN 'standard'
		else 'Basic'
 END AS CATEGORIA
FROM tb_produtos


---UTILIZANDO O FORMAT JUNTO COM O CASE.
SELECT
 nome,
 FORMAT(valorunitario, 'C','pt-br'),
 CASE
		WHEN valorunitario >= 4000 THEN 'Premiun'
		WHEN valorunitario >= 3000 THEN 'standard'
		else 'Basic'
 END AS CATEGORIA
FROM tb_produtos

---traz o item que esta com estoque baixo

select nome, estoque FROM tb_produtos where estoque <= 15;

select * from tb_produtos

--apagar um dado da tabela

DELETE FROM tb_produtos WHERE idproduto = 3;

---apagar somente se existir o valor a ser apagado
IF EXISTS (SELECT 1 FROM tb_produtos WHERE idproduto = 2)
DELETE FROM tb_produtos WHERE idproduto = 2

--apagar a tabela rm modo destrutivo
---DROP TABLE tb_produtos

---apagar em modo seguro
/*IF OBJECT_ID('tb_produtos', 'U') IS NOT NULL
    DROP TABLE tb_produtos;
*/

---APAGAR UM BANCO DE DADOS COMPLETO.
DROP DATABASE db_Pedidos
---consultar a exixtencia do banco
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'db_pedidos')
select * from db_pedidos

---
---


