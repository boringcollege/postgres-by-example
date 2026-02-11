-- Integer types: smallint, integer, bigint
SELECT 1::integer AS i, 1000000::bigint AS b;

-- Decimal: numeric(precision, scale) for exact math
SELECT 3.14::numeric(4,2) AS n;

-- Float (approximate): real, double precision
SELECT 1.5::real AS r, 2.5::double precision AS d;
