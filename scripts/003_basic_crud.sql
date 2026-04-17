select * from bookshop.books;

update bookshop.orders
set order_status = 'Paid'
where order_id = 1
	and order_customer_id = 1;

delete from bookshop.orders
where order_customer_id = 2
	and order_book_id = 4
	and order_status = 'Cancel';

alter table bookshop.customers
add column customer_phone TEXT;

update bookshop.customers
set customer_phone = '+79294851254'
where customer_id = 2;

insert into bookshop.books (book_name, book_release_year, book_price, book_stock)
values ('Clean Code', 2008, 1450, 3);

insert into bookshop.customers (customer_full_name, customer_phone)
values ('Мария Петрова', '+79059458542');

insert into bookshop.orders (order_customer_id, order_book_id, order_price, order_status)
select 4, book_id, book_price, 'New'
from bookshop.books
where book_id = 5;