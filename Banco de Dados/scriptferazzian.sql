create database ferazzian;
use ferazzian;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nomeEmpresa VARCHAR(45),
  cep CHAR(9),
  cnpj CHAR(18),
  numero VARCHAR(45));

INSERT INTO empresa VALUES
(default, 'Fazenda Bela Vista','12345-678','26.186.289/0001-79','122'),
(default, 'Fazenda Vista Verde','87654-321','26.186.289/0001-78','143'),
(default, 'Fazenda Santa Rita','54321-876','26.186.289/0001-77','333');


CREATE TABLE funcionario (
  idFuncionario INT UNIQUE,
  cpf CHAR(11) UNIQUE NOT NULL,
  fkEmpresaFuncionario INT, PRIMARY KEY (cpf, fkEmpresaFuncionario), 
  FOREIGN KEY (fkEmpresaFuncionario) 
  REFERENCES empresa(idEmpresa),
  nomeFuncionario VARCHAR(45),
  cargo VARCHAR(45));

INSERT INTO funcionario VALUES
(1,'54198667767','1','Antonio','Supervisor'),
(2,'35168661167','2','Renan','Gerente de Produção'),
(3,'24138768717','3','Pedro','Supervisor');

CREATE TABLE usuario (
  idUsuario INT UNIQUE,
  nomeUsuario VARCHAR(45),
  email VARCHAR(30),
  telefone VARCHAR(12),
  senha VARCHAR(45),
  fkFuncionarioUsuario INT, 
  PRIMARY KEY (idUsuario, fkFuncionarioUsuario), 
  FOREIGN KEY (fkFuncionarioUsuario) 
  REFERENCES funcionario(idFuncionario));

INSERT INTO usuario VALUES
(1,'ANTONIO','antonio@belavista.com','11961713435','76hf238rB',1),
(2,'RENAN','renan@vistaverde.com','11962719090','sdh586T',2),
(3,'PEDRO','pedro@santarita.com','11966723334','Hrfer3412',3);

CREATE TABLE fazenda (
  idFazenda INT PRIMARY KEY AUTO_INCREMENT,
  nomeFazenda VARCHAR(45),
  tipoSoja VARCHAR(45),
  tamHectare INT,
  fkEmpresaFazenda INT, CONSTRAINT fkEmpFazenda FOREIGN KEY (fkEmpresaFazenda) REFERENCES empresa(idEmpresa));

INSERT INTO fazenda VALUES
(null,'A','Soja Orgânica', 2, 1),
(null,'B','Soja Convencional', 4, 2),
(null,'C','Soja Orgânica', 50, 3);

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  fkSensorFazenda INT, CONSTRAINT fkSensorFzd FOREIGN KEY (fkSensorFazenda) REFERENCES fazenda(idFazenda));

INSERT INTO sensor VALUES
(1,'DHT11-A1',1),
(2,'DHT11-A2',2),
(3,'DHT11-A3',3);

CREATE TABLE dadosSensor (
  idDadosSensor INT PRIMARY KEY AUTO_INCREMENT,
  sensorTemp DECIMAL,
  sensorUmid DECIMAL,
  horaColeta DATETIME default current_timestamp);

SELECT * FROM empresa;
SELECT * FROM funcionario;
SELECT * FROM usuario;
SELECT * FROM fazenda;
SELECT * FROM sensor;
SELECT * FROM dadosSensor;

-- EXIBINDO O NOME DA EMPRESA, TIPO DE SOJA, DATAS DO PLANTIO E COLHEITA, NOME DO SENSOR, TEMPERATURAS E UMIDADES REGISTRADAS, E A HORA DESSE REGISTRO

SELECT empresa.nomeFazenda AS Empresa,
	fazenda.tipoSoja AS 'Tipo de Soja',
    fazenda.dataPlantio AS 'Data do plantio',
    fazenda.dataColheita AS 'Data da colheita',
    sensor.nome AS Sensor,
    dadosSensor.sensorTemp AS Temperatura,
    dadosSensor.sensorUmid AS Umidade,
    dadosSensor.horaColeta AS 'Hora do Registro'
FROM fazenda 
JOIN empresa 
ON fazenda.fkEmpresaFazenda = empresa.idEmpresa
JOIN sensor 
ON sensor.fkSensorFazenda = fazenda.idFazenda
JOIN  dadosSensor 
ON dadosSensor.fkSensorDados = sensor.idSensor
WHERE idEmpresa = 1;



select empresa.nomeFazenda as NomeEmpresa,
fazenda.tipoSoja as TipoSoja,
fazenda.dataColheita as DataColheita
from empresa join fazenda on fazenda.fkEmpresaFazenda = empresa.idEmpresa; 

select * from funcionario;
select * from usuario;


select nomeFuncionario as Funcionario, email as Email, nomeEmpresa as Empresa from funcionario join usuario on usuario.fkFuncionarioUsuario = funcionario.idFuncionario join empresa on fkEmpresaFuncionario = idEmpresa;
select * from funcionario join usuario on fkFuncionarioUsuario = idFuncionario;

select funcionario.nomeFuncionario as funcionario, empresa.nomeEmpresa as empresa, usuario.email from usuario join funcionario on usuario.fkFuncionarioUsuario = funcionario.idFuncionario join empresa on idEmpresa = funcionario.fkEmpresaFuncionario;