create database ferazzian;
use ferazzian;

create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(20),
email varchar(50) unique,
telefone varchar(20),
senha varchar(30) unique,
cargo varchar(30));

create table Fazenda (
idFazenda int primary key auto_increment, 
nome_fazenda varchar(50),
logradouro varchar(60), 
telefone_fazenda varchar(20), -- retirar
email_fazenda varchar(50), -- retirar
UF char(2));
 
create table Plantacao ( -- trocar nome para sensor
idPlantacao int auto_increment primary key, -- idhectare
SensorTemp float, -- 1 sensor por hectare
SensorUmid float,
HoraColeta datetime);
-- colocar campo tipo de grão

alter table Usuario add column fkFazenda int, add constraint UsuarioFazenda foreign key (fkFazenda) references Fazenda(idFazenda);

alter table Usuario add column fkPlantacao int, add constraint UsuarioPlantacao foreign key (fkPlantacao) references Plantacao(idPlantacao);


insert into Usuario (nome, email, telefone, senha, cargo) values
-- Fazenda Espelho D'água 1
('José Almeida', 'almeida.jose@gmail.com', '(65) 94359-8253', '$MaklSOJFER', 'Proprietário'),
('Carlos Santana', 'carlos.santana@outlook.com', '(65) 96782-9764', 'Cs#230478', 'Gerente'),
('Ana Nascimento', 'nasc.ana@gmail.com', '(11) 95801-3158', 'Rz\0I@cV', 'Operador'),
-- Fazenda Trevo de Quatro Folhas
('Fabiana Camargo', 'camargo.fabi@gmail.com', '(62) 92106-6745', 'Fabi_%Camarg#768', 'Proprietário'),
('Raimundo Ferreira', 'raimundo.ferreira@gmail.com', '(62) 98695-9352', 'fR*90674', 'Gerente'),
('César Stefano', 'stefano.cesar@hotmail.com', '(11) 97849-2958', '3472%Myu', 'Operador'),
-- Fazenda Norte
('Rafaela Silva', 'rafaela.silva13@hotmail.com', '(62) 90746-7923', '1xP2_69f2C', 'Proprietário'),
('Romero Espanha', 'espanha.romero@yahoo.com.br', '(62) 94758-2094', '7$2ha64rE8', 'Gerente'),
('Samuel Castro', 'castro.samuel@outlook.com', '(11) 90786-4956', '<06J6%Cl%3', 'Operador'),
-- Fazenda Falcão
('Manuel Pereira', 'pereira.manuel@yahoo.com.br', '(65) 99746-1028', '62CUr*$3,j', 'Proprietário'),
('Leticia Lima', 'lima.leticia@hotmail.com', '(65) 99867-2109', '31;JGd8H[m', 'Gerente'),
('Carolina Vieira', 'carolina.vieira@outlook.com', '(11) 98746-8593', 'wx0qjZ5m[3', 'Operador');

insert into Fazenda (nome_fazenda, logradouro, telefone_fazenda, email_fazenda, UF) values
("Fazenda Espelho D'água", 'MT 699 + 11 km a esquerda + 3 km a direita, Sorriso', '(65) 3589-2764', 'fazenda.espelho.agua@gmail.com', 'MT'),
('Fazenda Trevo de Quatro Folhas', 'À esquerda, Rodovia BR-158, km 56, Bom Jardim de Goiás', '(62) 3899-3474', 'fazenda.trevo.quatro.folhas@gmail.com', 'GO'),
('Fazenda Norte', 'Km 60, R. Goiás, 436 - Norte, Cristalina', '(62) 3702-9047', 'fazenda.norte@hotmail.com', 'GO'),
('Fazenda Falcão', 'Rod MT 220, Km 110, Porto dos Gaúchos', '(65) 3905-6859', 'fazenda.falcao@outlook.com', 'MT');

insert into Plantacao values
-- Fazenda Espelho D'água
( null, 23.4, 35, '2024-02-15 10:07:54'),
-- Fazenda Trevo de Quatro Folhas
( null, 23.7, 29, '2024-02-16 11:13:32'),
-- Fazenda Norte
( null, 28.9, 37, '2024-02-17 12:56:12'),
-- Fazenda Falcão
( null, 24.8, 34, '2024-02-18 14:33:56');

alter table plantacao add column statusSensor char(10); -- retirar statusSensor
alter table plantacao add constraint chkstatusSensor check (statusSensor in('Ligado','Desligado'));
select * from plantacao;
update plantacao set statusSensor = 'Ligado' where idPlantacao = 1;
update plantacao set statusSensor = 'Desligado' where idPlantacao = 2;
update plantacao set statusSensor = 'Desligado' where idPlantacao = 3;
update plantacao set statusSensor = 'Ligado' where idPlantacao = 4;

update Usuario set fkFazenda = 1 where idUsuario in (1, 2, 3);
update Usuario set fkFazenda = 2 where idUsuario in (4, 5, 6);
update Usuario set fkFazenda = 3 where idUsuario in (7, 8, 9);
update Usuario set fkFazenda = 4 where idUsuario in (10, 11, 12);

update Usuario set fkPlantacao = 1 where idUsuario = 1;
update Usuario set fkPlantacao = 2 where idUsuario = 2;
update Usuario set fkPlantacao = 3 where idUsuario = 3;
update Usuario set fkPlantacao = 4 where idUsuario = 4;

select * from Usuario;
select * from Fazenda;
select * from Plantacao;

select Usuario.nome as Usuario, Usuario.cargo as Posição,
Fazenda.nome_fazenda as Fazenda,
SensorTemp as Temperatura, SensorUmid as Umidade, HoraColeta as Horário
from Usuario
join Fazenda on fkFazenda = idFazenda
join Plantacao on fkPlantacao = idPlantacao
;