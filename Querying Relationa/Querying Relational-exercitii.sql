--afissare asocierilor dintre studenti si cartile lor
SELECT student.first_name, book.book_name     --ce vrei sa iti afiseze
FROM student JOIN book                        --de unde sa isi ia datele
ON student.id = book.student_id               --sa verifice asocierea de date



--afisare asocierii datelor din cele doua tabele si la final e si o conditie
SELECT student.first_name, book.book_name FROM student
JOIN book ON student.id = book.student_id WHERE student_id = 1 



--afisare numele cursului si cine este inscris la el, asociere
SELECT  course.name, student.first_name FROM enrolment

JOIN student ON  student_id = student.id
JOIN course ON course_id = course.id


--afisare numele userilor care au id ul asociat cu student_id din book iar apoi si cei care nu au
SELECT first_name, book_name
FROM student left JOIN book on
    student.id = book.student_id;


--afisarea cartilor care au student_idul asociat cu id ul userilor iar apoi si cei care nu au
SELECT  book_name, first_name
FROM student RIGHT JOIN book on
    student.id = book.student_id;


--returneaza toate valorile de la ambele tabele (cu duplicari)
SELECT book_name FROM book
UNION
SELECT id FROM  student`1