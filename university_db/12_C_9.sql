-- Задание 12.С.9.5. Самопроверка
-- Напишите запрос, который выберет все города из таблицы LECTURERS и выведет названия городов, упорядочивая их по алфавиту, и количество повторений города в таблице. Не используйте переносы строк.

SELECT CITY , COUNT(CITY) FROM LECTURERS l WHERE CITY IS NOT NULL GROUP BY CITY ORDER BY CITY ASC ;
SELECT CITY , COUNT(CITY) FROM LECTURERS GROUP BY CITY ORDER BY CITY;

-- Задание 12.С.9.7
-- Список студентов и всех университетов в их городе с дублированием имени студента
SELECT STUDENTS.NAME, STUDENTS.CITY, UNIVERSITIES.NAME FROM STUDENTS JOIN UNIVERSITIES ON STUDENTS.CITY = UNIVERSITIES.CITY;

-- Задание 12.С.9.8. Самопроверка
-- Напишите запрос, который выведет фамилию студента, название предметов, которые он изучает на текущем курсе, и количество лекционных часов. Не используйте AS и переносы строк. Пишите в UPPERCASE.

SELECT s.SURNAME, s2.NAME , s2.HOURS 
FROM STUDENTS s 
JOIN SUBJECTS s2 on s.COURSE = s2.COURSE
ORDER BY s.SURNAME ;

-- из ответа на задание:
Select SURNAME, SUBJECTS.NAME, hours FROM STUDENTS JOIN SUBJECTS on STUDENTS.COURSE = SUBJECTS.COURSE;
Select SURNAME, SUBJECTS.NAME, hours FROM STUDENTS JOIN SUBJECTS on  SUBJECTS.COURSE=STUDENTS.COURSE;
Select SURNAME, SUBJECTS.NAME, hours FROM SUBJECTS JOIN STUDENTS on STUDENTS.COURSE = SUBJECTS.COURSE;
Select SURNAME, SUBJECTS.NAME, hours FROM SUBJECTS JOIN STUDENTS on SUBJECTS.COURSE=STUDENTS.COURSE