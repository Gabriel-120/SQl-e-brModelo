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

create table Vendedor (
	Vcodigo int auto_increment not null,
    salario decimal(7,2) not null,
    Fsalarial char(1) not null,
    primary key(Vcodigo)
);


insert into Produto 
value ('01', '10', 'Um teclado gamer', '375');

insert into Produto (unidade, descricao, valor_unit)
values ('10','Um pc para jogar roblox','5000');

select * from Produto;


-- atuaizacao de valores
update Produto
set valor_unit = 32.00
where descricao = 'Um teclado gamer';

update Produto
set valor_unit = 28.00,
descricao = 'Pc branco para joga roblox'
where codigo = 02;

update Produto set valor_unit = valor_unit + (valor_unit * (10 / 100));

-- desafio 
select * from Vendedor;

insert into Vendedor (salario, Fsalarial) value (1904.00, 1);
insert into Vendedor (salario, Fsalarial) value (1904.00, 1);
insert into Vendedor (salario, Fsalarial) value (2808.00, 2);
insert into Vendedor (salario, Fsalarial) value (2808.00, 2);
insert into Vendedor (salario, Fsalarial) value (5712.00, 3);
insert into Vendedor (salario, Fsalarial) value (5712.00, 3);

-- desafio 1 
update Vendedor
set salario = 3150.00
where Fsalarial = 1;

-- desafio 2
update Vendedor
set salario = salario + (salario *(10 / 100))
where Fsalarial = 2;

-- desafio 3 
update Vendedor
set salario = 3500.00
where Fsalarial = 3;


delete from Vendedor
where salario < 2500.00;

delete from Produto;

-- registro unico
delete from Produtos where codigo = '01';

-- Registro multiplo
delete from Vendedor where Fsalarial = 2;

-- Intervalo (operador AND)
delete from Vendedor where Fsalarial>=1 and Vcodigo<=2;

truncate table Produto;
