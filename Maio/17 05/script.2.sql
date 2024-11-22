-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE  DEPARTAMENTO (
idDepartamento int PRIMARY KEY,
nome varchar(50),
localizacao varchar(30)
)

CREATE TABLE COLABORADOR (
idColaborador int PRIMARY KEY,
nome varchar(50),
 CPF varchar(15),
dataAdmissao date,
idGerente int,           --chave estrangeira
idDepartamento int, -- atributo gerado do auto relacionamento a partir da chave primária do idColaborador
FOREIGN KEY(idDepartamento) REFERENCES  DEPARTAMENTO (idDepartamento)
)

