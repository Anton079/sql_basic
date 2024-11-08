--inserarea unui singur rand
INSERT INTO products VALUES (5,'monitor','monitor cu hz multi','560','55','Electronice')


--inserarea a mai multor valori in ordinea din schema
INSERT INTO products (id, product_name, product_description, price, stock_count, category)
VALUES
    (8, 'webcam', 'HD webcam', '70', '200', 'Electronice'),
    (9, 'printer', 'laser printer', '150', '100', 'Electronice');

--update la toata coloana 
UPDATE products SET price = 500;

--update la mai multe coloane
UPDATE products SET stock_count = 0, price = price * 1.10;

--update la coloane dupa conditie
UPDATE products SET price = 450 WHERE product_id = 5;

--update la la randuri dupa coloane specifice
UPDATE products SET stock_count = 10, product_description = '4K monitor with high refresh rate' WHERE product_name = 'monitor';

--a sterge un tabel intreg
DELETE FROM products;


--a sterge dupa conditie
DELETE FROM products WHERE category = 'Electronice' AND stock_count = 0;


--tranzitie
BEGIN TRANSACTION;
BEGIN;
COMMIT;
ROLLBACK;