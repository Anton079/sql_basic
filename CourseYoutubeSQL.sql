----------------BASIC SQL---------------------

--cele mai populare atribute
INT  pentru a retine numere
DECIAML(M,N)   pentru decimale, pentru a retine valori exacte
VARCHAR(1)   pentru text, cu nr maxim de litere
BLOD    pentru a retine date cu valori mari
DATE   yyyy-mm-dd
TIMESTAMP    yyyy-mm-dd HH:MM:SS = folosit pentru a inregistra




CREATE TABLE student(
         student_id INT PRIMARY KEY,
         name VARCHAR(20),
         major VARCHAR(20)
);

--sau pentru a face student_id primari key

CREATE TABLE student(
         student_id INT,
         name VARCHAR(20),
         major VARCHAR(20),
         PRIMARY KEY(student_id)
);


--pentru a da info despre tabelul student
DESCRIBE student;


--pentru a sterge
DROP TABLE student;


--adauga coloana in plus
ALTER TABLE student ADD gpa DECIMAL(3,2);

--a da drop la o coloana anume
ALTER TABLE student DROP COLUMN gpa;


--inserarea unui singur rand in tabel
INSERT INTO student VALUES(1,'Jack','Biology');

INSERT INTO student VALUES(2,'Kate','Sociology');



--a-3 ea coloana v-a fi null
INSERT INTO student VALUES (student_id, name, major)(3,'Claire');



--not null inseamna ca nu te lasa sa lasi campul repspectiv gol
name VARCHAR(20) NOT NULL,



--unique este pentru completa cu ceva unic in text, pentru a nu se dubla
name VARCHAR(20) UNIQUE,



--primari key este not null si unique la un loc
student_id INT PRIMARY KEY



--default este pentru a completa cu un text anume in caz ca spatiul ramane gol
major VARCHAR(20) DEFAULT 'undecided',



--auto_increment pune automat id-ul pentru al nu pune manual
student_id INT AUTO_INCREMENT,

INSERT INTO student (name, major) VALUES ('Kate','Sociology');

--------UPDATE--------------


--a da update la major cu textul 'Bio' doar la userii care au 'Biology' la major
UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';


--acelasi lucru doar ca te cauta dupa id
UPDATE student
SET major = 'Comp Sci'
WHERE student_id = 4;


--acelasi lucru doar ca sunt doua conditii
UPDATE student
SET major = 'Comp Sci'
WHERE student_id = 4 OR major = 'Bio';


--pentru a pune la toti studentii scoti conditiile
UPDATE student
SET major = 'undecided';


--pentru a sterge toti userii
DELETE FROM student


--pentru a sterge toti userii dupa conditii
DELETE FROM student
WHERE student_id = 5;

DELETE FROM student
WHERE name = 'Tom' AND major = 'undecided';



--pentru afisare folosesti SELECT
SELECT *  --selectezi ce coloane vrei sa afiseze
FROM student;           --din ce tabel


--afisare dupa conditii
SELECT name           --selectezi ce coloane vrei sa afiseze
FROM student;           --din ce tabel


-- ORDER BY afisare dupa conditii si in ordine alfabetica
SELECT name           --selectezi ce coloane vrei sa afiseze
FROM student,            --din ce tabel
ORDER BY name;              --dupa ce conditie


--DESC afisare dupa conditii si in ordine doar ca invers
SELECT name                  --selectezi ce coloane vrei sa afiseze
FROM student,                 --din ce tabel
ORDER BY name DESC;         --dupa ce conditie


--afisare in ordine invers id urile
SELECT name         --selectezi ce coloane vrei sa afiseze
FROM student,               --din ce tabel
ORDER BY student_id DESC;          --dupa ce conditie


--afisare cu limita 
SELECT *          
FROM student,
LIMIT 2;


--afisare dupa conditii doar daca numele sunt acelea
SELECT *          
FROM student,
WHERE name IN('Claire','Kate','Mike') AND student_id >2;





------------CREATE COMPANY DATABASE---------------
CREATE DATABASE company_database;

USE company_database;

--creare BAZA DE DATE CU REFERENCES
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);


CREATE TABLE branch(
    brach_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
)


--update la brancj_id de la employee
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES brach(brach_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;


--creare tabel client 
CREATE TABLE  client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE  SET NULL
);


