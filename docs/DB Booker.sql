drop database if exists booker;
create database if not exists booker;
use booker;
-- MySQL Workbench Synchronization
-- Generated: 2017-09-29 11:25
-- Model: Booker
-- Version: 1.0
-- Project: Booker
-- Author: Moura

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER SCHEMA `booker`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `booker`.`usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `booker`.`livros` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `autor` VARCHAR(255) NOT NULL,
  `idUsuario` BIGINT,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_IDUSUARIO FOREIGN KEY(`idUsuario`) REFERENCES usuarios(id))
  DEFAULT CHARACTER SET = utf8;

select * from usuarios;
select * from livros;
insert into livros(titulo, autor, idUsuario) values("Capitães Da Areia", "Jorge Amado", 1);
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
