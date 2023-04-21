select * from products order by id;

--Извлеките из таблицы с товарами всё, кроме идентификатора. 
SELECT 
  name AS "Название товара", 
  price as "Цена",
  category AS "Катего4рия",
  in_stock as "В наличии"
FROM 
  products;

--Выведите название товара и на какую сумму запас данного товара хранится в магазине. 
select
  name as "Название товара",
  price * in_stock as "В наличии на сумму"
from
  products;

--получим список заказов, которые отправляются в Казань и ещё не выполнены 
SELECT 
  * 
FROM 
  orders 
WHERE 
  address = 'Казань' 
  AND status != 'done' 
  AND status != 'delivery';
 
-- тот же результат но с пердикатом IN:
SELECT 
  * 
FROM 
  orders 
WHERE 
  address = 'Казань' 
  AND status NOT IN ('done', 'delivery');

--Выведите название всех товаров для дома.
select 
  name
from 
  products 
where 
  category = 'товары для дома';
  
--Выведите название, стоимость и количество в наличии всех товаров, 
--которых в наличии строго больше 3, и их стоимость ниже (или равна) 500 рублей, 
--или товаров, которые стоят больше 5000. 
select 
  name as "NAMES",
  price as "PRICES",
  in_stock as "IN STOCK"
from 
  products
where 
  in_stock > 3 
  and price <= 500
  or price > 5000;
 
--Какие товары будут возвращены в результате запроса?
SELECT 
  name, price  
FROM 
  products 
WHERE 
  price NOT BETWEEN 500 
  AND 5500;
 
SELECT 
  * 
FROM 
  orders 
WHERE 
  status != 'done' 
  AND (
    address = 'Казань' 
    OR address = 'Мурманск' 
    OR address = 'Новосибирск'
  );
--Перепишите запрос выше с использование предиката IN:
SELECT 
  * 
FROM 
  orders 
WHERE 
  status != 'done' 
  AND 
    address in ('Казань', 'Мурманск', 'Новосибирск'); 

--
SELECT 
  name 
FROM 
  clients 
WHERE 
  id IN (
    SELECT 
      client_id 
    FROM 
      orders 
    WHERE 
      address = 'Мурманск'
  );
 
-- запрос, который возвращает имена клиентов, которые не сделали ни одного заказа в магазине.
SELECT 
  name 
FROM 
  clients 
WHERE 
  id not IN (
    SELECT 
      client_id 
    FROM 
      orders); 

--запрос, который возвращает название всех товаров, которые были в заказе с доставкой в Москву.
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
 
