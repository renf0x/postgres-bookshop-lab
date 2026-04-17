select c.customer_full_name as "ФИО покупателя",
		count(o.order_id) as "Количество заказов"
from bookshop.customers c
left join bookshop.orders o
	on c.customer_id = o.order_customer_id
group by "ФИО покупателя";

select c.customer_full_name as "ФИО покупателя",
		count(o.order_id) as "Количество заказов"
from bookshop.customers c
right join bookshop.orders o
	on c.customer_id = o.order_customer_id
group by "ФИО покупателя";

select c.customer_full_name as "ФИО покупателя",
		coalesce(SUM(o.order_price), 0) as "Сумма заказов"
from bookshop.customers c
left join bookshop.orders o
	on c.customer_id = o.order_customer_id
group by "ФИО покупателя";

select b.book_name as "Название книги",
	coalesce(count(o.order_id), 0) as "Сколько раз заказали"
from bookshop.books b
left join bookshop.orders o
	on b.book_id = o.order_book_id
group by b.book_name
order by count(o.order_id) desc;

select b.book_name as "Название книги",
	coalesce(sum(o.order_price), 0) as "Выручка по книге"
from bookshop.books b
left join bookshop.orders o
	on b.book_id = o.order_book_id
group by b.book_name
ORDER BY COALESCE(SUM(o.order_price), 0) DESC;