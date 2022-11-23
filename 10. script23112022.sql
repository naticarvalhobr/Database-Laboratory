CREATE DATABASE assinatura;
USE assinatura;

CREATE TABLE assinante (
    cd_assinante INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nm_assinante VARCHAR(50) NOT NULL,
    cd_ramo INT(8) NOT NULL,
    cd_tipo INT(8) NOT NULL,
    CONSTRAINT fk_ass_ramo FOREIGN KEY (cd_ramo) REFERENCES ramo_atividade (cd_ramo),
    CONSTRAINT fk_ass_tipo FOREIGN KEY (cd_tipo) REFERENCES tipo_assinante (cd_tipo)
);

CREATE TABLE ramo_atividade (
    cd_ramo INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ds_ramo VARCHAR(30) NOT NULL
); 

CREATE TABLE tipo_assinante (
    cd_tipo INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ds_tipo VARCHAR(30) NOT NULL
);

CREATE TABLE municipio (
    cd_municipio INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ds_municipio VARCHAR(30) NOT NULL
);

CREATE TABLE telefone (
	cd_fone INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ddd INT(2) NOT NULL,
    n_fone INT(11) NOT NULL,
    cd_endereco INT(8) NOT NULL,
    CONSTRAINT fk_end_fone FOREIGN KEY (cd_endereco) REFERENCES endereco (cd_endereco)
);

CREATE TABLE endereco (
    cd_endereco INT(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ds_endereco VARCHAR(30) NOT NULL,
    complemento VARCHAR(30),
    bairro VARCHAR(20),
    cep VARCHAR(10),
    cd_assinante INT(8) NOT NULL,
    cd_municipio INT(8) NOT NULL,
    CONSTRAINT fk_ass_end FOREIGN KEY (cd_assinante) REFERENCES assinante (cd_assinante),
    CONSTRAINT fk_end_munic FOREIGN KEY (cd_municipio) REFERENCES municipio (cd_municipio)
);

-- insert table assinante
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Renata Moreira', 1, 2);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Camila Andrade', 6, 4);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Robson Carvalho', 7, 2);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Paulo Thomaz', 3, 1);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Ester Silva', 9, 3);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Maria Oliveira', 2, 3);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Rose Andrade', 7, 4);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Barbara Pereira', 10, 4);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Elisa de Paula', 8, 2);
insert into assinante (nm_assinante, cd_ramo, cd_tipo) values ('Joao Thomaz', 5, 4);

select * from telefone;

-- insert ramo_atividade (cod_ramo 1 a 10)
insert into ramo_atividade (ds_ramo) values ('Advogado');
insert into ramo_atividade (ds_ramo) values ('Psicologo');
insert into ramo_atividade (ds_ramo) values ('Servidor Público');
insert into ramo_atividade (ds_ramo) values ('Analista de Sistemas TI');
insert into ramo_atividade (ds_ramo) values ('Professor');
insert into ramo_atividade (ds_ramo) values ('Vendedor');
insert into ramo_atividade (ds_ramo) values ('Bancário');
insert into ramo_atividade (ds_ramo) values ('Supervisor');
insert into ramo_atividade (ds_ramo) values ('Arquiteto');
insert into ramo_atividade (ds_ramo) values ('Médico');

-- insert tipo_assinante (cod_tipo 1 a 4)
insert into tipo_assinante (ds_tipo) values ('Diamante');
insert into tipo_assinante (ds_tipo) values ('Ouro');
insert into tipo_assinante (ds_tipo) values ('Prata');
insert into tipo_assinante (ds_tipo) values ('Bronze');

-- insert municipio (cod_municipio 1 a 6)
insert into municipio (ds_municipio) values ('Aguas Claras');
insert into municipio (ds_municipio) values ('Sudoeste');
insert into municipio (ds_municipio) values ('Guará');
insert into municipio (ds_municipio) values ('Cruzeiro');
insert into municipio (ds_municipio) values ('Sudoeste');
insert into municipio (ds_municipio) values ('Asa Sul');

