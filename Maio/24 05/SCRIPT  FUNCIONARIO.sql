-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE  FUNCIONARIO (
	matricula int PRIMARY KEY, --CHAVE PRIMARIA
	nome varchar(30),
	dataNasc date,
	nacionalidade varchar(30),
	sexo varchar(10),
	estadoCivil varchar(15),
	RG varchar(15),
	CPF varchar(15),
	endereco varchar(50),
	telefone  varchar(15),
	dataAdmissao date
)

CREATE TABLE CARGOS (
	idCargos Texto(1) PRIMARY KEY, --CHAVE PRIMARIA
	nomeCargo varchar(30),
	dataInicio date,
	dataFim date
)

CREATE TABLE  DEPENDENTES (
	idDependentes Texto(1) PRIMARY KEY, --CHAVE PRIMARIA
	nome varchar(30),
	dataNasc date,
	matricula int,
	FOREIGN KEY(matricula) REFERENCES  FUNCIONARIO (matricula) --CHAVE ESTRANGEIRA
)

CREATE TABLE ocupar (
	idCargos Texto(1),
	matricula int,
	PRIMARY KEY(idCargos,matricula), --CHAVE PRIMARIA COMPOSTA
	FOREIGN KEY(idCargos) REFERENCES CARGOS (idCargos),   --CHAVE ESTRANGEIRA
	FOREIGN KEY(matricula) REFERENCES  FUNCIONARIO (matricula) --CHAVE ESTRANGEIRA
)

