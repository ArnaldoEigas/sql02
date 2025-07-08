--- criar o banco de dados Byciclon

CREATE DATABASE bd_16_byciclon
go
use bd_16_byciclon
go


---criar a tabela tb_cliente
CREATE TABLE tb_cliente(
    idcliente int primary key identity(1,1), --COLUNA NUMERICA DO TIPO AUTONUMERAÇÃO.
	idendereco INT NOT NULL,  -- CAMPO NUMERICO PARA FK
	idregional INT NOT NULL, -- CAMPO NUMERICO PARA FK
	nome varchar(40) not null, -- campo texto
	email varchar(40) NOT NULL, -- CAMPO DE TEXTO
	CPF VARCHAR(11) NOT NULL -- CAMPO 
);

CREATE TABLE tb_vendedores(
      idvendedor int primary key identity(1,1),
	  idendereco int not null,
	  idregional int not null,
	  nome varchar(40) not null,
	  email varchar(30) not null, 
	  cpf varchar(11) not null
);

create table tb_produtos(
       idproduto int identity(1,1) primary key,
	   nome varchar(255) not null,
	   linha varchar(255) not null,
	   valorunitario MONEY NOT NULL,
);

CREATE TABLE TB_PEDIDOS(
       idpedido int identity (1,1) primary key,
	   idcliente int not null,
	   idvendedor int not null,
	   datapedido date not null,
	   qtitens int not null,
	   valortotal money not null
);

CREATE TABLE tb_itens_pedidos(
       iditem INT IDENTITY (1,1) PRIMARY KEY,
	   idpedido INT NOT NULL,
	   idproduto INT NOT NULL,
	   quantidade INT NOT NULL,
	   precounitario money not null,
	   desconto money not null
);

CREATE TABLE tb_regional(
       idregional int primary key identity (1,1),
	   nomeregional varchar (50) not null,
	   enderecoregional varchar (255),
	   telefoneregional varchar (50)

);

CREATE TABLE tb_enderecos(
       idendereco int identity (1,1) primary key,
	   pais varchar (50) not null,
	   uf varchar (50) not null,
	   cidade varchar (50) not null,
	   bairro varchar (50) not null,
	   rua varchar (50) not null,
	   numero int not null
);
CREATE TABLE temporaria(
      coluna int,
	  coluna02 int
);