--1. Total Revenue & Average Order Value
SELECT 
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_order_value
FROM customer_behaviour;
--2. Revenue by Category (Top-selling products)
SELECT 
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_behaviour
GROUP BY category
ORDER BY total_revenue DESC;
--3. Customer Segmentation by Age Group
SELECT 
    age_group,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(purchase_amount) AS revenue
FROM customer_behaviour
GROUP BY age_group
ORDER BY revenue DESC;
--4. Gender-wise Purchase Behavior
SELECT 
    gender,
    COUNT(customer_id) AS total_orders,
    SUM(purchase_amount) AS revenue,
    AVG(review_rating) AS avg_rating
FROM customer_behaviour
GROUP BY gender;
--5. Top 10 High-Value Customers
SELECT top 10
    customer_id,
    SUM(purchase_amount) AS lifetime_value,
    COUNT(*) AS total_orders
FROM customer_behaviour
GROUP BY customer_id
ORDER BY lifetime_value DESC;
--6. Subscription vs Non-Subscription Analysis
SELECT 
    subscription_status,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(purchase_amount) AS revenue,
    AVG(previous_purchases) AS avg_past_orders
FROM customer_behaviour
GROUP BY subscription_status;
--7. Discount Effectiveness
SELECT 
    discount_applied,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS revenue,
    AVG(purchase_amount) AS avg_order_value
FROM customer_behaviour
GROUP BY discount_applied;
--8. Purchase Frequency Analysis
SELECT 
    frequency_of_purchases,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(purchase_amount) AS revenue
FROM customer_behaviour
GROUP BY frequency_of_purchases
ORDER BY revenue DESC;
--9. Seasonal Sales Trend
SELECT 
    season,
    SUM(purchase_amount) AS revenue,
    COUNT(*) AS total_orders
FROM customer_behaviour
GROUP BY season
ORDER BY revenue DESC;
--10. Shipping Type Performance
SELECT 
    shipping_type,
    COUNT(*) AS orders,
    AVG(review_rating) AS avg_rating
FROM customer_behaviour
GROUP BY shipping_type
ORDER BY avg_rating DESC;
