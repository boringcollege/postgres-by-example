# Postgres by Example: Primary Keys and Unique

A `PRIMARY KEY` uniquely identifies each row and implies NOT NULL; a table has at most one primary key (single or composite). `UNIQUE` means no two rows can have the same value(s) in that column or set of columns; NULL is treated as distinct, so multiple NULLs are allowed unless the column is also NOT NULL.

**What you'll learn:**
- Defining a primary key on a column
- UNIQUE constraint for no duplicates
- Why we use a table name like users_example (reserved word / common name)

```sql
DROP TABLE IF EXISTS users_example;

CREATE TABLE users_example (
  id   integer PRIMARY KEY,
  name text UNIQUE NOT NULL
);

INSERT INTO users_example (id, name) VALUES (1, 'alice'), (2, 'bob');
SELECT * FROM users_example;
```

Inserting another row with `id = 1` or `name = 'alice'` would violate the constraints and raise an error.

To run:

```bash
$ psql -f source/primary-keys-and-unique.sql postgres
DROP TABLE
CREATE TABLE
INSERT 0 2
 id | name
----+-------
  1 | alice
  2 | bob
(2 rows)
```

**Tip:** Prefer a single-column primary key (e.g. id) when possible; use a surrogate key (serial/bigserial or gen_random_uuid()) if you don't have a natural key.

**Try it:** Uncomment the duplicate INSERT and run to see the error.

Source: [primary-keys-and-unique.sql](../source/primary-keys-and-unique.sql)

Next: [NOT NULL and DEFAULT](not-null-and-default.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
