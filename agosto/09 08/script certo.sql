-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



	CREATE TABLE CLIENTE (
	IDcliente int PRIMARY KEY, --Chave primaria               not null
	nome 		varchar(50),not null
	endereco 	varchar(30),not null
	telefone	varchar(15),not null
	email 		varchar(100),not null
);

	CREATE TABLE PEDIDO (
	IDpedido 		int PRIMARY KEY, --Chave primaria                 not null
	IDcliente 		int,not null
	data_pedido 	date,not null
	status 			varchar(20),not null
	FOREIGN KEY(IDcliente) REFERENCES CLIENTE (IDcliente) --Chave estrangeira              not null
);

	CREATE TABLE ITEM_PEDIDO (
	IDitem 			int PRIMARY KEY,  --Chave primaria           --not null
	IDpedido 		int,not null
	IDproduto 		int,not null
	preco 			decimal(9,2),not null
	quantidade 		numeric,not null
	FOREIGN KEY(IDpedido) REFERENCES PEDIDO (IDpedido)    --Chave estrangeira            --not null
	FOREIGN KEY(IDproduto) REFERENCES PRODUTO (IDproduto) --Chave estrangeira           --not null
);

	CREATE TABLE PRODUTO (
	IDproduto 			int PRIMARY KEY, --Chave primaria         --not null
	nome 				varchar(50),not null
	descricao 			varchar(100),not null
	preco 				decimal(9,2),not null
	estoque 			numeric not null
);

	CREATE TABLE FATURA (
	IDfatura 			int PRIMARY KEY, --Chave primaria             --not null
	IDpedido 			int,not null
	valorTotal 			decimal(9,2),not null
	data 				date,not null
	FOREIGN KEY(IDpedido) REFERENCES PEDIDO (IDpedido)  --Chave estrangeira          --not null
);

ALTER TABLE ITEM_PEDIDO ADD 
