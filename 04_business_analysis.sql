-- Food Delivery Management: Sprint 4 Business Analysis
-- 43 numbered questions plus two introductory restaurant questions.
-- Run the full script in MySQL Workbench after importing all five tables.
-- Delivered analyses use order_status; other queries include all statuses unless stated.
-- Item sales value is before order-level discounts and is not platform profit.
-- Compare full months only: the dataset ends on 2026-08-01.

USE food_delivery_project_db;

-- Sprint 4.1: Customer Profile and Segmentation
-- Q1. How many customers belong to each customer status?
select customer_status,count(*) as customer_count from customers
group by customer_status;

-- Q2. How many customers are there in each city?

select city, count(*) as customer_count from customers
group by city
order by customer_count desc;

-- Q3. How many orders has each customer placed, including customers with zero orders?

select c.customer_id,c.first_name,count(o.order_id) as order_count
from 
customers c left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.first_name
order by order_count desc;

-- Q4. Which customers have placed more than one order?
select c.customer_id,c.first_name,count(o.order_id) as order_count
from 
customers c left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.first_name
having order_count > 1
order by order_count desc;

-- Q5. Which customers have never placed an order?

select c.customer_id,c.first_name,c.city,o.order_id
from 
customers c left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

-- Q6. How much has each customer spent on Delivered orders?
select c.customer_id,c.first_name,sum(o.total_amount) as total_spent
from 
customers c inner join orders o on c.customer_id = o.customer_id
where o.order_status = 'Delivered'
group by c.customer_id,c.first_name
order by total_spent desc;

-- Q7. Who are the top 5 customers by total spending on Delivered orders?

select c.customer_id,c.first_name,sum(o.total_amount) as total_spent
from 
customers c inner join orders o on c.customer_id = o.customer_id
where o.order_status = 'Delivered'
group by c.customer_id,c.first_name
order by total_spent desc, c.customer_id
limit 5;

-- Q8. What is each customer’s average Delivered order value?

select 
c.customer_id,c.first_name,avg(o.total_amount) as Average_spent
from
customers c inner join orders o on c.customer_id = o.customer_id
where o.order_status = 'Delivered'
group by c.customer_id,c.first_name
order by Average_spent desc;

-- Q9. How many customers prefer each payment method?
select preferred_payment_method, count(*) as customers_count from customers
group by preferred_payment_method
order by customers_count desc;

-- Q10. How many customers belong to each gender?
select gender, count(*) as gender_count from customers
group by gender
order by gender_count desc;

-- Q11. How many customers are there in each state?

select state,count(*) as num_of_customers from customers
group by state
order by num_of_customers desc;

-- Q12. How long has each customer been registered, in days?
-- Use the latest order date as the analysis reference date.
SELECT MAX(order_date) INTO @reference_date FROM orders;

SELECT customer_id, first_name, registration_date,
       DATEDIFF(@reference_date, registration_date) AS tenure_days
FROM customers
ORDER BY tenure_days DESC, customer_id;

-- Q13. What is the average customer tenure in days?
SELECT ROUND(AVG(DATEDIFF(@reference_date, registration_date)), 2) AS avg_tenure_days
FROM customers;

-- Sprint 4.2: Restaurant and Menu Activity
-- Additional A. How many restaurants offer each cuisine type?
SELECT cuisine_type, COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY cuisine_type
ORDER BY restaurant_count DESC;

-- Additional B. How many restaurants belong to each restaurant status?
SELECT restaurant_status, COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY restaurant_status
ORDER BY restaurant_count DESC;

-- Q14. What is the average restaurant rating for each cuisine type?
select cuisine_type,round(avg(rating),2) as Avg_rating from restaurants
group by cuisine_type
order by Avg_rating desc;

-- Q15. How many restaurants are there in each city?
select city, count(*) as restaurant_count from restaurants
group by city
order by restaurant_count desc;

-- Q16. How many menu items belong to each item category?
select item_category, count(*) as item_count from menu_items
group by item_category
order by item_count desc;

-- Q17. How many restaurants belong to each price range?
select price_range,count(*) as restaurant_count from restaurants
group by price_range
order by restaurant_count desc;

-- Q18. How many menu items belong to each vegetarian classification?
select vegetarian,count(menu_item_id) as veg_count from menu_items
group by vegetarian
order by veg_count desc;

-- Q19. How many menu items belong to each availability status?
select availability,count(menu_item_id) as availability_count from menu_items
group by availability
order by availability_count desc;

-- Q20. How many menu items belong to each item status?

select item_status, count(menu_item_id) as item_status_count from menu_items
group by item_status
order by item_status_count desc;

-- Q21. How many menu items does each restaurant have, including restaurants with no menu items?

select r.restaurant_id,r.restaurant_name,count(m.menu_item_id) as menu_item_count 
from
restaurants r left join menu_items m on r.restaurant_id = m.restaurant_id
group by r.restaurant_id,r.restaurant_name
order by menu_item_count desc;

-- Q22. What is the average menu item price for each restaurant?
select r.restaurant_id,r.restaurant_name,round(avg(m.price),2) as avg_price
from
restaurants r inner join menu_items m on r.restaurant_id = m.restaurant_id
group by r.restaurant_name,r.restaurant_id
order by avg_price desc;

-- Sprint 4.3: Analyze Order Patterns

-- Q23. How many orders has each restaurant received, including restaurants with zero orders?

select r.restaurant_id,r.restaurant_name,count(o.order_id) as order_count 
from
restaurants r left join orders o on r.restaurant_id = o.restaurant_id
group by r.restaurant_id,r.restaurant_name
order by order_count desc;

