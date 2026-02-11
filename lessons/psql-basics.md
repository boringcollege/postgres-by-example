# Postgres by Example: psql Basics

`psql` is the standard command-line client for PostgreSQL. You use it to run SQL files (as in the previous lesson) or to work interactively. A few basics help you navigate and inspect the server.

**What you'll learn:**
- That `psql` can run a file or an interactive session
- How to see current user and database via SQL
- Where to find help: `\?` and `\h` in interactive psql

```sql
-- List databases (meta-command: \l)
-- In the script we use the SQL equivalent:
SELECT datname FROM pg_database WHERE datistemplate = false ORDER BY 1 LIMIT 5;

-- Current user and current database
SELECT current_user, current_database();
```

From a script we use SQL: `pg_database` is a system catalog; `current_user` and `current_database()` are session variables. When you use `psql` interactively, you can type **meta-commands** like `\l` (list databases), `\dt` (list tables), `\q` (quit). Type `\?` for meta-command help and `\h` for SQL command help.

To run this file:

```bash
$ psql -f source/psql-basics.sql postgres
       datname
--------------------
 postgres
(1 row, or more if you have other DBs)

 current_user | current_database
--------------+------------------
 your_user    | postgres
(1 row)
```

**Tip:** Start an interactive session with `psql postgres` (or just `psql`). Then you can paste or type SQL and use `\l`, `\dt`, etc.

**Try it:** Run `psql postgres`, then type `\l` and press Enter. Exit with `\q`.

Source: [psql-basics.sql](../source/psql-basics.sql)

Next: [SELECT Basics](select-basics.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
