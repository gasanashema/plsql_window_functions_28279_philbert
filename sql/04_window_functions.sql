USE rwandaro_cooperative_db;

-- ==========================================
-- 1. Ranking farmers by total deliveries
-- ==========================================
SELECT
    f.full_name,
    SUM(d.quantity) AS total_quantity,
    RANK() OVER (ORDER BY SUM(d.quantity) DESC) AS farmer_rank
FROM farmers f
JOIN deliveries d ON f.farmer_id = d.farmer_id
GROUP BY f.farmer_id;

-- ==========================================
-- 2. Running total of sales revenue
-- ==========================================
SELECT
    sale_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM sales;

-- ==========================================
-- 3. Month-over-month sales comparison
-- ==========================================
SELECT
    sale_date,
    total_amount,
    total_amount -
    LAG(total_amount) OVER (ORDER BY sale_date) AS revenue_change
FROM sales;

-- ==========================================
-- 4. Farmer segmentation using NTILE
-- ==========================================
SELECT
    f.full_name,
    SUM(d.quantity) AS total_quantity,
    NTILE(4) OVER (ORDER BY SUM(d.quantity) DESC) AS contribution_quartile
FROM farmers f
JOIN deliveries d ON f.farmer_id = d.farmer_id
GROUP BY f.farmer_id;

-- ==========================================
-- 5. Moving average of sales revenue
-- ==========================================
SELECT
    sale_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM sales;
