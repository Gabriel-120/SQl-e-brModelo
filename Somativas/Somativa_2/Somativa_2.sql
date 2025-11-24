create database somativa_2;
use somativa_2;


CREATE TABLE Cliente (
Id_cliente int auto_increment primary key PRIMARY KEY,
Nome varchar(100) not null,
CPF varchar(14) not null,
Email varchar(150) not null,
Celular varchar(15) not null,
CEP varchar(9) not null,
N_endereco varchar(10) not null
);

CREATE TABLE Carro (
Id_carro int auto_increment primary key PRIMARY KEY,
Placa char(8) not null,
Marca varchar(50) not null,
Modelo varchar(50) not null,
Cor varchar(25) not null,
Ano date not null,
Id_cliente int,
FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente)
);

CREATE TABLE Mecanico (
Id_mec int auto_increment primary key PRIMARY KEY,
Salario decimal(7,2) not null,
Data_nasc date,
CPF varchar(14) not null,
CEP varchar(9) not null,
Nome varchar(100) not null,
N_endereco varchar(10) not null,
Celular varchar(15) not null ,
Email varchar(150) not null
);

CREATE TABLE OS (
Descricao varchar(255) not null,
Id_servico int auto_increment primary key PRIMARY KEY,
Data_inicio date,
Servico varchar(100) not null,
Data_termino date,
Status_os char(11) default 'Em Execução',
Id_carro int,
Id_mec int,
Id_item int,
FOREIGN KEY(Id_carro) REFERENCES Carro (Id_carro),
FOREIGN KEY(Id_mec) REFERENCES Mecanico (Id_mec),
FOREIGN KEY(Id_item) REFERENCES Estoque (Id_item)
);

CREATE TABLE Estoque (
Qtde int not null,
Preco decimal(5,2) not null,
Id_item int auto_increment primary key PRIMARY KEY,
Nome varchar(150) not null,
Descricao varchar(255) not null
);

-------- 1 --------
-- 1.1: Selecione todos os veículos cadastrados que são da marca "Ford".
select * from Carro where Marca = "Ford";

-- 1.2: Liste todos os clientes que abriram uma Ordem de Serviço (OS) nos últimos 6 meses.alter
select distinct c.Nome, c.CPF, o.Data_inicio
from Cliente c 
join Carro car on c.Id_cliente = car.Id_cliente
join OS o on car.Id_carro = o.Id_carro
where o.Data_inicio <= DATE_SUB(CURDATE(), interval 6 month);

-- 1.3: Mostre os mecânicos que possuem a especialidade "Injeção Eletrônica"
alter table Mecanico add column Especialidade varchar(100) not null;
select * from Mecanico where Especialidade = "Injeção Eletrônica";

-- 1.4: Exiba todas as Ordens de Serviço (OS) que estão com o status "Aguardando Peça".
alter table OS add column Status_peca varchar(20) default 'Aguardando Peça';
select * from OS where Status_peca = "Aguardando Peça";

-- 1.5: Liste as peças (tabela Pecas) cujo estoque (qtd_estoque) está abaixo de 5 unidades.
select * from Estoque where Quantidade < 5;

-- 1.6: Escreva uma consulta para encontrar os veículos que já tiveram mais de uma Ordem de Serviço (retornaram à oficina) usando uma subconsulta correlacionada.


-- 1.7: Identifique as Ordens de Serviço que foram executadas por um mecânico específico (ex: id_mecanico = 3).
select * from OS where Id_mec = 3;



-------- 2 --------
-- 2.1: Atualize o preco_venda de todas as peças do fabricante "Bosch", aplicando um aumento de 5%.
alter table Estoque add column Fabricante varchar(100) not null;
update Estoque set Preco = Preco + (Preco*(5/100)) where Fabricante = "Bosch";

-- 2.2: Modifique o status da Ordem de Serviço de ID 105 de "Em Execução" para "Concluída".
update OS set Status_os = "Concluída" where Id_servico = 105;

-- 2.3: Atualize a data_conclusao de todas as Ordens de Serviço que ainda estão "Em Execução" e foram abertas há mais de 30 dias.
update OS set Data_termino = "10/12/2025" where Status_os = "Em Execução" and Data_inicio >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- desafio 
update Estoque set Qtde = Qtde*2 where Id_item = 20;



-------- 3 --------
-- 3.1: Adicione uma nova coluna email (tipo VARCHAR(100)) à tabela Clientes.
alter table Cliente add column Email_sec varchar(100) not null;

-- 3.2: Modifique o tipo de dados da coluna especialidade na tabela Mecanicos para VARCHAR(150).
alter table Mecanico modify column Especialidade varchar(150) not null;

-- 3.3: Remova uma coluna (ex: diagnostico_entrada) da tabela Ordens_Servico.
alter table OS drop column Descricao;

-- desafio: Adicione uma restrição CHECK na tabela Pecas para garantir que preco_venda seja sempre maior ou igual ao preco_custo.
alter table Estoque add column Preco_custo decimal(5,2) not null;
alter table Estoque add constraint VendaMaiorCusto check (Preco >= Preco_custo);


