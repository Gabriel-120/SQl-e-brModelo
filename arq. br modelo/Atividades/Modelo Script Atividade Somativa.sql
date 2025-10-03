-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database Atividade_Somativa;
use Atividade_Somativa;
select database();


CREATE TABLE Alunos (
Cod_aluno int auto_increment primary key PRIMARY KEY,
Nome varchar(100) not null,
Email varchar(200) not null,
Data_nascimento date not null
);

CREATE TABLE Inscricao (
Cod_inscricao int auto_increment primary key PRIMARY KEY,
Data_inscricao date not null,
Cod_curso int,
Cod_aluno int,
FOREIGN KEY(Cod_aluno) REFERENCES Alunos (Cod_aluno),
FOREIGN KEY(Cod_curso) REFERENCES Curso (Cod_curso)
);

CREATE TABLE Curso (
Cod_curso int auto_increment primary key PRIMARY KEY,
Titulo varchar(100) not null,
Carga_horaria int,
Descricao varchar(255) not null,
Status_curso char(7) default'ativo'
);

CREATE TABLE Avaliacao (
Cod_avaliacao int auto_increment primary key PRIMARY KEY,
Nota decimal(3,2) not null,
Comentario varchar(255) not null,
Cod_inscricao int,
FOREIGN KEY(Cod_inscricao) REFERENCES Inscricao (Cod_inscricao)
);

-- Inserts 
-- Inserindo 5 alunos na tabela Alunos
INSERT INTO Alunos (Nome, Email, Data_nascimento) VALUES
('João Silva', 'joao.silva@email.com', '1990-05-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '2000-02-20'),
('Carlos Pereira', 'carlos.pereira@email.com', '1999-11-30'),
('Ana Souza', 'ana.souza@email.com', '2001-07-10'),
('Pedro Costa', 'pedro.costa@email.com', '1994-09-05');

-- Inserindo 5 cursos na tabela Curso (sendo 1 inativo)
INSERT INTO Curso (Titulo, Carga_horaria, Descricao, Status_curso) VALUES
('Introdução ao Banco de Dados SQL', 40, 'Aprenda os fundamentos da linguagem SQL para manipulação de dados.', 'ativo'),
('Python para Análise de Dados', 60, 'Um curso completo para utilizar Python na análise e visualização de dados.', 'ativo'),
('Desenvolvimento Web com JavaScript', 80, 'Explore o desenvolvimento front-end moderno com JavaScript, HTML e CSS.', 'ativo'),
('Marketing Digital para Iniciantes', 35, 'Conceitos e estratégias essenciais para iniciar no marketing digital.', 'ativo'),
('Fundamentos de Design Gráfico', 50, 'Curso introdutório sobre os princípios do design gráfico.', 'inativo');

-- Inserindo 5 inscrições na tabela Inscricao
-- Supondo que os IDs dos alunos e cursos são gerados sequencialmente de 1 a 5.
INSERT INTO Inscricao (Cod_aluno, Cod_curso, Data_inscricao) VALUES
(1, 1, '2024-03-10'), -- João Silva no curso de SQL
(2, 2, '2024-03-12'), -- Maria Oliveira no curso de Python
(3, 3, '2024-03-15'), -- Carlos Pereira no curso de JavaScript
(1, 2, '2024-04-01'), -- João Silva se inscrevendo também no curso de Python
(4, 5, '2024-04-05'); -- Ana Souza no curso de Marketing Digital

-- Inserindo 3 avaliações na tabela Avaliacao
-- Supondo que os IDs das inscrições são gerados sequencialmente de 1 a 5.
INSERT INTO Avaliacao (Cod_inscricao, Nota, Comentario) VALUES
(1, 9.50, 'Excelente curso! Muito claro e objetivo.'),
(2, 8.00, 'Bom conteúdo, mas poderia ter mais exercícios práticos.'),
(4, 9.80, 'Professor com ótima didática. Recomendo!');


-- Updates dos inserts
-- Atualizar email de um aluno
update Alunos
set Email = 'Joao.gomes.da.silva@email.com'
where Nome = 'João Silva';

-- Alterar carga horária de um curso
update Curso
set Carga_horaria = 100
where Titulo = 'Desenvolvimento Web com JavaScript';

-- Corrigir nome de aluno
update Alunos
set Nome = 'João Gomes da Silva'
where Nome = 'João Silva';

-- Mudar status de curso
update Curso 
set Status_curso = 'inativo'
where Titulo = 'Desenvolvimento Web com JavaScript';

-- Alterar nota de uma avaliação
update Avaliacao 
set Nota = 9
where Cod_inscricao = 1;


-- Exclusão de dados
-- Excluir uma inscrição
delete from Inscricao 
where Cod_inscricao = 1;

-- Excluir um curso
delete from Curso
where Carga_horaria > 40;

-- Excluir uma avaliação ofensiva
delete from Avaliacao
where Cod_Inscricao = 2;

-- Excluir um aluno
delete from Alunos
where Data_nascimento < 2005;

-- Excluir todas inscrições de um curso encerrado
delete from Inscricao 
where Cod_curso = 5;


-- Consultas com Critérios e Agrupamentos
-- 1. Listar todos os alunos cadastrados
select * from Aluno;

-- 2. Exibir apenas os nomes e e-mails dos alunos
select Nome, Email from Alunos;

-- 3. Listar cursos com carga horária maior que 30 horas
select * from Curso 
where Carga_horaria > 30;

-- 4. Exibir cursos que estão inativos
select * from Curso 
where Status_curso = 'inativo';

-- 5. Buscar alunos nascidos após o ano 1995
select * from Alunos
where Data_nascimento > 1995;

-- 6. Exibir avaliações com nota acima de 9
select * from Avaliacao 
where Nota > 9;

-- 7. Contar quantos cursos estão cadastrados
select count(*) as Titulo from Curso;

-- 8. Listar os 3 cursos com maior carga horária
select * from Curso
order by Carga_horaria desc
limit 3;


-- Desafios Extras
CREATE INDEX idx_alunos_email ON Alunos (Email);


-- select * from Alunos;
-- select * from Curso;
-- select * from Inscricao;
-- select * from Avaliacao;