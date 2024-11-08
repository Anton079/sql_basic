--creare tabel 
CREATE TABLE products
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    product_name        VARCHAR(100) NOT NULL,
    product_description TEXT,
    price               DECIMAL(10, 2),
    stock_count         INT,
    category            VARCHAR(50)
);


--Introducere in tabel
INSERT INTO products(product_name, product_description, price, stock_count, category) VALUES(
    'laptop','laptop Birou',2500.00,10,'Electronice'),
('Telefon','Telefon cu camera de inalta calitate',500.99,55,'Electronice'),
('Tableta','Tableta cu ecran de 10inch', 1200.15,100,'Electronice'),
('Mouse','Mouse cu senzor laser',500.50,15,'Electronice')


--selectarea intregului tabel
SELECT * FROM products;


--selectarea unei coloane dintr un tabel 
SELECT price FROM products;


--selectarea a multiple coloane dintr un tabel 
SELECT price, category FROM products;


--selectarea unei coloane cu un nume temporar
SELECT  product_name AS "Numele Produselor" FROM products;


--gasirea tuturor randurilor dintr o coloana care au valoarea respectiva
SELECT price FROM products WHERE price = 500.50;


--gasirea tuturor randurilor dintr o coloana care nu au valoare respectiva
SELECT  price FROM products WHERE  price != 500.50

--operatori basic

-- < mai putin
-- <= mai putin sau egal
-- > mai mare
-- >= mai mare sau egal

SELECT  price FROM products WHERE  price < 500.50
SELECT  price FROM products WHERE  price <= 500.50
SELECT  price FROM products WHERE  price > 500.50
SELECT  price FROM products WHERE  price >= 500.50


--gasirea a tuturor randurilor dupa mai mule conditii
SELECT price FROM products WHERE  price >= 500.50 AND price <= 5000

SELECT price FROM products WHERE price = 500.50 OR price >2400 -- afiseaza si 500.50 si 2400


--cautarea a mai multor valori de odata intr o coloana 
SELECT price FROM products WHERE price IN (500.50, 2500, 300 ,400);


--a cauta in tot tabelul unde pretul este intr 500 si 2600
SELECT *  FROM products WHERE price BETWEEN 500 AND 2600;


--cautarea valorii unor atribute dupa alt atribut
SELECT price FROM products WHERE product_name LIKE "laptop%";


--cautarea in tot tabelul unde pretul nu este sau este null
SELECT * FROM products where price is NUll;


--cautarea in tot tabelul unde pretul nu este null sau are valori
SELECT * FROM products where price is NOT NUll;