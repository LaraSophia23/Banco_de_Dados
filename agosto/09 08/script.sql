-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
IDcliente int PRIMARY KEY,
nome varchar(50),
endereco varchar(30),
telefone varchar(15),
email varchar(100)
)

CREATE TABLE PEDIDO (
IDpedido int PRIMARY KEY,
IDcliente int,
data_pedido date,
status varchar(20),
FOREIGN KEY(IDcliente) REFERENCES CLIENTE (IDcliente)
)

CREATE TABLE ITEM_PEDIDO (
IDitem int PRIMARY KEY,
IDpedido int,
IDproduto int,
preco decimal(9,2),
quantidade numeric,
FOREIGN KEY(IDpedido) REFERENCES PEDIDO (IDpedido)
)

CREATE TABLE PRODUTO (
IDproduto int PRIMARY KEY,
nome varchar(50),
descricao varchar(100),
preco decimal(9,2),
estoque numeric
)

CREATE TABLE FATURA (
IDfatura int PRIMARY KEY,
IDpedido int,
valorTotal decimal(9,2),
data date,
FOREIGN KEY(IDpedido) REFERENCES PEDIDO (IDpedido)
)

ALTER TABLE ITEM_PEDIDO ADD FOREIGN KEY(IDproduto) REFERENCES PRODUTO (IDproduto)
