# Postgres by Example: GROUP BY

`GROUP BY` splits rows into groups by the same values in the listed columns, then you can apply aggregates (COUNT, SUM, etc.) to each group. Every column in the SELECT list must either be in GROUP BY or be inside an aggregate.

**What you'll learn:**
- Grouping rows with GROUP BY
- Using aggregates per group
- Why SELECT columns must be grouped or aggregated

```sql
-- Group rows and aggregate per group
SELECT name, COUNT(*) AS cnt
FROM (SELECT 1 AS id, 'a' AS name UNION ALL SELECT 2, 'a' UNION ALL SELECT 3, 'b') t
GROUP BY name;

-- From orders_example: total per customer (run after join lessons)
SELECT customer_id, COUNT(*) AS order_count, SUM(total) AS total_spent
FROM orders_example
GROUP BY customer_id;
```

The first query groups by `name` and counts rows per name. The second uses the orders table from the join lessons: one row per customer_id with order count and sum of totals.

To run (second query needs orders_example from inner-and-left-join):

```bash
$ psql -f source/group-by.sql postgres
 name | cnt
------+-----
 a    |   2
 b    |   1
(2 rows)

 customer_id | order_count | total_spent
-------------+-------------+-------------
           1 |           2 |       80.00
          99 |           1 |       10.00
(2 rows)
```

**Tip:** To filter by aggregate result (e.g. only groups with COUNT > 1), use HAVING.

**Try it:** Group fruits by the first letter of name (e.g. SUBSTRING(name, 1, 1)) and count per letter.

Source: [group-by.sql](../source/group-by.sql)

Next: [HAVING](having.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
