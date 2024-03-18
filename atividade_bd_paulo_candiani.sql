-- Crie o Banco de dados
CREATE DATABASE musicstore_t2;

-- Use o Banco de dados
USE musicstore_t2;

-- Crie a tabela EP
CREATE TABLE EP (
    codEP INT PRIMARY KEY,
    nomeEP VARCHAR(50),
    dataCompra DATE,
    valorPago REAL,
    album VARCHAR(50)
);

-- Crie a tabela Musicas
CREATE TABLE Musicas (
    codEP INT,
    codMusic INT,
    nomeMusic VARCHAR(50),
    artistaMusic VARCHAR(50),
    tempoMusic TIME,
    PRIMARY KEY (codEP, codMusic)
);

-- Insira estes dados na tabela EP
INSERT INTO EP (codEP, nomeEP, dataCompra, valorPago, album) VALUES
(1, 'Rita', '2021-02-01', 1.5, 'Acertou na Mosca'),
(2, 'Pulei na Piscina', '2021-01-10', 1.8, 'Drive in 360'),
(3, 'Alô Ambev', '2021-02-05', 2.5, 'Segue a vida'),
(4, 'Facas', '2020-12-20', 1.4, 'Ao Vivo'),
(5, 'Lance Individual', '2020-12-15', 1.35, 'Lance');


-- Insira estes dados na tabela Musicas
INSERT INTO Musicas (codEP, codMusic, nomeMusic, artistaMusic, tempoMusic) VALUES
(1, 6, 'Rita', 'Tierry', '00:04:09'),
(2, 8, 'Pulei na Piscina', 'Guilherme e Benuto', '00:05:01'),
(3, 5, 'Alô Ambev', 'Zé Neto e Cristiano', '00:04:09'),
(4, 2, 'Facas', 'Diego e Victor Hugo', '00:05:18'),
(5, 3, 'Lance Individual', 'Jorge e Mateus', '00:04:02');


-- Realize uma listagem de todos os EP cadastrados mostrando todos os campos.
SELECT * FROM EP;

-- Realize uma listagem de todas as músicas cadastradas mostrando todos os campos.
SELECT * FROM Musicas;

-- Ordene a listagem dos EP por nome em ordem descendente mostrando apenas os campos Nome e Data.
SELECT nomeEP, dataCompra FROM EP ORDER BY nomeEP DESC;

-- Ordene a listagem das músicas por tempo em ordem ascendente mostrando apenas os campos codMusic, nomeMusic e tempoMusic.
SELECT codMusic, nomeMusic, tempoMusic FROM Musicas ORDER BY tempoMusic ASC;

-- Mostre o total gasto com a compra dos EP.
SELECT SUM(valorPago) AS total_gasto FROM EP;

-- Mostre todos os campos da música cujo campo codMusic seja igual a 5.
SELECT * FROM Musicas WHERE codMusic = 5;

-- Mostre todos os campos do EP cujo campo tempoMusic seja maior que 300
SELECT * FROM EP WHERE codEP IN (SELECT codEP FROM Musicas WHERE tempoMusic > '00:05:00');

-- Mostre todos os campos do EP cujo campo tempoMusic esteja entre 200 a 299
SELECT * FROM EP WHERE codEP IN (SELECT codEP FROM Musicas WHERE tempoMusic BETWEEN '00:03:20' AND '00:04:59');

-- Mostre todos os campos das Musicas e o EP cujos os campos codEP da tabela musica seja igual ao campo codEP da tabela ep.
SELECT * FROM Musicas, EP WHERE Musicas.codEP = EP.codEP;

-- Mostre somente os campos ArtistaMusic, nomeMusic da tabela Musicas
SELECT artistaMusic, nomeMusic FROM Musicas;

-- Retorne a quantidade de registros existentes na tabela EP
SELECT COUNT(*) AS quantidade_registros FROM EP;

-- Retorne o valor maximo pago pelo EP
SELECT MAX(valorPago) AS valor_maximo_pago FROM EP;

-- Retorne o menor tempo de reprodução entre as musicas
SELECT MIN(tempoMusic) AS menor_tempo_reproducao FROM Musicas;

-- Retorne o valor médio pago pelos EP
SELECT AVG(valorPago) AS valor_medio_pago FROM EP;

-- Mostre todos os campos da tabela EP retornando somente os EP vendidos entre 01/01/2020 a 31/01/2021 ordenado por dataCompra de forma ascendente.
SELECT * FROM EP WHERE dataCompra BETWEEN '2020-01-01' AND '2021-01-31' ORDER BY dataCompra ASC;
