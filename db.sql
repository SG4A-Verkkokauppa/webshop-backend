-- Testi taulu, jolla testataan back-end:

CREATE TABLE testi (
    Id int primary key auto_increment,
    name varchar(50) not null
);

INSERT INTO testi (name) VALUES ('Testi1');
INSERT INTO testi (name) VALUES ('Testi2');