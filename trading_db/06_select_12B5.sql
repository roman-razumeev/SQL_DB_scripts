--Для того чтобы выбрать из таблицы только уникальные данные, используется оператор DISTINCT:
select distinct category from products;

--апрос, который возвращает все категории товаров только один раз 
--(значение NULL не должно быть возвращено в этом запросе)
select distinct category from products where category is not null;

--запрос, который выводит название товаров для дома по возрастанию их цены.
select name from products p 
where 
  category = 'товары для дома' 
order by 
  price;
  
-- Запрос ниже считает среднюю стоимость товара в нашем интернет-магазине:
select 
  avg(price) 
from 
  products;

 --кол-во строк для выборки:  
select 
  count(id) 
from 
  products;
  
--Какое имя у самого дорогого товара в магазине?
select name from products p 
where 
  price = (
    select 
      max(price) 
    from 
      products
  );

 --
select 
  address 
from 
  orders 
group by 
  address;
--С помощью какого оператора или функции можно получить такие же результаты (города без повторений)? 
select distinct address from orders;

--запрос подсчитывает количество заказов, отправленных в каждый город:
--без сортировки 
select 
  address, 
  count(*) as order_count 
from 
  orders group by address;
--то же, без сортировки и без именования "order_count "
select 
  address, 
  count(*)
from 
  orders group by address;  

--то же, но с сортировкой - КАК НАДА! 
select 
  address, 
  count(*) as order_count 
from 
  orders 
group by 
  address 
order by 
  order_count desc;

 --Задание 12.В.5.5
--запрос, который подсчитывает среднюю стоимость товара в категории:
select 
  category,  
  avg(price) as avg_price 
from 
  products
group by 
  category 
order by 
  avg_price asc;

 --Задание 12.В.5.6
 --запрос, который возвращает количество видов товара в каждом заказе. 
select 
  order_id,
  count(*) as count_product
from positions 
group by
  order_id 
order by --order_id; 
  count_product asc;
 
 
--Напишите запрос, который возвращает информацию о том, сколько заказов выполнено, 
--сколько заказов в доставке и в процессе обработки. В подсчёте не должны участвовать товары, 
--у которых город доставки — Казань (для этого вам понадобится where).
 select 
   status,
   count(*) as c_status
 from
   orders
 where 
   address != 'Казань' 
 group by
   status; 
------------------------------------------------------------------------------------------------ 
--запрос, который возвращает название всех товаров, которые были в заказе с доставкой в Москву.
--из 12В3.sql
select 
  name
from
  products 
where 
  id in (
    select 
      product_id 
    from 
      positions 
    where 
      order_id in (
        select 
          id 
        from 
          orders 
        where 
          address = 'Москва'
      )
  );  
 -----------------------------------------------------------------------------------------------
--найти среднюю стоимость товара в категории, а потом взять максимальную из этих стоимостей
select 
  max(tmp.avg_price) 
from 
  (
    select 
      category, 
      avg(price) 
    from 
      products 
    group by 
      category
  ) as tmp; 

    
 
--запрос, который выводит название категории, в которой находится самый дорогой товар.
select 
  category  
from 
  products 
where 
  price = (
    select 
      max(price) 
    from 
      products
  )
group by   --без нее тоже выводит
  category;  

--12.В.5.9 запрос, который возвращает названия всех товаров, 
--которые были в самом последнем (по дате) заказе.  
select 
  name
from
  products 
where 
  id in (
    select 
      product_id 
    from 
      positions 
    where 
      order_id = (
        select id from orders where date = (
                                            select 
                                              max(date) 
                                            from 
                                              orders
                                           )
      )
  );  

--найдём все категории, в которых есть более трёх товаров:
select 
  category, 
  count(*) 
from 
  products 
group by 
  category 
having 
  count(*) > 3;
 
--мы можем использовать выражения WHERE и HAVING одновременно. 
--В таком случае сначала фильтруются строки, т. е. применяется условие из WHERE, 
--а потом фильтруются группы с помощью условия из HAVING:
select 
  category, 
  count(*) 
from 
  products 
where 
  price > 100 
group by 
  category 
having 
  count(*) > 3;  
  

 --запрос, который выводит имена клиентов, сортируя их в порядке убывания по длине имени.
 select name, length(name) as lm from clients order by lm;
 select name from clients order by length(name); -- как в ответе
 
 --
 
 


 
 
  
  
  
  