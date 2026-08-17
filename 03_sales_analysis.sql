-- 03: Sales Analysis
-- Revenue definition: completed orders only.
-- Net sales = quantity * unit_price * (1 - discount_pct)

-- 1. Total revenue
SELECT ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed';

-- 2. Monthly revenue
SELECT DATE_TRUNC('month', o.order_date)::date AS month,
       ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY 1
ORDER BY 1;

-- 3. Revenue by region
SELECT c.region,
       ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.region
ORDER BY revenue DESC;

-- 4. Average order value
WITH order_revenue AS (
    SELECT o.order_id,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY o.order_id
)
SELECT ROUND(AVG(revenue),2) AS average_order_value
FROM order_revenue;

-- 5. Revenue by category
SELECT p.category,
       ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;
