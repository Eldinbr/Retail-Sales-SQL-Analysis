-- 01: Data Exploration
-- 1. Row counts
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;

-- 2. Orders by status
SELECT status, COUNT(*) AS orders
FROM orders
GROUP BY status
ORDER BY orders DESC;

-- 3. Customers by segment and region
SELECT segment, region, COUNT(*) AS customers
FROM customers
GROUP BY segment, region
ORDER BY segment, customers DESC;

-- 4. Product catalogue by category
SELECT category, COUNT(*) AS products
FROM products
GROUP BY category
ORDER BY products DESC;
