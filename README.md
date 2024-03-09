# Lista de Exercício SQL – Banco de Dados 02

Abra seu framework e vamos criar o nosso banco de dados chamado MusicStore,
sendo que para o nome do Banco de Dados vamos terminar identificando a sua turma.

<br>


## Nome para o Banco de Dados => musicstore_t1 ou musicstore_t2
```bash
create database musicstore_t2;
```
<br>

## Dentro de seu banco de dados crie as tabelas com os seguintes campos.

 ## Tabela EP
```bash
CREATE TABLE EP (
    codEP INT PRIMARY KEY,
    nomeEP VARCHAR(50),
    dataCompra DATE,
    valorPago DECIMAL(10,2),
    album VARCHAR(50)
);
```
<br>


## Tabela Musicas
```bash
CREATE TABLE Musicas (
    codEP INT,
    codMusic INT,
    nomeMusic VARCHAR(50),
    artistaMusic VARCHAR(50),
    tempoMusic TIME,
    PRIMARY KEY (codEP, codMusic),
    FOREIGN KEY (codEP) REFERENCES EP(codEP)
);

);
```
<br>

## Insira estes dados da tabela EP


| Campo      | Tipo      | Tamanho | Chave |
|------------|-----------|---------|-------|
| codEP      | Int       | -       | PK    |
| nomeEP     | Varchar   | 50      |       |
| dataCompra | Date      | -       |       |
| valorPago  | Real      | -       |       |
| album      | Varchar   | 50      |       |


```bash
INSERT INTO EP (codEP, nomeEP, dataCompra, valorPago, album)
VALUES
(1, 'Rita', '2021-02-01', 1.5, 'Acertou na Mosca'),
(2, 'Pulei na Piscina', '2021-01-10', 1.8, 'Drive in 360'),
(3, 'Alô Ambev', '2021-02-05', 2.5, 'Segue a vida'),
(4, 'Facas', '2020-12-20', 1.4, 'Ao Vivo'),
(5, 'Lance Individual', '2020-12-15', 1.35, 'Lance');
```
 

  OBS.: As datas deverão ser inseridas no padrão americano yyyy-mm-dd.
Exemplo: 01/03/2020 deverá ser inserida “2020-03-01” e entre aspas (“ “) separadas por
traços ( - ).




<br>

## Insira estes dados da tabela Musicas


| codEP | codMusic | nomeMusic        | artistaMusic        | tempoMusic |
|-------|----------|------------------|---------------------|------------|
| 1     | 6        | Rita             | Tierry              | 249        |
| 2     | 8        | Pulei na Piscina | Guilherme e Benuto  | 301        |
| 3     | 5        | Alô Ambev        | Zé Neto e Cristiano| 249        |
| 4     | 2        | Facas            | Diego E Victor Hugo | 318        |
| 5     | 3        | Lance Individual | Jorge e Mateus      | 242        |


```bash
INSERT INTO Musicas (codEP, codMusic, nomeMusic, artistaMusic, tempoMusic)
VALUES
(1, 6, 'Rita', 'Tierry', 249),
(2, 8, 'Pulei na Piscina', 'Guilherme e Benuto', 301),
(3, 5, 'Alô Ambev', 'Zé Neto e Cristiano', 249),
(4, 2, 'Facas', 'Diego E Victor Hugo', 318),
(5, 3, 'Lance Individual', 'Jorge e Mateus', 242);
```
 

<p align="center">
 <img src="">  
</p>



## Execute estes comandos

1. Realize uma listagem de todos os EP cadastrados mostrando todos os campos.
 ```bash
SELECT * FROM EP;

```  
2. Realize uma listagem de todas as músicas cadastradas mostrando todos os campos.
    ```bash
    SELECT * FROM Musicas;
```

3. Ordene a listagem dos EP por nome em ordem descendente mostrando apenas os campos
Nome e Data.

```bash
SELECT nomeEP, dataCompra FROM EP ORDER BY nomeEP DESC;
```
4. Ordene a listagem das músicas por tempo em ordem ascendente mostrando apenas os
campos codMusic, nomeMusic e tempoMusic.
```bash
SELECT codMusic, nomeMusic, tempoMusic FROM Musicas ORDER BY tempoMusic ASC;

```
5. Mostre o total gasto com a compra dos EP.
  ```bash
SELECT SUM(valorPago) AS TotalGasto FROM EP;

```
6. Mostre todos os campos da música cujo campo codMusic seja igual a 5.
   ```bash
SELECT * FROM Musicas WHERE codMusic = 5;

```
7. Mostre todos os campos do EP cujo campo tempoMusic seja maior que 300
  ```bash
SELECT * FROM EP WHERE codEP IN (SELECT codEP FROM Musicas WHERE tempoMusic > 300);

```
8. Mostre todos os campos do EP cujo campo tempoMusic esteja entre 200 a 299
  ```bash
SELECT * FROM EP WHERE codEP IN (SELECT codEP FROM Musicas WHERE tempoMusic BETWEEN 200 AND 299);

```
9. Mostre todos os campos das Musicas e o EP cujos os campos codEP da tabela musica seja
igual ao campo codEP da tabela ep.
```bash
SELECT M.*, E.*
FROM Musicas M
JOIN EP E ON M.codEP = E.codEP;

```
10. Mostre somente os campos ArtistaMusic, nomeMusic da tabela Musicas
  ```bash
SELECT artistaMusic, nomeMusic FROM Musicas;

```
11. Retorne a quantidade de registros existentes na tabela EP
  ```bash
SELECT COUNT(*) AS QuantidadeRegistros FROM EP;

```
12. Retorne o valor maximo pago pelo EP

  ```bash
SELECT MAX(valorPago) AS ValorMaximoPago FROM EP;

```
13. Retorne o menor tempo de reprodução entre as musicas
    ```bash
SELECT MIN(tempoMusic) AS MenorTempoReproducao FROM Musicas;

```
14. Retorne o valor médio pago pelos EP
```bash
SELECT AVG(valorPago) AS ValorMedioPago FROM EP;

```
15. Mostre todos os campos da tabela EP retornando somente os EP vendidos entre 01/01/2020
a 31/01/2021 ordenado por dataCompra de forma ascendente.

```bash
SELECT * FROM EP WHERE dataCompra BETWEEN '2020-01-01' AND '2021-01-31' ORDER BY dataCompra ASC;

```
