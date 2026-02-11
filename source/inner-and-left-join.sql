-- Two small tables for joins
DROP TABLE IF EXISTS orders_example;
DROP TABLE IF EXISTS customers_example;
CREATE TABLE customers_example (id integer PRIMARY KEY, name text);
CREATE TABLE orders_example (id integer PRIMARY KEY, customer_id integer, total numeric(10,2));
INSERT INTO customers_example VALUES (1, 'Alice'), (2, 'Bob');
INSERT INTO orders_example VALUES (1, 1, 50), (2, 1, 30), (3, 99, 10);

-- INNER JOIN: only rows with a match in both tables
SELECT c.name, o.id AS order_id, o.total
FROM customers_example c
INNER JOIN orders_example o ON o.customer_id = c.id;

-- LEFT JOIN: all rows from left, match from right or NULL
SELECT c.name, o.id AS order_id, o.total
FROM customers_example c
LEFT JOIN orders_example o ON o.customer_id = c.id
ORDER BY c.id, o.id;
