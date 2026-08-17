-- 02: Data Quality Checks
-- 1. Duplicate customer IDs
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. Missing customer fields
SELECT COUNT(*) FILTER (WHERE first_name IS NULL) AS missing_first_name,
       COUNT(*) FILTER (WHERE region IS NULL) AS missing_region,
       COUNT(*) FILTER (WHERE signup_date IS NULL) AS missing_signup_date
FROM customers;

-- 3. Invalid product prices
SELECT *
FROM products
WHERE unit_price <= 0 OR unit_cost <= 0 OR unit_price < unit_cost;

-- 4. Orders without a valid customer
SELECT o.*
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 5. Order items with invalid quantities
SELECT *
FROM order_items
WHERE quantity <= 0 OR discount_pct < 0 OR discount_pct > 1;
