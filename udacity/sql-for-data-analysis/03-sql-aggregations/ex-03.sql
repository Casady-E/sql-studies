/*
SELECT COUNT(*)
FROM accounts;

SELECT COUNT(accounts.id)
FROM accounts;


SELECT SUM(poster_qty) total_poster_sales
FROM orders;

SELECT SUM(standard_qty) total_standard_sales
FROM orders;

SELECT SUM(total_amt_usd) total_dollar_sales
FROM orders;

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

SELECT SUM(standard_amt_usd) / SUM(standard_qty) AS price_per_unit
FROM orders;


SELECT MIN(occurred_at)
FROM orders;

SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1;

SELECT MAX(occurred_at)
FROM web_events;

SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;
--wrong
SELECT SUM(standard_amt_usd) / SUM(standard_qty) AS price_per_standard, SUM(gloss_amt_usd) / SUM(gloss_qty) AS price_per_gloss,SUM(poster_amt_usd) / SUM(poster_qty) AS price_per_poster
FROM orders;
--AVG(price_per_standard, price_per_poster, price_per_gloss)
--FROM orders
--correct
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss,
        AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
        AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;

--get median
SELECT *
FROM (SELECT total_amt_usd
        FROM orders
        ORDER BY total_amt_usd
        LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;


SELECT accounts.name,
    orders.occurred_at
FROM orders
JOIN accounts ON accounts.id =  orders.account_id
GROUP BY orders.occurred_at, accounts.name
ORDER BY accounts.name, orders.occurred_at
LIMIT 5;

SELECT accounts.name, SUM(total_amt_usd) total_sales
FROM orders
JOIN accounts ON accounts.id = orders.account_id
GROUP BY accounts.name
LIMIT 5;

SELECT web_events.occurred_at, web_events.channel, accounts.name
FROM web_events 
JOIN accounts
ON web_events.account_id = accounts.id 
ORDER BY web_events.occurred_at DESC
LIMIT 1;

SELECT web_events.channel, COUNT(*)
FROM web_events
GROUP BY web_events.channel;

SELECT accounts.primary_poc, web_events.occurred_at
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
ORDER BY web_events.occurred_at 
LIMIT 5;

SELECT accounts.name, MIN(orders.total_amt_usd) smallest_order
FROM accounts
JOIN orders
ON accounts.id = orders.account_id
GROUP BY accounts.name
ORDER BY smallest_order
LIMIT 5;

SELECT region.name region, COUNT(sales_reps.id) number_of_reps
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
GROUP BY region.name
LIMIT 5;
*/
SELECT accounts.name, AVG(orders.standard_qty) standard_avg, AVG(orders.gloss_qty) gloss_avg, AVG(orders.poster_qty) poster_avg
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY accounts.name
ORDER BY accounts.name
LIMIT 5;

SELECT accounts.name, AVG(orders.standard_amt_usd) standard_avg, AVG(orders.gloss_amt_usd) gloss_avg, AVG(orders.poster_amt_usd) poster_avg
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY accounts.name
ORDER BY accounts.name
LIMIT 5;

SELECT sales_reps.name, web_events.channel, COUNT(web_events.channel) occurences
FROM sales_reps
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
JOIN web_events
ON web_events.account_id = accounts.id
GROUP BY sales_reps.name, web_events.channel
ORDER BY occurences DESC
LIMIT 5;

SELECT region.name, web_events.channel, COUNT(web_events.channel) occurences
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
JOIN web_events
ON web_events.account_id = accounts.id
GROUP BY region.name, web_events.channel
ORDER BY occurences DESC
LIMIT 5;