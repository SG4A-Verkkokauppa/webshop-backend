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


 --Tuotteen lisäys tuoteryhmaan
INSERT INTO Tuoteryhma (tuoteryhma_id, tuoteryhma_nimi) VALUES (7,'T-paita');