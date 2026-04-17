create schema bookshop;

create table bookshop.books (
	book_id INTEGER generated always as identity primary key,
	book_name TEXT not null,
	book_release_year INTEGER,
	book_price INTEGER not null,
	book_stock INTEGER not null default 0,
	created_at timestamp not null default current_timestamp
);

create table bookshop.customers (
	customer_id INTEGER generated always as identity primary key,
	customer_full_name TEXT not null,
	created_at timestamp not null default current_timestamp
);

create table bookshop.orders (
	order_id INTEGER generated always as identity primary key,
	order_customer_id INTEGER references bookshop.customers(customer_id),
	order_book_id INTEGER references bookshop.books(book_id),
	order_price INTEGER not null,
	order_status TEXT not null default 'New',
	created_at timestamp not null default current_timestamp
);

