-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database Atividade_4;
use Atividade_4;
select database();


CREATE TABLE Livros (
Cod_livro int Auto_Increment Primary Key,
quantidade int not null,
genero varchar(100) not null,
titulo varchar(100) not null,
preco decimal(5,2) not null,
autor varchar(100) not null,
editora varchar(100) not null
);

CREATE TABLE Autores (
Cod_autor Int Auto_Increment Primary Key PRIMARY KEY,
data_nascimento date,
nome varchar(100) not null,
nacionalidade varchar(20) not null,
Cod_editora Int,
FOREIGN KEY(Cod_editora) REFERENCES Editoras (Cod_editora)
);

CREATE TABLE Editoras (
Cod_editora Int Auto_Increment Primary Key PRIMARY KEY,
nome_editora varchar(100) not null,
cidade varchar(50) default 'Limeira-SP',
contato varchar(200) not null,
endereco varchar(200) not null,
cnpj varchar(18) not null
);

CREATE TABLE Clientes (
Cod_cliente Int Auto_Increment Primary Key PRIMARY KEY,
cpf varchar(14) not null,
telefone varchar(15) not null,
email varchar(255) not null,
data_nascimento date
);

CREATE TABLE Vendas (
Cod_venda Int Auto_Increment Primary Key PRIMARY KEY,
quantidade int,
valor_total  decimal(7,2) not null,
data_venda datetime not null,
Cod_cliente Int,
Cod_livro Int,
FOREIGN KEY(Cod_cliente) REFERENCES Clientes (Cod_cliente),
FOREIGN KEY(Cod_livro) REFERENCES Livros (Cod_livro)
);

CREATE TABLE Escreve (
Cod_escreve Int Auto_Increment Primary Key PRIMARY KEY,
Cod_livro Int,
Cod_autor Int,
FOREIGN KEY(Cod_livro) REFERENCES Livros (Cod_livro),
FOREIGN KEY(Cod_autor) REFERENCES Autores (Cod_autor)
);


-- 1. Inserindo dados na tabela Editoras (não possui dependências)
INSERT INTO Editoras (nome_editora, cidade, contato, endereco, cnpj) VALUES
('Companhia das Letras', 'São Paulo-SP', 'contato@companhia.com.br', 'Rua das Flores, 123', '12.345.678/0001-99'),
('Editora Rocco', 'Rio de Janeiro-RJ', 'comercial@rocco.com.br', 'Avenida Principal, 456', '98.765.432/0001-11'),
('Sextante', 'Rio de Janeiro-RJ', 'contato@sextante.com.br', 'Rua do Saber, 789', '11.222.333/0001-44'),
('Intrínseca', 'Rio de Janeiro-RJ', 'atendimento@intrinseca.com.br', 'Travessa dos Livros, 101', '55.666.777/0001-88'),
('Editora Aleph', 'São Paulo-SP', 'sac@aleph.com.br', 'Alameda dos Ficcionistas, 202', '99.888.777/0001-22'),
('Companhia das Letras', 'São Paulo-SP', 'contato@companhia.com.br', 'Rua das Flores, 123', '12.345.678/0001-99'),
('Editora Rocco', 'Rio de Janeiro-RJ', 'comercial@rocco.com.br', 'Avenida Principal, 456', '98.765.432/0001-11'),
('Sextante', 'Rio de Janeiro-RJ', 'contato@sextante.com.br', 'Rua do Saber, 789', '11.222.333/0001-44'),
('Intrínseca', 'Rio de Janeiro-RJ', 'atendimento@intrinseca.com.br', 'Travessa dos Livros, 101', '55.666.777/0001-88'),
('Editora Aleph', 'São Paulo-SP', 'sac@aleph.com.br', 'Alameda dos Ficcionistas, 202', '99.888.777/0001-22');

