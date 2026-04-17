# postgres-bookshop-lab

A portfolio SQL project that demonstrates practical PostgreSQL skills in a reproducible local environment using Docker Compose.

## Project overview

This project models a small bookshop database and shows how to work with relational data in PostgreSQL.

It includes:
- schema and table creation
- foreign keys and table relationships
- seed data
- CRUD operations
- joins
- aggregations
- HAVING
- subqueries

The main goal of the project is to demonstrate hands-on SQL skills in a format that can be reviewed as a portfolio repository.

## Tech stack

- PostgreSQL 17
- Docker Compose
- DBeaver
- Git / GitHub

## Database structure

The project contains one schema:

- `bookshop`

### Tables

#### `bookshop.books`
Stores information about books.

Columns:
- `book_id`
- `book_name`
- `book_release_year`
- `book_price`
- `book_stock`
- `created_at`

#### `bookshop.customers`
Stores information about customers.

Columns:
- `customer_id`
- `customer_full_name`
- `created_at`
- `customer_phone`

#### `bookshop.orders`
Stores customer orders.

Columns:
- `order_id`
- `order_customer_id`
- `order_book_id`
- `order_price`
- `order_status`
- `created_at`

## Project structure

```text
postgres-bookshop-lab/
  README.md
  compose.yml
  scripts/
    001_create_schema_and_tables.sql
    002_seed_data.sql
    003_basic_crud.sql
    004_joins.sql
    005_aggregations.sql
    006_subqueries.sql
```

## What this project demonstrates

This repository includes practical SQL examples for:

- creating schemas and tables
- inserting and updating data
- deleting rows safely with conditions
- joining multiple tables
- counting orders per customer
- calculating revenue by book
- filtering grouped results with `HAVING`
- using subqueries with `AVG()` and grouped totals

## How to run the project

### 1. Start PostgreSQL in Docker

```bash
docker compose up -d
```

### 2. Connect to PostgreSQL

Use DBeaver or another PostgreSQL client with the following settings:

- **Host:** `localhost`
- **Port:** `5433`
- **Database:** `sql_bookshop-lab`
- **User:** `sql_adm`
- **Password:** `sql_qwerty`

### 3. Run SQL scripts in order

Execute the scripts one by one:

1. `scripts/001_create_schema_and_tables.sql`
2. `scripts/002_seed_data.sql`
3. `scripts/003_basic_crud.sql`
4. `scripts/004_joins.sql`
5. `scripts/005_aggregations.sql`
6. `scripts/006_subqueries.sql`

## Example business questions solved by SQL

- What books are available in the catalog?
- Which customer ordered which book?
- How many orders does each customer have?
- Which books are ordered most often?
- What revenue does each book generate?
- Which customers have more than one order?
- Which books are priced above the average?
- Which customers have total order sums above the average customer total?

## Example queries

### Orders in a human-readable format

```sql
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
```

### Revenue by book

```sql
select b.book_name as "Название книги",
       coalesce(sum(o.order_price), 0) as "Выручка по книге"
from bookshop.books b
left join bookshop.orders o
  on b.book_id = o.order_book_id
group by b.book_name
order by coalesce(sum(o.order_price), 0) desc;
```

### Customers with more than one order

```sql
select c.customer_full_name as "ФИО",
       count(o.order_id) as "Количество заказов"
from bookshop.customers c
left join bookshop.orders o
  on c.customer_id = o.order_customer_id
group by c.customer_full_name
having count(o.order_id) > 1;
```

## Purpose

This repository is my first SQL portfolio project.
It focuses on practical PostgreSQL usage, relational database design, and analytical SQL queries.

## Next improvements

Possible improvements for future versions:

- add `CHECK` constraints for price, stock, and order status
- add indexes
- add `EXPLAIN` examples
- expand dataset coverage
- add schema diagram
- add views for reporting
