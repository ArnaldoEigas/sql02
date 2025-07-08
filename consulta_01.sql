select 
  p.id_pedido,
  p.descricao,
  p.valor,
  c.id_cliente,
  c.nome,
  c.cidade
  from
    tb_pedidos p
	join 
	    tb_clientes c on p.fk_cliente = c.id_cliente
		order by c.nome;
