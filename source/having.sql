-- HAVING filters groups (after aggregation)
SELECT customer_id, COUNT(*) AS order_count, SUM(total) AS total_spent
FROM orders_example
GROUP BY customer_id
HAVING COUNT(*) >= 1 AND SUM(total) > 30;

-- Compare: WHERE filters rows before grouping
SELECT customer_id, COUNT(*) AS order_count
FROM orders_example
WHERE total > 20
GROUP BY customer_id;
