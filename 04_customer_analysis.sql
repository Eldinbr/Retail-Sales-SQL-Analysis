-- 04: Customer Analysis
-- 1. Top 10 customers by revenue
SELECT c.customer_id,
       c.first_name || ' ' || c.last_name AS customer_name,
       ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, customer_name
ORDER BY revenue DESC
LIMIT 10;

-- 2. Repeat customers
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS orders
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
)
SELECT COUNT(*) FILTER (WHERE orders > 1) AS repeat_customers,
       COUNT(*) AS purchasing_customers,
       ROUND(100.0 * COUNT(*) FILTER (WHERE orders > 1) / COUNT(*),2) AS repeat_rate_pct
FROM customer_orders;

-- 3. Customer lifetime revenue
SELECT c.customer_id,
       c.segment,
       ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS lifetime_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.segment
ORDER BY lifetime_revenue DESC;

-- 4. Customers with no completed orders
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
 AND o.status = 'Completed'
WHERE o.order_id IS NULL;
