create database Atividade1;

use Atividade1;

create table Clientes (
Cod_Cliente int,
Nome_Cliente varchar(100),
CPF varchar(14),
Celular varchar(18),
Endereco varchar(255)
);

create table Manutencao (
Cod_Manutencao int,
Nome_Cliente varchar(100),
Valor_Manutencao decimal,
Endereco_Cliente varchar(255),
Data_Manutencao datetime
);

create table Produtos (
Cod_Produto int,
Nome_Produto varchar(100),
Descricao varchar(255),
Quantidade int,
Valor decimal
);

create table Funcionarios (
Cod_Funcionario int,
Nome_Funcionario varchar(100),
CPF_Funcionario varchar(14),
Data_Nascimento date,
Salario decimal
);

create table Vendas (
Cod_Venda int,
Nome_Cliente varchar(100),
Produtos_Vendidos varchar(255),
Valor_Venda decimal,
Data_Venda datetime
);


select * from Clientes;
select * from Manutencao;
select * from Produtos;
select * from Funcionarios;
select * from Vendas;