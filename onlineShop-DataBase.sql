--creare
CREATE TABLE online_shop;
USE online_shop;



CREATE  TABLE Customer(
                          id INT AUTO_INCREMENT PRIMARY KEY ,
                          email VARCHAR(100) NOT NULL,
                          fullName VARCHAR(150),
                          billingAddress VARCHAR(100)
)


-- order
CREATE TABLE orders(
        id INT AUTO_INCREMENT PRIMARY KEY ,
        customer_id INT,
        ammount INT,
        shippingAddress VARCHAR(150),
        FOREIGN KEY (customer_id) REFERENCES customer(id)
)


CREATE  TABLE products(
                          id INT AUTO_INCREMENT PRIMARY KEY ,
                          name VARCHAR(100) NOT NULL,
                          price INT,
                          description VARCHAR(100),
                          create_date datetime,
                          stock INT DEFAULT 0
);


CREATE TABLE order_detail(
                               id INT AUTO_INCREMENT PRIMARY KEY ,
                               order_id INT,
                               product_id INT,
                               price INT,
                               quantity INT,
                               FOREIGN KEY (order_id) REFERENCES customer(id),
                               FOREIGN KEY (product_id) REFERENCES  products(id)
)

--inserare

INSERT INTO customers(id, email, fullName, billingAddress) VALUES
                         (1,'laur@gmail.com','Laur Mihai','Botosani'),
                         (2,'marius@gmail.com','Marius George','Cluj'),
                         (3,'antonio@gmail.com','Antonio Marius','Bucuresti'),
                         (4,'bogdan@gmail.com','Bogdan Mihai','Galati'),
                         (5,'vlad@gmail.com','Vlad Alex','Constanta')


INSERT INTO orders(id, customer_id, ammount, shippingAddress) VALUES
                         (1,1,50,'Botosanni'),
                         (2,1,500,'Botosani'),
                         (3,2,100,'Cluj'),
                         (4,3,150,'Bucuresti')        

               
                         
                                      
INSERT INTO products(name, price, description, create_date, stock) VALUES
                                                                           ('Sare',10,'Alba','2000-01-01',50),
                                                                           ('Cola',6,'Carbogazoaza','2004-01-01',500),
                                                                           ('Pepsi',500,'Acidulata','2004-10-10',400),
                                                                           ('Supa',50,'Supa de legume','2004-01-01',50)   




INSERT INTO order_details( order_id, product_id, price, quantity) VALUES
                                                                         (1,1,50,10),
                                                                         (2,3,5,50),
                                                                         (3,2,5,100),
                                                                         (4,4,2,10);




INSERT INTO orders(customer_id, ammount, shippingAddress) VALUES
                                                                  (1,50,'Cluj'),
                                                                  (2,12,'Botosani'),
                                                                  (3,10,'Odorhei'),
                                                                  (4,25,'Craiova'),
                                                                  (3,25,'Bucuresti'),
                                                                  (2,35,'Kiselef'),
                                                                  (4,12,'Pantelimon'),
                                                                  (1,10,'Cluj')                                                                




INSERT INTO order_details( order_id, product_id, price, quantity) VALUES
                                                                         (5,3,90,51),
                                                                         (6,2,14,5),
                                                                         (7,1,34,11),
                                                                         (8,4,453,51),
                                                                         (9,1,51,1),
                                                                         (10,2,51,5),
                                                                         (11,3,32,7),
                                                                         (12,4,51,1);