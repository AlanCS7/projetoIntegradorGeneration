CREATE DATABASE db_rede_social;
USE db_rede_social;

CREATE TABLE tb_usuario (
	nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL PRIMARY KEY,
    senha VARCHAR(30) NOT NULL
);

CREATE TABLE tb_tema (
	id_tema BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tema_enum ENUM("Exatas", "Humanas", "Biológicas", "Tecnologia", "Livre"),
    subtema VARCHAR(100) NOT NULL,
    escolaridade ENUM("Alfabetização", "Ensino Fundamental", "Ensino Médio", "Ensino Superior", "Livre")
);

CREATE TABLE tb_postagem (
	id_postagem BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    postagem TEXT NOT NULL,
    `data` DATETIME,
    url_img VARCHAR(1000),
    fk_usuario VARCHAR(100) NOT NULL,
    fk_tema BIGINT NOT NULL,
    FOREIGN KEY (fk_usuario) REFERENCES tb_usuario (email),
    FOREIGN KEY (fk_tema) REFERENCES tb_tema (id_tema)
);

INSERT INTO tb_usuario(nome_completo, email, senha) VALUES
("Jose da Silva", "jose@gmail.com", "12345678j"),
("Maria de Souza", "maria@gmail.com", "12345678m"),
("Jose Maria", "jm@gmail.com", "12345678jm");

INSERT INTO tb_tema(tema_enum, subtema, escolaridade) VALUES
("Exatas", "Matemática Aplicada", "Ensino Fundamental"),
("Livre", "Tocar Violão", "Livre"),
("Tecnologia", "Programação", "Livre"),
("Humanas", "Sociologia", "Ensino Médio"),
("Biológicas", "Ciências", "Livre");

INSERT INTO tb_postagem (titulo, postagem, `data`, url_img, fk_usuario, fk_tema) VALUES
("Quanto é 1+1", "Para calcular 1+1 é só somar os 2", "2021-07-30 09:35:29", "ndkafjskbkcbkjbvkbadhbknx c", "jose@gmail.com", 1),
("Como aprender a tocar violão em 5 minutos", "Vamos abordar as melhores técnicas para conseguir destravar nesse mundo", "2021-08-30 10:35:29", "as.nckbchx mcmx cbsvdvgsvdf", "jose@gmail.com", 2),
("Programação em 3 meses na Gen", "Bootcamp intensivo para aprender as melhores tecnologias do mercado....", "2021-09-30 11:35:29", "sadasfgdkçjklfngdnsadsxcvx", "maria@gmail.com", 3),
("Mistérios da lingua portuguesa", "Hoje falaremos das maiores dificuldades do portugues que .....", "2021-11-30 12:35:29", "", "jm@gmail.com", 4),
("Quantos metros tem as baleias", "A maior baleia é tal com x metros de comprimento e as outras tem...", "2021-10-30 13:35:29", "asdkbhbhsadvjashdgvajshdalshduhkbda", "maria@gmail.com", 5);

SELECT tb_usuario.nome_completo AS "Nome", tb_usuario.email AS "Login", tb_tema.tema_enum AS "Tema",
tb_tema.escolaridade AS "Escolaridade", tb_postagem.titulo AS "Titulo", tb_postagem.`data` AS "Data da Postagem" FROM tb_usuario
INNER JOIN tb_postagem ON tb_usuario.email = tb_postagem.fk_usuario
INNER JOIN tb_tema ON tb_tema.id_tema = tb_postagem.fk_tema;

SELECT * FROM tb_usuario
INNER JOIN tb_postagem ON tb_usuario.email = tb_postagem.fk_usuario
INNER JOIN tb_tema ON tb_tema.id_tema = tb_postagem.fk_tema;