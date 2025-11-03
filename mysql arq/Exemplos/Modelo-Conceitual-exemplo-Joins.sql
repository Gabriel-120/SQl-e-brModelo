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

select * from usuarios;

create table TabelaEX (
nome varchar(100)
);

create table TabelaFX (
nome varchar(100)
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

-- inserirndo dados das duas novas tabelas
--  TabelaEX
insert into TabelaEX values ('Claudia');
insert into TabelaEX values ('Roberto');
insert into TabelaEX values ('Gabriel');
insert into TabelaEX values ('Alvaro');
insert into TabelaEX values ('Beneli');

-- TabelaFX
insert into TabelaFX values ('Miguel');
insert into TabelaFX values ('Augusto');
insert into TabelaFX values ('Gabriel');
insert into TabelaFX values ('Cadu');
insert into TabelaFX values ('Roberto');

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



-- aula nova 
-- inner join
select EX.nome, FX.nome
from TabelaEX as EX
inner join TabelaFX as FX
on EX.nome = FX.nome;

-- left join 
select EX.nome, FX.nome
from TabelaEX as EX
left join TabelaFX as FX
on EX.nome = FX.nome;

-- right join
select EX.nome, FX.nome
from TabelaEX as EX
right join TabelaFX as FX
on EX.nome = FX.nome;

-- left join com null
select EX.nome, FX.nome
from TabelaEX as EX
left join TabelaFX as FX
on EX.nome = FX.nome
where FX.nome is null;

-- right join com null
select EX.nome, FX.nome
from TabelaEX as EX
right join TabelaFX as FX
on EX.nome = FX.nome
where EX.nome is null;


-- atividade

-- 1 Exibir duplicatas em carteira do cliente “PCTEC - MICROCOMPUTADORES S/A”
-- (como o cliente não existe na base atual, ajuste o nome conforme cadastro)
select cli.nome, ven.duplic, ven.valor
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
where cli.nome = 'PCTEC - MICROCOMPUTADORES S/A';

-- 2️ Exibir nomes dos clientes e data de vencimento das duplicatas de novembro de 2004
select cli.nome, ven.vencto
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
where month(ven.vencto) = 11 and year(ven.vencto) = 2004
order by ven.vencto;

-- 3️ Nome dos clientes e duplicatas com vencimento em outubro (qualquer ano)
select cli.nome, ven.duplic, ven.vencto
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
where month(ven.vencto) = 10;

-- 4️ Nome do cliente, quantidade de títulos e total devido
select cli.nome, count(*) as qtde, sum(ven.valor) as total
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
group by cli.nome;

-- 5️ Mesma consulta anterior com apelido para a soma das duplicatas
select cli.nome, count(*) as qtde, sum(ven.valor) as total_devido
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
group by cli.nome;

-- 6️ Listagem com apelidos CLIENTE e VENCIDOS (vencimento anterior a 31/12/2003)
select cli.nome as CLIENTE, count(*) as VENCIDOS
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
where ven.vencto < '2003-12-31'
group by cli.nome;

-- 7️ Duplicatas em atraso anteriores a 31/12/1999
-- Exibir nome do cliente, valor da duplicata, juros (10%) e valor total
select 
  cli.nome,
  ven.duplic,
  ven.valor,
  (ven.valor * 0.10) as juros,
  (ven.valor + (ven.valor * 0.10)) as total_com_juros
from clientes cli
inner join vendas ven on cli.cod_cli = ven.cod_cli
where ven.vencto < '1999-12-31'
order by cli.nome;
