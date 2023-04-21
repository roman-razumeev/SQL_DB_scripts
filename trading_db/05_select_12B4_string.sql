--запрос, возвращаtт имена клиентов, у которых чётный id в верхнем регистре 
select 
  id, 
  upper(name)  
from clients where id%2 = 0;

--номера телефонов клиентов не принято отображать целиком, часть номера лучше скрывать. 
--Например, вместо 89996785432 лучше вернуть 8999***5432.
select 
  'Номер телефона '|| name || ': ' || overlay(
    phone placing 'xxx' 
    from 
      5 for 3
  ) as "Информация о клиенте" 
from
  clients;

--Какие id у заказов, города доставки которых заканчиваются на "ск"?
select * from 
  orders
where 
  address like '%ск';

--запрос, который возвращает имена клиентов в номерах телефонов, в которых после 6 следует 7 или наоборот. 
 select * 
 from 
   clients c 
 where 
   phone similar to '%(67|76)%';
   
  
--В скольких номерах телефонов есть три или более цифры 4 подряд?
 select * from clients 
 where 
   phone similar to '%4{3,}%';
   
--запрос, который возвращает название товаров, категория которых не определена
select name from products 
where 
  category is null;

 --Задание 12.В.4.4
select 
  max(date) - min(date) as "Difference" 
from 
  orders;
  
--Задание 12.В.4.6
--Напишите запрос, который выводит месяц, в котором был сделан самый последний заказ.
select extract(
    month from 
      (
        select 
          max(date) 
        from 
          orders
      )
  ); 
--Задание 12.В.4.7
--Сколько заказов было сделано после 12 марта 2020?
select*from 
  orders 
where 
  date > '2020-03-12';