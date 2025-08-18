create database Exemplo3;

use Exemplo3;

create table if not exists Cliente (
Estado char(2) default 'SP',
Cod_Cliente int auto_increment primary key not null,
Nome_Cliente varchar(100) not null,
Endereco varchar(255) not null,
CPF_Cliente varchar(14) not null,
Celular varchar(18) not null
);


create table Fornecedor (
Cod_Fornecedor int auto_increment primary key not null,
Nome_Fornecedor varchar(100) not null,
CNPJ varchar(18) not null,
Endereco varchar(255) not null,
Celular varchar(18) not null
);

create table Produto (
Cod_Produto int auto_increment primary key not null,
Nome_Produto varchar(255) not null,
Valor decimal(5,2) not null,
Descricao varchar(255),
Qtde int
);

create table Tem (
Cod_Tem int auto_increment primary key not null,
Cod_Fornecedor int,
Cod_Produto int,
foreign key (Cod_Produto) references Produto (Cod_Produto),
foreign key (Cod_Fornecedor) references Fornecedor (Cod_Fornecedor)
);

-- consulta de tabelas 
select * from Clientes;

-- Remoção de tabela
drop table Cliente;

-- Remoção do banco de dados
drop database exemplo3;

-- Alterar Campo 
alter table Cliente
add sexo char(1);

alter table Cliente
drop column sexo;

alter table Cliente 
rename to Pessoa_Fisica;

alter table Pessoa_Fisica
change CPF CPFP varchar(18);

alter table Pessoa_Fisica
modify column Nome_Cliente varchar(150);

alter table Pessoa_Fisica
modify column Estado char(2) default 'MG';


-- Revisar alterações
-- Acresentar os campos cidade em Pessoa_Fisica
alter table Pessoa_Fisica
add Cidade varchar(60) not null;

-- alterar o campo valor produtos para decimal (7,2)
alter table Produto 
modify column valor decimal(7,2) not null;

-- acresentar o campo cidade e estado em fornecedor e definir 
-- o estado como padrão 'sp'

alter table Fornecedor 
add cidade varchar(60) not null,
add estado char(2) default 'SP';

alter table Produto 
add cidade varchar(60) not null,
ADD estado char(2) default 'SP';
