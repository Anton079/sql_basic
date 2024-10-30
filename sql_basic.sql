-- create database
create database  users_management_db;


-- creare tabele
create table users(
    id INT AUTO_INCREMENT  PRIMARY KEY,
    name TEXT NOT NULL ,
    mail VARCHAR(100),
    phone INT,
    date_of_birth DATE,
    address VARCHAR(200)
)

--cum sa inserezi in tabel
INSERT INTO users (name, mail, phone, date_of_birth, address) VALUES
                                                                  ('John Doe', 'john.doe@example.com', 123456, '1980-05-15', '123 Main St, City, Country'),
                                                                  ('Jane Smith', 'jane.smith@example.com', 23456, '1990-06-20', '456 Elm St, Town, Country'),
                                                                  ('Alice Johnson', 'alice.johnson@example.com', 3456, '1975-03-30', '789 Oak St, Village, Country');


--semnul * indica faptul ca dorim sa vedem toate coloanele din acel tabel
--selectarea tuturor coloanelor si randurile dintr un table

SELECT * FROM books;


--selectarea anumitor coloane din table

SELECT name, mail FROM users;


--afisarea cu un nume alternativ temporar a unei coloane

SELECT 'name' AS "Full name " FROM users;


--afisarea unor date dupa niste conditii

SELECT * FROM users WHERE name = 'Maria';   


--afisarea tuturor datelor inafara de ce-a ceruta de tine

SELECT * FROM users WHERE name != 'Maria';


--operatori normali

<, >, <=, >=, și <>

SELECT * FROM users WHERE phone < 200000;  


--conditii multiple 

--  AND si OR
SELECT * FROM users WHERE phone = 123456 AND name = 'Maria';


--  IN
SELECT * FROM users WHERE address IN ('Suite 21');


--  BETWEEN
SELECT * FROM products WHERE price BETWEEN 50 AND 100;


--  LIKE este utilizat pentru a cauta valori care respecta anumite modele

--  % este folosit pentru a selecta toate numele care incep cu litera A
SELECT * FROM users WHERE name LIKE 'A%';

--  _ este folosit pentru a selecta toate cuvinte care incep cu A si au doar doua caractere
SELECT * FROM users WHERE name LIKE 'A_';

--IS NULL si IS NOT NULL este utilizat pentru a verifica daca o coloana are sau nu valori lipsa
SELECT * FROM orders WHERE phone IS NULL;
SELECT * FROM orders WHERE phone IS NOT NULL;





--MODIFICARE DATA CU SQL
--inserare in tabel

INSERT INTO users  VALUES (135,'Antonio','antonio@gmail.com',0761731,1990-03-15,'Bucuresti');


--inserare intr un singur rand cu valori in orice ordine
INSERT INTO users (name, mail, phone, date_of_birth, address) VALUES ('Lucasandru', 'Lucasandru@gmail.com', 0563454,1442-12-30,'Spania');

INSERT INTO  books (title, author, isbn, year_realeased) VALUE  ('Luceafarul','Eminescu',942343243,1920-12-10);



-- updatin la toate randurile dintr un tabel
UPDATE users SET phone = 107229238;


--update la mai multe coloane la toate randurile

UPDATE users SET name = 'Anony', phone = 65463634;


--update la o linie anume
UPDATE  users SET name = 'Beatrice' WHERE name = 'Maria';


--pentru a da delete la toate randurile dintr un tabel 
DELETE FROM users;


--pentru a sterege un anumit rand 

