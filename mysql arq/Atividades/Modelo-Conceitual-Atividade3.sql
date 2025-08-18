create database Atividade3;

use Atividade3;

create table Aluno (
Cod_Aluno int auto_increment primary key not null,
Nome_Aluno varchar(100) not null,
Data_nascimento date not null,
Endereco varchar(255) not null,
Celular varchar(18),
Cod_Reserva int,
foreign key (Cod_Reserva) references Reserva (Cod_Reserva)
);

create table Reserva (
Cod_reserva int auto_increment primary key not null,
Cod_Aluno int not null,
Data_Reserva datetime not null,
Data_Devolucao datetime not null,
descricao varchar(255)
);

create table Armazem (
Cod_Armazem int auto_increment primary key not null,
Nome_armazem varchar(30),
Qtde_Equipamento int,
Valor decimal(5,2) not null,
Endereco varchar(255) not null
);

create table Equipamento (
Cod_Equipamento int auto_increment primary key not null,
Nome_Equipamento varchar(100) not null,
Qtde int,
Valor decimal(5,2) not null,
Descricao varchar(255) 
);

create table Fornecedor (
Cod_Fornecedor int auto_increment primary key not null,
Nome_Fornecedor varchar(100) not null,
CNPJ varchar(14) not null,
Endereco varchar(255) not null,
Ceular varchar(18)
);

create table Tem (
Cod_Tem int auto_increment primary key not null,
Cod_Equipamento int,
Cod_Fornecedor int,
foreign key (Cod_Equipamento) references equipamento (Cod_Equipamento),
foreign key (Cod_Fornecedor) references fornecedor (Cod_Fornecedor)
);

create table Contem (
Cod_Contem int auto_increment primary key not null,
Cod_Armazem int,
Cod_Equipamento int,
foreign key (Cod_Armazem) references Armazem (Cod_Armazem),
foreign key (Cod_Equipamento) references Equipamento (Cod_Equipamento)
);


select * from Aluno;
select * from Reserva;
select * from Fornecedor;
select * from Armazem;
select * from equipamento;
select * from Tem;
select * from Contem;