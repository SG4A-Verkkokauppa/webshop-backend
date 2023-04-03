-- Testi taulu, jolla testataan back-end:

CREATE TABLE testi (
    Id int primary key auto_increment,
    name varchar(50) not null
);

INSERT INTO testi (name) VALUES ('Testi1');
INSERT INTO testi (name) VALUES ('Testi2');

 --tästä alkaa malli lauseet
create table category (
  id int primary key auto_increment,
  name varchar(50) not null
);

create table product (
  id int primary key auto_increment,
  name varchar(100) not null,
  price double (10,2) not null,
  image varchar(50),
  category_id int not null,
  index category_id(category_id),
  foreign key (category_id) references category(id)
  on delete restrict
);

 

insert into category (name) values ('Shirt');
insert into category (name) values ('Poster');

insert into product (name, price,category_id) values ('XL Shirt',10,1);
insert into product (name, price,category_id) values ('Test shoe 2',20,1);

-- tähän päättyy malli lauseet

 --Ajetut taulut
Tuotteet-taulu:*/

CREATE TABLE Tuotteet (
tuotteen_id INT PRIMARY KEY,
tuotteen_nimi VARCHAR(255),
tuotteen_kuvaus TEXT,
hinta DECIMAL(10,2),
varastosaldo INT
);
-- Tuotteet taulun muokkaus:
ALTER TABLE Tuotteet
ADD tuoteryhma_id INT;

ALTER TABLE Tuotteet
ADD kuva VARCHAR(50);

ALTER TABLE Tuotteet
ADD FOREIGN KEY (tuoteryhma_id) REFERENCES Tuoteryhma(tuoteryhma_id);

/*
Tuoteryhma-taulu:
*/
CREATE TABLE Tuoteryhma (
tuoteryhma_id INT PRIMARY KEY,
tuoteryhma_nimi VARCHAR(255)
);


/*
Asiakkaat-taulu:
*/
CREATE TABLE Asiakkaat (
  asiakas_id INT AUTO_INCREMENT PRIMARY KEY,
  etunimi VARCHAR(255),
  sukunimi VARCHAR(255),
  sahkoposti VARCHAR(255),
  puhelinnumero VARCHAR(20)
);

/*
Tilaus-taulu:
*/
CREATE TABLE Tilaus (
tilaus_id INT PRIMARY KEY,
asiakas_id INT,
tilauspaivays DATE,
toimitusosoite TEXT,
maksutapa VARCHAR(50),
FOREIGN KEY (asiakas_id) REFERENCES Asiakkaat(asiakas_id)
);

/*
Tilausrivi-taulu:
*/
CREATE TABLE Tilausrivi (
tilausrivi_id INT PRIMARY KEY,
tilaus_id INT,
tuotteen_id INT,
maara INT,
hinta DECIMAL(10,2),
FOREIGN KEY (tilaus_id) REFERENCES Tilaus(tilaus_id),
FOREIGN KEY (tuotteen_id) REFERENCES Tuotteet(tuotteen_id)
);


 --Tuoteryhmän lisäys tuoteryhmaan
INSERT INTO Tuoteryhma (tuoteryhma_id, tuoteryhma_nimi) VALUES (7,'T-paita');

-- Tuotteen lisäys tuotteet tauluun:
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva) 
VALUES (102, 'Maagista Paita', 'Tässä on maaginen paita', 10, 3, 7);
--
-- Verkkokaupan tuotteet:
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (100, 'T-paita', '100% puuvillasta valmistettu T-paita tekstillä: Aina tapahtuu jotain maagista!', 20, 50, 7, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (101, 'T-paita', '100% puuvillasta valmistettu T-paita tekstillä: Come fork with me!', 20, 25, 7, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (102, 'Pipo', 'Jokaiseen päähän sopiva pipo tekstillä: Aina tapahtuu jotain maagista!(Ei tiukkapipoisille!)', 12, 32, 7, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (103, 'Pipo', 'Jokaiseen päähän sopiva pipo tekstillä: Come fork with me!(Ei tiukkapipoisille!)', 12, 33, 7, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (104, 'Muki', 'Jokaisen tosi-fanin muki kaikenlaiseen käyttöön!', 15, 10, 8, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (105, 'Siivousliina', 'Tällä liinalla tulee varmasti maagisen siistiä! Jokaiseen käteen sopiva liina, kodin jokaiselle pinnalle!', 4, 15, 8, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (106, 'Maaginen parkkikiekko', 'Vältä maagiset sakot! Jokaiseen autoon sopiva parkkikiekko.', 5, 40, 9, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (107, 'Maaginen pyyhekumi', 'Jotta voit pyyhkiä ylimääräisen magian!', 2, 93, 9, NULL);
--
INSERT INTO Tuotteet (tuotteen_id, tuotteen_nimi, tuotteen_kuvaus, hinta, varastosaldo, tuoteryhma_id, kuva)
VALUES (108, 'Kangaskassi', 'Jokaiseen olkapäähän iloisesti istuva pitkäripainen kassi.', 4, 70, 9, NULL);
--

-- Tuotteen poisto tuotteet taulusta:
DELETE FROM Tuotteet
WHERE tuotteen_id = 102;

UPDATE Tuoteryhma SET tuoteryhma_nimi = 'Vaatteet' WHERE tuoteryhma_id = 7;

INSERT INTO Tuoteryhma (tuoteryhma_id, tuoteryhma_nimi) VALUES (8,'Keittio tarvikkeet');

UPDATE Tuoteryhma SET tuoteryhma_nimi = 'Keittiö tarvikkeet' WHERE tuoteryhma_id = 8;

INSERT INTO Tuoteryhma (tuoteryhma_id, tuoteryhma_nimi) VALUES (9,'Muut tuotteet');

 --testikuva images kansioon
UPDATE Tuotteet SET kuva = 'musta parkkikiekko.jpg' WHERE tuotteen_id = 106;
UPDATE Tuotteet SET kuva = 'pinkki-glitter-muki.png' WHERE tuotteen_id = 104;
