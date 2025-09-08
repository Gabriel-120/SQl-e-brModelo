-- Criação inicial

CREATE DATABASE Atividade_Avaliativa_1;
USE Atividade_Avaliativa_1;


CREATE TABLE Fornecedor (
    Fcodigo INT PRIMARY KEY,
    Fnome VARCHAR(100) NOT NULL,
    FStatus VARCHAR(20) DEFAULT'Ativo',
    Cidade VARCHAR(100)
);

CREATE TABLE Peca (
    Pcodigo INT PRIMARY KEY,
    Pnome VARCHAR(100) NOT NULL,
    Cor VARCHAR(50) NOT NULL,
    Peso DECIMAL(10,2) NOT NULL,
    Cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Instituicao (
    Icodigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Projeto (
    PRcod INT PRIMARY KEY,
    PRnome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100),
    Icod INT,
    FOREIGN KEY (Icod) REFERENCES Instituicao(Icodigo)
);

CREATE TABLE Fornecimento (
    Fcod INT,
    Pcod INT,
    PRcod INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (Fcod, Pcod, PRcod),
    FOREIGN KEY (Fcod) REFERENCES Fornecedor(Fcodigo),
    FOREIGN KEY (Pcod) REFERENCES Peca(Pcodigo),
    FOREIGN KEY (PRcod) REFERENCES Projeto(PRcod)
);

-- ALTERAÇÃO DE INFORMAÇÕES DE TABELAS 

-- Criação da tabela Cidade
CREATE TABLE Cidade (
    Ccod INT PRIMARY KEY,
    Cnome VARCHAR(100) NOT NULL,
    UF CHAR(2) NOT NULL
);

-- Alteração de Fornecedor
ALTER TABLE Fornecedor
    ADD Fone VARCHAR(20),
    ADD Ccod INT,
    DROP COLUMN Cidade,
    ADD FOREIGN KEY (Ccod) REFERENCES Cidade(Ccod);

-- Alteração de Peca
ALTER TABLE Peca
    ADD Ccod INT,
    DROP COLUMN Cidade,
    ADD FOREIGN KEY (Ccod) REFERENCES Cidade(Ccod);

-- Alteração de Projeto
ALTER TABLE Projeto
    DROP COLUMN Cidade,
    DROP FOREIGN KEY Projeto_ibfk_1, -- remove FK antiga de Instituicao
    DROP COLUMN Icod,
    ADD Ccod INT,
    ADD FOREIGN KEY (Ccod) REFERENCES Cidade(Ccod);

-- drop da tabela instituição
drop table Instituicao;


-- INSERINDO ÍNDICES NO CAMPOS IMPORTANTES
CREATE INDEX idx_fornecedor_nome ON Fornecedor(Fnome);
CREATE INDEX idx_peca_nome ON Peca(Pnome);
CREATE INDEX idx_projeto_nome ON Projeto(PRnome);

-- Índices em FKs
CREATE INDEX idx_fornecedor_ccod ON Fornecedor(Ccod);
CREATE INDEX idx_peca_ccod ON Peca(Ccod);
CREATE INDEX idx_projeto_ccod ON Projeto(Ccod);


-- inserindo dados
-- tabela cidade
insert into Cidade value ('11','Limeira', 'SP');
insert into Cidade value ('12','São Paulo','SP');
insert into Cidade value ('13','Campinas','SP');

-- tabela fornecedor
insert into Fornecedor value (01, 'Kalunga', '', '(19) 99999-9999', '11');
insert into Fornecedor value (02, 'LLC Logistica', 'Inativo', '(19) 99999-9999', '11');

-- tabela pecas
insert into Peca value ('01','Porca','Preto','1','11');
insert into Peca value ('02','Parafuso','Prata','5','11');


select * from Cidade;
select * from Fornecedor;
select * from Peca;