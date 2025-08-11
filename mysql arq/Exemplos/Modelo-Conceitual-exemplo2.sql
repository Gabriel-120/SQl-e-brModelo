-- criar banco cde dados
create database Exemplo2;

-- ativar banco de dados
use Exemplo2;

create table Clientes (
Cod_Cliente int,
Nome_Cliente varchar(100),
CPF varchar(14),
Celular varchar(18),
Endereco varchar(255)
);

create table Estoque (
Cod_Produto int,
Nome_Produto varchar(100),
Quantidade int,
Posicao int,
Validade date
);

create table Produto (
Cod_Produto int,
Nome_Produto varchar(100),
Descricao varchar(255),
Quantidade int,
Valor decimal
);

create table Funcionario (
Cod_Funcionario int,
Nome_Funcionario varchar(100),
CPF_Funcionario varchar(14),
Data_Nascimento date,
Salario decimal
);

-- apaga tabela e banco de dados
drop table Clientes;
drop database Exemplo2;

-- consulta de tabelas
select * from Clientes;


