-- Meta-commands are psql-specific and don't run from -f like this.
-- In interactive psql you can run:
--   \l          list databases
--   \c dbname  connect to database
--   \dt        list tables in public schema
--   \d fruits  describe table fruits
--   \dn        list schemas
--   \df        list functions
--   \?         help for meta-commands
--   \h SELECT  help for SQL command
--   \q         quit

-- This file just shows the current database and a table list via SQL
SELECT current_database();
SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename LIMIT 5;
