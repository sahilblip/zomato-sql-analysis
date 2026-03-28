-- ================================================
-- ZOMATO FOOD DELIVERY SQL ANALYSIS
-- Schema: All 5 tables
-- ================================================

-- 1. USERS
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    age INTEGER,
    gender VARCHAR(100),
    marital_status VARCHAR(100),
    occupation VARCHAR(100),
    monthly_income VARCHAR(50),
    educational_qualification VARCHAR(100),
    family_size INTEGER
);

-- 2. RESTAURANTS
CREATE TABLE restaurants (
    r_id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    city VARCHAR(100),
    rating VARCHAR(10),
    rating_count VARCHAR(50),
    cost VARCHAR(50),
    cuisine VARCHAR(200),
    lic_no VARCHAR(50),
    link TEXT,
    address TEXT,
    menu TEXT
);

-- 3. FOOD
CREATE TABLE food (
    f_id VARCHAR(100) PRIMARY KEY,
    item VARCHAR(200),
    veg_or_non_veg VARCHAR(50)
);

-- 4. ORDERS
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    r_id INTEGER REFERENCES restaurants(r_id),
    order_date DATE,
    sales_qty INTEGER,
    sales_amount INTEGER,
    currency VARCHAR(50)
);

-- 5. MENU
CREATE TABLE menu (
    menu_id VARCHAR(100),
    r_id INTEGER REFERENCES restaurants(r_id),
    f_id VARCHAR(100) REFERENCES food(f_id),
    cuisine VARCHAR(200),
    price VARCHAR(50)
);