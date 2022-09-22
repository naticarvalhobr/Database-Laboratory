CREATE DATABASE exercicio;

USE exercicio;

/* Relacionamento 1:1 */

CREATE TABLE cliente (
	ID_cliente int (3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	endereco varchar(30) not null
);

CREATE TABLE conta (
	ID_conta int (3) PRIMARY KEY AUTO_INCREMENT,
	ID_cliente int (3),
	numero int(11) not null, 
	CONSTRAINT FK_cliente FOREIGN KEY (ID_cliente) REFERENCES cliente (ID_cliente)
);

/* Relacionamento 1:N */

CREATE TABLE aluno (
	ID_aluno int (3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	matricula int(11) not null
);

CREATE TABLE telefone (
	ID_telefone int (3) PRIMARY KEY AUTO_INCREMENT,
	ID_aluno int (3),
	numero int(11) not null, 
	DDD int(3) not null,
	CONSTRAINT FK_aluno FOREIGN KEY (ID_aluno) REFERENCES aluno (ID_aluno)
);

/* Relacionamento N:N */

CREATE TABLE loja (
	ID_loja int (3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	endereco varchar(30) not null
);

CREATE TABLE produto (
	ID_produto int (3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	tipo varchar(30) not null
);

CREATE TABLE loja_produto (
	ID_loja int (3),
	ID_produto int (3),
	data_compra date,
	CONSTRAINT PK_loja_produto PRIMARY KEY (ID_loja, ID_produto),
	CONSTRAINT FK_loja FOREIGN KEY (ID_loja) REFERENCES loja (ID_loja),
	CONSTRAINT FK_produto FOREIGN KEY (ID_produto) REFERENCES produto (ID_produto)
);

