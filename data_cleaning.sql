-- ================================================
-- ZOMATO FOOD DELIVERY SQL ANALYSIS
-- Data Cleaning
-- ================================================

-- 1. Fix rating column — replace '--' with NULL
UPDATE restaurants 
SET rating = NULL 
WHERE rating = '--';

-- 2. Strip ₹ symbol from cost column
UPDATE restaurants
SET cost = REGEXP_REPLACE(cost, '[^0-9]', '', 'g');

-- 3. Convert cost to INTEGER
ALTER TABLE restaurants 
ALTER COLUMN cost TYPE INTEGER USING cost::INTEGER;

-- 4. Remove orders with invalid sales amount
DELETE FROM orders 
WHERE sales_amount <= 0;

-- 5. Remove orders with NULL restaurant
DELETE FROM orders 
WHERE r_id IS NULL;

-- VERIFY CLEANING
SELECT COUNT(*) AS unrated_restaurants 
FROM restaurants WHERE rating = '--';

SELECT COUNT(*) AS bad_orders 
FROM orders WHERE sales_amount <= 0;

SELECT COUNT(*) AS null_rid 
FROM orders WHERE r_id IS NULL;