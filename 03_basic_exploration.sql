-- Sprint 3: Official questions 11-20.
USE food_delivery_project_db;
-- Q11. Total customers.
SELECT COUNT(*) AS customer_count FROM customers;
-- Q12. Total restaurants.
SELECT COUNT(*) AS restaurant_count FROM restaurants;
-- Q13. Different restaurant cuisines.
SELECT DISTINCT cuisine_type FROM restaurants ORDER BY cuisine_type;
-- Q14. Active customers.
SELECT COUNT(*) AS active_customer_count FROM customers WHERE customer_status='Active';
-- Q15. Payment methods used in orders.
SELECT DISTINCT payment_method FROM orders ORDER BY payment_method;
-- Q16. Total Delivered order value.
SELECT SUM(total_amount) AS delivered_order_value FROM orders WHERE order_status='Delivered';
-- Q17. Menu categories.
SELECT DISTINCT item_category FROM menu_items ORDER BY item_category;
-- Q18. Total orders.
SELECT COUNT(*) AS order_count FROM orders;
-- Q19. Order statuses.
SELECT DISTINCT order_status FROM orders ORDER BY order_status;
-- Q20. Recorded discounts across all statuses.
SELECT SUM(discount_amount) AS recorded_discount_amount FROM orders;
