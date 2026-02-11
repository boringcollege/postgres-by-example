-- EXISTS: true if subquery returns at least one row
SELECT id, name FROM fruits f
WHERE EXISTS (SELECT 1 FROM orders_example o WHERE o.customer_id = 1)
LIMIT 2;

-- Derived table (subquery in FROM)
SELECT sub.total_spent
FROM (
  SELECT customer_id, SUM(total) AS total_spent
  FROM orders_example
  GROUP BY customer_id
) sub
WHERE sub.customer_id = 1;
