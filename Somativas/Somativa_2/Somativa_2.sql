-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database somativa_2;
use somativa_2;
select somativa_2;


CREATE TABLE Cliente (
Celular varchar(15) not null,
CEP varchar(9) not null,
Id_cliente int auto_increment primary key PRIMARY KEY,
N_endereco varchar(10) not null,
Nome varchar(100) not null,
CPF varchar(14) not null,
Email varchar(150) not null
);

CREATE TABLE Carro (
Id_carro int auto_increment primary key PRIMARY KEY,
Placa char(8) not null,
Marca varchar(50) not null,
Modelo varchar(50) not null,
Cor varchar(25) not null,
Ano date not null,
Id_cliente int,
FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente)
);

CREATE TABLE Mecanico (
Id_mec int auto_increment primary key PRIMARY KEY,
Salario decimal(7,2) not null,
Data_nasc date,
CPF varchar(14) not null,
CEP varchar(9) not null,
Nome varchar(100) not null,
N_endereco varchar(10) not null,
Celular varchar(15) not null ,
Email vrchar(150) not null
);

CREATE TABLE OS (
Descricao varchar(255) not null,
Id_servico int auto_increment primary key PRIMARY KEY,
Data_inicio date,
Servico varchar(100) not null,
Data_termino date,
Status char(10) default 'Ativo',
Id_carro int,
Id_mec int,
Id_item int,
FOREIGN KEY(Id_carro) REFERENCES Carro (Id_carro),
FOREIGN KEY(Id_mec) REFERENCES Mecanico (Id_mec),
FOREIGN KEY(Id_item) REFERENCES Estoque (Id_item)
);

CREATE TABLE Estoque (
Qtde int not null,
Preco decimal(5,2) not null,
Id_item int auto_increment primary key PRIMARY KEY,
Nome varchar(150) not null,
Descricao varchar(255) not null
);