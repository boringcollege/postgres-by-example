# Postgres by Example: BEGIN, COMMIT, ROLLBACK

A transaction groups statements so they either all take effect (COMMIT) or none do (ROLLBACK). `BEGIN` starts a transaction; `COMMIT` makes changes permanent; `ROLLBACK` undoes everything since the last BEGIN. If you don't start a transaction, each statement runs in its own auto-commit transaction.

**What you'll learn:**
- Starting a transaction with BEGIN
- COMMIT to save, ROLLBACK to undo
- That ROLLBACK removes uncommitted changes

```sql
-- Transactions: BEGIN, COMMIT, ROLLBACK
BEGIN;
DROP TABLE IF EXISTS tx_demo;
CREATE TABLE tx_demo (id integer PRIMARY KEY, val text);
INSERT INTO tx_demo VALUES (1, 'a');
-- COMMIT;   -- makes changes permanent
ROLLBACK;    -- discards changes since BEGIN

-- After ROLLBACK, tx_demo should not exist (or be empty if it existed before)
SELECT COUNT(*) FROM pg_tables WHERE tablename = 'tx_demo';
```

Because we ROLLBACK, the CREATE and INSERT are undone. The final SELECT shows that tx_demo was not left behind (or the table existed from before and wasn't created in this run).

To run:

```bash
$ psql -f source/begin-commit-rollback.sql postgres
BEGIN
DROP TABLE
CREATE TABLE
INSERT 0 1
ROLLBACK
 count
-------
     0
(1 row)
```

**Tip:** Use transactions when you need several changes to succeed or fail together. In application code, use the driver's transaction API (e.g. connection.begin(), commit(), rollback()).

**Try it:** Change ROLLBACK to COMMIT and run again; then check that tx_demo exists.

Source: [begin-commit-rollback.sql](../source/begin-commit-rollback.sql)

Next: [Savepoints](savepoints.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
