-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE  USUARIO (
	 codUsuario  int PRIMARY KEY,
	 nome             varchar(50),
	 email            varchar(100),
	 login            varchar(20),
	 senha            varchar(20),
	 dataCadastro     date,
	 dataNasc         date,
	 areaAtuacao      varchar(30),
	 profissao        varchar(30),
	 areaFormacao     varchar(30),
	 estadoCivil      varchar(15),
	 escolaridade     varchar(30),
	 estado           char(2)
);

CREATE TABLE  ENQUETE (
	 codEnquete 	 int PRIMARY KEY,
	 nome 			 varchar(30),
	 descricao	     varchar(50),
	 dataInicial     date,
	 dataFinal 		 date,
	 codUsuario 	 int, --chave estrangeira
	 FOREIGN KEY( codUsuario) REFERENCES  USUARIO (codUsuario)
);

CREATE TABLE  PERGUNTAS (
	 codPergunta  	int PRIMARY KEY,
	 descricao  	varchar(150),
	 codEnquete     int, --chave estrangeira
	 FOREIGN KEY( codEnquete) REFERENCES  ENQUETE (codEnquete)
);

CREATE TABLE  RESPOSTAS (
	 codResposta 	 int PRIMARY KEY,
	 descricao  	 varchar(150),
	 codPergunta 	 int, --chave estrangeira
	 FOREIGN KEY( codPergunta) REFERENCES  PERGUNTAS (codPergunta)
);

CREATE TABLE  responder (
	 codUsuario 	 int, --chave estrangeira
	 codEnquete  	 int, --chave estrangeira
	 data 			 date,
	 PRIMARY KEY(codUsuario, codEnquete), --chave estrangeira
	 FOREIGN KEY( codUsuario) REFERENCES  USUARIO (codUsuario),
	 FOREIGN KEY( codEnquete) REFERENCES  ENQUETE (codEnquete)
);

