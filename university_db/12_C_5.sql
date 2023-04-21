--Кто из студентов в каком университете учится:
SELECT * FROM STUDENTS JOIN UNIVERSITIES on UNIV_ID = UNIVERSITIES.id

SELECT * FROM UNIVERSITIES

--Выводит фамилию, курс и название университета, где учится студент.
SELECT SURNAME, COURSE, UNIVERSITIES.`NAME` as `Unm` FROM STUDENTS JOIN UNIVERSITIES on UNIV_ID = UNIVERSITIES.id order by Unm
SELECT ID, SURNAME, COURSE, UNIVERSITIES.`NAME` as `Unm` FROM STUDENTS JOIN UNIVERSITIES on UNIV_ID = UNIVERSITIES.id


--Фамилия преподавателя и название университета:
SELECT SURNAME as `Фамилия преподавателя`, UNIVERSITIES.NAME as `Название Университета` FROM LECTURERS JOIN UNIVERSITIES on UNIV_ID = UNIVERSITIES.id
--То же самое, но без пробелов:
SELECT SURNAME as Фамилия_преподавателя, UNIVERSITIES.NAME as Название_университета FROM LECTURERS JOIN UNIVERSITIES on UNIV_ID = UNIVERSITIES.id

--Узнать, кто из студентов сдавал экзамены и на какую оценку.
SELECT SURNAME, STUDENTS.Name, SUBJECTS.NAME AS `Предмет`, MARK FROM EXAM_MARKS 
JOIN STUDENTS on STUDENT_ID = STUDENTS.id
JOIN SUBJECTS on SUBJ_ID = SUBJECTS.id

--Список оценок только по английскому языку:
SELECT SURNAME, STUDENTS.Name, SUBJECTS.NAME AS `Предмет`, MARK FROM EXAM_MARKS 
JOIN STUDENTS on STUDENT_ID = STUDENTS.id
JOIN SUBJECTS on SUBJ_ID = SUBJECTS.id
WHERE SUBJECTS.NAME = 'Английский'


--Задание 12.С.5.3
--Напишите запрос, который выведет фамилии (без имён) всех студентов и название предмета для предметов, сданных на отлично. Не используйте в запросе AS.
SELECT SURNAME, SUBJECTS.NAME FROM EXAM_MARKS JOIN STUDENTS on STUDENT_ID = STUDENTS.id JOIN SUBJECTS on SUBJ_ID = SUBJECTS.id WHERE MARK = 5

SELECT * FROM EXAM_MARKS 

--Сколько и каких оценок по предметам получили студенты:
SELECT SUBJECTS.NAME, mark, count(mark) FROM EXAM_MARKS 
JOIN STUDENTS on STUDENT_ID = STUDENTS.id
JOIN SUBJECTS on SUBJ_ID = SUBJECTS.ID
GROUP BY SUBJECTS.NAME, mark
ORDER BY  SUBJECTS.NAME

--Средний балл студентов:
SELECT  SURNAME, avg(mark) FROM EXAM_MARKS 
JOIN STUDENTS on STUDENT_ID = STUDENTS.id
JOIN SUBJECTS on SUBJ_ID = SUBJECTS.id
GROUP BY SURNAME
ORDER BY  SURNAME;

--Задание 12.С.5.4
--Какой средний балл у студента с фамилией Винник?
SELECT  SURNAME, avg(mark) FROM EXAM_MARKS 
JOIN STUDENTS on STUDENT_ID = STUDENTS.id
JOIN SUBJECTS on SUBJ_ID = SUBJECTS.id
WHERE SURNAME='Винник';


--Задание 12.С.5.5
--Введите разделённый запятыми список университетов, в которых меньше всего преподавателей.
ТНТУ, ЗДИА, КоХА
--Подсказка: соедините таблицы Преподаватели и Университеты, выведите название и каунт названия, сгруппируйте по ID университетов.
SELECT * FROM LECTURERS
JOIN UNIVERSITIES ON LECTURERS.UNIV_ID = UNIVERSITIES.ID

SELECT UNIVERSITIES.NAME, COUNT(LECTURERS.ID) as num_lec 
FROM LECTURERS
JOIN UNIVERSITIES ON LECTURERS.UNIV_ID = UNIVERSITIES.ID
GROUP BY UNIVERSITIES.ID
order by num_lec;


--Задание 12.С.5.6
--Напишите запрос, который выводит только фамилию преподавателя и название предмета, который он преподаёт. Упорядочьте по названию предмета. Используйте таблицу SUBJ_LECT, не используйте AS.
SELECT LECTURERS.`SURNAME`, SUBJECTS.`NAME` FROM LECTURERS
JOIN SUBJ_LECT ON SUBJ_LECT.LECTURER_ID = LECTURERS.ID
JOIN SUBJECTS ON SUBJ_LECT.SUBJ_ID = SUBJECTS.ID
ORDER by SUBJECTS.`NAME`


--Задание 12.С.5.7
--Сколько преподавателей преподают информатику?
SELECT COUNT(SURNAME) FROM LECTURERS
JOIN SUBJ_LECT ON SUBJ_LECT.LECTURER_ID = LECTURERS.ID
WHERE SUBJ_LECT.SUBJ_ID=1


--Задание 12.С.5.8
--Сколько преподавателей преподают тестирование?
select * from SUBJECTS
SELECT COUNT(SURNAME) FROM LECTURERS
JOIN SUBJ_LECT ON SUBJ_LECT.LECTURER_ID = LECTURERS.ID
WHERE SUBJ_LECT.SUBJ_ID=7