--creare tabel works_with
CREATE TABLE  works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id,client_id),
    FOREIGN KEY (emp_id) REFERENCES  employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES  client(client_id) ON DELETE CASCADE
);


--creare tabel branch_supplier
CREATE TABLE  branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR (40),
    PRIMARY KEY (branch_id,supplier_name),
    FOREIGN KEY (branch_id) REFERENCES  branch(branch_id) ON DELETE CASCADE
);


--Corporate
INSERT INTO  employee VALUES (100,'David','Wallace','1967-11-17','M',250000,NULL,NULL);

INSERT INTO branch VALUES (1,'Corporate',100,'2006-02-09');

INSERT INTO employee VALUES (101,'Jan','Levinos','1961-05-11','F',110000,100,1);






INSERT INTO  employee VALUES (102,'Mihaela','Scott','1964-11-17','M',250000,NULL,NULL);

INSERT INTO branch VALUES (2,'Scranton',102,'1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;


INSERT INTO employee VALUES (103,'Angheka','Martin','1971-06-25','F',110000,100,1);
INSERT INTO employee VALUES (104,'Kelly','Kapoor','1980-02-05','F',110000,100,1);
INSERT INTO employee VALUES (105,'Stanley','Hudson','1958-02-19','F',110000,100,1);







INSERT INTO  employee VALUES (106,'Josh','Porter','1964-11-17','M',250000,NULL,NULL);

INSERT INTO branch VALUES (3,'Stanford',102,'1992-04-06');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;


INSERT INTO employee VALUES (107,'Andy','Bernard','1971-06-25','F',110000,100,1);
INSERT INTO employee VALUES (108,'Jim','Halpert','1980-02-05','F',110000,100,1);





-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');





-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);




---WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 26700);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);






-----------MORE BASICS SQL--------

--redenumire doar pe timpul afisarii cand apelezi
SELECT first_name AS forename, last_name AS surname
FROM employee;


--gasirea tuturor genurilor 
--afisarea tipurlor
SELECT DISTINCT sex
FROM employee;

SELECT DISTINCT branch_id
FROM employee;


--gasirea numarului de muncitori
SELECT COUNT(emp_id)
FROM employee;


--gasirea numarului de femei nascute pana in 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_date > '1970-01-01';

--AVG = avrage, media salariilor din tabel
SELECT AVG(salary)
FROM employee;

SELECT AVG(salary)
FROM employee
WHERE sex = 'M';


--sa calculezi, sa vezi cat este totalul salarilor
SELECT SUM(salary)
FROM employee;


--sa vezi totalul de barbatii si femei din tabel
SELECT COUNT(sex)
FROM employee;
--EX: 9


--sa afiseze totatul de barbatii si totalul de femei separat
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;
--EX: F=3    M=6


--găsiți vânzările totale ale fiecărui vânzător
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;
--o sa calculeze suma totala a vanzatirolor din tabelul de vanzari works_with grupate de id urile din tabelul emp_id


--cautare nume
--  LIKE  = sa caute clienti care au LLC
--  %   = te lasa sa pui orice combinatie de cuvinte iar apoi LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC'


-- undeva pe la mijlocul textului sa fie Label pentru al gasi ( J.T Forms & Labels )
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Label &'


--Gasire unui angajat nascut in Octombrie
-- ____ = sunt in loc de anii, el cauta doar luna octombire 
SELECT *
FROM employee
WHERE birth_date LIKE '____-10%'


--afisare celor doua coloane din doua tabelere diferite intr un singur rand, le unesti pentru a le arata
SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch;
-- NU POTI PUNE in primul tabel doua coloane si in al doilea tabel doar o coloana
-- NU POT FI TIPURI DE DATE DIFERITE!!!!!!!!
SELECT first_name, last_name
FROM employee
UNION
SELECT date_time
FROM branch;


--find all bramches and the name of their managers
--a filtra doua tabele care au legaura
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;


--find names of all employees who have over 30000 to a single client

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
SELECT works_with.emp_id
FROM works_with
WHERE works_with.total_sales >3000
);


--trigger
DELIMITER $$
CREATE
     TRIGGER  my_trigger BEFORE INSERT
     ON employee
     FOR EACH ROW BEGIN
          INSERT INTO trigger_test VALUES ('added new employee');
end $$
DELIMITER ;