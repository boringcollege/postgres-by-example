-- Same tables as inner-and-left-join
SELECT c.name, o.id AS order_id
FROM customers_example c
RIGHT JOIN orders_example o ON o.customer_id = c.id
ORDER BY o.id;

-- FULL JOIN: all rows from both, NULL where no match
SELECT c.name, o.id AS order_id
FROM customers_example c
FULL JOIN orders_example o ON o.customer_id = c.id
ORDER BY c.id NULLS LAST, o.id NULLS LAST;
