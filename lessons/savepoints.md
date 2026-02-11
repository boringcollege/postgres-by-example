# Postgres by Example: Savepoints

A savepoint marks a point inside a transaction. You can `ROLLBACK TO SAVEPOINT name` to undo work after that point but keep the rest of the transaction. Useful when you want to try a risky operation and back out of just that part without rolling back everything.

**What you'll learn:**
- Creating a savepoint with SAVEPOINT
- Rolling back to a savepoint
- That COMMIT still commits the whole transaction

```sql
-- Savepoints: partial rollback within a transaction
BEGIN;
DROP TABLE IF EXISTS sp_demo;
CREATE TABLE sp_demo (id integer PRIMARY KEY);
INSERT INTO sp_demo VALUES (1);
SAVEPOINT one;
INSERT INTO sp_demo VALUES (2);
ROLLBACK TO SAVEPOINT one;  -- undo only the second insert
SELECT * FROM sp_demo;
COMMIT;

-- Cleanup
DROP TABLE IF EXISTS sp_demo;
```

After ROLLBACK TO SAVEPOINT one, only the row with id=1 remains. COMMIT makes that state permanent, then we drop the table.

To run:

```bash
$ psql -f source/savepoints.sql postgres
BEGIN
DROP TABLE
CREATE TABLE
INSERT 0 1
SAVEPOINT
INSERT 0 1
ROLLBACK
 id
----
  1
(1 row)
COMMIT
DROP TABLE
```

**Tip:** Releasing a savepoint (RELEASE SAVEPOINT) removes it so you can't roll back to it; the transaction continues.

**Try it:** Add a second savepoint and ROLLBACK TO it, then COMMIT and see what's left.

Source: [savepoints.sql](../source/savepoints.sql)

Next: [CREATE VIEW](create-view.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
