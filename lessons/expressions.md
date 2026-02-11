# Postgres by Example: Expressions

You can use expressions in `SELECT` (column list) and in `WHERE`. Expressions include arithmetic, string concatenation with `||`, and function calls. The result of an expression can be compared or returned as a column.

**What you'll learn:**
- Arithmetic and `||` in SELECT
- Using expressions in WHERE
- Naming expression results with AS

```sql
-- Expressions in SELECT: arithmetic, concatenation
SELECT 10 + 2 AS sum, 10 * 2 AS product;
SELECT 'Hello ' || 'world' AS greeting;

-- Expression in WHERE
SELECT * FROM fruits WHERE id * 2 > 4 ORDER BY id;
```

`||` concatenates text. In the last query only rows with `id * 2 > 4` (i.e. id 3, 4, 5) are returned.

To run:

```bash
$ psql -f source/expressions.sql postgres
 sum | product
-----+---------
  12 |      20
(1 row)

 greeting
-------------
 Hello world
(1 row)

 id |    name
----+------------
  3 | cherry
  4 | date
  5 | elderberry
(3 rows)
```

**Tip:** Use parentheses to control precedence: `(id + 1) * 2`.

**Try it:** Add a column like `SELECT id, name, id || ': ' || name AS label FROM fruits;`

Source: [expressions.sql](../source/expressions.sql)

Next: [Numeric Types](numeric-types.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
