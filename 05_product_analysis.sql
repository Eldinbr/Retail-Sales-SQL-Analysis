-- 05: Product Analysis
-- 1. Top 10 products by revenue
SELECT p.product_id, p.product_name, p.category,
       ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)),2) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC
LIMIT 10;

-- 2. Top 3 products in each category
WITH product_revenue AS (
    SELECT p.category, p.product_name,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS revenue
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status = 'Completed'
    GROUP BY p.category, p.product_name
),
ranked AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS category_rank
    FROM product_revenue
)
SELECT category, product_name, ROUND(revenue,2) AS revenue, category_rank
FROM ranked
WHERE category_rank <= 3
ORDER BY category, category_rank;

-- 3. Gross profit by product
SELECT p.product_name,
       ROUND(SUM(oi.quantity * ((p.unit_price * (1 - oi.discount_pct)) - p.unit_cost)),2) AS gross_profit
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_name
ORDER BY gross_profit DESC;
