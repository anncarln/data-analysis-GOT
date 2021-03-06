-- Criação do Banco de dados
DROP DATABASE IF EXISTS `GAME_OF_THRONES`;
CREATE DATABASE `GAME_OF_THRONES`;
USE `GAME_OF_THRONES`;

-- Tabelas importadas do dbdiagram.io
CREATE TABLE HOUSES (
  `HOUSENAME` varchar(35),
  `REGION` varchar(30)
);

CREATE TABLE CHARACTERS (
  `CHARACTER` varchar(35),
  `ACTOR_ESS` varchar(30),
  `EPISODES_APPEARED` varchar(2),
  `FIRST_APPEARANCE` char(4),
  `LAST_APPEARANCE` char(4)
);

CREATE TABLE EPISODES (
  `SEASON` char(1),
  `EPISODE` varchar(2),
  `TITLE` varchar(50),
  `RATING` float,
  `VOTES` varchar(6),
  `SUMMARY` varchar(240),
  `WRITTER1` varchar(20),
  `WRITTER2` varchar(15),
  `STAR1` varchar(22),
  `STAR2` varchar(22),
  `STAR3` varchar(22),
  `USERS_REVIEWS` varchar(4),
  `CRITICS_REVIEWS` varchar(2),
  `US_VIEWERS` float,
  `DURATION` varchar(2),
  `DIRECTOR` varchar(20)
);

-- Tabelas povoadas com CSVs de Game of Thrones
-- Teste das tabelas povoadas corretamente
SELECT * FROM `CHARACTERS`;
SELECT * FROM `EPISODES`;
SELECT * FROM `HOUSES`;

-- Criação de PK em `CHARACTERS` e FK e `EPISODES`
ALTER TABLE `CHARACTERS` ADD PRIMARY KEY (ACTOR_ESS);
ALTER TABLE `EPISODES` ADD CONSTRAINT fk_ACTOR_ESS_ID 
FOREIGN KEY (`STAR1`) REFERENCES `CHARACTERS`(`ACTOR_ESS`);

-- Filtro para gráfico "QUANTIDADE DE CASAS POR REGIÃO"
SELECT `REGION`,COUNT(*) AS TOTAL 
FROM `HOUSES` GROUP BY `REGION` 
ORDER BY TOTAL DESC LIMIT 10
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/REGIONS.csv' 
FIELDS TERMINATED BY ","
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Filtro para gráfico "PERSONAGENS VIVOS POR MAIS TEMPO E EM QUANTOS EPISÓDIOS APARECERAM"
SELECT `CHARACTER`, `LAST_APPEARANCE`-`FIRST_APPEARANCE`
AS TOTAL FROM `CHARACTERS` ORDER BY TOTAL DESC;

-- Sabendo que o máximo de anos é 8 temos o filtro abaixo
SELECT `CHARACTER`, `LAST_APPEARANCE`-`FIRST_APPEARANCE` 
AS TOTAL FROM `CHARACTERS`
WHERE (`LAST_APPEARANCE`-`FIRST_APPEARANCE`) = 8;
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TOP_APEA.csv' 
FIELDS TERMINATED BY ","
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Filtro para Gráfico "TEMPORADAS MELHOR AVALIADAS"
SELECT `SEASON`, ROUND (AVG (`RATING`),2) 
FROM `EPISODES`
GROUP BY `SEASON` 
ORDER BY AVG (`RATING`) DESC
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TEMPORADA_MEDIA.csv' 
FIELDS TERMINATED BY ","
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Personagens mais importantes de todas as temporadas
SELECT `CHARACTER` AS `PERSONAGENS` ​
FROM `CHARACTERS` WHERE `ACTOR_ESS` ​
IN (SELECT `STAR1` FROM `EPISODES`)​
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PERSONAGENS_MAIS_IMPORTANTES.csv' ​
FIELDS TERMINATED BY ","​
ENCLOSED BY '"' ​
LINES TERMINATED BY '\n';​

-- Filtro para o gráfico "TOP 3 DIRETORES COM MAIS EPISÓDIOS DIRIGIDOS"
SELECT `DIRECTOR`, COUNT(*) AS TOTAL  FROM `EPISODES` GROUP BY `DIRECTOR` ORDER BY TOTAL DESC LIMIT 3;

-- Filtro para o gráfico "TOP 3 EPISÓDIOS MAIS LONGOS"
SELECT `TITLE`, MAX(DURATION) AS MAIOR_DURACAO FROM `EPISODES` GROUP BY `TITLE` ORDER BY MAIOR_DURACAO DESC LIMIT 3;