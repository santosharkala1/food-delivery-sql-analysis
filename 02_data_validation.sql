-- Read-only data validation. Run after importing all five CSVs.
USE food_delivery_project_db;
-- Expected counts: 500, 40, 300, 2000, 5000.
SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL SELECT 'restaurants', COUNT(*) FROM restaurants
UNION ALL SELECT 'menu_items', COUNT(*) FROM menu_items
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;

-- Expected: zero invalid item rows.
SELECT COUNT(*) AS invalid_item_rows FROM order_items
WHERE quantity IS NULL OR unit_price IS NULL OR subtotal IS NULL
   OR quantity <= 0 OR unit_price < 0
   OR ABS(subtotal - quantity * unit_price) > 0.01;

-- Expected: zero orphan relationships in each row.
SELECT 'menu_restaurant' AS relationship_name, COUNT(*) AS missing_parent_count
FROM menu_items m LEFT JOIN restaurants r ON r.restaurant_id=m.restaurant_id
WHERE r.restaurant_id IS NULL
UNION ALL SELECT 'order_customer', COUNT(*)
FROM orders o LEFT JOIN customers c ON c.customer_id=o.customer_id WHERE c.customer_id IS NULL
UNION ALL SELECT 'order_restaurant', COUNT(*)
FROM orders o LEFT JOIN restaurants r ON r.restaurant_id=o.restaurant_id WHERE r.restaurant_id IS NULL
UNION ALL SELECT 'item_order', COUNT(*)
FROM order_items i LEFT JOIN orders o ON o.order_id=i.order_id WHERE o.order_id IS NULL
UNION ALL SELECT 'item_menu', COUNT(*)
FROM order_items i LEFT JOIN menu_items m ON m.menu_item_id=i.menu_item_id WHERE m.menu_item_id IS NULL;

-- Expected: zero cross-restaurant item mismatches.
SELECT COUNT(*) AS restaurant_mismatches
FROM order_items i JOIN orders o ON o.order_id=i.order_id
JOIN menu_items m ON m.menu_item_id=i.menu_item_id
WHERE o.restaurant_id <> m.restaurant_id;

-- Expected: no rows. Reconcile order amounts without multiplying order totals by item rows.
SELECT o.order_id, o.total_amount, o.discount_amount, a.item_total
FROM orders o
LEFT JOIN (SELECT order_id, SUM(subtotal) AS item_total FROM order_items GROUP BY order_id) a
ON a.order_id=o.order_id
WHERE a.item_total IS NULL OR o.total_amount IS NULL OR o.discount_amount IS NULL
   OR ABS(a.item_total-o.discount_amount-o.total_amount)>0.01;

-- Observed range: 2025-02-01 to 2026-08-01; August 2026 is partial.
SELECT MIN(order_date) AS first_order_date, MAX(order_date) AS last_order_date FROM orders;
