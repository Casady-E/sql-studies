/*
SELECT *
FROM accounts
LIMIT 5;

SELECT *
FROM orders
LIMIT 5;

SELECT id, account_id, occurred_at
FROM orders
LIMIT 10;

SELECT *
FROM region
LIMIT 5;

SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

SELECT *
FROM orders
ORDER BY occurred_at DESC -- most recent orders first
LIMIT 20;

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at ASC
LIMIT 10;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd ASC
LIMIT 20;


SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id ASC, total_amt_usd DESC
LIMIT 10;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id ASC
LIMIT 10;

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;

SELECT (standard_amt_usd/standard_qty) AS unit_price, id, account_id
FROM orders
LIMIT 10;

SELECT id, account_id, 
       (poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd))*100 AS post_per
FROM orders
LIMIT 10;

SELECT *
FROM accounts
WHERE name LIKE 'C%';

SELECT *
FROM accounts
WHERE name LIKE '%one%';

SELECT *
FROM accounts
WHERE name LIKE '%s';

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')
LIMIT 10;

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords')
LIMIT 10;

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%'
LIMIT 10;

SELECT *
FROM accounts
WHERE name NOT LIKE '%one%'
LIMIT 10;

SELECT *
FROM accounts
WHERE name NOT LIKE '%s'
LIMIT 10;

SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0
LIMIT 10;

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name NOT LIKE '%s'
LIMIT 5;

SELECT *
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29
LIMIT 5;

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC
LIMIT 10;
*/

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000
LIMIT 5;

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000)
LIMIT 5;

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE'W%') 
    AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
    AND primary_poc NOT LIKE '%eana%')
LIMIT 5;

/*
Statement	How to Use It	Other Details
SELECT	SELECT Col1, Col2, ...	--Provide the columns you want
FROM	FROM Table	--Provide the table where the columns exist
LIMIT	LIMIT 10	--Limits based number of rows returned
ORDER BY	ORDER BY Col	--Orders table based on the column. Used with DESC.
WHERE	WHERE Col > 5	--A conditional statement to filter your results
LIKE	WHERE Col LIKE '%me%'	--Only pulls rows where column has 'me' within the text
IN	WHERE Col IN ('Y', 'N')	--A filter for only rows with column of 'Y' or 'N'
NOT	WHERE Col NOT IN ('Y', 'N')	--NOT is frequently used with LIKE and IN
AND	WHERE Col1 > 5 AND Col2 < 3	--Filter rows where two or more conditions must be true
OR	WHERE Col1 > 5 OR Col2 < 3	--Filter rows where at least one condition must be true
BETWEEN	WHERE Col BETWEEN 3 AND 5	--Often easier syntax than using an AND
*/