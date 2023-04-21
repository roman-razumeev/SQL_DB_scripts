-- Задание 12.С.7.2
-- У скольких университетов в базе нет привязанных преподавателей?
SELECT u.ID , u.NAME , l.SURNAME , l.UNIV_ID FROM UNIVERSITIES u left join LECTURERS l on u.ID = l.UNIV_ID;
SELECT u.ID , u.NAME , l.SURNAME , l.UNIV_ID FROM UNIVERSITIES u left join LECTURERS l on u.ID = l.UNIV_ID WHERE l.SURNAME IS NULL ;

SELECT u.ID , u.NAME , l.SURNAME , l.UNIV_ID FROM UNIVERSITIES u right join LECTURERS l on u.ID = l.UNIV_ID;

SELECT u.ID , u.NAME , l.SURNAME , l.UNIV_ID FROM UNIVERSITIES u right join LECTURERS l on u.ID = l.UNIV_ID WHERE u.ID is NULL ;

-- FULL JOIN isn't supported by MySQL 
-- UNION ALL эквивалентно FULL JOIN

SELECT u.ID , u.NAME , l.SURNAME , l.UNIV_ID FROM UNIVERSITIES u right join LECTURERS l on u.ID = l.UNIV_ID WHERE u.ID is NULL 
UNION
SELECT u.ID , u.NAME , l.SURNAME , l.UNIV_ID FROM UNIVERSITIES u left join LECTURERS l on u.ID = l.UNIV_ID WHERE l.SURNAME IS NULL ;