-- insert endereço (cod_endereco 1 a 10)
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('Rua 60', 'lote 1', 'Norte', '71.700-800', 1 , 2);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('SQS 310', 'Bloco h ap 302', 'Sul', '70.700-200', 6 , 1);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('Av. Tamboril lote 5', 'ap 304', 'Sul', '71.700-800', 1 , 3);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('QE 36 conjunto A', 'lote 3', 'Norte', '70.700-600', 3 , 4);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('SQSW 306 bloco A', 'ap 405', 'Sul', '71.900-600', 5 , 5);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('SCHS 711 bloco R', 'ap 301', 'Norte', '70.100-800', 4 , 6);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('QI 11 bloco G', 'ap 208', 'Guará 1', '71.700-800', 3 , 7);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('Rua 30', 'lote 4 ap 609', 'Norte', '71.910-800', 1 , 8);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('SQS 809 bloco f', 'ap 309', 'Sul', '71.700-800', 6 , 9);
insert into endereco (ds_endereco, complemento, bairro, cep, cd_municipio, cd_assinante) values ('QE 15 conjunto T', 'lote 10', 'Guará II', '72.700-800', 3 , 10);

-- insert telefone
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.6632', 1);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.6325', 2);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.4000', 3);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.5000', 4);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.6000', 5);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.0003', 6);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.1000', 7);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.9000', 8);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.0008', 9);
insert into telefone (ddd, n_fone, cd_endereco) values (61, '99558.1452', 10);

-- a) Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones correspondentes.

SELECT 
    nm_assinante AS nome_assinante,
    ds_endereco AS endereco,
    complemento,
    bairro,
    ds_municipio AS municipio,
    ddd,
    n_fone AS fone
FROM
    assinante AS a
        INNER JOIN
    endereco AS e ON a.cd_assinante = e.cd_assinante
        INNER JOIN
    municipio AS m ON e.cd_municipio = m.cd_municipio
        INNER JOIN
    telefone AS t ON t.cd_endereco = e.cd_endereco;

-- b) Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e posteriormente por nome.
SELECT 
    nm_assinante AS nome, 
    ds_ramo AS ramo
FROM
    assinante AS a
        LEFT JOIN
    ramo_atividade AS ra ON a.cd_ramo = ra.cd_ramo
ORDER BY ds_ramo;

SELECT 
    nm_assinante AS nome, 
    ds_ramo AS ramo
FROM
    assinante AS a
        LEFT JOIN
    ramo_atividade AS ra ON a.cd_ramo = ra.cd_ramo
ORDER BY nm_assinante;

-- c) Listar os assinantes do município Aguas Claras que são do tipo ouro. (adaptado aos meus dados)
SELECT 
	nm_assinante AS nome,
    ds_tipo AS tipo,
    ds_municipio AS municipio
FROM
	assinante AS a
		LEFT OUTER JOIN 
    tipo_assinante AS t ON a.cd_tipo = t.cd_tipo
		LEFT OUTER JOIN
	endereco AS e ON a.cd_assinante = e.cd_assinante
		LEFT OUTER JOIN
	municipio AS m ON e.cd_municipio = m.cd_municipio
WHERE m.cd_municipio = 1 AND t.cd_tipo = 2;

-- d) Listar os nomes dos assinantes que possuem mais de um telefone.
SELECT 
    COUNT(a.cd_assinante) AS qtd, 
    a.nm_assinante AS nome
FROM
    assinante AS a
        INNER JOIN
    endereco AS e ON a.cd_assinante = e.cd_assinante
        INNER JOIN
    telefone AS t ON e.cd_endereco = t.cd_endereco
GROUP BY a.cd_assinante
HAVING qtd > 1;

-- e) Listar os nomes dos assinantes seguido do número do telefone, tipo de assinante Diamante, com endereço em Asa Sul ou Aguas Claras.
SELECT 
    a.nm_assinante AS nome_assinante, 
    t.n_fone AS fone, 
    ti.ds_tipo AS tipo, 
    m.ds_municipio AS municipio
FROM
    assinante AS a
        INNER JOIN
    tipo_assinante AS ti ON a.cd_tipo = ti.cd_tipo
        INNER JOIN
    endereco AS e ON a.cd_assinante = e.cd_assinante
        INNER JOIN
    telefone AS t ON e.cd_endereco = t.cd_endereco
        INNER JOIN
    municipio AS m ON e.cd_municipio = m.cd_municipio
WHERE
    ti.ds_tipo = 'Bronze' AND (m.ds_municipio = 'Guará' OR m.ds_municipio = 'Sudoeste');
