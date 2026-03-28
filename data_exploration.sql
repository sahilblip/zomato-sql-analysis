-- ================================================
-- ZOMATO FOOD DELIVERY SQL ANALYSIS
-- Data Exploration
-- ================================================

-- 1. Row counts per table
SELECT 'users' AS table_name, COUNT(*) FROM users
UNION ALL
SELECT 'restaurants', COUNT(*) FROM restaurants
UNION ALL
SELECT 'food', COUNT(*) FROM food
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'menu', COUNT(*) FROM menu;

-- 2. Date range of orders
SELECT MIN(order_date) AS first_order, 
       MAX(order_date) AS last_order 
FROM orders;

-- 3. Total cities covered
SELECT COUNT(DISTINCT city) AS total_cities 
FROM restaurants;

-- 4. Most common cuisines
SELECT cuisine, COUNT(*) AS total 
FROM restaurants
GROUP BY cuisine 
ORDER BY total DESC
LIMIT 10;

-- 5. User age distribution
SELECT MIN(age) AS youngest, 
       MAX(age) AS oldest,
       ROUND(AVG(age), 1) AS avg_age
FROM users;

-- 6. Gender split
SELECT gender, COUNT(*) AS total 
FROM users
GROUP BY gender;