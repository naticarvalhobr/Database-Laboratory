CREATE DATABASE loja;

USE loja;

/* Not null, unique, default, primary key, check */
CREATE TABLE cliente (
	id_cliente int not null auto_increment,
    nome varchar(30) not null,
    cpf int(11) not null unique, 
    telefone int(11) not null,
    cidade varchar(30) default ('Brasilia'),
    idade int(3) not null,
    check ((idade > 0) and (idade <= 100)),
    primary key (id_cliente)
);

/* not null, primary key, unique, default, check */
CREATE TABLE vendedor (
	id_vendedor int not null auto_increment primary key,
    nome varchar(30) not null,
    cpf int(11) not null unique,
    cargo varchar(15) not null,
    depart varchar(25) not null default ('Geral'),
    idade int(3) not null,
	check ((idade > 0) and (idade <= 100))
);

/* not null, primary key */ 
CREATE TABLE pedido (
	id_pedido int not null auto_increment,
    data_pedido int(8) not null,
    primary key (id_pedido)
);

/* not null, primary key */
CREATE TABLE produto (
	id_produto int not null auto_increment primary key,
    fabrica varchar(30) not null
);