-- Q24. What is the total Delivered order value for each cuisine type?

select r.cuisine_type,sum(o.total_amount) as total_delivered_value 
from 
restaurants r inner join orders o on r.restaurant_id = o.restaurant_id
where o.order_status = 'Delivered'
group by r.cuisine_type
order by total_delivered_value desc;

-- Q25. How many orders were placed in each year and month?

select year(order_date) as order_year,month(order_date) as order_month,count(*) as order_count
from orders
group by year(order_date),month(order_date)
order by year(order_date),month(order_date);

-- Q26. What is the total Delivered order value for each year and month?

select year(order_date) as order_year, month(order_date) as order_month, sum(total_amount) as total_delivered_value
from orders
where order_status = 'Delivered'
group by year(order_date),month(order_date)
order by year(order_date),month(order_date);

-- Q27. What are the order count and average order value for each customer status?
select c.customer_status, count(o.order_id) as order_count, round(avg(o.total_amount),2) as avg_ord_value
from
customers c inner join orders o on c.customer_id = o.customer_id
group by c.customer_status;

-- Q28. What is the total discount amount for each order status?

select order_status, sum(discount_amount) as total_discount_amount 
from orders
group by order_status
order by total_discount_amount desc;

-- Sprint 4.4: Payment and Delivery Performance

-- Q29. How many orders use each payment method?

select payment_method, count(*) as order_count from orders
group by payment_method
order by order_count desc;

-- Q30. How many orders belong to each payment status?

select payment_status, count(*) as order_count from orders
group by payment_status
order by order_count desc;

-- Q31. How many orders belong to each delivery status?

select delivery_status, count(*) as order_count from orders
group by delivery_status
order by order_count desc;

-- Q32. How many orders fall into each combination of payment method and payment status?

select payment_method,payment_status, count(*) as order_count from orders
group by payment_method,payment_status
order by payment_method,order_count desc;

-- Q33. How many cancelled orders does each restaurant have?

select r.restaurant_id,r.restaurant_name,count(*) as cancelled_count
from 
restaurants r inner join orders o on r.restaurant_id = o.restaurant_id
where order_status = 'Cancelled'
group by r.restaurant_id,r.restaurant_name
order by cancelled_count desc;

-- Q34. How many orders are assigned to each delivery partner?

select delivery_partner_name, count(order_id) as order_count 
from orders
WHERE delivery_partner_name IS NOT NULL
  AND TRIM(delivery_partner_name) <> ''
group by delivery_partner_name
order by order_count desc;

-- Q35. How many orders were placed during each hour of the day?

select hour(order_time) as order_hour, count(*) as order_count from orders
group by HOUR(order_time)
order by HOUR(order_time) ASC;

-- Q36. How many orders fall into each combination of order status and delivery status?

select order_status,delivery_status,count(*) as order_count from orders
group by  order_status,delivery_status
order by order_count desc;

-- Q37. What percentage of each restaurant’s orders were cancelled?

SELECT
    r.restaurant_id,
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE
        WHEN o.order_status = 'Cancelled' THEN 1
        ELSE 0
    END) AS cancelled_orders,
    ROUND(
        SUM(CASE
            WHEN o.order_status = 'Cancelled' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(o.order_id),
        2
    ) AS cancellation_percentage
FROM restaurants r
INNER JOIN orders o
    ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY cancellation_percentage DESC;

-- Sprint 4.5: Menu Item Usage and Product Engagement

-- Q38. For each menu item, how many individual units were purchased in Delivered orders?

select m.menu_item_id,m.item_name,sum(oi.quantity) as total_quantity
from
menu_items m inner join order_items oi on m.menu_item_id = oi.menu_item_id
inner join orders o
on o.order_id = oi.order_id
where o.order_status = 'Delivered'
group by m.menu_item_id,m.item_name
order by total_quantity desc;

-- Q39. Calculate each menu item’s total sales value before order-level discounts.

select m.menu_item_id,m.item_name,SUM(oi.quantity * oi.unit_price) AS item_sales_value
from
menu_items m inner join order_items oi on m.menu_item_id = oi.menu_item_id
inner join orders o
on o.order_id = oi.order_id
where o.order_status = 'Delivered'
group by m.menu_item_id,m.item_name
order by item_sales_value desc;

-- Q40. Find the top 5 menu item categories by quantity purchased in Delivered orders.

select m.item_category,sum(oi.quantity) as total_quantity 
from 
menu_items m inner join order_items oi on m.menu_item_id = oi.menu_item_id
inner join orders o on o.order_id = oi.order_id
where o.order_status = 'Delivered'
group by m.item_category
order by total_quantity desc, m.item_category
limit 5;

-- Q41. How many units were purchased for each vegetarian classification?

select m.vegetarian,sum(oi.quantity) as total_quantity 
from 
menu_items m inner join order_items oi on m.menu_item_id = oi.menu_item_id
inner join orders o on o.order_id = oi.order_id
where o.order_status = 'Delivered'
group by m.vegetarian
order by total_quantity desc;

-- Q42. Which menu items have never appeared in any order?

select m.menu_item_id,m.item_name
from
menu_items m left join order_items oi on m.menu_item_id = oi.menu_item_id
where oi.order_item_id is null;

-- Q43. What is the average listed preparation time for each menu item category?
select item_category, round(avg(preparation_time),2) as avg_prep_time from menu_items
group by item_category
order by avg_prep_time desc;