-- 2. Inserindo dados na tabela Clientes (não possui dependências)
INSERT INTO Clientes (cpf, telefone, email, data_nascimento) VALUES
('111.222.333-44', '(19) 99123-4567', 'joao.silva@email.com', '1990-05-15'),
('222.333.444-55', '(11) 98765-4321', 'maria.oliveira@email.com', '1985-11-20'),
('333.444.555-66', '(21) 99988-7766', 'carlos.pereira@email.com', '2000-01-30'),
('444.555.666-77', '(19) 98877-6655', 'ana.souza@email.com', '1995-07-10'),
('555.666.777-88', '(11) 97654-3210', 'pedro.costa@email.com', '1998-03-25'),
('666.777.888-99', '(21) 98888-1234', 'lucas.mendes@email.com', '1992-09-12'),
('777.888.999-00', '(19) 97777-4321', 'fernanda.lima@email.com', '1987-04-18'),
('888.999.000-11', '(31) 96666-7890', 'roberto.alves@email.com', '1975-02-25'),
('999.000.111-22', '(11) 95555-2468', 'camila.santos@email.com', '2001-06-30'),
('000.111.222-33', '(41) 94444-1357', 'juliana.ferreira@email.com', '1996-12-05');

-- 3. Inserindo dados na tabela Autores (depende de Editoras)
INSERT INTO Autores (data_nascimento, nome, nacionalidade, Cod_editora) VALUES
('1947-08-24', 'Paulo Coelho', 'Brasileira', 2),
('1955-01-12', 'Haruki Murakami', 'Japonesa', 1),
('1965-07-31', 'J.K. Rowling', 'Britânica', 2),
('1948-09-20', 'George R. R. Martin', 'Norte-Americana', 4),
('1920-01-02', 'Isaac Asimov', 'Russa', 5),
('1968-06-15', 'Neil Gaiman', 'Britânica', 6),
('1973-11-29', 'Suzanne Collins', 'Norte-Americana', 7),
('1952-02-21', 'Umberto Eco', 'Italiana', 8),
('1977-06-26', 'Margaret Atwood', 'Canadense', 9),
('1964-04-28', 'André Vianco', 'Brasileira', 10);

-- 4. Inserindo dados na tabela Livros (aqui preenchemos os campos redundantes de autor e editora)
INSERT INTO Livros (quantidade, genero, titulo, preco, autor, editora) VALUES
(15, 'Ficção Científica', 'Eu, Robô', 45.50, 'Isaac Asimov', 'Editora Aleph'),
(10, 'Fantasia', 'Harry Potter e a Pedra Filosofal', 39.90, 'J.K. Rowling', 'Editora Rocco'),
(20, 'Romance', 'O Alquimista', 29.99, 'Paulo Coelho', 'Editora Rocco'),
(8, 'Fantasia Épica', 'A Guerra dos Tronos', 59.90, 'George R. R. Martin', 'Intrínseca'),
(12, 'Realismo Mágico', '1Q84', 65.00, 'Haruki Murakami', 'Companhia das Letras'),
(18, 'Fantasia', 'Deuses Americanos', 54.90, 'Neil Gaiman', 'DarkSide Books'),
(25, 'Distopia', 'Jogos Vorazes', 42.00, 'Suzanne Collins', 'L&PM Editores'),
(9, 'Romance Histórico', 'O Nome da Rosa', 69.90, 'Umberto Eco', 'Editora Record'),
(14, 'Ficção Científica', 'O Conto da Aia', 58.50, 'Margaret Atwood', 'Editora Globo'),
(20, 'Terror', 'Os Sete', 39.99, 'André Vianco', 'Moderna');

