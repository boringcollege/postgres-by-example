-- Transactions: BEGIN, COMMIT, ROLLBACK
-- Run in one session; we simulate with a temp table so we don't change shared state
BEGIN;
DROP TABLE IF EXISTS tx_demo;
CREATE TABLE tx_demo (id integer PRIMARY KEY, val text);
INSERT INTO tx_demo VALUES (1, 'a');
-- COMMIT;   -- makes changes permanent
ROLLBACK;    -- discards changes since BEGIN

-- After ROLLBACK, tx_demo should not exist (or be empty if it existed before)
SELECT COUNT(*) FROM pg_tables WHERE tablename = 'tx_demo';
