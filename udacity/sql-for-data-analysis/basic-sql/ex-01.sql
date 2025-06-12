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
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');