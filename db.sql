-- Testi taulu, jolla testataan back-end:

CREATE TABLE testi (
    Id int primary key auto_increment,
    name varchar(50) not null
);

INSERT INTO testi (name) VALUES ('Testi1');
INSERT INTO testi (name) VALUES ('Testi2');

 --tämä on malli lause
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

INSERT INTO Tuoteryhma (tuoteryhma_id, tuoteryhma_nimi) VALUES (7,'T-paita');