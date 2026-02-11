# Postgres by Example: Column Types and Constraints

When defining a table you choose a type for each column. You can add defaults with `DEFAULT expr` so inserts can omit those columns. This lesson shows a mix of types and a default; the next lessons cover NOT NULL, PRIMARY KEY, and UNIQUE.

**What you'll learn:**
- Combining multiple column types in one table
- `DEFAULT` for optional values
- `timestamp with time zone` and `current_timestamp`

```sql
-- Table with varied column types
DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id          integer,
  name        text,
  price       numeric(10,2),
  in_stock    boolean DEFAULT true,
  created_at  timestamp with time zone DEFAULT current_timestamp
);

INSERT INTO products (id, name, price) VALUES (1, 'Widget', 19.99);
SELECT * FROM products;
```

`in_stock` and `created_at` get their defaults when not specified. `current_timestamp` is the time of the insert.

To run:

```bash
$ psql -f source/column-types-and-constraints.sql postgres
DROP TABLE
CREATE TABLE
INSERT 0 1
 id |  name   | price  | in_stock |          created_at
----+---------+--------+----------+-------------------------------
  1 | Widget | 19.99  | t        | 2024-xx-xx xx:xx:xx.xxxxxx+00
(1 row)
```

**Tip:** Use `DEFAULT` for "usually this value" so application code doesn't have to send it every time.

**Try it:** Insert a row without `in_stock` and `created_at` and confirm they get defaults.

Source: [column-types-and-constraints.sql](../source/column-types-and-constraints.sql)

Next: [ALTER TABLE and DROP](alter-table-and-drop.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
