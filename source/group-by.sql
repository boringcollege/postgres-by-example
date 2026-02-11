-- Group rows and aggregate per group
SELECT name, COUNT(*) AS cnt
FROM (SELECT 1 AS id, 'a' AS name UNION ALL SELECT 2, 'a' UNION ALL SELECT 3, 'b') t
GROUP BY name;

-- From orders_example: total per customer (run after join lessons)
SELECT customer_id, COUNT(*) AS order_count, SUM(total) AS total_spent
FROM orders_example
GROUP BY customer_id;
