--12B4
 
SELECT 
  current_date,
  current_time;
  
SELECT 
  extract(
    'mon' 
    FROM 
      date '1999-11-27'
  );
  
SELECT 
  extract(
    'day' 
    FROM 
      date '1999-11-27'
  );

SELECT 
  extract(
    'mon', 
    FROM 
      current_date
  );

 
SELECT 
  extract(
    'day' 
    FROM 
      current_date
  );

SELECT 
  extract(
    'day' 
    FROM 
      (
        SELECT 
          current_date
      )
  );
 
select 
  date as "Old date", 
  date + 7 as "New date", 
  date + interval '7 hour' as "New date with time" 
from 
  orders;
 
SELECT 
  extract(
    'year' 
    FROM 
      current_date
  );

 --Посчитайте количество дней между самым новым заказом и текущей датой.  
select 
  max(date), --самая новая дата заказа
  min(date), --самая старая дата заказа
  max(date) - min(date) as "Difference",
  current_date - max(date) as "Diff_02"
from 
  orders;
--Посчитайте количество дней между самым новым заказом и текущей датой.
select 
  current_date - (
    select 
      max(date) 
    from 
      orders
  ); 
--Напишите запрос, который выводит месяц, в котором был сделан самый последний заказ.
SELECT 
  extract(
    'mon' 
    FROM 
      (select max(date) from orders)
  );
SELECT 
  extract(
    month from 
      (select max(date) from orders)
  );

--Сколько заказов было сделано после 12 марта 2020?
select * from orders where date > '2020-03-12';