-- 5. Inserindo dados na tabela Escreve (tabela associativa entre Livros e Autores)
-- Ligando o autor ao seu livro correspondente que inserimos acima.
INSERT INTO Escreve (Cod_livro, Cod_autor) VALUES
(1, 5), -- Eu, Robô -> Isaac Asimov
(2, 3), -- Harry Potter -> J.K. Rowling
(3, 1), -- O Alquimista -> Paulo Coelho
(4, 4), -- A Guerra dos Tronos -> George R. R. Martin
(5, 2), -- 1Q84 -> Haruki Murakami
(6, 6), -- Deuses Americanos -> Neil Gaiman
(7, 7), -- Jogos Vorazes -> Suzanne Collins
(8, 8), -- O Nome da Rosa -> Umberto Eco
(9, 9), -- O Conto da Aia -> Margaret Atwood
(10, 10); -- Os Sete -> André Vianco


-- 6. Inserindo dados na tabela Vendas (depende de Clientes e Livros)
INSERT INTO Vendas (quantidade, valor_total, data_venda, Cod_cliente, Cod_livro) VALUES
(1, 45.50, '2025-09-21 10:30:00', 1, 1), -- Cliente 1 comprou Livro 1
(2, 79.80, '2025-09-21 11:45:00', 2, 2), -- Cliente 2 comprou 2x o Livro 2
(1, 59.90, '2025-09-22 09:15:00', 1, 4), -- Cliente 1 comprou Livro 4
(1, 65.00, '2025-09-22 14:00:00', 3, 5), -- Cliente 3 comprou Livro 5
(3, 89.97, '2025-09-22 16:20:00', 4, 3), -- Cliente 4 comprou 3x o Livro 3
(1, 54.90, '2025-09-23 10:00:00', 5, 6),
(2, 84.00, '2025-09-23 11:30:00', 6, 7),
(1, 69.90, '2025-09-23 12:45:00', 7, 8),
(3, 175.50, '2025-09-23 14:20:00', 8, 9),
(2, 79.98, '2025-09-23 15:10:00', 9, 10);


select * from Clientes;
drop table vendas;


-- Atividade: 
select Titulo, Quantidade from Livros; 

select Titulo, Preco from Livros
where Titulo like 'A%' and Preco > 100;

select sum(Quantidade) as Quantidade from Vendas;
select sum(Quantidade) as Quantidade from Livros;

delete from Livros
where Cod_livro = 5;

alter table Livros add column Ano_publicacao Date;


-- Exemplos:
-- Consulta * todos os dados
select * from Autores, Livros;
select * from Livros;

-- Comsulta por campos
select Titulo from Livros;
select Nome, Cod_livro from Livros;

-- Consulta por Data com comdição
select Titulo, Autor from Livros
where quantidade > 2;

-- Consulta por crecente e decrescente
select Titulo, Quantidade from Livros
order by Quantidade desc;

-- Consulta por limite de resultado
select Titulo from Livros
limit 5;

-- Renomear Colunas com AS
select Titulo as Nome, Autores as Escritor from Livros;

-- Funções Agregadas
select Count(*) as Total_Livros
from Livros; 

select Sum(Preco) as Total_Livros 
from Livros;

select avg(Preco) as Total_Livros
from Livros;

-- Agrupamentos com group by 
select Autor, Count(*) as Quantidade
from Livros
group by Autor;

-- Uso de and ou or
select Titulo, Preco from Livros
where Titulo = 'Harry' and Preco > 30;

select Titulo, Preco from Livros
where Titulo = 'Harry' or Preco > 30;

-- Condições extras com group by, having e order by
select Cod_livro, count(*) as Total_Livros
from Livros
group by Autor
having Total_Livros > 5
order by Total_Livros desc;

-- Uso do like
select Titulo from Livros
where Titulo like '%Harry%';

-- Uso do like com inicio por letras
select Titulo from Livros
where Titulo like 'H%';

-- Uso do like com termino por letras
select Titulo from Livros 
where Titulo Like '%ry';

-- Uso do like por quantidade de letras
select Titulo from Livros
where Titulo like 'H___y';

-- Combinando situações
select Titulo, Preco from Livros
where Titulo like '%Harry%'
order by Preco desc;