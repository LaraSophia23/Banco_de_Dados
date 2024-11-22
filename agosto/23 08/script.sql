-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



	CREATE TABLE CLIENTE (
	clienteID int PRIMARY KEY, not null --Chave primaria
	email varchar(100),        not null
	nome varchar(100),		   not null	  
	telefone varchar(12),      not null	  
	endereco varchar(100),     not null
	dataCadastro date,         not null
	status varchar(15)         not null
);

	CREATE TABLE PESSOA FISICA (
	clienteID int,              not null
	estado civil varchar(10),   not null
	sexo char,                  not null
	habilitação varchar(15),    not null
	profissão varchar(50),      null
	CPF varchar(15),            not null
	RG varchar(15),             not null
	clienteID int,              not null 
	faixa renda decimal(9,2),   null
	dataNasc date,              not null
	FOREIGN KEY(clienteID) REFERENCES CLIENTE (clienteID)  not null --chave estrangeira
) ;

	CREATE TABLE PESSOA JURIDICA (
	clienteID int,                       not null
	ramo atividade varchar(50),          null
	contato responsavel varchar(100),    null
	razão social varchar(100),           not null
	inscrição estadual Texto(1),         not null
	CNPJ varchar(15),                    not null
	FOREIGN KEY(clienteID) REFERENCES CLIENTE (clienteID)  not null --chave estrangeira
);

	CREATE TABLE veiculo (
	numero registro int PRIMARY KEY,  not null --Chave primaria
	clienteID int,                    not null
	marca varchar(20),                not null
	modelo varchar(20),               not null
	ano fabricação int,               not null
	tipo varchar(20),                 not null
	placa varchar(10),                not null
	FOREIGN KEY(clienteID) REFERENCES CLIENTE (clienteID)  not null --chave estrangeira
);

	CREATE TABLE acidente (
	numeroID int PRIMARY KEY, not null --Chave primaria
	numero registro int,
	localAcidente varchar(100),
	dataAcidente date,
	descrição varchar(200),
	hora time,
	FOREIGN KEY(numero registro) REFERENCES veiculo (numero registro)
);

	CREATE TABLE APOLICE (
	numero int PRIMARY KEY, not null --Chave primaria
	valor decimal(9,2),
	descrição varchar(100),
	numero registro int,
	FOREIGN KEY(numero registro) REFERENCES veiculo (numero registro)
);

