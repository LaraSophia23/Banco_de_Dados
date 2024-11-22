create database pedido;

use pedido;

create table cliente (
	idCliente  		int not null primary key auto_increment,
    nome 	  		varchar(50) not null,
    endereco   		varchar(30) not null,
    telefone   		varchar(15) not null,
    email 	  		varchar(100)
);

create table produto (
	idProduto 		int not null primary key auto_increment,
    nome 	   		varchar(50) not null,
    descricao   	varchar(100) not null,
    preco 			decimal(9,2) not null,
    estoque 		int not null
);

create table pedido (
	idPedido		int not null primary key auto_increment,
    idCliente		int not null,  -- chave estrangeira
    dataPedido  	date not null, 
    statusPedido	varchar(20) not null,
    foreign key (idCliente) references Cliente (idCliente)
);

create table fatura (
	idFatura 		int not null primary key auto_increment,
    idPedido		int not null, -- chave estrangeira
    dataFatura		date not null,
    valorTotal		decimal(9,2) not null,
    foreign key (idPedido) references Pedido (idPedido)
);

create table ItemPedido (
	idItemPedido	int not null primary key auto_increment,
    idPedido		int not null, -- chave estrangeira
    idProduto		int not null, -- chave estrangeira
    quantidade 		int not null,
    preco 			decimal(9,2) not null,
    foreign key (idPedido) references Pedido (idPedido),
    foreign key (idProduto) references Produto (idProduto)
);