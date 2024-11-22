-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE FORNECEDOR (
	codFornecedor 	int 			PRIMARY KEY, --chave primaria 
	nome 			varchar(50),    not null
	 endereco 		varchar(50),    not null
	 telefone 		varchar(15),    not null
	cidade 			varchar(30),    not null
	estado 			char (2)        not null
);

CREATE TABLE OC (
    PRIMARY KEY, -chave primaria    not null
	codOC 				int         not null
	dataEmissao 		date,       not null
	ValorTotal 			numeric,    not null
	nomeResponsavel 	varchar(30),not null
	codFornecedor 		int,        not null
	FOREIGN KEY(codFornecedor) REFERENCES FORNECEDOR (codFornecedor) --chave estrangeira
);

CREATE TABLE MATERIAL (
     PRIMARY KEY, --chave primaria   
	codMaterial int               not null
	quantidade int,               not null
	descricao varchar(100),       not null
	valorUni nuneric,             not null
	valorTotal numeric            not null
);

CREATE TABLE itemCompra ( 
    PRIMARY KEY, --chave primaria
	codigoIC int              not null
	 codMaterial int,         not null
	 codOC int,               not null
	FOREIGN KEY( codMaterial)  --chave estrangeira
	REFERENCES MATERIAL (codMaterial), 
	FOREIGN KEY( codOC)     --chave estrangeira
	REFERENCES OC (codOC) --chave estrangeira
);

