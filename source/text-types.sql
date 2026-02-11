-- text: unlimited length (preferred for strings)
SELECT 'hello'::text AS t;

-- varchar(n): variable length, max n
SELECT 'hi'::varchar(10) AS v;

-- char(n): fixed length, padded with spaces
SELECT 'ab'::char(5) AS c, length('ab'::char(5)) AS len;
