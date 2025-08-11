create database pizzaria;

use pizzaria;

create table cliente(
ID_Cliente int,
Email varchar(255),
CPF int,
Celular int,
Nome_Cliente varchar(255),
Endereco varchar(255)
);

create table pizza(
ID_Pizza int,
Sabor_Pizza varchar(255),
Preco int,
Quantidade int,
Descricao_Pizza varchar(255)
);

create table pedidos(
ID_Pedido int,
Item_Comprado varchar(255),
Preco_total int,
Data_Pedido varchar(255),
Preco_Pedido int,
Nome_Cliente varchar(255)
);

create table funcionario(
ID_Funcionario int,
Celular int,
Salario int,
Data_Nascimento varchar(255),
CPF int,
Nome_Funcionario varchar(255),
Cargo varchar(255)
);

drop database escola; -- Apaga BCD

select * from pedidos; -- Consultar Valores