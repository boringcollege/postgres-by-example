# Postgres by Example: COPY

`COPY` moves data between the database and files (or stdin/stdout). `COPY table TO file` exports; `COPY table FROM file` imports. The server must have read/write access to the file path. In psql, `\copy` is the client-side variant: the client reads or writes the file, so local paths work.

**What you'll learn:**
- COPY ... TO STDOUT for export (e.g. CSV)
- COPY ... FROM for import (server file path)
- That \copy in psql uses the client for file I/O

```sql
-- COPY: bulk load and unload (server-side)
-- Export to stdout (redirect to file from shell: psql ... > out.csv)
COPY (SELECT id, name FROM fruits ORDER BY id) TO STDOUT WITH (FORMAT csv, HEADER true);

-- Import from file (server must read the path; or use \copy in psql for client-side)
-- \copy fruits FROM '/path/to/file.csv' WITH (FORMAT csv, HEADER true);
```

Running with `-f` sends the COPY output to your terminal. To save to a file from the shell: `psql -f source/copy.sql postgres > out.csv`.

To run:

```bash
$ psql -f source/copy.sql postgres
id,name
1,apricot
2,banana
3,cherry
4,date
5,elderberry
```

**Tip:** For application-driven bulk load, use INSERT with multiple rows or a library that supports COPY from a stream.

**Try it:** Redirect the output to a file, then use `\copy fruits FROM 'out.csv' WITH (FORMAT csv, HEADER true)` in psql (with a temp table if you don't want to duplicate into fruits).

Source: [copy.sql](../source/copy.sql)

[Table of Contents](../README.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
