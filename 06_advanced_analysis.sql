-- 06: Advanced SQL Analysis
-- 1. Month-over-month revenue growth
WITH monthly AS (
    SELECT DATE_TRUNC('month', o.order_date)::date AS month,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY 1
),
with_previous AS (
    SELECT month, revenue,
           LAG(revenue) OVER (ORDER BY month) AS previous_revenue
    FROM monthly
)
SELECT month,
       ROUND(revenue,2) AS revenue,
       ROUND(previous_revenue,2) AS previous_revenue,
       ROUND(100.0 * (revenue - previous_revenue) / NULLIF(previous_revenue,0),2) AS mom_growth_pct
FROM with_previous
ORDER BY month;

-- 2. Running total of revenue
WITH monthly AS (
    SELECT DATE_TRUNC('month', o.order_date)::date AS month,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY 1
)
SELECT month,
       ROUND(revenue,2) AS revenue,
       ROUND(SUM(revenue) OVER (ORDER BY month),2) AS running_revenue
FROM monthly
ORDER BY month;

-- 3. Revenue contribution by product
WITH product_revenue AS (
    SELECT p.product_id, p.product_name,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS revenue
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status = 'Completed'
    GROUP BY p.product_id, p.product_name
)
SELECT product_name,
       ROUND(revenue,2) AS revenue,
       ROUND(100.0 * revenue / SUM(revenue) OVER (),2) AS revenue_share_pct
FROM product_revenue
ORDER BY revenue DESC;

-- 4. Customer revenue ranking
WITH customer_revenue AS (
    SELECT c.customer_id,
           c.first_name || ' ' || c.last_name AS customer_name,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, customer_name
)
SELECT customer_id, customer_name,
       ROUND(revenue,2) AS revenue,
       RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank;

-- 5. RFM-style customer segmentation
WITH customer_metrics AS (
    SELECT c.customer_id,
           MAX(o.order_date) AS last_order_date,
           COUNT(DISTINCT o.order_id) AS frequency,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct)) AS monetary
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id
),
scored AS (
    SELECT *,
           NTILE(4) OVER (ORDER BY last_order_date) AS recency_score,
           NTILE(4) OVER (ORDER BY frequency) AS frequency_score,
           NTILE(4) OVER (ORDER BY monetary) AS monetary_score
    FROM customer_metrics
)
SELECT *,
       recency_score + frequency_score + monetary_score AS rfm_score
FROM scored
ORDER BY rfm_score DESC;
