-- MySQL Script generated by MySQL Workbench
-- Fri Sep 13 08:09:33 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capacitacao` DEFAULT CHARACTER SET utf8 ;
USE `capacitacao` ;

-- -----------------------------------------------------
-- Table `capacitacao`.`INSTRUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`INSTRUTOR` (
  `idINSTRUTOR`		 INT(11) NOT NULL,
  `nome`			 VARCHAR(100) NOT NULL,
  `email`			 VARCHAR(100) NOT NULL,
  `valorHora`		 DOUBLE NOT NULL,
  `certificados`	 VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idINSTRUTOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`CURSO` (
  `idCURSO` 		INT(11) NOT NULL,
  `nome` 			VARCHAR(100) NOT NULL,
  `requisito`		VARCHAR(100) NOT NULL,
  `carga_horaria` 	DOUBLE NOT NULL,
  `preco`			DOUBLE NOT NULL,
  PRIMARY KEY (`idCURSO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`TURMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`TURMA` (
  `idTURMA` 				INT(11) NOT NULL,
  `carga_horaria` 			VARCHAR(100) NOT NULL,
  `data_inicial` 			DATE NOT NULL,
  `data_final` 				DATE NOT NULL,
  `INSTRUTOR_idINSTRUTOR`   INT(11) NOT NULL, -- chave estrangeira
  `CURSO_idCURSO` 			INT(11) NOT NULL, -- chave estrangeira
  PRIMARY KEY (`idTURMA`, `INSTRUTOR_idINSTRUTOR`, `CURSO_idCURSO`),
  -- INDEX `fk_TURMA_INSTRUTOR1_idx` (`INSTRUTOR_idINSTRUTOR` ASC) VISIBLE,
  -- INDEX `fk_TURMA_CURSO1_idx` (`CURSO_idCURSO` ASC) VISIBLE,
  CONSTRAINT `fk_TURMA_INSTRUTOR1`
    FOREIGN KEY (`INSTRUTOR_idINSTRUTOR`)
    REFERENCES `capacitacao`.`INSTRUTOR` (`idINSTRUTOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TURMA_CURSO1`
    FOREIGN KEY (`CURSO_idCURSO`)
    REFERENCES `capacitacao`.`CURSO` (`idCURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`ALUNO` (
  `idALUNO` 		INT(11) NOT NULL,
  `nome` 			VARCHAR(100) NOT NULL,
  `CPF`				VARCHAR(15) NOT NULL,
  `datanasc` 		DATE NOT NULL,
  `fone` 			CHAR(14) NOT NULL,
  `email` 			VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idALUNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`MATRICULA` (
  `idMATRICULA` 			INT(11) NOT NULL,
  `data_matricula` 			DATE NULL,
  `ALUNO_idALUNO` 			INT(11) NOT NULL, -- chave estrangeira
  `TURMA_idTURMA` 			INT(11) NOT NULL, -- chave estrangeira
  PRIMARY KEY (`idMATRICULA`),
  -- INDEX `fk_MATRICULA_ALUNO1_idx` (`ALUNO_idALUNO` ASC) VISIBLE,
  -- INDEX `fk_MATRICULA_TURMA1_idx` (`TURMA_idTURMA` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_ALUNO1`
    FOREIGN KEY (`ALUNO_idALUNO`)
    REFERENCES `capacitacao`.`ALUNO` (`idALUNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MATRICULA_TURMA1`
    FOREIGN KEY (`TURMA_idTURMA`)
    REFERENCES `capacitacao`.`TURMA` (`idTURMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;