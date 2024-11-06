USE shop;

select * from customers;
select* from orders;
select * from sellers;

-- Определить какие из покупок были совершены в июне
select * 
from orders
where month(ODATE)='06';

-- Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года
select * 
from orders
where ODATE >= '2022-04-10' and ODATE<= '2022-05-10';

-- Определить сколько покупок было совершено в марте
select count(*) 
from orders
where month(ODATE)='03';

-- Определить среднюю стоимость покупок в марте
select avg(AMT) 
from orders
where month(ODATE)='03';

-- Выведите минимальный рейтинг(rating) покупателя среди сделавших заказ в апреле 2022 года.
select min(RATING) 
from customers t1
join orders t2
on t1.CUST_ID=t2.CUST_ID
where month(ODATE)='04';

-- Выведите продавцов, которые оформили заказ на наибольшую сумму в период с 1 марта по 1 май 2022 года.
-- Вывести : sell_id, amt
select t1.SELL_ID,  t1.SNAME, t2.AMT
from sellers t1
join orders t2
on t1.SELL_ID=t2.SELL_ID
where ODATE >= '2022-03-01' and ODATE<= '2022-05-01' 
	and AMT=( select max(AMT) 
			from orders t1
			join sellers t2
			on t1.SELL_ID=t2.SELL_ID
			where ODATE >= '2022-03-01' and ODATE<= '2022-05-01');

-- Определить какие покупки были совершены во вторник
select * 
from orders
where dayofweek(ODATE)='03';

