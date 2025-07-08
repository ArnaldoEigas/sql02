use bd_16_byciclon

select p.idpedido as CodPedido, pr.nome as Produto,
i.quantidade,
i.precounitario,
i.desconto
from tb_itens_pedidos i
join TB_PEDIDOS p on i.idpedido = p.idpedido
join tb_produtos pr on i.idproduto = pr.idproduto
where p.idpedido = 1

---listar os vendedores por regioao
select idvendedor as vendedor, email 
from tb_vendedores
--join tb_regional

select v.nome as Vendedor,
       v.email as Email,
	   r.nomeregional as Região
from tb_vendedores v
join tb_regional r on v .idregional = r.idregional;

---clientes e vendedores (por pedido)
select c.nome as Cliente, v.nome as Vendedor, p.datapedido
from TB_PEDIDOS p
join tb_cliente c on p.idcliente = c.idcliente
join tb_vendedores v on p.idvendedor = v.idvendedor;

---produtos com valor entre 2000 e 3000
select nome, valorunitario
from tb_produtos
where valorunitario between  2000 and 3000



