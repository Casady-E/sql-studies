/*
SELECT orders.*, -- Inner Join
    accounts.*
FROM orders
JOIN accounts -- Join clause
    ON orders.account_id = accounts.id
LIMIT 5;

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
LIMIT 10;

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
LIMIT 10;

SELECT accounts.*, orders.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id
LIMIT 5;

SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
LIMIT 5;

SELECT o.*, a.* --use aliases to make things faster
FROM orders o
JOIN accounts a
ON o.account_id = a.id
LIMIT 5;


SELECT web_events.channel, accounts.primary_poc, accounts.name
FROM web_events
JOIN accounts
ON accounts.id = web_events.account_id
WHERE accounts.name = 'Walmart'
LIMIT 5;

SELECT region.name region, sales_reps.name salesrep, accounts.name account
FROM sales_reps
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON region.id = sales_reps.region_id
ORDER BY accounts.name ASC
LIMIT 5;

SELECT region.name region, accounts.name account, orders.total_amt_usd / (orders.total + 0.01) unit_price
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON sales_reps.region_id = region.id
ORDER BY unit_price DESC
LIMIT 5;
*/

/*
SELECT r.name region, a.name account, 
    o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;
*/

SELECT region.name region, sales_reps.name sales_rep, accounts.name account
FROM sales_reps
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON region.id = sales_reps.region_id
WHERE region.name = 'Midwest'
ORDER BY account
LIMIT 5;

SELECT region.name region, sales_reps.name sales_rep, accounts.name account
FROM sales_reps
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON region.id = sales_reps.region_id
WHERE sales_reps.name LIKE 'S%' AND region.name = 'Midwest'
ORDER BY account
LIMIT 5;

SELECT region.name region, sales_reps.name sales_rep, accounts.name account
FROM sales_reps
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON region.id = sales_reps.region_id
WHERE sales_reps.name LIKE '% K%' AND region.name = 'Midwest'
ORDER BY account
LIMIT 5;

SELECT region.name region, accounts.name account, orders.total_amt_usd/(orders.total+0.01) unit_price
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
WHERE orders.standard_qty > 100
ORDER BY unit_price ASC
LIMIT 5;

SELECT region.name region, accounts.name account, orders.total_amt_usd/(orders.total+0.01) unit_price
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
WHERE orders.standard_qty > 100 AND orders.poster_qty > 50
ORDER BY unit_price ASC
LIMIT 5;

SELECT accounts.name account, web_events.channel channel
FROM accounts
JOIN web_events
ON web_events.account_id = accounts.id
WHERE accounts.id = 1001
ORDER BY channel
LIMIT 5;

SELECT orders.occurred_at, accounts.name, orders.total, orders.total_amt_usd
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
WHERE orders.occurred_at BETWEEN '2015-01-01' AND '2016-01-01'
ORDER BY orders.occurred_at DESC
LIMIT 10;