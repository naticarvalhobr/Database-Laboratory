CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE cliente (
    cpf INT(12) NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    dtNasc DATE NOT NULL
);

CREATE TABLE modelo (
	codMod INT(30) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    desc_2 VARCHAR(40)
);

CREATE TABLE veiculo (
    placa VARCHAR(8) NOT NULL PRIMARY KEY,
    modelo_codMod INT(30) NOT NULL,
    cliente_cpf INT(12) NOT NULL,
    cor VARCHAR(20),
    ano year,
    CONSTRAINT modelo_veiculo FOREIGN KEY (modelo_codMod) REFERENCES modelo (codMod),
    CONSTRAINT cliente_veiculo FOREIGN KEY (cliente_cpf) REFERENCES cliente (cpf)
); 

CREATE TABLE patio (
	num INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ender VARCHAR(40) NOT NULL,
    capacidade INT(5) NOT NULL
);

CREATE TABLE estaciona (
	cod INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    patio_num INT(5) NOT NULL,
    veiculo_placa VARCHAR(8) NOT NULL,
    dtEntrada VARCHAR(10),
    dtSaida VARCHAR(10),
    hsEntrada VARCHAR(10),
    hsSaida VARCHAR(10),
    CONSTRAINT patio_estaciona FOREIGN KEY (patio_num) REFERENCES patio (num),
    CONSTRAINT veiculo_estaciona FOREIGN KEY (veiculo_placa) REFERENCES veiculo (placa)
);

insert into cliente (cpf, nome, dtNasc) values (1112223, 'Valdivina Andrade', '2000-11-30');
insert into cliente (cpf, nome, dtNasc) values (9998887, 'Lucas Pereira', '1977-10-30');
insert into cliente (cpf, nome, dtNasc) values (6549873, 'João Afonso', '1986-11-12');
insert into cliente (cpf, nome, dtNasc) values (9685743, 'Luisa Cardoso', '2004-01-15');
insert into cliente (cpf, nome, dtNasc) values (9683527, 'Amanda Nunes', '1971-06-10');
insert into cliente (cpf, nome, dtNasc) values (9685745, 'Augusto Reis', '2004-01-15');
insert into cliente (cpf, nome, dtNasc) values (2225554, 'Ruan Carvalho', '1986-06-10');
select * from cliente;

insert into modelo (desc_2) values ('Honda');
insert into modelo (desc_2) values ('Chevrolet Captiva');
insert into modelo (desc_2) values ('Volkswagen Taos');
insert into modelo (desc_2) values ('Honda Civic');
select * from modelo;

insert into veiculo (placa, modelo_codMod, cliente_cpf, cor, ano) values ('JJJ-2020', 2, 1112223,'cinza', 1998);
insert into veiculo (placa, modelo_codMod, cliente_cpf, cor, ano) values ('JHO-1020', 3, 9998887,'branco', 2013);
insert into veiculo (placa, modelo_codMod, cliente_cpf, cor, ano) values ('JZP-2080', 2, 6549873,'azul', 2016);
insert into veiculo (placa, modelo_codMod, cliente_cpf, cor, ano) values ('JEH-2014', 1, 9683527,'preto', 1999);
insert into veiculo (placa, modelo_codMod, cliente_cpf, cor, ano) values ('JPT-3520', 4, 9685743,'vermelho', 2019);
insert into veiculo (placa, modelo_codMod, cliente_cpf, cor, ano) values ('JEG-1010', 4, 2225554,'branco', 2018);
select * from veiculo;

insert into patio (ender, capacidade) values ('Rua 9 Sul', 50);
insert into patio (ender, capacidade) values ('Rua 18 Norte', 60);
insert into patio (ender, capacidade) values ('Rua 24 Leste', 30);
insert into patio (ender, capacidade) values ('Rua 45 Oeste', 80);
insert into patio (ender, capacidade) values ('Rua 86 Norte', 60);
select * from patio;

