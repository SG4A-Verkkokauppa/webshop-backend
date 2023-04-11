-- Verkkokaupan kanta:

-- Tuotteet taulu:

CREATE TABLE Tuotteet (
  tuotteen_id INT PRIMARY KEY AUTO_INCREMENT,
  tuotteen_nimi VARCHAR(255),
  tuotteen_kuvaus TEXT,
  hinta DECIMAL(5,2),
  varastosaldo INT,
  tuoteryhma_id INT,
  kuva VARCHAR(50),
  FOREIGN KEY (tuoteryhma_id) REFERENCES Tuoteryhma(tuoteryhma_id)
);

-- Tuoteryhmä taulu:
CREATE TABLE Tuoteryhma (
  tuoteryhma_id INT PRIMARY KEY AUTO_INCREMENT,
  tuoteryhma_nimi VARCHAR(255)
);

-- Asiakas-taulu:
CREATE TABLE Asiakas(
  asiakas_id INT PRIMARY KEY AUTO_INCREMENT,
  etunimi VARCHAR(255),
  sukunimi VARCHAR(255),
  sahkoposti VARCHAR(255),
  puhelinnumero VARCHAR(20)
);

-- Tilaus-taulu:
CREATE TABLE Tilaus(
  tilaus_id INT PRIMARY KEY AUTO_INCREMENT,
  asiakas_id INT,
  tilauspvm DATE,
  toimitusosoite TEXT,
  maksutapa VARCHAR(50),
  FOREIGN KEY (asiakas_id) REFERENCES Asiakas(asiakas_id)
);

-- Tilausrivi
CREATE TABLE Tilausrivi (
  tilausrivi_id INT PRIMARY KEY AUTO_INCREMENT,
  tilaus_id INT,
  tuotteen_id INT,
  maara INT,
  hinta DECIMAL(5,2),
  FOREIGN KEY (tilaus_id) REFERENCES Tilaus(tilaus_id),
  FOREIGN KEY (tuotteen_id) REFERENCES Tuotteet(tuotteen_id)
);

-- Tuoteryhmien lisäys:

INSERT INTO Tuoteryhma (tuoteryhma_nimi) VALUES ('Vaatteet');
INSERT INTO Tuoteryhma (tuoteryhma_nimi) VALUES ('Keittiö tarvikkeet');
INSERT INTO Tuoteryhma (tuoteryhma_nimi) VALUES ('Muut tuotteet');

-- Tuotteiden lisäys:

-- Vaatteet:
INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Maagista Paita', '100% puuvillasta valmistettu T-paita tekstillä: Aina tapahtuu jotain maagista', 20, 50, 1, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('T-paita', '100% puuvillasta valmistettu T-paita tekstillä: Come fork with me!', 20, 25, 1, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Maaginen Pipo', 'Jokaiseen päähän sopiva pipo tekstillä: Aina tapahtuu jotain maagista!(Ei tiukkapipoisille!)', 12, 32, 1, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Fork Pipo', 'Jokaiseen päähän sopiva pipo tekstillä: Come fork with me!(Ei tiukkapipoisille!)', 12, 33, 1, NULL);

-- Keittiö tarvikkeet:

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Maagista muki', 'Jokaisen tosi-fanin muki kaikenlaiseen käyttöön!', 15, 10, 2, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Kultamuki', 'Jokaisen tosi-fanin muki kaikenlaiseen käyttöön!', 15, 10, 2, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Siivousliina', 'Tällä liinalla tulee varmasti maagisen siistiä! Jokaiseen käteen sopiva liina, kodin jokaiselle pinnalle!', 4, 15, 2, NULL);

-- Muut tuotteet:
INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Maaginen kangaskassi', 'Jokaiseen olkapäähän iloisesti istuva pitkäripainen kassi', 4, 70, 3, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Fork kangaskassi', 'Jokaiseen olkapäähän iloisesti istuva pitkäripainen kassi', 4, 70, 3, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Parkkikiekko', 'Vältä maagiset sakot! Jokaiseen autoon sopiva parkkikiekko.', 5, 40, 3, NULL);

INSERT INTO Tuotteet (tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) VALUES ('Maaginen pyyhekumi', 'Jotta voit pyyhkiä ylimääräisen magian!', 2, 93, 3, NULL);

-- Testi kuvien lisäys:
UPDATE Tuotteet SET kuva = 'musta parkkikiekko.jpg' WHERE tuotteen_id = 10;

UPDATE Tuotteet SET kuva = 'pinkki-glitter-muki.png' WHERE tuotteen_id = 5;
