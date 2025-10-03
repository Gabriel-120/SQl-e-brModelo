-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Alunos (
Nome varchar(100) not null,
Email varchar(200) not null,
Data_nascimento date not null,
Cod_aluno int auto_increment primary key PRIMARY KEY
)

CREATE TABLE Inscricao (
Data_inscricao date not null,
Cod_inscricao int auto_increment primary key PRIMARY KEY,
Cod_curso int,
Cod_aluno int,
FOREIGN KEY(Cod_aluno) REFERENCES Alunos (Cod_aluno),
FOREIGN KEY(Cod_curso) REFERENCES Curso (Cod_curso)
);

CREATE TABLE Curso (
Titulo varchar(100) not null,
Carga_horaria int,
Descricao varchar(255) not null,
Status char(7) default'ativo',
Cod_curso int auto_increment primary key PRIMARY KEY
);

CREATE TABLE Avaliacao (
Cod_avaliacao int auto_increment primary key PRIMARY KEY,
Nota decimal(3,2) not null,
Comentario varchar(255) not null,
Cod_inscricao int,
FOREIGN KEY(Cod_inscricao) REFERENCES Inscricao (Cod_inscricao)
);
