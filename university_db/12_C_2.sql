SELECT*FROM STUDENTS 
SELECT*FROM UNIVERSITIES 
SELECT*FROM LECTURERS 
SELECT*FROM SUBJECTS 
SELECT name, hours FROM SUBJECTS 

-- Задание 12.С.2.5 
-- Сколько студентов учатся на втором курсе и более старших курсах?

SELECT*FROM STUDENTS WHERE COURSE >= 2 

SELECT*FROM STUDENTS WHERE GENDER ='m'
SELECT*FROM STUDENTS WHERE NAME ='Ольга'

-- Студенты 1990 года рождения и старше И которые учатся на первом и втором курсе:
SELECT*FROM STUDENTS WHERE BIRTHDAY >="1990-01-01"and COURSE < 3 

-- Студенты 1990 года рождения и старше ИЛИ которые учатся на первом и втором курсе:
SELECT*FROM STUDENTS WHERE BIRTHDAY >="1990-01-01"or COURSE < 3 

-- Студенты из Остергарда И женского пола И учащиеся от четвёртого курса и выше:
SELECT*FROM STUDENTS WHERE CITY ='Остергард'and GENDER ='f'and COURSE > 3 

-- Студенты из Остергарда И женского пола ИЛИ студенты из Лемурова И мужского пола:
SELECT*FROM STUDENTS WHERE ( CITY ='Остергард'and GENDER ='f') OR ( CITY ='Лемуров'and GENDER ='m') 

-- Задание 12.С.2.7 
-- Скольких студенток зовут Ольга?
SELECT*FROM STUDENTS WHERE NAME ='Ольга'