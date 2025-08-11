create database Atividade2;

use Atividade2;

create table Clientes (
Cod_Cliente int,
Nome_Cliente varchar(100),
CPF varchar(14),
Celular varchar(18),
Endereco varchar(255)
);

create table Funcionarios (
Cod_Funcionario int,
Nome_Funcionario varchar(100),
CPF_Funcionario varchar(14),
Data_Nascimento date,
Salario decimal
);

create table Veiculo (
Cod_Veiculo int,
Nome_Funcionario varchar(100),
Marca_Veiculo varchar(50),
Placa_Veiculo varchar(7),
Modelo_veiculo varchar(50)
);

create table Pacotes (
Cod_Pacote int,
Nome_Cliente varchar(100),
CPF_Cliente varchar(14),
Descricao varchar(255),
Quantidade int
);

create table Entregas (
Cod_Entrega int,
Nome_Cliente varchar(100),
Endereco_Cliente varchar(255),
Cod_Pacote int,
Data_Entrega datetime
);

select * from Clientes;
select * from Entregas;
select * from Pacotes;
select * from Funcionarios;
select * from veiculo;