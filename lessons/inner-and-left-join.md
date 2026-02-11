# Postgres by Example: INNER and LEFT JOIN

Joins combine rows from two (or more) tables. `INNER JOIN` keeps only rows where the join condition matches in both tables. `LEFT JOIN` keeps every row from the left table and adds columns from the right; when there is no match, the right-side columns are NULL.

**What you'll learn:**
- INNER JOIN and the ON condition
- LEFT JOIN and unmatched rows (NULLs from the right)
- Using table aliases (c, o)

```sql
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
```

Order 3 has `customer_id = 99` (no customer); INNER JOIN excludes it. LEFT JOIN keeps Bob with NULL for order columns because he has no orders.

To run:

```bash
$ psql -f source/inner-and-left-join.sql postgres
...
 name  | order_id | total
-------+----------+-------
 Alice |        1 | 50.00
 Alice |        2 | 30.00
(2 rows)

 name  | order_id | total
-------+----------+-------
 Alice |        1 | 50.00
 Alice |        2 | 30.00
 Bob   |         | 
(3 rows)
```

**Tip:** Prefer explicit JOIN with ON; it's clearer than listing tables in FROM and conditions in WHERE.

**Try it:** Change to RIGHT JOIN and see which side is "kept" when there's no match.

Source: [inner-and-left-join.sql](../source/inner-and-left-join.sql)

Next: [RIGHT and FULL JOIN](right-and-full-join.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
