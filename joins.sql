use bd_16_byciclon

--- relacionar tb_cliente --> tb_enderecos
ALTER TABLE tb_cliente
ADD constraint fk_pedidos_cliente_endereco
FOREIGN KEY (idendereco) references tb_enderecos(idendereco)

--- relacionar tb_cliente --> tb_regional
ALTER TABLE tb_cliente
ADD constraint fk_cliente_regional
FOREIGN KEY (idregional) references tb_regional(idregional)

--- relacionar tb_vendedores --> tb_enderecos
ALTER TABLE tb_vendedores
ADD constraint fk_vendedores_endereco
FOREIGN KEY (idendereco) references tb_enderecos(idendereco)

--- relacionar tb_vendedores --> tb_regional
ALTER TABLE tb_vendedores
ADD constraint fk_vendedores_regional
FOREIGN KEY (idregional) references tb_regional(idregional)

--- relacionar tb_pedidos --> tb_cliente
ALTER TABLE tb_pedidos
ADD constraint fk_pedidos_cliente
FOREIGN KEY (idcliente) references tb_cliente(idcliente)

--- relacionar tb_pedidos --> tb_vendedores
ALTER TABLE tb_pedidos
ADD constraint fk_pedidos_vendedores
FOREIGN KEY (idvendedores) references tb_vendedores(idvendedor)

--- relacionar tb_itens_pedidos --> tb_pedidos
ALTER TABLE tb_itens_pedidos
ADD constraint fk_itens_pedidos_tb_pedidos
FOREIGN KEY (idpedido) references tb_pedidos(idpedido)

--- relacionar tb_itens_pedidos --> tb_produtos
ALTER TABLE tb_itens_pedidos
ADD constraint fk_itens_pedidos_produtos
FOREIGN KEY (idproduto) references tb_produtos(idproduto)




