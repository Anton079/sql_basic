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
DELETE FROM users WHERE id =5;