use bd_16_byciclon

insert into tb_enderecos(pais, uf, cidade, bairro, rua, numero) values
('Brasil','SP','Centro','SÃO PAULO','Avenida Paulista',1240),
('Brasil','SP','Taboão','PQ PINHEIROS','Avenida Paulo Ayres',75),
('Brasil','RJ','Centro','Belfo Roxo','Rua da Fortuna',131);

insert into tb_regional(nomeregional, enderecoregional, telefoneregional) values
('sudeste','Av paulista 1439', '47885479'),
('sul','Rua da Fortuna', '47885477');

insert into tb_cliente(idendereco, idregional, nome, email, cpf) values
(1,1, 'Cida', 'cida@gmail.com', '38745849688'),
(2,2, 'Neia', 'neia@gmail.com', '38745849689'),
(1,1, 'Jonas', 'jonas@gmail.com', '38745849644'),
(2,2, 'Dona', 'dona@gmail.com', '38745849633');

insert into tb_vendedores(idendereco, idregional, nome, email, cpf) values
(1,1, 'Paulo', 'paulo@gmail.com', '38745849677'),
(2,2, 'Arnaldo', 'Arnaldo@gmail.com', '38745849655');

insert into tb_produtos(nome, linha, valorunitario) values
('Mountain Bike Specialized', 'MTB', 3500.90),
('Caloi Ceci', 'Speed', 2800.00),
('Barra Forte', 'MTB', 4000.10);

insert into tb_pedidos (idcliente, idvendedor, datapedido, qtitens, valortotal) values
(1,1,'2025-07-20',2,5000),
(2,2,'2025-07-21',2,5000),
(2,1,'2025-07-22',2,5000);

insert into tb_itens_pedidos(idpedido, idproduto, quantidade, precounitario, desconto) values
(1,1,1, 1600.00, 0.00),
(1,1,1, 9000.00, 0.00),
(1,1,1, 2600.00, 0.00);