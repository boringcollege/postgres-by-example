-- COPY: bulk load and unload (server-side; needs file access or stdin/stdout)
-- Export fruits to stdout (you can redirect to a file)
-- In psql -f, COPY TO STDOUT goes to the terminal:
COPY (SELECT id, name FROM fruits ORDER BY id) TO STDOUT WITH (FORMAT csv, HEADER true);

-- Import from a file (run from psql with a path the server can read, or use \copy for client-side)
-- \copy fruits FROM '/path/to/file.csv' WITH (FORMAT csv, HEADER true);
