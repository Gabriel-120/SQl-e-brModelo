-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database solar;
use solar;
select database();


CREATE TABLE Clientes (
Cod_Cliente Int Auto_Increment Primary Key PRIMARY KEY,
Nome_Cliente Varchar(100) Not Null
);

CREATE TABLE Produtos (
Cod_Produto Int Auto_Increment Primary Key PRIMARY KEY,
Nome_Produto Varchar(150) Not Null
);

CREATE TABLE Compra (
Cod_Compra Int Auto_Increment Primary Key PRIMARY KEY,
Cod_Produto Int,
Cod_Cliente Int,
FOREIGN KEY(Cod_Produto) REFERENCES Produtos (Cod_Produto),
FOREIGN KEY(Cod_Cliente) REFERENCES Clientes (Cod_Cliente)
);