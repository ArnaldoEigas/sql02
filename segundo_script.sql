
use db_16_vendas

create table tb_clientes(
  id_cliente int identity (1,1) primary key ,
  nome varchar(50) not null,
  cidade varchar(255)

);

create table tb_pedidos(
  id_pedido int identity (1,1) primary key,
  descricao varchar (255) not null,
  valor money not null,
  fk_cliente int,
  foreign key (fk_cliente) references tb_clientes(id_cliente)
);

insert into tb_clientes values
('caio','São Paulo'),
('Arnaldo','Taboão'),
('Andressa','Bahia'),
('Rodrigo','Guarulhos'),
('Pedro','Belfo Roxo'),
('Gabriel','Brasilia')

insert into tb_pedidos values
('camisa preta',120,1),
('jaqueta cinza',250,1),
('calça jeans',300,2),
('meia do mickey',10,3)

select * from tb_clientes

select * from tb_pedidos
