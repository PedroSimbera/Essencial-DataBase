-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE USUARIO (
cpf NUMERIC(11) PRIMARY KEY,
telefone NUMERIC(11),
telefone1 NUMERIC(11),
telefone2 NUMERIC(11),
telefone3 NUMERIC(11),
telefone4 NUMERIC(11),
endereco VARCHAR(40),
nome_usuario VARCHAR(40),
codigo_usuario CHAR(5)
)

CREATE TABLE TIPOUSUARIO (
codigo_usuario CHAR(5) PRIMARY KEY,
modalidade_usuario CHAR(6),
beneficio_usuario VARCHAR(40)
)

CREATE TABLE Relacao2_EMPRESTIMO (
momento_emprestimo DATETIME PRIMARY KEY,
tempo_emprestimo NUMERIC(2),
valor_emprestimo NUMERIC(3),
cpf NUMERIC(11),
codigo_exemplar CHAR(10),
FOREIGN KEY(cpf) REFERENCES USUARIO (cpf)
)

CREATE TABLE EXEMPLAR (
codigo_exemplar CHAR(10) PRIMARY KEY,
quantidade_obra NUMERIC(3),
isbn NUMERIC(13)
)

CREATE TABLE OBRA (
isbn NUMERIC(13) PRIMARY KEY,
nome_livro VARCHAR(10),
valor_emprestimo NUMERIC(3)
)

CREATE TABLE EDITORA (
cnpj NUMERIC(14) PRIMARY KEY,
nome_editora VARCHAR(20),
codigo_exemplar CHAR(10),
FOREIGN KEY(codigo_exemplar) REFERENCES EXEMPLAR (codigo_exemplar)
)

CREATE TABLE Relacao5_AUTORIA (
cpf NUMERIC(11),
isbn NUMERIC(13),
FOREIGN KEY(isbn) REFERENCES OBRA (isbn)
)

CREATE TABLE AUTOR (
cpf NUMERIC(11) PRIMARY KEY,
nome_autor VARCHAR(40),
codigo_pais CHAR(4)/*falha: chave estrangeira*/
)

CREATE TABLE PAIS (
codigo_pais CHAR(4) PRIMARY KEY,
nome_pais VARCHAR(20)
)

ALTER TABLE USUARIO ADD FOREIGN KEY(codigo_usuario) REFERENCES TIPOUSUARIO (codigo_usuario)
ALTER TABLE Relacao2_EMPRESTIMO ADD FOREIGN KEY(codigo_exemplar) REFERENCES EXEMPLAR (codigo_exemplar)
ALTER TABLE EXEMPLAR ADD FOREIGN KEY(isbn) REFERENCES OBRA (isbn)
ALTER TABLE Relacao5_AUTORIA ADD FOREIGN KEY(cpf) REFERENCES AUTOR (cpf)
