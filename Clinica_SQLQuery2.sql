Create Database Clinica;

Use Clinica;

CREATE TABLE Enfermeiro (
  ID INT PRIMARY KEY NOT NULL,
  Nome VARCHAR(50) NOT NULL,
  Sobrenome VARCHAR(50) NOT NULL,
  Data_Nascimento DATE,
  Genero VARCHAR(10),
  Endereco VARCHAR(100) UNIQUE,
  Telefone VARCHAR(20) UNIQUE,
  Email VARCHAR(100) UNIQUE,
  Data_Contratacao DATE,
  Cargo VARCHAR(50) NOT NULL
);

INSERT INTO Enfermeiro (Nome, Sobrenome, Data_Nascimento, Genero, Endereco, Telefone, Email, Data_Contratacao, Cargo)
VALUES (1, 'João', 'Matheus', '1990-05-10', 'Masculino', 'Rua A, 123', '(+258) 99999-9999', 'joao.mathues@email.com', '2015-01-01', 'Enfermeiro'),
       (2, 'Maria', 'Souza', '1988-12-03', 'Feminino', 'Rua B, 456', '(+258) 88888-8888', 'maria.souza@email.com', '2016-02-01', 'Enfermeiro');

	   SELECT * FROM Enfermeiro;

CREATE TABLE Especialidades (
  ID INT PRIMARY KEY NOT NULL,
  Nome VARCHAR(50) NOT NULL
);

INSERT INTO Especialidades (ID, Nome)
VALUES (1, 'Cardiologia'),
       (2, 'Pediatria'),
       (3, 'Emergência');

SELECT * FROM Especialidades;

CREATE TABLE Certificacoes (
  ID INT PRIMARY KEY NOT NULL,
  Nome VARCHAR(50) NOT NULL,
  Data_Conclusao DATE,
  ID_Enfermeiro INT,
  FOREIGN KEY (ID_Enfermeiro) REFERENCES Enfermeiro(ID)
);

INSERT INTO Certificacoes (ID, Nome, Data_Conclusao, ID_Enfermeiro)
VALUES (1, 'Certificação A', '2017-06-01', 1),
       (2, 'Certificação B', '2018-09-01', 2),
       (3, 'Certificação C', '2019-03-01', 1);

SELECT * FROM Certificacoes;

CREATE TABLE Plantao (
  ID INT PRIMARY KEY NOT NULL,
  Data_Plantao DATE NOT NULL,
  Horario_Inicio TIME,
  Horario_Termino TIME,
  ID_Enfermeiro INT NOT NULL,
  FOREIGN KEY (ID_Enfermeiro) REFERENCES Enfermeiro(ID)
);

INSERT INTO Plantao (ID, Data_Plantao, Horario_Inicio, Horario_Termino, ID_Enfermeiro)
VALUES (1, '2022-01-01', '08:00:00', '14:00:00', 1),
       (2, '2022-01-02', '14:00:00', '20:00:00', 2),
       (3, '2022-01-03', '08:00:00', '14:00:00', 1);

SELECT * FROM Plantao;

CREATE TABLE Paciente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    DataNascimento DATE,
    Genero VARCHAR(10) NOT NULL,
    Endereco VARCHAR(255) UNIQUE,
    Telefone VARCHAR(20) UNIQUE,
    Email VARCHAR(255)
);


INSERT INTO Paciente (ID, Nome, Sobrenome, DataNascimento, Genero, Endereco, Telefone, Email)
VALUES 
  (1, 'João', 'Silva', '1990-01-01', 'M', 'Rua A, 321', '(258) 1234-5678', 'joao.silva@email.com'),
  (2, 'Maria', 'Santos', '1980-02-02', 'F', 'Av. B, 456', '(258) 2345-6789', 'maria.santos@email.com'),
  (3, 'Pedro', 'Almeida', '1996-03-03', 'M', 'Av. Trabalho C, 789', '(258) 3456-7890', 'pedro.almeida@email.com');

  SELECT * FROM Paciente;

CREATE TABLE Prescrições (
  ID INT PRIMARY KEY NOT NULL,
  Data DATE,
  Medicamento VARCHAR(50) NOT NULL,
  Dosagem VARCHAR(20) NOT NULL,
  Frequencia VARCHAR(20) NOT NULL,
  ID_Enfermeiro INT,
  ID_Paciente INT,
  ID_Plantao INT
FOREIGN KEY (ID_Enfermeiro) REFERENCES Enfermeiro(ID),
FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID),
FOREIGN KEY (ID_Plantao) REFERENCES Plantao(ID)
);

INSERT INTO Prescrições (ID, Data, Medicamento, Dosagem, Frequencia, ID_Enfermeiro, ID_Paciente, ID_Plantao)
VALUES 
  (1, '2022-01-01', 'Paracetamol', '500mg', '6/6 horas', 1, 1, 1),
  (2, '2022-01-02', 'Dipirona', '1g', '8/8 horas', 2, 2, 1),
  (3, '2022-01-03', 'Ibuprofeno', '400mg', '12/12 horas', 2, 3, 2);


   SELECT * FROM prescrições; 