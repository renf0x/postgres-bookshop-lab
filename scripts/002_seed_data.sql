select * from bookshop.orders;

insert into bookshop.books (book_name, book_release_year, book_price, book_stock)
values ('1984', 1949, 650, 20),
		('Идиот', 1869, 710, 5),
		('Код да Винчи', 2003, 840, 13),
		('Алхимик', 1988, 610, 16);

insert into bookshop.customers (customer_full_name)
values ('Иван Иванович Иванов'),
		('Сергей Вячеславович'),
		('Анастасия Витальевна Федько');


insert into bookshop.orders (order_customer_id, order_book_id, order_price)
select 1, book_id, book_price
from bookshop.books
where book_id = 2;

insert into bookshop.orders (order_customer_id, order_book_id, order_price, order_status)
select 1, book_id, book_price, 'Сancel'
from bookshop.books
where book_id = 2;

insert into bookshop.orders (order_customer_id, order_book_id, order_price, order_status)
select 2, book_id, book_price, 'Paid'
from bookshop.books
where book_name = 'Код да Винчи';

insert into bookshop.orders (order_customer_id, order_book_id, order_price, order_status)
select 2, book_id, book_price, 'Сancel'
from bookshop.books
where book_id = 4;

insert into bookshop.orders (order_customer_id, order_book_id, order_price, order_status)
select 1, book_id, book_price, 'New'
from bookshop.books
where book_id = 3;