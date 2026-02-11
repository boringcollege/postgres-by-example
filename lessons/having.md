# Postgres by Example: HAVING

`HAVING` filters groups after `GROUP BY`. It applies to aggregate results (e.g. keep only groups where COUNT(*) > 1). `WHERE` filters rows before grouping; `HAVING` filters groups after aggregation.

**What you'll learn:**
- Filtering groups with HAVING
- Using aggregate expressions in HAVING
- Difference between WHERE (rows) and HAVING (groups)

```sql
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
```

The first query keeps only customers whose total_spent is greater than 30. The second filters individual orders first (total > 20), then groups.

To run (requires orders_example):

```bash
$ psql -f source/having.sql postgres
 customer_id | order_count | total_spent
-------------+-------------+-------------
           1 |           2 |       80.00
(1 row)
 ...
```

**Tip:** You can use the same aggregate in HAVING and in the SELECT list; the condition and the displayed value stay consistent.

**Try it:** Change HAVING to only groups with SUM(total) < 50 and run again.

Source: [having.sql](../source/having.sql)

Next: [Scalar and IN Subqueries](scalar-and-in-subqueries.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
