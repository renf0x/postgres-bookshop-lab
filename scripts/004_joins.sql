select o.order_id as "Номер заказа",
		c.customer_full_name as "ФИО покупателя",
		b.book_name as "Название книги",
		o.order_price as "Стоимость",
		o.order_status as "Статус заказа",
		o.created_at as "Заказ создан"
from bookshop.orders o
 join bookshop.customers c
 	on o.order_customer_id = c.customer_id
 join bookshop.books b
 	on o.order_book_id = b.book_id
 order by o.created_at desc;