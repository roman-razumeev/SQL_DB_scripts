--Выведите список городов, из которых приехали студенты, без дублирования названий городов.
SELECT DISTINCT CITY FROM STUDENTS
SELECT * FROM STUDENTS
--важный момент: «звёздочка» в операциях «изъятия» DISTINCT не используется.
SELECT DISTINCT * FROM STUDENTS
--Или
SELECT DISTINCT ID, CITY FROM STUDENTS

--Задание 12.С.4.1
--Сколько уникальных городов в списке преподавателей?
SELECT DISTINCT CITY FROM LECTURERS ORDER BY CITY
SELECT * FROM LECTURERS

--Оператор ORDER BY не убирает повторяющиеся данные, но сортирует их:

SELECT CITY FROM STUDENTS ORDER BY CITY --Выведет города по алфавиту от A, но с дубликатами.

SELECT DISTINCT CITY FROM STUDENTS ORDER BY CITY --Выведет города по алфавиту от А, без дублирования.

--С какого по какой курс учатся студенты города Айфончиков?
SELECT COURSE, CITY FROM STUDENTS WHERE CITY = 'Айфончиков' ORDER BY COURSE

--Задание 12.С.4.2
--Напишите запрос, который выведет список студентов женского пола со стипендией от большей к меньшей без дублирования данных. Необходимо вывести пол и размер стипендии. Должно выйти семь строк и два столбца.
SELECT * FROM STUDENTS
SELECT distinct GENDER, STIPEND from STUDENTS WHERE GENDER='f' ORDER BY STIPEND DESC

--ГРУППИРУЕМ И ПОЛУЧАЕМ ДОПОЛНИТЕЛЬНЫЕ ДАННЫЕ
--Если DISTINCT просто убирает повторения, то GROUP BY запоминает, где и сколько данных было убрано.
--С GROUP BY часто используют агрегатные функции:
--SUM (столбец);
--MIN (столбец);
--MAX (столбец);
--AVG (столбец);
--COUNT (столбец).
--ПРИМЕРЫ
--Общая сумма стипендии студентов:
SELECT SUM(STIPEND) FROM STUDENTS
--Сумма стипендии студентов по городам:
SELECT SUM(STIPEND), CITY FROM STUDENTS GROUP by CITY
--Сумма стипендии студентов по городам + сортировка по сумме:
SELECT SUM(STIPEND), city FROM STUDENTS GROUP by city ORDER BY SUM(STIPEND)
--Максимальная сумма стипендии у студентов женского и мужского пола:
SELECT MAX(STIPEND), GENDER FROM STUDENTS GROUP by GENDER
--Сколько студентов из каждого города (от меньшего к большему)?
SELECT COUNT(city), city FROM STUDENTS GROUP by city order by COUNT(city)
--
SELECT COUNT(GENDER), gender, city FROM STUDENTS GROUP by gender, city order by COUNT(city)
SELECT gender, CITY FROM STUDENTS order by CITY

--Задание 12.С.4.3
--Напишите запрос, который выдаёт число преподавателей (LECTURERS) из г. Остергард.
SELECT COUNT(*) from LECTURERS where city = 'Остергард'
SELECT COUNT(city) from LECTURERS where city = 'Остергард'
select * FROM LECTURERS

--Задание 12.С.4.4
--Какая сумма рейтинга (RATING) университетов (UNIVERSITIES) из городов Зернотаун и Лемуров?
SELECT * from UNIVERSITIES
SELECT SUM(RATING) from UNIVERSITIES WHERE CITY IN ('Зернотаун', 'Лемуров') --1975
--
SELECT SUM(RATING), CITY from UNIVERSITIES WHERE CITY IN ('Зернотаун', 'Лемуров') GROUP by CITY

--Задание 12.С.4.5
--Напишите запрос, который выведет минимальный рейтинг в таблице университетов для городов Зернотаун, Лемуров, Хобитов.
SELECT min(RATING) from UNIVERSITIES where city in ('Зернотаун', 'Лемуров', 'Хобитов')
--ответ из учебника:
SELECT MIN(RATING) FROM UNIVERSITIES WHERE CITY = "Зернотаун" OR CITY = "Лемуров" OR CITY = "Хобитов"
