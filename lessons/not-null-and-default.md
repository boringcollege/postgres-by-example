# Postgres by Example: NOT NULL and DEFAULT

`NOT NULL` means the column cannot hold NULL; inserts and updates must provide a value (or rely on a DEFAULT). `DEFAULT expr` is used when the column is omitted in an INSERT. Combine them so required columns always have a value.

**What you'll learn:**
- Enforcing non-null values with NOT NULL
- Using DEFAULT so inserts can omit the column
- NOT NULL and DEFAULT together

```sql
DROP TABLE IF EXISTS tasks_example;

CREATE TABLE tasks_example (
  id        integer PRIMARY KEY,
  title     text NOT NULL,
  done      boolean NOT NULL DEFAULT false
);

INSERT INTO tasks_example (id, title) VALUES (1, 'Learn SQL');
INSERT INTO tasks_example (id, title, done) VALUES (2, 'Done task', true);
SELECT * FROM tasks_example;
```

The first insert omits `done`; it gets `false` from the default. The second insert sets `done` explicitly.

To run:

```bash
$ psql -f source/not-null-and-default.sql postgres
DROP TABLE
CREATE TABLE
INSERT 0 1
INSERT 0 1
 id |   title   | done
----+-----------+------
  1 | Learn SQL | f
  2 | Done task | t
(2 rows)
```

**Tip:** Use NOT NULL on columns that must always have a value; use DEFAULT for the "usual" value so application code stays simple.

**Try it:** Omit `title` in an INSERT and see the NOT NULL error.

Source: [not-null-and-default.sql](../source/not-null-and-default.sql)

Next: [UPDATE](update.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
