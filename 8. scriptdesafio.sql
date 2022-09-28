CREATE DATABASE desafio2;

USE desafio2;

CREATE TABLE idioma (
	idioma_id tinyint(3) PRIMARY KEY,
    nome char(20) NOT NULL,
    ultima_atualizacao TIMESTAMP NOT NULL
);

CREATE TABLE filme (
	filme_id smallint(5) PRIMARY KEY,
    idioma_id tinyint(3),
    titulo varchar(255) NOT NULL,
    duracao_da_locacao tinyint(3) NOT NULL,
    preco_da_locacao decimal(4,2) NOT NULL,
    custo_de_substituicao decimal(5,2) NOT NULL,
    ultima_atualizacao timestamp NOT NULL,
    descricao text,
    ano_de_lancamento year(4),
    idioma_original_id tinyint(3), 
    duracao_do_filme smallint(5),
    classificacao ENUM('Livre', '10' ,'12','14', '16', '18'),
    recursos_especiais SET('Stop Motion', 'Chroma Key', 'Bullet Time', 'Computação Gráfica', 'Captura de Movimentos'),
    CONSTRAINT FK_filme FOREIGN KEY (idioma_id) REFERENCES idioma (idioma_id)
);

CREATE TABLE ator (
	ator_id smallint(5) PRIMARY KEY,
    primeiro_nome varchar(45) NOT NULL,
    ultimo_nome varchar(45) NOT NULL,
    ultima_atualizacao timestamp NOT NULL
);

CREATE TABLE filme_ator (
	ator_id smallint(5),
    filme_id smallint(5),
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_filme_ator FOREIGN KEY (ator_id) REFERENCES ator (ator_id),
    CONSTRAINT FK_filme_filme FOREIGN KEY (filme_id) REFERENCES filme (filme_id)
);

CREATE TABLE pais (
	pais_id smallint(5) PRIMARY KEY,
    pais varchar(50) NOT NULL,
    ultima_atualizacao timestamp NOT NULL
);

CREATE TABLE cidade (
	cidade_id smallint(5) PRIMARY KEY,
    cidade varchar(50) NOT NULL,
    pais_id smallint(5),
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_cidade_pais FOREIGN KEY (pais_id) REFERENCES pais (pais_id)
);

CREATE TABLE endereco (
	endereco_id smallint(5) PRIMARY KEY,
    cidade_id smallint(5),
    endereco varchar(50) NOT NULL,
    endereco2 varchar(50) NULL,
    bairro varchar(20) NOT NULL,
    cep varchar(10) NULL,
    telefone varchar(20) NOT NULL,
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_endereco_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (cidade_id)
);

CREATE TABLE loja (
	loja_id tinyint(3) PRIMARY KEY,
    endereco_id smallint(5),
    gerente_id tinyint(3) NOT NULL, 
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_loja_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (endereco_id)
);

CREATE TABLE cliente (
	cliente_id smallint(5) PRIMARY KEY,
    loja_id tinyint(3),
    endereco_id smallint(5),
    primeiro_nome varchar(45) NOT NULL,
    ultimo_nome varchar(45) NOT NULL,
    email varchar(50) NULL,
    ativo tinyint (1) NOT NULL,
    data_criacao datetime NOT NULL,
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_cliente_loja FOREIGN KEY (loja_id) REFERENCES loja (loja_id),
    CONSTRAINT FK_cliente_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (endereco_id)
);

CREATE TABLE categoria (
	categoria_id tinyint(3) PRIMARY KEY,
    nome varchar(25) NOT NULL,
    ultima_atualizacao timestamp NOT NULL
);

CREATE TABLE filme_categoria (
	filme_id smallint(5),
    categoria_id tinyint(3),
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT PK_filme_categoria PRIMARY KEY (filme_id, categoria_id),
    CONSTRAINT FK_filme_categoria_filme_id FOREIGN KEY (filme_id) REFERENCES filme (filme_id),
    CONSTRAINT FK_filme_categoria_categoria_id FOREIGN KEY (categoria_id) REFERENCES categoria (categoria_id)
);

CREATE TABLE filme_texto (
	filme_id smallint(6) PRIMARY KEY,
    titulo varchar(255) NOT NULL,
    descricao text NULL,
    CONSTRAINT FK_filme_texto_filme_id FOREIGN KEY (filme_id) REFERENCES filme (filme_id)
);

CREATE TABLE inventario (
	inventario_id mediumint(8) PRIMARY KEY,
    filme_id smallint(5), 
    loja_id tinyint(3),
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_inventario_filme FOREIGN KEY (filme_id) REFERENCES filme (filme_id),
    CONSTRAINT FK_inventario_loja FOREIGN KEY (loja_id) REFERENCES loja (loja_id)
);

CREATE TABLE funcionario (
	funcionario_id tinyint(3) PRIMARY KEY,
    endereco_id smallint(5),
    loja_id tinyint(3),
    primeiro_nome varchar(45) NOT NULL,
    ultimo_nome varchar(45) NOT NULL,
    foto blob NULL,
    email varchar(50) NULL,
    ativo tinyint(1) NOT NULL,
    usuario varchar(6) NOT NULL,
    senha varchar(40) NULL,
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_funcionario_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (endereco_id),
    CONSTRAINT FK_funcionario_loja FOREIGN KEY (loja_id) REFERENCES loja (loja_id)
);

CREATE TABLE aluguel (
	aluguel_id int(11) PRIMARY KEY,
    inventario_id mediumint(8),
    cliente_id smallint(5),
    funcionario_id tinyint(3),
    data_de_aluguel datetime NOT NULL,
    data_de_devolucao datetime NULL,
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_aluguel_inventario FOREIGN KEY (inventario_id) REFERENCES inventario (inventario_id),
    CONSTRAINT FK_aluguel_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id),
    CONSTRAINT FK_aluguel_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario (funcionario_id)
);

CREATE TABLE pagamento (
	pagamento_id smallint(5) PRIMARY KEY,
    cliente_id smallint(5),
    funcionario_id tinyint(3),
    aluguel_id int(11),
    valor decimal(5,2) NOT NULL,
    data_de_pagamento datetime NOT NULL,
    ultima_atualizacao timestamp NOT NULL,
    CONSTRAINT FK_pagamento_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id),
    CONSTRAINT FK_pagamento_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario (funcionario_id),
    CONSTRAINT FK_pagamento_aluguel FOREIGN KEY (aluguel_id) REFERENCES aluguel (aluguel_id)
);


