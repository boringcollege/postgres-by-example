# Postgres by Example: RETURNING

`RETURNING` lets you get back the rows affected by an INSERT, UPDATE, or DELETE. You list the columns (or `*`) to return. This is useful when you need the generated or updated values (e.g. a serial id or updated timestamp) without a second query.

**What you'll learn:**
- Using RETURNING with INSERT to get generated values
- RETURNING with UPDATE and DELETE
- Reducing round-trips by getting affected rows in one statement

```sql
-- RETURNING: get the row(s) affected by INSERT/UPDATE/DELETE
DROP TABLE IF EXISTS logs_example;
CREATE TABLE logs_example (id serial PRIMARY KEY, msg text);

INSERT INTO logs_example (msg) VALUES ('first') RETURNING id, msg;

UPDATE logs_example SET msg = 'updated' WHERE id = 1 RETURNING id, msg;

DELETE FROM logs_example WHERE id = 1 RETURNING id, msg;
```

`serial` auto-generates integer values. The INSERT returns the new row including the generated `id`; the UPDATE and DELETE return the row(s) that were changed or removed.

To run:

```bash
$ psql -f source/returning.sql postgres
CREATE TABLE
 id |  msg
----+-------
  1 | first
(1 row)

 id |   msg
----+---------
  1 | updated
(1 row)

 id |   msg
----+---------
  1 | updated
(1 row)
```

**Tip:** Use RETURNING when your app needs the inserted id or updated row; it avoids a follow-up SELECT.

**Try it:** Insert multiple rows with one INSERT and use RETURNING to see all new ids.

Source: [returning.sql](../source/returning.sql)

Next: [INNER and LEFT JOIN](inner-and-left-join.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
