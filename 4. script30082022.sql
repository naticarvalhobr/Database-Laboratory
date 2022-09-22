create database biblioteca;

use biblioteca;

CREATE TABLE livros (
	ID int not null auto_increment,
    titulo varchar(50) not null,
    autor varchar(30) not null,
	primary key(ID)
);

CREATE TABLE revistas (
	ID int not null auto_increment,
	titulo varchar(50) null,
	autor varchar(30) null,
    primary key(ID)
);

select * from livros; 
ALTER TABLE livros ADD editora varchar(30); /* adicionar nova coluna */
ALTER TABLE livros DROP COLUMN editora; /* remover um campo da tabela */
ALTER TABLE livros CHANGE COLUMN autor autores varchar(50) not null; /* alterar o nome e o tipo de dado do campo da tabela */
ALTER TABLE livros MODIFY COLUMN autores varchar(80) not null; /* alterar o tipo do campo da tabela */

select * from revistas;
ALTER TABLE revistas ADD editora varchar(30);
ALTER TABLE revistas DROP COLUMN editora;
drop table revistas;
