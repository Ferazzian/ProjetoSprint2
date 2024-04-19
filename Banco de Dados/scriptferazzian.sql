create database ferazzian;
use ferazzian;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nomeFazenda VARCHAR(45),
  cep CHAR(9),
  cnpj CHAR(18),
  numero VARCHAR(45),
  cidade VARCHAR(45),
  bairro VARCHAR(45)
  );

CREATE TABLE funcionario (
  idFuncionario INT UNIQUE,
  cpf CHAR(11) UNIQUE NOT NULL,
  fkEmpresaFuncionario INT, PRIMARY KEY (cpf, fkEmpresaFuncionario), 
  FOREIGN KEY (fkEmpresaFuncionario) 
  REFERENCES empresa(idEmpresa),
  nomeFuncionario VARCHAR(45),
  cargo VARCHAR(45)
);

CREATE TABLE usuario (
  idUsuario INT UNIQUE,
  nomeUsuario VARCHAR(45),
  email VARCHAR(30),
  telefone VARCHAR(12),
  senha VARCHAR(45),
  fkFuncionarioUsuario INT, 
  PRIMARY KEY (idUsuario, fkFuncionarioUsuario), 
  FOREIGN KEY (fkFuncionarioUsuario) 
  REFERENCES funcionario(idFuncionario)
);

CREATE TABLE fazenda (
  idFazenda INT PRIMARY KEY AUTO_INCREMENT,
  tipoSoja VARCHAR(45),
  dataPlantio DATE,
  dataColheita DATE,
  tamHectare float,
  fkEmpresaFazenda INT, CONSTRAINT fkEmpFazenda FOREIGN KEY (fkEmpresaFazenda) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  fkSensorFazenda INT, CONSTRAINT fkSensorFzd FOREIGN KEY (fkSensorFazenda) REFERENCES fazenda(idFazenda)
);

CREATE TABLE parametro (
  idParametro INT PRIMARY KEY AUTO_INCREMENT,
  tempMax float,
  tempMin float,
  umiMax float,
  umiMin float,
  fkSensorParametro INT, 
  CONSTRAINT fkSensorParam FOREIGN KEY (fkSensorParametro) 
  REFERENCES sensor(idSensor)
);

CREATE TABLE dadosSensor (
  idDadosSensor INT AUTO_INCREMENT,
  fkSensorDados INT, PRIMARY KEY (idDadosSensor, fkSensorDados), FOREIGN KEY (fkSensorDados) 
  REFERENCES sensor(idSensor),
  sensorTemp FLOAT,
  sensorUmid FLOAT,
  horaColeta DATETIME
);

INSERT INTO empresa VALUES
(null,'Fazenda Bela Vista','12345-678','26186289000179','122','São Paulo','Bela Vista'),
(null,'Fazenda Vista Verde','87654-321','46070868001998','143','São Paulo','Vista Verde'),
(null,'Fazenda Santa Rita','54321-876','60318797000100','333','São Paulo','Rural do Vale');

INSERT INTO funcionario VALUES
(1,'54198667767','1','Antonio','Supevisor'),
(2,'35168661167','2','Renan','Gerente de Produção'),
(3,'24138768717','3','Pedro','Supevisor');

INSERT INTO usuario VALUES
(1,'Antonio','antonio@belavista.com','11961713435','76hf238rB',1),
(2,'Renan','renan@vistaverde.com','11962719090','sdh586T',2),
(3,'Pedro','pedro@santarita.com','11966723334','Hrfer3412',3);

INSERT INTO fazenda VALUES
(null,'Soja Orgânica','2024-01-01','2024-04-30',1.5,1),
(null,'Soja Convencional','2024-03-01','2024-06-29',3.7,2),
(null,'Soja Orgânica','2024-04-01','2024-07-30',50.5,3);

INSERT INTO sensor VALUES
(1,'DHT11-A1',1),
(2,'DHT11-A2',2),
(3,'DHT11-A3',3);

INSERT INTO parametro VALUES
(1,'20','15','60','41',1),
(2,'28','11','75','55',2),
(3,'26','17','78','61',3);

INSERT INTO dadosSensor VALUES
(1,1,'20','70','2024-01-01 00:00:00');

SELECT * FROM empresa;
SELECT * FROM funcionario;
SELECT * FROM usuario;
SELECT * FROM fazenda;
SELECT * FROM sensor;
SELECT * FROM parametro;
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


