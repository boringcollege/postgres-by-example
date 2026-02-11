# Postgres by Example: DELETE

`DELETE FROM table` removes rows. Use `WHERE` to delete only the rows that match; without WHERE, all rows are deleted. The table structure remains.

**What you'll learn:**
- Deleting rows with DELETE FROM
- Restricting deletes with WHERE
- That DELETE removes data but not the table definition

```sql
-- Delete rows matching WHERE (use a temp table so we don't lose fruits)
DROP TABLE IF EXISTS to_delete;
CREATE TABLE to_delete AS SELECT * FROM fruits LIMIT 1;

DELETE FROM to_delete WHERE id = 1;
SELECT * FROM to_delete;

DROP TABLE to_delete;
```

We copy one row from `fruits` into `to_delete`, delete that row, then show the (now empty) table and drop it so we don't modify the main `fruits` table.

To run:

```bash
$ psql -f source/delete.sql postgres
DROP TABLE
CREATE TABLE
DELETE 1
 id | name
----+------
(0 rows)
DROP TABLE
```

**Tip:** Before a big DELETE, run a SELECT with the same WHERE to see how many rows will be removed. Consider a transaction (BEGIN ... COMMIT/ROLLBACK) so you can roll back if needed.

**Try it:** Create a small table, insert a few rows, delete some with WHERE, and confirm the rest remain.

Source: [delete.sql](../source/delete.sql)

Next: [RETURNING](returning.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
