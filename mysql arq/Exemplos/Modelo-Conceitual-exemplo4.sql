create database Remoterc;
use Remoterc;

select database();

-- tabelas
create table Produto (
	codigo int auto_increment not null,
    unidade char(3) not null,
    descricao varchar(30) not null,
    valor_unit decimal(7,2) not null,
    primary key(codigo)
);

insert into Produto 
value ('01', '10', 'Um teclado gamer', '375');

insert into Produto (unidade, descricao, valor_unit)
values ('10','Um pc para jogar roblox','5000');

select * from Produto;

-- atuaizacao de valores
update Produto
set valor_unit = 32.00
where descricao = 'teclado'