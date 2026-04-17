SELECT c.customer_full_name AS "ФИО",
      count(o.order_id) AS "Количество заказов"
FROM bookshop.customers c
LEFT JOIN bookshop.orders o
    ON c.customer_id = o.order_customer_id
group by "ФИО" 
having count(o.order_id) > 1;

select book_name,
	book_price
from bookshop.books
where book_price > (
	select avg(book_price)
	from bookshop.books
);

SELECT c.customer_full_name AS "ФИО",
       coalesce(SUM(o.order_price), 0)  AS "Сумма заказов"
FROM bookshop.customers c
LEFT JOIN bookshop.orders o
    ON c.customer_id = o.order_customer_id
GROUP BY c.customer_full_name
having sum(o.order_price) > (
	select avg(customer_total)
	from (
		select sum(order_price) as customer_total
		from bookshop.orders
		group by order_customer_id
	) t
);