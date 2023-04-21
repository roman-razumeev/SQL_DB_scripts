-- Задание 12.С.3.1 
-- Скольких студентов зовут не Ольга, и не Виталий и не Дмитрий? 
SELECT*FROM STUDENTS WHERE NAME !='Ольга'AND NAME !='Виталий'AND NAME !='Дмитрий'

-- Задание 12.С.3.2 
-- Скольких студентов зовут или Ольга, или Виталий, или Дмитрий ? 
SELECT*FROM STUDENTS WHERE NAME ='Ольга'OR NAME ='Виталий'OR NAME ='Дмитрий'

-- Задание 12.С.3.3 
-- Сколько преподавателей в таблице LECTURERS из г.Остергард и из университета с ID (UNIV_ID) = 6 ?
SELECT*FROM LECTURERS WHERE CITY ='Остергард'AND (UNIV_ID) = 6 

-- РАБОТАЕМ С ДИАПАЗОНАМИ 
-- BETWEEN, IN диапазоны можно исключать - используется NOT перед BETWEEN или IN.
-- Список преподавателей  из  городов Колымагиновск, Лемуров, Хобитов: 
 SELECT*FROM LECTURERS WHERE CITY IN ('Колымагиновск','Лемуров','Хобитов') 

-- Студенты со стипендией от 650 до 750 флоринов:
SELECT*FROM STUDENTS WHERE STIPEND BETWEEN 650 and 750 

-- Список преподавателей НЕ из городов Колымагиновск, Лемуров, Хобитов:
SELECT*FROM LECTURERS WHERE CITY NOT IN ('Колымагиновск','Лемуров','Хобитов')

--Студенты со стипендией вне суммы от 700 до 800 флоринов:
SELECT * FROM STUDENTS WHERE STIPEND NOT BETWEEN 700 and 800

--Задание 12.С.3.4
--Сколько студентов из городов Зернотаун, Лемуров, Айфончиков И со второго по четвёртый курс? - 8
SELECT * FROM STUDENTS WHERE CITY IN ('Зернотаун', 'Лемуров', 'Айфончиков') AND COURSE BETWEEN 2 AND 4

--Задание 12.С.3.7
--Сколько студентов нашлось? - 2
--SELECT*from STUDENTS WHERE NAME LIKE "Дани_" - 2
SELECT*from STUDENTS WHERE NAME LIKE "Дани_"
--SELECT*from STUDENTS WHERE NAME LIKE "Дани%" - 4
SELECT*from STUDENTS WHERE NAME LIKE "Дани%"

--Выведите список городов, из которых приехали студенты, без дублирования названий городов.
SELECT DISTINCT CITY FROM STUDENTS
SELECT * FROM STUDENTS
--важный момент: «звёздочка» в операциях «изъятия» DISTINCT не используется.
SELECT DISTINCT * FROM STUDENTS
--Или
SELECT DISTINCT ID, CITY FROM STUDENTS

--Задание 12.С.4.1
--Сколько уникальных городов в списке преподавателей?
SELECT DISTINCT CITY FROM LECTURERS
SELECT * FROM LECTURERS

SELECT CITY FROM STUDENTS ORDER BY CITY