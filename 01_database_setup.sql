-- Food Delivery Management: MySQL schema
-- For a fresh installation. Does not drop or overwrite existing tables/data.
-- For the existing populated project database, skip this script.
CREATE DATABASE IF NOT EXISTS food_delivery_project_db;
USE food_delivery_project_db;

CREATE TABLE IF NOT EXISTS customers (
 customer_id VARCHAR(20) PRIMARY KEY,
 first_name VARCHAR(100), last_name VARCHAR(100), email VARCHAR(255),
 phone VARCHAR(20), gender VARCHAR(10), date_of_birth DATE,
 registration_date DATE, city VARCHAR(100), state VARCHAR(100),
 pincode VARCHAR(10), customer_status VARCHAR(20), preferred_payment_method VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS restaurants (
 restaurant_id VARCHAR(20) PRIMARY KEY, restaurant_name VARCHAR(100),
 cuisine_type VARCHAR(50), city VARCHAR(100), state VARCHAR(100),
 rating DECIMAL(2,1), price_range VARCHAR(20), opening_time TIME,
 closing_time TIME, restaurant_status VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS menu_items (
 menu_item_id VARCHAR(20) PRIMARY KEY, restaurant_id VARCHAR(20),
 item_name VARCHAR(100), cuisine_type VARCHAR(50), item_category VARCHAR(50),
 price DECIMAL(10,2), preparation_time INT, vegetarian VARCHAR(10),
 availability VARCHAR(20), item_status VARCHAR(20),
 FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
CREATE TABLE IF NOT EXISTS orders (
 order_id VARCHAR(20) PRIMARY KEY, customer_id VARCHAR(20), restaurant_id VARCHAR(20),
 order_date DATE, order_time TIME, delivery_address VARCHAR(255),
 payment_method VARCHAR(50), payment_status VARCHAR(30), order_status VARCHAR(30),
 delivery_status VARCHAR(30), delivery_partner_name VARCHAR(100),
 discount_amount DECIMAL(10,2), total_amount DECIMAL(10,2),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
CREATE TABLE IF NOT EXISTS order_items (
 order_item_id VARCHAR(20) PRIMARY KEY, order_id VARCHAR(20), menu_item_id VARCHAR(20),
 quantity INT, unit_price DECIMAL(10,2), subtotal DECIMAL(10,2), item_status VARCHAR(20),
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (menu_item_id) REFERENCES menu_items(menu_item_id)
);
