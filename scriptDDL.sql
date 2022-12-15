CREATE DATABASE fintech;

CREATE TABLE tb_login(
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(30),
    senha VARCHAR(30)
);

CREATE TABLE tb_endereco(
	id INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(30),
    bairro VARCHAR(30),
    complemento VARCHAR (30),
    numero INT,
    cidade VARCHAR(20),
    estado VARCHAR(20)
    
);

CREATE TABLE tb_user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    dt_nascimento DATE,
    cpf VARCHAR(11),
    celular VARCHAR (11),
    login_id INT,
    endereco_id INT,
    FOREIGN KEY (login_id) REFERENCES tb_login(id),
    FOREIGN KEY (endereco_id) REFERENCES tb_endereco(id)
    
);


CREATE TABLE tb_conta_bancaria(
	id INT PRIMARY KEY  AUTO_INCREMENT,
    user_id INT,
    agencia VARCHAR(4),
    numero_conta VARCHAR(5),
    saldo DOUBLE,
    FOREIGN KEY (user_id) REFERENCES tb_user(id)
);


CREATE TABLE tb_cartao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    conta_id INT,
    codigo_seguranca VARCHAR(3),
    senha VARCHAR(4),
    FOREIGN KEY (conta_id) REFERENCES tb_conta_bancaria(id)
);

CREATE TABLE tb_conta_corrente(
	id INT PRIMARY KEY  AUTO_INCREMENT,
    conta_bancaria_id INT,
    num_limite_transacoes_diarias INT,
    FOREIGN KEY (conta_bancaria_id) REFERENCES tb_conta_bancaria(id)
);

CREATE TABLE tb_conta_poupanca(
	id INT PRIMARY KEY AUTO_INCREMENT,
    conta_bancaria_id INT,
    rendimento_percentual INT,
    FOREIGN KEY (conta_bancaria_id) REFERENCES tb_conta_bancaria(id)
);


CREATE TABLE tb_pagamentos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento DATE,
    valor_pagamento DOUBLE,
    id_conta_transferiu INT,
    id_conta_recebeu INT,
    FOREIGN KEY (id_conta_transferiu) REFERENCES tb_conta_bancaria(id),
    FOREIGN KEY (id_conta_recebeu) REFERENCES tb_conta_bancaria(id)
);








