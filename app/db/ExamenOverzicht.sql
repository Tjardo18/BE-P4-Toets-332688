DROP DATABASE IF EXISTS `ExamenOverzicht`;
CREATE DATABASE IF NOT EXISTS `ExamenOverzicht`;
Use `ExamenOverzicht`;

DROP TABLE IF EXISTS Examen;
CREATE TABLE IF NOT EXISTS Examen(
Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
StudentId INT NOT NULL,
Rijschool VARCHAR(200) NOT NULL,
Stad VARCHAR(50) NOT NULL,
Rijbewijscategorie VARCHAR(10) NOT NULL,
Datum DATE NOT NULL,
Uitslag VARCHAR(8) NOT NULL,
IsActief BIT NOT NULL DEFAULT 1,
Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
DatumAangemaakt DateTime(6) NOT NULL,
DatumGewijzigd DateTime(6) NOT NULL)
ENGINE = InnoDB;

INSERT INTO Examen VALUES 
(NULL, 100234, 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 103234, 'LinksomRechtsom', 'Dordrecht', 'D', '2023-05-15', 'Geslaagd', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 106452, 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-05-08', 'Gezakt', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 104546, 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-04-17', 'Gezakt', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 100333, 'AltijdGeslaagd', 'Dordrecht', 'B', '2023-05-12', 'Geslaagd', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 124444, 'RijlesVoorJou', 'Rotterdam', 'B', '2023-04-12', 'Geslaagd', '1', NULL, sysdate(6), sysdate(6));

DROP TABLE IF EXISTS Examinator;
CREATE TABLE IF NOT EXISTS Examinator(
Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Voornaam VARCHAR(200) NOT NULL,
Tussenvoegsel VARCHAR(200),
Achternaam VARCHAR(200) NOT NULL,
Mobiel VARCHAR(11) NOT NULL,
IsActief BIT NOT NULL DEFAULT 1,
Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
DatumAangemaakt DateTime(6) NOT NULL,
DatumGewijzigd DateTime(6) NOT NULL)
ENGINE = InnoDB;

INSERT INTO Examinator VALUES
(NULL, 'Manuel', 'van', 'Meekeren', '06-28493823', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 'Lissette', 'den', 'Dongen', '06-24383299', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 'Jurswailly', ' ', 'Luciano', '06-48293846', '1', NULL, sysdate(6), sysdate(6)),
(NULL, 'Naswha', ' ', 'Salawi', '06-34291219', '1', NULL, sysdate(6), sysdate(6));

DROP TABLE IF EXISTS ExamenPerExaminator;
CREATE TABLE IF NOT EXISTS ExamenPerExaminator(
Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ExamenId INT NOT NULL,
ExaminatorId INT NOT NULL,
IsActief BIT NOT NULL DEFAULT 1,
Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
DatumAangemaakt DateTime(6) NOT NULL,
DatumGewijzigd DateTime(6) NOT NULL,
FOREIGN KEY (ExamenId) REFERENCES Examen(Id),
FOREIGN KEY (ExaminatorId) REFERENCES Examinator(Id))
ENGINE = InnoDB;

INSERT INTO ExamenPerExaminator VALUES
(NULL, 1, 3, '1', NULL, sysdate(6), sysdate(6)),
(NULL, 3, 3, '1', NULL, sysdate(6), sysdate(6)),
(NULL, 2, 2, '1', NULL, sysdate(6), sysdate(6)),
(NULL, 4, 1, '1', NULL, sysdate(6), sysdate(6)),
(NULL, 7, 3, '1', NULL, sysdate(6), sysdate(6)),
(NULL, 6, 2, '1', NULL, sysdate(6), sysdate(6)),
(NULL, 5, 4, '1', NULL, sysdate(6), sysdate(6));