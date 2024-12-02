-- Crearea bazei de date
CREATE DATABASE orders_database;

-- Selectarea bazei de date
USE orders_database;


CREATE TABLE orders
(
    order_id            INT AUTO_INCREMENT PRIMARY KEY,
    customer_id         INT NOT NULL,
    order_date          DATE NOT NULL,
    total_amount        DECIMAL(10, 2),
    status              VARCHAR(50)
);


INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
    (1, '2023-01-15', 150.50, 'Procesat'),
    (2, '2023-01-17', 200.00, 'În așteptare'),
    (3, '2023-01-20', 350.75, 'Livrat'),
    (4, '2023-01-25', 500.00, 'În așteptare'),
    (5, '2023-01-28', 250.00, 'Procesat'),
    (6, '2023-01-30', 300.00, 'Livrat');


SELECT * FROM orders;


SELECT total_amount FROM orders;


SELECT order_date, status FROM orders;


SELECT total_amount AS "Suma Totală" FROM orders;


SELECT * FROM orders WHERE status = 'Procesat';


SELECT * FROM orders WHERE status != 'Livrat';


-- Mai mic decât
SELECT * FROM orders WHERE total_amount < 200;

-- Mai mic sau egal cu
SELECT * FROM orders WHERE total_amount <= 200;

-- Mai mare decât
SELECT * FROM orders WHERE total_amount > 200;

-- Mai mare sau egal cu
SELECT * FROM orders WHERE total_amount >= 200;


SELECT * FROM orders WHERE total_amount > 100 AND status = 'Procesat';


SELECT * FROM orders WHERE status IN ('Livrat', 'Procesat');


SELECT * FROM orders WHERE total_amount BETWEEN 100 AND 300;


SELECT * FROM orders WHERE status LIKE 'În a%';


SELECT * FROM orders WHERE total_amount IS NULL;


SELECT order_id, total_amount, status 
FROM orders 
WHERE status = 'Livrat';


SELECT order_id, order_date, total_amount 
FROM orders 
WHERE total_amount > 300;


SELECT *
FROM orders
ORDER BY total_amount DESC;


SELECT * 
FROM orders 
WHERE status IN ('Procesat', 'Livrat');


SELECT * 
FROM orders 
WHERE total_amount BETWEEN 200 AND 500;


UPDATE orders
SET status = 'Anulat'
WHERE total_amount < 200;


--pentru a afla ct la toate type urile de comenzi
SELECT status, COUNT(*) AS total_comenzi 
FROM orders 
GROUP BY status;




---Customers 

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(150) NOT NULL,
    phone       VARCHAR(15),
    address     TEXT
);

INSERT INTO customers (full_name, email, phone, address) 
VALUES
    ('Ion Popescu', 'ion.popescu@example.com', '0720123456', 'Strada Principală nr. 10, București'),
    ('Maria Ionescu', 'maria.ionescu@example.com', '0733123456', 'Strada Libertății nr. 5, Cluj-Napoca'),
    ('George Vasilescu', 'george.vasilescu@example.com', '0745123456', 'Strada Unirii nr. 3, Timișoara'),
    ('Ana Stoica', 'ana.stoica@example.com', '0756123456', 'Bulevardul Victoriei nr. 8, Brașov'),
    ('Elena Mihai', 'elena.mihai@example.com', '0767123456', 'Calea București nr. 12, Craiova'),
    ('Radu Dumitrescu', 'radu.dumitrescu@example.com', '0778123456', 'Strada Florilor nr. 20, Iași');


INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
    (1, '2023-01-15', 150.50, 'Procesat'),
    (2, '2023-01-17', 200.00, 'În așteptare'),
    (3, '2023-01-20', 350.75, 'Livrat'),
    (4, '2023-01-25', 500.00, 'În așteptare'),
    (5, '2023-01-28', 250.00, 'Procesat'),
    (6, '2023-01-30', 300.00, 'Livrat');


SELECT 
    orders.order_id,
    orders.order_date,
    orders.total_amount,
    orders.status,
    customers.full_name,
    customers.email,
    customers.phone
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;



ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE;


