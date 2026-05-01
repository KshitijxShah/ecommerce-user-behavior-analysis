-- =========================
-- CREATE TABLE
-- =========================
CREATE TABLE ecommerce_data (
    user_id INT,
    event_type VARCHAR(20),
    product_id INT,
    category VARCHAR(50),
    event_time DATE
);

-- =========================
-- INSERT DATA
-- =========================
INSERT INTO ecommerce_data VALUES
(101,'view',2001,'Electronics','2024-01-01'),
(101,'cart',2001,'Electronics','2024-01-01'),
(101,'purchase',2001,'Electronics','2024-01-01'),
(102,'view',2002,'Clothing','2024-01-02'),
(102,'view',2003,'Clothing','2024-01-02'),
(102,'cart',2003,'Clothing','2024-01-02'),
(103,'view',2004,'Home','2024-01-03'),
(103,'view',2005,'Home','2024-01-03'),
(104,'view',2001,'Electronics','2024-01-04'),
(104,'cart',2001,'Electronics','2024-01-04'),
(105,'view',2006,'Beauty','2024-01-05'),
(105,'purchase',2006,'Beauty','2024-01-05'),
(106,'view',2007,'Electronics','2024-01-06'),
(106,'cart',2007,'Electronics','2024-01-06'),
(106,'purchase',2007,'Electronics','2024-01-06'),
(107,'view',2008,'Clothing','2024-01-07'),
(108,'view',2009,'Home','2024-01-08'),
(108,'cart',2009,'Home','2024-01-08'),
(109,'view',2010,'Beauty','2024-01-09'),
(109,'view',2011,'Beauty','2024-01-09'),
(110,'view',2012,'Electronics','2024-01-10'),
(110,'cart',2012,'Electronics','2024-01-10');

-- =========================
-- Q1: Total number of events
-- =========================
SELECT COUNT(*) AS total_events
FROM ecommerce_data;

-- =========================
-- Q2: Count of each event type
-- =========================
SELECT event_type, COUNT(*) AS count
FROM ecommerce_data
GROUP BY event_type;

-- =========================
-- Q3: Funnel numbers (Views, Carts, Purchases)
-- =========================
SELECT 
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS views,
    SUM(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carts,
    SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM ecommerce_data;

-- =========================
-- Q4: Cart conversion rate (Cart / View)
-- =========================
SELECT 
    COUNT(CASE WHEN event_type = 'cart' THEN 1 END) * 1.0 /
    COUNT(CASE WHEN event_type = 'view' THEN 1 END) AS cart_conversion
FROM ecommerce_data;

-- =========================
-- Q5: Purchase conversion rate (Purchase / Cart)
-- =========================
SELECT 
    COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) * 1.0 /
    COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS purchase_conversion
FROM ecommerce_data;

-- =========================
-- Q6: Purchases by category
-- =========================
SELECT category, COUNT(*) AS purchases
FROM ecommerce_data
WHERE event_type = 'purchase'
GROUP BY category
ORDER BY purchases DESC;

-- =========================
-- Q7: Top users by activity
-- =========================
SELECT user_id, COUNT(*) AS activity_count
FROM ecommerce_data
GROUP BY user_id
ORDER BY activity_count DESC;