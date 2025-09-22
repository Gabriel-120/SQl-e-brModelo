-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database Atividade_4;
use Atividade_4;
select database();


CREATE TABLE Livros (
Cod_livro Int Auto_Increment Primary Key PRIMARY KEY,
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
INSERT INTO Editoras (Cod_editora, nome_editora, cidade, contato, endereco, cnpj) VALUES
(NULL, 'Companhia das Letras', 'São Paulo-SP', 'contato@companhia.com.br', 'Rua das Flores, 123', '12.345.678/0001-99'),
(NULL, 'Editora Rocco', 'Rio de Janeiro-RJ', 'comercial@rocco.com.br', 'Avenida Principal, 456', '98.765.432/0001-11'),
(NULL, 'Sextante', 'Rio de Janeiro-RJ', 'contato@sextante.com.br', 'Rua do Saber, 789', '11.222.333/0001-44'),
(NULL, 'Intrínseca', 'Rio de Janeiro-RJ', 'atendimento@intrinseca.com.br', 'Travessa dos Livros, 101', '55.666.777/0001-88'),
(NULL, 'Editora Aleph', 'São Paulo-SP', 'sac@aleph.com.br', 'Alameda dos Ficcionistas, 202', '99.888.777/0001-22');

-- 2. Inserindo dados na tabela Clientes (não possui dependências)
INSERT INTO Clientes (Cod_cliente, cpf, telefone, email, data_nascimento) VALUES
(NULL, '111.222.333-44', '(19) 99123-4567', 'joao.silva@email.com', '1990-05-15'),
(NULL, '222.333.444-55', '(11) 98765-4321', 'maria.oliveira@email.com', '1985-11-20'),
(NULL, '333.444.555-66', '(21) 99988-7766', 'carlos.pereira@email.com', '2000-01-30'),
(NULL, '444.555.666-77', '(19) 98877-6655', 'ana.souza@email.com', '1995-07-10'),
(NULL, '555.666.777-88', '(11) 97654-3210', 'pedro.costa@email.com', '1998-03-25');

-- 3. Inserindo dados na tabela Autores (depende de Editoras)
INSERT INTO Autores (Cod_autor, data_nascimento, nome, nacionalidade, Cod_editora) VALUES
(NULL, '1947-08-24', 'Paulo Coelho', 'Brasileira', 2),
(NULL, '1955-01-12', 'Haruki Murakami', 'Japonesa', 1),
(NULL, '1965-07-31', 'J.K. Rowling', 'Britânica', 2),
(NULL, '1948-09-20', 'George R. R. Martin', 'Norte-Americana', 4),
(NULL, '1920-01-02', 'Isaac Asimov', 'Russa', 5);

-- 4. Inserindo dados na tabela Livros (aqui preenchemos os campos redundantes de autor e editora)
INSERT INTO Livros (Cod_livro, quantidade, genero, titulo, preco, autor, editora) VALUES
(NULL, 15, 'Ficção Científica', 'Eu, Robô', 45.50, 'Isaac Asimov', 'Editora Aleph'),
(NULL, 10, 'Fantasia', 'Harry Potter e a Pedra Filosofal', 39.90, 'J.K. Rowling', 'Editora Rocco'),
(NULL, 20, 'Romance', 'O Alquimista', 29.99, 'Paulo Coelho', 'Editora Rocco'),
(NULL, 8, 'Fantasia Épica', 'A Guerra dos Tronos', 59.90, 'George R. R. Martin', 'Intrínseca'),
(NULL, 12, 'Realismo Mágico', '1Q84', 65.00, 'Haruki Murakami', 'Companhia das Letras');

-- 5. Inserindo dados na tabela Escreve (tabela associativa entre Livros e Autores)
-- Ligando o autor ao seu livro correspondente que inserimos acima.
INSERT INTO Escreve (Cod_escreve, Cod_livro, Cod_autor) VALUES
(NULL, 1, 5), -- Eu, Robô -> Isaac Asimov
(NULL, 2, 3), -- Harry Potter -> J.K. Rowling
(NULL, 3, 1), -- O Alquimista -> Paulo Coelho
(NULL, 4, 4), -- A Guerra dos Tronos -> George R. R. Martin
(NULL, 5, 2); -- 1Q84 -> Haruki Murakami

-- 6. Inserindo dados na tabela Vendas (depende de Clientes e Livros)
INSERT INTO Vendas (Cod_venda, quantidade, valor_total, data_venda, Cod_cliente, Cod_livro) VALUES
(NULL, 1, 45.50, '2025-09-21 10:30:00', 1, 1), -- Cliente 1 comprou Livro 1
(NULL, 2, 79.80, '2025-09-21 11:45:00', 2, 2), -- Cliente 2 comprou 2x o Livro 2
(NULL, 1, 59.90, '2025-09-22 09:15:00', 1, 4), -- Cliente 1 comprou Livro 4
(NULL, 1, 65.00, '2025-09-22 14:00:00', 3, 5), -- Cliente 3 comprou Livro 5
(NULL, 3, 89.97, '2025-09-22 16:20:00', 4, 3); -- Cliente 4 comprou 3x o Livro 3

select * from Clientes;

drop table vendas;