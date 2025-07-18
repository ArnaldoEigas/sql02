USE [bd_16_byciclon]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[idendereco] [int] NOT NULL,
	[idregional] [int] NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[CPF] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_enderecos]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_enderecos](
	[idendereco] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[uf] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idendereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_itens_pedidos]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_itens_pedidos](
	[iditem] [int] IDENTITY(1,1) NOT NULL,
	[idpedido] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[precounitario] [money] NOT NULL,
	[desconto] [money] NOT NULL,
	[idproduto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iditem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PEDIDOS]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PEDIDOS](
	[idpedido] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[datapedido] [date] NOT NULL,
	[qtitens] [int] NOT NULL,
	[valortotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_produtos]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_produtos](
	[idproduto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[linha] [varchar](255) NOT NULL,
	[valorunitario] [money] NOT NULL,
	[estoque] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idproduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_regional]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_regional](
	[idregional] [int] IDENTITY(1,1) NOT NULL,
	[nomeregional] [varchar](50) NOT NULL,
	[enderecoregional] [varchar](255) NULL,
	[telefoneregional] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idregional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_vendedores]    Script Date: 10/07/2025 17:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_vendedores](
	[idvendedor] [int] IDENTITY(1,1) NOT NULL,
	[idendereco] [int] NOT NULL,
	[idregional] [int] NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idvendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_produtos] ADD  DEFAULT ((0)) FOR [estoque]
GO
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [fk_cliente_regional] FOREIGN KEY([idregional])
REFERENCES [dbo].[tb_regional] ([idregional])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [fk_cliente_regional]
GO
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [fk_pedidos_cliente_endereco] FOREIGN KEY([idendereco])
REFERENCES [dbo].[tb_enderecos] ([idendereco])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [fk_pedidos_cliente_endereco]
GO
ALTER TABLE [dbo].[tb_itens_pedidos]  WITH CHECK ADD  CONSTRAINT [fk_itens_pedidos_produtos] FOREIGN KEY([idproduto])
REFERENCES [dbo].[tb_produtos] ([idproduto])
GO
ALTER TABLE [dbo].[tb_itens_pedidos] CHECK CONSTRAINT [fk_itens_pedidos_produtos]
GO
ALTER TABLE [dbo].[tb_itens_pedidos]  WITH CHECK ADD  CONSTRAINT [fk_itens_pedidos_tb_pedidos] FOREIGN KEY([idpedido])
REFERENCES [dbo].[TB_PEDIDOS] ([idpedido])
GO
ALTER TABLE [dbo].[tb_itens_pedidos] CHECK CONSTRAINT [fk_itens_pedidos_tb_pedidos]
GO
ALTER TABLE [dbo].[TB_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [fk_pedidos_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[tb_cliente] ([idcliente])
GO
ALTER TABLE [dbo].[TB_PEDIDOS] CHECK CONSTRAINT [fk_pedidos_cliente]
GO
ALTER TABLE [dbo].[TB_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PEDIDOS_tb_vendedores] FOREIGN KEY([idvendedor])
REFERENCES [dbo].[tb_vendedores] ([idvendedor])
GO
ALTER TABLE [dbo].[TB_PEDIDOS] CHECK CONSTRAINT [FK_TB_PEDIDOS_tb_vendedores]
GO
ALTER TABLE [dbo].[tb_vendedores]  WITH CHECK ADD  CONSTRAINT [fk_vendedores_endereco] FOREIGN KEY([idendereco])
REFERENCES [dbo].[tb_enderecos] ([idendereco])
GO
ALTER TABLE [dbo].[tb_vendedores] CHECK CONSTRAINT [fk_vendedores_endereco]
GO
ALTER TABLE [dbo].[tb_vendedores]  WITH CHECK ADD  CONSTRAINT [fk_vendedores_regional] FOREIGN KEY([idregional])
REFERENCES [dbo].[tb_regional] ([idregional])
GO
ALTER TABLE [dbo].[tb_vendedores] CHECK CONSTRAINT [fk_vendedores_regional]
GO
