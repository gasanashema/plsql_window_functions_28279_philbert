USE rwandaro_cooperative_db;

-- ==========================================
-- 1. INNER JOIN: Valid deliveries
-- ==========================================
SELECT f.full_name, p.product_name, d.quantity, d.delivery_date
FROM deliveries d
INNER JOIN farmers f ON d.farmer_id = f.farmer_id
INNER JOIN products p ON d.product_id = p.product_id;

-- ==========================================
-- 2. LEFT JOIN: Farmers with no deliveries
-- ==========================================
SELECT f.full_name, d.delivery_id
FROM farmers f
LEFT JOIN deliveries d ON f.farmer_id = d.farmer_id
WHERE d.delivery_id IS NULL;

-- ==========================================
-- 3. RIGHT JOIN: Products with no deliveries
-- ==========================================
SELECT p.product_name, d.delivery_id
FROM deliveries d
RIGHT JOIN products p ON d.product_id = p.product_id
WHERE d.delivery_id IS NULL;

-- ==========================================
-- 4. FULL OUTER JOIN
-- Farmers and deliveries including unmatched
-- ==========================================
SELECT f.full_name, d.delivery_id
FROM farmers f
LEFT JOIN deliveries d ON f.farmer_id = d.farmer_id

UNION

SELECT f.full_name, d.delivery_id
FROM farmers f
RIGHT JOIN deliveries d ON f.farmer_id = d.farmer_id;

-- ==========================================
-- 5. SELF JOIN: Farmers in same region
-- ==========================================
SELECT a.full_name AS farmer_one,
       b.full_name AS farmer_two,
       r.region_name
FROM farmers a
INNER JOIN farmers b
    ON a.region_id = b.region_id
   AND a.farmer_id < b.farmer_id
INNER JOIN regions r
    ON a.region_id = r.region_id;