insert into estaciona (patio_num, veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values (2, 'JEG-1010', '2022-10-14', '2022-10-14', '9:00', '9:10');
insert into estaciona (patio_num, veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values (2, 'JEH-2014', '2022-10-14', '2022-10-14', '9:00', '9:10');
insert into estaciona (patio_num, veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values (2, 'JJJ-2020', '2022-10-16', '2022-10-17', '9:00', '10:10');
insert into estaciona (patio_num, veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values (2, 'JHO-1020', '2022-10-14', '2022-10-14', '9:00', '11:10');
insert into estaciona (patio_num, veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values (2, 'JZP-2080', '2022-10-14', '2022-10-14', '9:00', '10:10');
insert into estaciona (patio_num, veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values (2, 'JPT-3520', '2022-10-14', '2022-10-14', '9:00', '12:10');
select * from estaciona;

-- a) Exiba a placa e o nome dos donos de todos os veículos.
SELECT 
    nome, placa
FROM
    veiculo
        JOIN
    cliente ON cliente_cpf = cpf;

-- b) Exiba o CPF e o nome do cliente que possui o veiculo de placa 'JJJ-2020'
SELECT 
    nome, cpf
FROM
    veiculo
        JOIN
    cliente ON cliente_cpf = cpf
WHERE
    placa = 'JJJ-2020';

-- c) Exiba a placa e a cor do veículo que possui o código de estacionamento 1.
SELECT
	cod, placa, cor
FROM 
	veiculo
		JOIN
	estaciona ON placa = veiculo_placa 
WHERE
	cod = 1;

-- d) Exiba a placa e o ano do veículo que possui o código de estacionamento 1.
SELECT
	cod, placa, ano
FROM 
	veiculo
		JOIN
	estaciona ON placa = veiculo_placa 
WHERE
	cod = 1;

-- e) Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000.
SELECT 
    placa, ano, desc_2 AS descrição
FROM
    veiculo
        LEFT JOIN
    modelo ON modelo_codMod = codMod
WHERE
    ano >= 2000;

-- f) Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa "JEG-1010"
SELECT
	veiculo_placa AS placa, ender AS endereco, dtEntrada AS entrada, dtSaida AS saida
FROM
	estaciona
		RIGHT OUTER JOIN 
	patio ON patio_num = num
WHERE veiculo_placa = 'JEG-1010';

-- g) Exiba a quantidade de vezes que os veículos de cor branco estacionaram.
SELECT 
    COUNT(cor) AS qtd
FROM
    veiculo
        INNER JOIN
    estaciona ON placa = veiculo_placa
WHERE
    cor LIKE 'branco';

-- h) Liste todos os clientes que possuem carro de modelo 1.
SELECT 
    nome, codMod AS modelo
FROM
    cliente
        RIGHT OUTER JOIN
    veiculo ON cpf = cliente_cpf
        RIGHT OUTER JOIN
    modelo ON modelo_codMod = codMod
WHERE
    codMod = 1;

-- i) Liste as placas, os horários de entrada e saída dos veículos de cor branca.
SELECT 
    placa, hsEntrada AS entrada, hsSaida AS saida
FROM
    veiculo
        INNER JOIN
    estaciona ON placa = veiculo_placa
WHERE
    cor = 'branco';

-- j) Liste todos os estacionamentos do veículo de placa 'JJJ-2020'
SELECT 
	placa, dtEntrada AS entrada, dtSaida AS saida
FROM
	veiculo
		INNER JOIN
	estaciona ON placa = veiculo_placa 
WHERE 
	placa = 'JJJ-2020';

-- k) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2.
SELECT 
	nome, patio_num AS codigo
FROM 
	cliente 
		INNER JOIN
	veiculo ON cpf = cliente_cpf
		INNER JOIN 
	estaciona ON placa = veiculo_placa
WHERE patio_num = 2;

-- l) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3.
SELECT 
	nome, cpf, patio_num AS codigo
FROM 
	cliente 
		RIGHT OUTER JOIN
	veiculo ON cpf = cliente_cpf
		RIGHT OUTER JOIN
	estaciona ON placa = veiculo_placa
WHERE patio_num = 3;

-- m) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2.
SELECT
	desc_2 AS descricao, patio_num AS cod
FROM 
	modelo
		RIGHT OUTER JOIN
	veiculo ON codMod = modelo_codMod
		RIGHT OUTER JOIN 
	estaciona ON placa = veiculo_placa 
WHERE patio_num = 2;

-- n) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos.
SELECT 
	placa, nome, desc_2 AS descricao
FROM 
	cliente
		LEFT JOIN
	veiculo ON cpf = cliente_cpf
		LEFT JOIN 
	modelo ON modelo_codMod = codMod;