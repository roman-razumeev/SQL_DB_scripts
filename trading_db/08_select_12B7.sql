
--Объединение двух множеств — UNION. Результатом объединения двух множеств является множество, 
--которое содержит в себе все элементы из первого и из второго множества.
select id from orders union select id from orders where status = 'done';

--Объединение двух множеств — ALL UNION. Результатом объединения двух множеств является множество, 
--которое содержит в себе все элементы из первого и из второго множества включая дубликаты.
select id from orders union all select id from orders where status = 'done';

select id from orders;
select id from orders where status = 'done';

--Пересечение двух множеств — INTERSECT. В результирующее множество попадают те элементы, которые есть и в первом, и во втором множестве.
select id from orders intersect select id from orders where status = 'done';

--Для включения строк-дубликатов нужно использовать INTERSECT ALL.
select id from orders intersect all select id from orders where status = 'done';


--операция исключение — EXCEPT. В результирующее множество попадают те элементы, которые есть только в первом множестве.
--Строки-дубликаты в результирующее множество не включаются. Для их включения нужно использовать EXCEPT ALL.
select id from orders except select id from orders where status = 'done';
select id from orders except all select id from orders where status = 'done';


--Задание 12.В.7.1
--Напишите два варианта запроса, который возвращает все заказы со статусом выполнено и на доставке.
select * from orders where status = 'done' union select * from orders where status = 'delivery';

select * from orders except select * from orders where status = 'in progress';

--Задание 12.В.7.2
--Предположим, что товар пришёл с браком. Например, вся партия велосипедов была бракованной. 
--Кроме этого, наш магазин изменил условия доставки для клиентов из Казани.

--Оператору интернет-магазина нужно получить номера телефонов и номера заказов для клиентов, 
--которые заказывали товар с идентификатором 1, и тех, кто указал в адресе доставки Казань. 
--Используйте UNION для написания запроса.

select 
  cli."name", cli.phone, o.id
from 
  positions as pos 
  join orders as o on pos.order_id = o.id 
  join clients as cli on cli.id = o.client_id 
where 
  pos.product_id = 1
union
select distinct --без distinct тот же результат
  cli."name", cli.phone, o.id 
from 
  orders as o  
  join clients as cli on cli.id = o.client_id 
where 
  o.address = 'Казань'; 

--из ответа:
select 
  clients."name",
  phone, 
  tmp.order_id 
from 
  clients 
  join (
    select 
      orders.id as order_id, 
      client_id 
    from 
      orders 
      join positions on positions.order_id = orders.id 
    where 
      positions.product_id = 1 
    union 
    select 
      orders.id, 
      client_id 
    from 
      orders 
    where 
      address = 'Казань'
  ) as tmp on tmp.client_id = clients.id;

--чтобы было проще понять вариант из ответа, декомпозируем -> возьмем часть в скобках и запустим:
    select 
      orders.id as order_id, 
      client_id 
    from 
      orders 
      join positions on positions.order_id = orders.id 
    where 
      positions.product_id = 1 
    union 
    select 
      orders.id, 
      client_id 
    from 
      orders 
    where 
      address = 'Казань';



