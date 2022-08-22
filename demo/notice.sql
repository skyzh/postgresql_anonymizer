BEGIN;

CREATE TABLE t(i int);

CREATE OR REPLACE FUNCTION f1() RETURNS TEXT AS
$$
BEGIN
  RAISE NOTICE 'f1 called';
  RETURN '1';
END
$$ LANGUAGE plpgsql IMMUTABLE;

CREATE OR REPLACE FUNCTION f2() RETURNS TEXT AS
$$
BEGIN
  RAISE NOTICE 'f2 called';
  RETURN '2';
END
$$ LANGUAGE plpgsql VOLATILE ;

SELECT f1(),f2() FROM t;

SELECT CASE
        WHEN EXISTS (SELECT 1 FROM t)
        THEN '1'
        ELSE f2()
       END
;

ROLLBACK;



