# Postgres by Example: UPDATE

`UPDATE` changes existing rows. You set column values with `SET col = expr` and optionally restrict which rows with `WHERE`. Without WHERE, every row is updated (use with care).

**What you'll learn:**
- Updating one or more columns with SET
- Restricting updates with WHERE
- Seeing the effect with SELECT

```sql
-- Update rows matching WHERE
UPDATE fruits SET name = 'apricot' WHERE id = 1;

-- Update multiple columns
UPDATE fruits SET name = 'banana', id = id WHERE id = 2;

SELECT * FROM fruits ORDER BY id;
```

The first statement changes the name of the row with `id = 1`. The second sets both columns (id unchanged); in practice you'd only set the columns that change.

To run (requires `fruits` from earlier lessons):

```bash
$ psql -f source/update.sql postgres
UPDATE 1
UPDATE 1
 id |    name
----+------------
  1 | apricot
  2 | banana
 ...
(5 rows)
```

**Tip:** Always use a WHERE clause unless you really want to update every row. Test with a SELECT using the same WHERE first.

**Try it:** Update the row where `name = 'cherry'` to a different name and run again.

Source: [update.sql](../source/update.sql)

Next: [DELETE](delete.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
