CREATE DATABASE desafio;

USE desafio;

CREATE TABLE professor (
	prof_ID int(3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	rua varchar(20) not null,
    cidade varchar(20) not null
);

CREATE TABLE aluno (
	aluno_ID int(3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	rua varchar(20) not null,
    cidade varchar(20) not null
);

CREATE TABLE disciplina (
	disc_ID int(3) PRIMARY KEY AUTO_INCREMENT,
	nome varchar(30) not null,
	qtd_aulas int(3) not null
);

CREATE TABLE matricula ( /* Tabela intermediaria */
	aluno_ID int (3),
	disc_ID int (3),
	ano year,
	CONSTRAINT PK_matricula PRIMARY KEY (aluno_ID, disc_ID),
	CONSTRAINT FK_aluno FOREIGN KEY (aluno_ID) REFERENCES aluno (aluno_ID),
	CONSTRAINT FK_disciplina FOREIGN KEY (disc_ID) REFERENCES disciplina (disc_ID)
);

CREATE TABLE professor_disciplina ( /* Tabela intermediaria */
	prof_ID int (3),
	disc_ID int (3),
	ano int(4),
	CONSTRAINT PK_professor_disciplina PRIMARY KEY (prof_ID, disc_ID),
	CONSTRAINT FK_professor FOREIGN KEY (prof_ID) REFERENCES professor (prof_ID),
	CONSTRAINT FK_disciplina1 FOREIGN KEY (disc_ID) REFERENCES disciplina (disc_ID)
);

select * from professor;
insert into professor values (0, 'Ana', 'Rua das Violetas', 'Goiania'), (0, 'Pedro', 'Rua das Margaridas', 'Goiania'), (0, 'Joao', 'Rua das Tulipas', 'Goiania');
insert into professor values (0, 'Maria', 'Rua das Anturios', 'Goiania'), (0, 'Henrique', 'Rua das Begonias', 'Goiania'), (0, 'Alice', 'Rua das Azaleias', 'Goiania');
insert into professor values (0, 'Carlos', 'Rua 21', 'Brasilia'), (0, 'Rebeca', 'Rua 40', 'Brasilia'), (0, 'Joaquim', 'Rua 37', 'Brasilia'), (0, 'Ester', 'Rua 52', 'Brasilia');

select * from aluno;
insert into aluno values (0, 'Alice', 'Rua 21', 'Brasilia'), (0, 'Carlos', 'Rua 40', 'Brasilia'), (0, 'Rebeca', 'Rua 37', 'Brasilia');
insert into aluno values (0, 'Joaquim', 'Rua 52', 'Brasilia'), (0, 'Ester', 'Rua das Violetas', 'Goiania'), (0, 'Ana', 'Rua das Margaridas', 'Goiania');
insert into aluno values (0, 'Pedro', 'Rua das Tulipas', 'Goiania'), (0, 'Joao', 'Rua dos Anturios', 'Goiania'), (0, 'Maria', 'Rua das Begonias', 'Goiania'), (0, 'Henrique', 'Rua das Azaleias', 'Goiania');

select * from disciplina;
insert into disciplina values (0, 'Ingles', 21), (0, 'Filosofia', 17), (0, 'Portugues', 15), (0, 'Matematica', 19);
insert into disciplina values (0, 'Biologia', 21), (0, 'Fisica', 22), (0, 'Quimica', 16), (0, 'Literatura', 18);
insert into disciplina values (0, 'Historia', 18), (0, 'Redacao', 20);

select * from matricula;
insert into matricula values (1, 5, 2022), (2, 6, 2021), (3, 7, 2022), (4, 8, 2022);
insert into matricula values (4, 9, 2022), (6, 10, 2021), (7, 1, 2022), (8, 2, 2022);
insert into matricula values (9, 3, 2021), (10, 4, 2021);

select * from professor_disciplina;
insert into professor_disciplina values (1, 1, 2022), (2, 2, 2021), (3, 3, 2022), (4, 4, 2022);
insert into professor_disciplina values (5, 5, 2022), (5, 6, 2021), (7, 7, 2022), (8, 8, 2022);
insert into professor_disciplina values (9, 9, 2021), (10, 10, 2021);

/* Atributo composto: vira uma nova tabela 
Atributo multivalorado: pode colocar varios valores; ex.: telefone pode armazenar celular e telefone fixo */

/* (A) Crie uma consulta com todas as disciplinas oferecidas no ano de 2021, constando os nomes das disciplinas. */
select disciplina.disc_ID, disciplina.nome from disciplina INNER JOIN professor_disciplina on disciplina.disc_id = professor_disciplina.disc_id where ano = 2021;
/*		DADO QUE QUER 				TABELA ORIGINAL		  TABELA INTERM. QUE ESTÁ RELACIONADO		 QUANDO O ID DA TABELA ORIGINAL FOR IGUAL AO DA INTERM.*/

/* (B) Crie uma consulta que mostre todos os nomes dos professores de uma disciplina específica. */
SELECT 
    professor.nome AS 'Nome professor'
FROM
    professor
        INNER JOIN
    professor_disciplina ON professor.prof_ID = professor_disciplina.prof_ID
WHERE
    professor_disciplina.disc_ID = 3;
/*O "as" significa "alias", que significa um "apelido" para visualização na tabela */

/* (C) Crie uma consulta com todos os nomes de alunos matriculados no ano de 2021, os nomes das disciplinas 
em que estão matriculados e a cidade onde moram. */
SELECT 
    aluno.nome,
    aluno.cidade,
    disciplina.nome AS 'disciplina',
    matricula.ano
FROM
    aluno
        INNER JOIN
    matricula ON aluno.aluno_ID = matricula.aluno_ID
        INNER JOIN
    disciplina ON matricula.disc_ID = disciplina.disc_ID
WHERE
    ano = 2021;  

/* (D) Crie uma consulta que mostre todos os alunos de Brasília que cursam alguma disciplina no ano de 2021. */
SELECT 
    aluno.nome, 
    aluno.cidade,
    disciplina.nome AS 'disciplina', 
    matricula.ano
FROM
    aluno
        INNER JOIN
    disciplina ON aluno.aluno_id = disciplina.disc_id
		INNER JOIN
	matricula ON disciplina.disc_id = matricula.disc_id
WHERE cidade = 'Brasilia' AND ano = 2021;

/* (E) Crie uma consulta que mostre o nome dos professores e a média de aulas que ministram. */
SELECT 
    professor.nome, 
    disciplina.qtd_aulas,
    AVG (disciplina.qtd_aulas) AS "Media"
FROM
    professor
		INNER JOIN
	professor_disciplina ON professor.prof_ID = professor_disciplina.prof_ID
		INNER JOIN
    disciplina ON professor_disciplina.disc_ID = disciplina.disc_ID group by nome;


