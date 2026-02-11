-- List databases (meta-command: \l)
-- In the script we use the SQL equivalent:
SELECT datname FROM pg_database WHERE datistemplate = false ORDER BY 1 LIMIT 5;

-- Current user and current database
SELECT current_user, current_database();
