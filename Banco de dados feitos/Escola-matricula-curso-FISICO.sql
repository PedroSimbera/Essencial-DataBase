-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE MATRICULA (
cd_matricula CHAR(10) PRIMARY KEY,
dt_matricula DATETIME,
cd_registro_academico CHAR(20),
cd_curso CHAR(10)
)

CREATE TABLE CURSO (
cd_curso CHAR(10) PRIMARY KEY,
nm_curso VARCHAR(30)
)

CREATE TABLE DISCIPLINA (
cd_disciplina CHAR(10) PRIMARY KEY,
nm_disciplina VARCHAR(10),
cd_curso CHAR(10),
FOREIGN KEY(cd_curso) REFERENCES CURSO (cd_curso)
)

CREATE TABLE ALUNO (
cd_registro_academico CHAR(20) PRIMARY KEY,
nm_aluno VARCHAR(40)
)

CREATE TABLE PROFESSOR (
cd_professor CHAR(10) PRIMARY KEY,
cd_cpf_professor NUMERIC(11),
nm_professor VARCHAR(30)
)

CREATE TABLE AULA (
cd_professor CHAR(10),
cd_disciplina CHAR(10),
dt_aula DATETIME,
nm_local_sala VARCHAR(10)
)

ALTER TABLE MATRICULA ADD FOREIGN KEY(cd_registro_academico) REFERENCES ALUNO (cd_registro_academico)
ALTER TABLE MATRICULA ADD FOREIGN KEY(cd_curso) REFERENCES CURSO (cd_curso)
ALTER TABLE AULA ADD FOREIGN KEY (cd_professor) REFERENCES PROFESSOR (cd_professor)
ALTER TABLE AULA ADD FOREIGN KEY (cd_disciplina) REFERENCES DISCIPLINA (cd_disciplina)
