CREATE TABLE student
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      TEXT,
    age        INT
);

CREATE TABLE book(
    id INT AUTO_INCREMENT PRIMARY KEY ,
    student_id  INT,
    book_name TEXT,
    create_at DATETIME,
    FOREIGN KEY( student_id) REFERENCES student(id)
);


CREATE TABLE student_id_card(
    id INT AUTO_INCREMENT PRIMARY KEY ,
    student_id INT,
    card_number INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE course(
                       id INT AUTO_INCREMENT PRIMARY KEY ,
                       nmme TEXT,
                       department TEXT
);

CREATE TABLE enrolment(
    student_id INT,
    course_id INT,
    create_at DATETIME,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);
