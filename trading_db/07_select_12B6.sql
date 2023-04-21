
--запрос отбирает и соединяет те записи, у которых значение поля id в обеих таблицах совпадает.  
select 
   * 
from 
  orders 
  join clients on orders.client_id = clients.id;
   
-- декртово произведение CROSS JOIN - все со всеми - используется для АНАЛИТИКИ.
select 
  * 
from 
  orders 
CROSS join 
  clients;

--внешнее объединение (FULL OUTER JOIN), которое объединяет записи из обеих таблиц (если условие 
--объединения равно true) и дополняет их всеми записями из обеих таблиц, которые не имеют совпадений. 
--Для записей, которые не имеют совпадений из другой таблицы, недостающее поле будет иметь значение NULL.
select 
  * 
from 
  orders 
  full outer join clients on orders.client_id = clients.id;
 
--то же самое, но без outer - результат тот же!  
select 
  * 
from 
  orders 
  full join clients on orders.client_id = clients.id;

--LEFT OUTER JOIN). В этом случае мы получаем все записи, удовлетворяющие условию объединения, 
--плюс все оставшиеся записи из внешней (первой) таблицы, которые не удовлетворяют условию объединения.  
select 
  * 
from 
  orders 
  left outer join clients on orders.client_id = clients.id;

-- меняем таблицы местами clinets <-> orders
-- получаем аналог FULL
select 
  * 
from 
  clients 
  left outer join orders on orders.client_id = clients.id;
 
 
--Такой запрос называется исключающим соединением (LEFT EXCLUSIVE JOIN). В результате 
--в таблице остаются только те записи, которые есть только в левой таблице. 
--Аналогичный запрос можно построить и для правого соединения.
select 
  * 
from 
  clients 
  left outer join orders on orders.client_id = clients.id 
where 
  orders.id is NULL;

--RIGHT OUTER JOIN работает точно так же, как и левое объединение, 
--только в качестве внешней таблицы будет использоваться правая (вторая) таблица.
select 
  * 
from 
  clients 
  right outer join orders on orders.client_id = clients.id;

select 
  * 
from 
  orders 
  right outer join clients on orders.client_id = clients.id; 

--Запрос возвращает суммарное количество и имя для каждого товара, который 
--приобрёл клиент с идентификатором 5
select 
  sum(pos.amount) as sum_, 
  prod.name
from 
  positions as pos 
  join orders as o on pos.order_id = o.id 
  join products as prod on prod.id = pos.product_id 
where 
  o.client_id = 5 
group by 
  prod.name
order by prod.name
 ;

--Чтобы было проще разобраться в запросе, попробуйте выполнять запрос частями. 
--Например, сначала получите все данные, сгруппировав только две таблицы:  
select 
  * 
from 
  positions 
  join orders on orders.id = positions.order_id;

-------------------------------------------------------------------- 
--Эксперименты с JOIN:
--запрос возвращает сумму товаров отправленных по адресам:
select 
  sum(pos.amount), 
  o.address 
from 
  positions as pos 
  join orders as o on pos.order_id = o.id 
  join products as prod on prod.id = pos.product_id 
group by 
  o.address; 
 
select 
  *
from 
  positions as pos 
  join orders as o on pos.order_id = o.id 
  join products as prod on prod.id = pos.product_id; 
 
--Задание 12.В.6.6 запрос, возвращает названия всех товаров, которые были в самом 
--последнем (по дате) заказе с использованием JOIN
select 
  prod.name
from 
  positions as pos 
  join orders as o on pos.order_id = o.id 
  join products as prod on prod.id = pos.product_id 
where 
  date = (
    select 
      max(date) 
    from 
      orders
  )
group by 
  prod.id; --можно обойтись без группировки
  
--вариант из ответа на по заданию 12.В.6.6
select 
  products.name 
from 
  orders 
  join positions on orders.id = positions.order_id 
  join products on positions.product_id = products.id 
where 
  orders.date = (
    select 
      max(date) 
    from 
      orders
  );
 
 
--Задание 12.В.6.7
--Напишите запрос, который возвращает идентификатор клиента, имя клиента и 
--суммарное количество его заказов. Обязательное условие: если клиент не сделал 
--ни одного заказа, то значение суммарного количества заказов должно быть 0. 
--Отсортируйте результат по возрастанию. 
 
select 
  c.id,
  c."name",
  count(o.id) as count_order
from 
  clients as c
  left join orders as o on o.client_id = c.id
group by c.id 
order by count_order
; 
 
-- из ответа на Задание 12.В.6.7
select 
  clients.id,
  clients.name,
  count(orders.id)
from 
  clients
  left join orders on orders.client_id = clients.id
group by 
  clients.id 
order by 
  clients.id
;  
 
--Задание 12.В.6.8
--Напишите запрос, который возвращает идентификатор клиента, имя клиента и 
--суммарное количество его заказов. Обязательное условие: если клиент не сделал 
--ни одного заказа, то его не должно быть в результирующей таблице. 
--Отсортируйте результат по возрастанию.  
select 
  clients.id,
  clients.name,
  count(orders.id)
from 
  clients
  right join orders on orders.client_id = clients.id
group by 
  clients.id 
order by 
  clients.id

--Задание 12.В.6.9
--запрос возвращает суммарную стоимость заказов  
select 
  orders.id, 
  sum(
    positions.amount * products.price
  ) 
from 
  orders 
  join positions on orders.id = positions.order_id 
  join products on positions.product_id = products.id 
group by 
  orders.id;