-------- 4 --------
-- 4.1: Liste todas as Ordens de Serviço, incluindo o nome do cliente, a placa do veículo e a data de abertura da OS.
select c.Nome as Nome_Cliente, car.Placa, o.Data_inicio
from OS o
join Carro car on o.Id_carro = car.Id_carro
join Cliente c on car.Id_cliente = c.Id_cliente;

-- 4.2: Mostre todas as peças usadas na OS de ID 50, incluindo o nome da peça (da tabela Pecas) e a quantidade_usada (da tabela OS_Pecas).
alter table OS add column Qtde_pecas int not null;
select e.Nome as Nome, o.Qtde_pecas
from Estoque e
join OS o on o.Id_item = e.Id_item 
where o.Id_servico = 50;

-- 4.3: Exiba os nomes dos mecânicos que trabalharam na OS de ID 75 (consultando Mecanicos e OS_Mecanicos).
select m.Nome as Nome
from Mecanico m
join OS o on o.Id_mec = m.Id_mec
where o.Id_servico = 75;

-- Desafio: Liste todos os veículos (placa e modelo) cadastrados e o nome do seu respectivo proprietário (cliente).
select c.Nome as Nome_Cliente, v.Placa, v.Modelo
from Carro v
join Cliente c on c.Id_cliente = v.Id_cliente;


-------- 5 --------
-- 5.1: Liste a placa e o modelo dos veículos que estão atualmente com uma OS "Em Execução".
select c.Placa, c.Modelo
from Carro c
inner join OS o
on o.Id_carro = c.Id_carro
where o.Status_os = "Em Execução";

-- 5.2: Mostre o nome dos clientes que possuem veículos da marca “Volkswagen".
select c.Nome as Nome_Cliente
from Carro v
inner join Cliente c
on v.Id_cliente = c.Id_cliente
where v.Marca = "Volkswagen";

-- 5.3: Exiba os nomes dos mecânicos que já trabalharam em pelo menos uma Ordem de Serviço (ou seja, que aparecem na tabela OS_Mecanicos).
select m.Nome as Nome_Mecanico
from OS o
inner join Mecanico m
on o.Id_mec = m.Id_mec;

-- Desafio: Liste apenas os nomes dos serviços (da tabela Servicos) que já foram executados (ou seja, que aparecem na tabela OS_Servicos).
select Servico from OS 
where Status_os = "Concluído";


-------- 6 --------
-- 6.1: Liste todos os clientes cadastrados e, para aqueles que já tiveram OS, mostre os IDs das ordens. Clientes que nunca vieram à oficina devem aparecer na lista.
SELECT c.Nome, c.Celular, o.Id_servico AS Id_OS
FROM Cliente c
join Carro car on c.Id_cliente = car.Id_cliente
LEFT JOIN OS o
ON car.Id_carro = o.Id_carro;

-- 6.2: Mostre todos os mecânicos e a quantidade de Ordens de Serviço em que cada um trabalhou (use COUNT). Mecânicos que nunca trabalharam em uma OS (novatos) devem aparecer com contagem 0.
select  m.Nome, count(o.Id_mec) as Qtde_de_OS
from OS o
left join Mecanico m
on o.Id_mec = m.Id_mec
group by m.Nome;

-- 6.3: Exiba todas as peças cadastradas (tabela Pecas) e, se houver, a quantidade total vendida de cada uma (somando de OS_Pecas). Peças que nunca foram vendidas devem aparecer.
select * from Estoque;

-- Desafio: Liste todos os veículos e a data da última OS aberta para cada um. Veículos que nunca tiveram uma OS devem aparecer com a data nula.
select c.Marca, c.Modelo, c.Placa, max(o.Data_inicio) as Data_Ultima_OS
from Carro c
left join OS o
on c.Id_carro = o.Id_carro
group by c.Id_carro, c.Marca, c.Modelo, c.Placa
order by Data_Ultima_OS DESC;


-------- 7 --------
-- 7.1: (Este é o inverso do 6.1) Liste todas as Ordens de Serviço e o nome do cliente correspondente.
select o.Id_servico as ID_OS, c.Nome, c.Celular
from OS o
join Carro car 
on o.Id_carro = car.Id_carro
right join Cliente c 
on car.Id_cliente = c.Id_cliente;

-- 7.2: Mostre todos os serviços (da tabela Servicos) e os IDs das OS onde eles foram usados. Serviços que nunca foram executados devem aparecer na lista (com ID da OS nulo).
select Id_servico, Servico from OS;

-- 7.3: Exiba todos os itens da tabela OS_Mecanicos e traga o nome completo do mecânico da tabela Mecanicos (um INNER JOIN daria o mesmo resultado neste caso).
select o.Id_servico, o.Servico, o.Descricao, o.Data_inicio, o.Data_termino, m.Nome as Nome_Completo_Mec
from Mecanico m
right join OS o
on m.Id_mec = o.Id_mec;

-- Desafio: Liste todos os veículos (tabela Veiculos, direita) e as OS associadas (tabela Ordens_Servico, esquerda). Veículos sem OS devem aparecer. (Demonstração de inversão do LEFT JOIN).
select c.Marca, c.Modelo, c.Placa, o.Id_servico as ID_OS
from OS o
right join Carro c 
on c.Id_carro = o.Id_carro;


-------- 2 --------



-------- 2 --------



-------- 2 --------



-------- 2 --------



-------- 2 --------



-------- 2 --------



-------- 2 --------


