create database db_joins;
use db_joins;

create table clientes (
cod_cli char(3) not null primary key,
nome varchar(40) not null,
endereco varchar(50) not null,
cidade varchar(20) not null,
estado char(2) not null,
cep char(9) not null
);

create table vendas (
duplic char(6) not null primary key,
valor decimal(10,2) not null,
vencto date not null,
cod_cli char(3) not null,
foreign key (cod_cli) references clientes(cod_cli)
);

create table usuarios (
cod_user int auto_increment primary key,
nome varchar(100) not null,
email varchar(200) not null
);


-- inserts clientes
insert into clientes value (
	'250',
    'Banco Barca S/A',
    'R. vito, 34',
    'Sao Sebastiao',
    'CE',
    '62380-000'
);

insert into clientes value (
	'820',
    'Mecanica Sao Paulo',
    'R. do Macuco, 99',
    'Santo Antonio',
    'ES',
    '29810-020'
);

insert into clientes value (
	'999',
    'Robson boca de reboque',
    'R. paraguai, 100.000.000',
    'Limeira',
    'SP',
    '13487-060'
);

insert into clientes value (
	'900',
    'Robson boca de reboque',
    'R. Estados Unidos, 10',
    'Xique-Xique',
    'BH',
    '73645-465'
);


-- insert vendas
insert into vendas value (
	'230001',
    '1300.00',
    '2001-06-10',
    '250'
);

insert into vendas value (
	'230099',
    '1000.00',
    '2002-10-02',
    '999'
);

insert into vendas value (
	'997818',
    '3000.00',
    '2001-11-11',
    '820'
);

insert into vendas value (
	'997819',
    '3500.00',
    '2001-12-12',
    '900'
);


-- Consultas (Juncões - Join)
select vendas.duplic, clientes.nome
from clientes, vendas
where clientes.cod_cli = vendas.cod_cli;


-- Com Inner Join
select vendas.duplic, clientes.nome
from clientes inner join vendas on clientes.cod_cli = vendas.cod_cli;


-- Com alias 
select ven.duplic, cli.nome
from clientes cli inner join vendas ven on cli.cod_cli = ven.cod_cli;

-- Com order by 
select ven.duplic, cli.nome
from clientes cli inner join vendas ven on cli.cod_cli = ven.cod_cli
order by cli.nome;

-- Com join 
select ven.duplic, cli.nome, cli.cidade
from clientes cli left join vendas ven on cli.cod_cli = ven.cod_cli
order by cli.nome;

-- Right join 
select ven.duplic, cli.nome, cli.cidade
from clientes cli right	join vendas ven on cli.cod_cli = ven.cod_cli
order by cli.nome;

-- Quanidade 
select clientes.nome, count(*) as qtde
from clientes inner join vendas on clientes.cod_cli = vendas.cod_cli
group by clientes.nome;

-- Soma
select clientes.nome, sum(valor) as total 
from clientes inner join vendas on clientes.cod_cli = vendas.cod_cli
group by clientes.nome;

select * from usuarios;