create database Biblioteca;
use Biblioteca;

select database();

create table Funcionario (
	Fcod int auto_increment not null,
    NomeF varchar(100) not null,
    Salario decimal(7,2) not null,
    CPF varchar(14) not null,
    Cidade varchar(50) default 'Limeira-SP' not null,
    primary key(Fcod)
);

create table Cliente (
	Ccod int auto_increment not null,
    NomeC varchar(100) not null,
    CPF varchar(14) not null,
    Cidade varchar(50) default 'Limeira-SP' not null,
    primary key(Ccod)
);


-- inserindo novas colunas nas tabelas
-- Cliente
alter table Cliente 
Add column Celular varchar(15) not null,
add column Email varchar(255) not null;

-- Funcionario
alter table Funcionario
Add column Celular varchar(15) not null,
add column Email varchar(255) not null;


-- inserindo valores e atualizando
-- Cliente
insert into Cliente (NomeC, CPF, Cidade, Celular, Email)
value ('Miguel Ferreira', '111.111.111-11', 'Limeira-SP', '(19) 12345-6789', 'MiguelFerreira1234@gmail.com');

insert into Cliente (NomeC, CPF, Cidade, Celular, Email)
value ('Lucas De Lima', '222.222.222-22', 'Brasilia-SP', '(61) 98765-4321', 'Lucas_de_Lima9875@gmail.com');


-- alterando
update Cliente
set Cidade = 'Maranhão-SP'
where NomeC = 'Lucas de Lima';



-- Funcionario
insert into Funcionario (NomeF, Salario, CPF, Cidade, Celular, Email)
value ('Rogerio de Jesus', '1904.00', '908.897.786-65', '', '(19) 90846-2543', 'Rogerinho_do-Grau@gmail.com');

insert into Funcionario (NomeF, Salario, CPF, Cidade, Celular, Email)
value ('Roberta Alves', '2000.00', '124.632.987-78', 'São Paulo-SP', '(61) 74634-5264', 'RobertaAlves2000@gmail.com');


-- alterando
update Funcionario
set Salario = salario + (salario *(20 / 100))
where Cidade = 'Limeira-SP';



-- excluir dados
truncate table Cliente;
truncate table Funcionario;