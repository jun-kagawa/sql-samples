INSERT INTO
	users (id, name, age)
SELECT 
	gen_random_uuid (),
	FORMAT('test%s', i),
	i
FROM 
	GENERATE_SERIES(1, 1_000_000) AS i;


explain analyze
WITH keys AS (SELECT UNNEST(ARRAY['b44925ed-1dc7-4982-87d2-2ad588dfcd70']::uuid[]) as key)
select * from users where id =  any(select key from keys);

