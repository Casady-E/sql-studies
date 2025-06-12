
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