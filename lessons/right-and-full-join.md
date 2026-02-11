# Postgres by Example: RIGHT and FULL JOIN

`RIGHT JOIN` keeps every row from the right table and matches from the left (or NULL). `FULL JOIN` keeps all rows from both tables; unmatched sides show NULL. In practice, LEFT JOIN is used more often than RIGHT; FULL is useful when you want to see matches and both kinds of non-matches.

**What you'll learn:**
- RIGHT JOIN: all rows from the right table
- FULL OUTER JOIN and NULLs for unmatched sides
- ORDER BY with NULLS LAST

```sql
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
```

Run after inner-and-left-join so the example tables exist. RIGHT JOIN keeps order 3 (customer_id 99) with NULL for name. FULL keeps Bob (no order), order 3 (no customer), and the matched rows.

To run:

```bash
$ psql -f source/right-and-full-join.sql postgres
  name  | order_id
--------+----------
 Alice  |        1
 Alice  |        2
        |        3
(3 rows)

  name  | order_id
--------+----------
 Alice  |        1
 Alice  |        2
 Bob    |
        |        3
(4 rows)
```

**Tip:** You can express a RIGHT JOIN as a LEFT JOIN by swapping the tables; use whichever reads more clearly.

**Try it:** Add a WHERE clause to the FULL JOIN to show only rows where one side is NULL (unmatched).

Source: [right-and-full-join.sql](../source/right-and-full-join.sql)

Next: [Self-Join](self-join.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
