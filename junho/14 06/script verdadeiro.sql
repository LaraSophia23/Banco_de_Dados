-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



	CREATE TABLE DEPARTAMENTO (
	numeroDepart int 		NOT NULL PRIMARY KEY, --Chave Primária
	nome varchar(30) 		NOT NULL
);
	CREATE TABLE DISCIPLINA (
	numeroDisci int 		NOT NULL PRIMARY KEY, --Chave Primária
	nome varcha(30),		NOT NULL
	cargaHoraria numeric 	NOT NULL
);

	CREATE TABLE PROFESSOR (
	numeroProfessor Texto(1) 	NOT NULL PRIMARY KEY, --Chave Primária
	nome varchar(30),			NOT NULL
	titulo varchar(50)			NOT NULL
);	

	CREATE TABLE CURSOS (
	numeroCurso int                   NOT NULL PRIMARY KEY, --Chave Primária
	nome varchar(30),                 NOT NULL
	numeroDepart int,                 NOT NULL 
	FOREIGN KEY(numeroDepart)         NOT NULL --Chave Estrangeira
	REFERENCES DEPARTAMENTO (numeroDepart)  NOT NULL
);

	CREATE TABLE ALUNO (
	numeroRA int PRIMARY KEY,        NOT NULL --Chave Primária
	status varchar(15),              NOT NULL
	nome varchar(50),                NOT NULL
	numeroCurso int,                 NOT NULL
	FOREIGN KEY(numeroCurso) REFERENCES CURSOS (numeroCurso) NOT NULL --Chave Estrangeira
);

	CREATE TABLE HISTORICO (
	ID int PRIMARY KEY,                      NOT NULL --Chave Primária
	nota decima(9,2),                        NOT NULL
	falta numeric,                           NOT NULL
	situacao varchar(15),                    NOT NULL
	numeroRA int,                            NOT NULL --Chave Estrangeira
	numeroDisci int,                         NOT NULL --Chave Estrangeira
	numeroProfessor Texto(1),                NOT NULL --Chave Estrangeira
	FOREIGN KEY(numeroRA)  REFERENCES ALUNO (numeroRA) NOT NULL   
	FOREIGN KEY(numeroDisci) REFERENCES DISCIPLINA (numeroDisci)  
	FOREIGN KEY(numeroProfessor) REFERENCES PROFESSOR (numeroProfessor)   
	 
);


	CREATE TABLE lecionar (
	ID int PRIMARY KEY,                 NOT NULL --Chave Primária
	numeroDisci int,                    NOT NULL
	numeroProfessor Texto(1),           NOT NULL
	FOREIGN KEY(numeroDisci)            NOT NULL --Chave Estrangeira
	REFERENCES DISCIPLINA (numeroDisci),NOT NULL
	FOREIGN KEY(numeroProfessor) REFERENCES PROFESSOR (numeroProfessor)NOT NULL --have Estrangeira
	 
);

 
