create database aula;

use aula; -- especifica em qual banco quer executar.
-- Se não selecionar uma linha específica, executa todas.

create table aluno (
	matricula int not null auto_increment,
    nome varchar(50) null,
    idade int(3) null, -- Até três dígitos
    primary key(matricula)
);

select * from aluno; -- * significa que seleciona todas as informações daquela tabela
insert into aluno values (0, 'Ana', 20), (0, 'João', 21); -- Pode inserir vários na mesma query, ou ir mudando os valores.
-- Where: especifica onde faz a alteração ou a busca
select nome from aluno where nome like 'a%'; -- Registros de nomes que comecem com a letra 'M'
select count(matricula) from aluno; -- Contagem de qtos registros tem na tabela aluno
select max(idade) from aluno; -- Mostra quem tem a maior idade na tabela
select avg(idade) from aluno; -- Calcula a média das idades inseridas
update aluno set idade = 18 where matricula = 1; -- atualiza o campo idade onde a matricula for 1. É preciso saber o registro que vai atualizar
-- Criar o backup do banco (exportar o banco para a pasta que quiser), apagar tudo (drop table e data base), restaurar o backup onde quiser

-- drop table aluno; exclui a tabela e todos os registros dela.
-- drop database aula; exclui o banco de dados.