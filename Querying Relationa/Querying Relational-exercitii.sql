--afisare nume studenti si numele cartiilor  asociate
select student.first_name,book.book_name 
from student JOIN  book on 
student.id = book.student_id


--afisare nume studenti si nume carti dupa idul 1 si 3
SELECT first_name, book_name FROM student

JOIN book on student.id = book.student_id where student_id = 1 or student_id =2;



--afisare nume cursului si cine este inscris
SELECT  course.name, student.first_name FROM enrolment

JOIN student ON  student_id = student.id
JOIN course ON course_id = course.id


--afisarea studentilor care au acelasi id la student_id de la book si a studentilor care nu au nici o carte
SELECT first_name, book_name                          --ce coloane sa se selecteze
FROM student  
left JOIN book on                    
student.id = book.student_id      



