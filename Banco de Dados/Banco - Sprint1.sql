create database sprint1;
use sprint1;

create table usuario
 ( idUsuario int primary key auto_increment,
 nome varchar(20),
 email varchar(50) unique,
 telefone varchar(20), 
 senha varchar(30) unique,
 cargo varchar(30), 
 idFazenda int);
 
create table fazenda 
( idFazenda int auto_increment primary key, 
nome_fazenda varchar(50),
 logradouro varchar(60), 
 telefone_fazenda varchar(20), 
 email_fazenda varchar(50),
 UF char(2));
 
 
create table plantacao 
( idFazenda int auto_increment primary key,
 idPlantacao char(1),
 SensorTemp float,
 SensorUmid float,
 HoraColeta datetime);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fazenda Espelho D'água
insert into usuario values 
( null, 'José Almeida', 'almeida.jose@gmail.com', '(65) 94359-8253', '$MaklSOJFER', 'Proprietário', 1);
insert into fazenda values
 ( null, "Fazenda Espelho D'água", 'MT 699 + 11 km a esquerda + 3 km a direita, Sorriso', '(65) 3589-2764', 'fazenda.espelho.agua@gmail.com', 'MT');
insert into plantacao values 
( null, 1, 20.4, 35, '2024-02-15 10:07:54');
insert into usuario values
 ( null, 'Carlos Santana', 'carlos.santana@outlook.com', '(65) 96782-9764', 'Cs#230478', 'Gerente', 1);
insert into usuario values
 ( null, 'Ana Nascimento', 'nasc.ana@gmail.com', '(11) 95801-3158', 'Rz\0I@cV', 'Operador', 1);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fazenda Trevo de Quatro Folhas
insert into usuario values
 ( null, 'Fabiana Camargo', 'camargo.fabi@gmail.com', '(62) 92106-6745', 'Fabi_%Camarg#768', 'Proprietário', 2);
insert into fazenda values
 ( null, 'Fazenda Trevo de Quatro Folhas', 'À esquerda, Rodovia BR-158, km 56, Bom Jardim de Goiás', '(62) 3899-3474', 'fazenda.trevo.quatro.folhas@gmail.com', 'GO');
insert into plantacao values 
( null, 1, 23.7, 29, '2024-02-16 11:13:32');
insert into usuario values 
( null, 'Raimundo Ferreira', 'raimundo.ferreira@gmail.com', '(62) 98695-9352', 'fR*90674', 'Gerente', 2);
insert into usuario values 
( null, 'César Stefano', 'stefano.cesar@hotmail.com', '(11) 97849-2958', '3472%Myu', 'Operador', 2);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fazenda Norte
insert into usuario values
 ( null, 'Rafaela Silva', 'rafaela.silva13@hotmail.com', '(62) 90746-7923', '1xP2_69f2C', 'Proprietário', 3);
insert into fazenda values
 ( null, 'Fazenda Norte', 'Km 60, R. Goiás, 436 - Norte, Cristalina', '(62) 3702-9047', 'fazenda.norte@hotmail.com', 'GO');
insert into plantacao values 
( null, 1, 28.9, 37, '2024-02-17 12:56:12');
insert into usuario values
 ( null, 'Romero Espanha', 'espanha.romero@yahoo.com.br', '(62) 94758-2094', '7$2ha64rE8', 'Gerente', 3);
insert into usuario values
 ( null, 'Samuel Castro', 'castro.samuel@outlook.com', '(11) 90786-4956', '<06J6%Cl%3', 'Operador', 3);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fazenda Falcão
insert into usuario values
 ( null, 'Manuel Pereira', 'pereira.manuel@yahoo.com.br', '(65) 99746-1028', '62CUr*$3,j', 'Proprietário', 4);
insert into fazenda values 
( null, 'Fazenda Falcão', 'Rod MT 220, Km 110, Porto dos Gaúchos', '(65) 3905-6859', 'fazenda.falcao@outlook.com', 'MT');
insert into plantacao values
 ( null, 1, 24.8, 34, '2024-02-18 14:33:56');
insert into usuario values 
( null, 'Leticia Lima', 'lima.leticia@hotmail.com', '(65) 99867-2109', '31;JGd8H[m', 'Gerente', 4);
insert into usuario values
 ( null, 'Carolina Vieira', 'carolina.vieira@outlook.com', '(11) 98746-8593', 'wx0qjZ5m[3', 'Operador', 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comandos
select * from usuario;
select * from fazenda;
select * from plantacao;
select * from usuario where idFazenda=1;
select * from usuario where idFazenda=2;
select * from usuario where idFazenda=3;
select * from usuario where idFazenda=4;
select nome from usuario where cargo='Proprietário';
alter table plantacao add column statusSensor char(10);
alter table plantacao add constraint chkstatusSensor check (statusSensor in('Ligado','Desligado'));
select * from plantacao;
update plantacao set statusSensor = 'Ligado' where idFazenda = 1;
update plantacao set statusSensor = 'Desligado' where idFazenda = 2;
update plantacao set statusSensor = 'Desligado' where idFazenda = 3;
update plantacao set statusSensor = 'Ligado' where idFazenda = 4;
drop table usuario;
drop table fazenda;
drop table plantacao;