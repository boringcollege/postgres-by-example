# Postgres by Example: psql Meta-commands

Meta-commands are shortcuts in the `psql` client. They start with backslash and are not SQL—they run in the client. Use them in an interactive session to list databases, connect, list tables, describe a table, and get help.

**What you'll learn:**
- Common meta-commands: \l, \c, \dt, \d
- \? and \h for help
- That meta-commands don't run from `psql -f file.sql`

```text
In interactive psql:
  \l          list databases
  \c dbname   connect to database
  \dt         list tables in public schema
  \d fruits   describe table fruits
  \dn         list schemas
  \df         list functions
  \?          help for meta-commands
  \h SELECT   help for SQL command
  \q          quit
```

When you run `psql -f script.sql`, only SQL runs; backslash commands in the file are not executed. So we use SQL here to show database and tables instead.

To run the SQL part:

```bash
$ psql -f source/psql-meta-commands.sql postgres
 current_database
------------------
 postgres
(1 row)

 tablename
-----------
 fruits
 ...
```

**Tip:** Run `psql postgres` and type `\?` to see all meta-commands. Use `\d+ table` for more detail.

**Try it:** Start psql, run `\dt`, then `\d fruits`, then `\q`.

Source: [psql-meta-commands.sql](../source/psql-meta-commands.sql)

Next: [COPY](copy.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
