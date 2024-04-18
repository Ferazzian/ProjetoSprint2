create database ferazzian;
use ferazzian;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nomeFazenda VARCHAR(45),
  cep CHAR(9),
  numero VARCHAR(45),
  complemento VARCHAR(45)
  );

  CREATE TABLE usuario (
    cpf CHAR(11) UNIQUE KEY NOT NULL,
    fkEmpresaUsuario INT, PRIMARY KEY (cpf, fkEmpresaUsuario), FOREIGN KEY (fkEmpresaUsuario) REFERENCES empresa(idEmpresa),
    nome VARCHAR(45),
    email VARCHAR(30),
    telefone VARCHAR(12),
    senha VARCHAR(45)
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
    fkSensorParametro INT, CONSTRAINT fkSensorParam FOREIGN KEY (fkSensorParametro) REFERENCES sensor(idSensor)
  );

  CREATE TABLE dadosSensor (
    idDadosSensor INT AUTO_INCREMENT,
    fkSensorDados INT, PRIMARY KEY (idDadosSensor, fkSensorDados), FOREIGN KEY (fkSensorDados) REFERENCES sensor(idSensor),
    sensorTemp FLOAT,
    sensorUmid FLOAT,
    horaColeta DATETIME
  );