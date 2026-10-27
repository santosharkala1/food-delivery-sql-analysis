# Food Delivery Management — Sprint 1 Answers

Santosh Kumar

Business requirements, database relationships and analytical approach for the Food Delivery Management project.

## 1.1 Business understanding

The platform connects customers with restaurants so they can order food online. It records customers, restaurants, menu items, orders, and the items within each order. Management wants to understand customer behaviour, restaurant activity, product demand, order value, payment outcomes, and delivery statuses.

## 1.2 Analyst role and project objective

The analysis uses MySQL to examine customer ordering behaviour, menu demand, restaurant performance, payments and cancellations. The approach combines data validation, defined business metrics and interpretation of query results to identify areas for operational review.

## 1.3 ER diagram interpretation

| Table | One row represents | Primary key | Foreign keys |
|---|---|---|---|
| customers | One customer | customer_id | None |
| restaurants | One restaurant | restaurant_id | None |
| menu_items | One restaurant menu item | menu_item_id | restaurant_id → restaurants |
| orders | One customer order at a restaurant | order_id | customer_id → customers; restaurant_id → restaurants |
| order_items | One item entry within an order | order_item_id | order_id → orders; menu_item_id → menu_items |

Each relationship above is one-to-many from the parent to the child. One customer can have many orders; one restaurant can have many orders and menu items; one order can have many order-item entries; one menu item can appear in many order-item entries.

Example: one order containing two identical biryanis and one drink normally has one orders row and two order_items rows, with quantities 2 and 1. Order count, item-entry count, and total units are different measures.

## 1.4 Analytical thinking answers

### Q1. Identify customers and understand their ordering behaviour

**Tables and columns:** customers: customer_id, first_name, last_name, city, customer_status, registration_date. orders: order_id, customer_id, order_date, order_status, total_amount.

**Relationship:** Connect customers to orders through customer_id; retain customers without orders when describing the full customer base.

**Analytical approach:** Count orders per customer, inspect first and latest ordering dates, and compare ordering frequency and order value across customer groups. Distinguish all placed orders from delivered orders when interpreting spending. Customers with no orders should have an order count of zero.

### Q2. Identify customers who placed more than one order

**Tables and columns:** customers: customer_id, first_name, last_name. orders: order_id, customer_id.

**Relationship:** Connect through customer_id.

**Analytical approach:** Count order IDs for each customer and retain counts greater than one. Group by customer identity, not only name, since different customers can share names. Treat this as all placed orders unless a particular status is requested.

### Q3. Compare orders associated with different restaurants

**Tables and columns:** restaurants: restaurant_id, restaurant_name. orders: order_id, restaurant_id, order_status, total_amount.

**Relationship:** Connect through restaurant_id.

**Analytical approach:** Count orders per restaurant and compare counts from highest to lowest. Retain restaurants with zero orders for a complete comparison. Compare delivered order value separately if required; define whether top means most orders or highest value.

### Q4. Understand how customers use restaurants through orders

**Tables and columns:** customers: customer_id, first_name, last_name. orders: order_id, customer_id, restaurant_id, order_date. restaurants: restaurant_id, restaurant_name.

**Relationship:** customers → orders through customer_id; orders → restaurants through restaurant_id.

**Analytical approach:** Identify the restaurants each customer orders from, count orders for each customer–restaurant pair, and examine repeat use of the same restaurant versus use of several restaurants.

### Q5. Identify common payment methods and payment outcomes

**Tables and columns:** orders: order_id, payment_method, payment_status. customers.preferred_payment_method is optional for comparing preference with actual use.

**Relationship:** No join is needed for actual payment usage and outcomes. Join customers through customer_id only for the preference comparison.

**Analytical approach:** Count orders by payment method and payment status. Compare the share of orders with each outcome within each method. The orders table records the payment outcome per order; without a payment-attempt log, do not describe these as counts of payment attempts. Preferred method is different from actual method used.

### Q6. Identify which customers order which menu items

**Tables and columns:** customers: customer_id, first_name, last_name. orders: order_id, customer_id, order_status. order_items: order_id, menu_item_id, quantity. menu_items: menu_item_id, item_name.

**Relationship:** customers → orders → order_items → menu_items, using customer_id, order_id, and menu_item_id respectively.

**Analytical approach:** Associate each customer with the menu items ordered. Sum quantity to measure units and count distinct orders to measure ordering frequency. Select and document an appropriate order/item status rule when measuring fulfilled purchases.

### Q7. Examine delivered, cancelled, processing, and pending orders

**Tables and columns:** orders: order_id, order_status, delivery_status, order_date.

**Relationship:** No join is needed for an overall status breakdown.

**Analytical approach:** Inspect the recorded statuses, count orders in each order_status, and calculate their shares of all orders. Examine delivery_status separately and check inconsistent combinations. Pending and processing orders should not automatically be treated as failed orders.

### Q8. Compare restaurant performance across cuisines and locations

**Tables and columns:** restaurants: restaurant_id, restaurant_name, cuisine_type, city, state, rating, restaurant_status. orders: order_id, restaurant_id, order_status, total_amount.

**Relationship:** Connect through restaurant_id.

**Analytical approach:** Compare order count, delivered order value, and cancellation rate per restaurant, then summarise by cuisine and restaurant location. Examine the number of restaurants in each group so a larger group is not assumed to perform better merely because it has more restaurants. Keep customer location distinct from restaurant location. Ratings are restaurant attributes and should not be unintentionally weighted by duplicated order rows.

### Q9. Identify which menu items belong to which restaurants

**Tables and columns:** restaurants: restaurant_id, restaurant_name. menu_items: menu_item_id, restaurant_id, item_name, item_category, price, availability, item_status.

**Relationship:** Connect through restaurant_id.

**Analytical approach:** List each restaurant's menu, count its items, and examine category coverage, prices, availability, and status. Retain restaurants with no menu items when checking completeness. No orders table is required to describe the menu catalogue.

### Q10. Understand customer use of restaurants and menu categories

**Tables and columns:** customers: customer_id, first_name, last_name. orders: order_id, customer_id, restaurant_id, order_status. restaurants: restaurant_id, restaurant_name. order_items: order_id, menu_item_id, quantity, subtotal. menu_items: menu_item_id, restaurant_id, item_category, item_name.

**Relationship:** Connect customers → orders → restaurants and orders → order_items → menu_items. Check that each menu item's restaurant matches the order's restaurant.

**Analytical approach:** Compare each customer's restaurants and menu categories, total units, distinct order counts, and item subtotals. Count an order only once within the intended grouping. An order containing several categories can appear in several category groups, so those category order counts are not additive. Do not sum a repeated order total after joining to order_items.

## Metric definitions and analytical limitations

- Treat the latest order_date in the data as the reference date for time-based analysis, as the assignment requires.
- Use customer_id, restaurant_id, order_id, and menu_item_id to identify entities; names need not be unique.
- Use all orders for placed-order counts unless explicitly narrowed. Define delivered/paid/item-status rules before reporting fulfilled sales or spending.
- Establish whether total_amount already includes the discount before subtracting discount_amount. Validate quantity × unit_price against subtotal and reconcile item subtotals with order amounts.
- Delivered order value is not automatically platform revenue or profit; commission and cost data are not supplied in this schema.
- There are no actual delivery timestamps or recorded delivery durations. Menu preparation_time cannot establish delivery speed or on-time delivery rates.
- Describe observed associations without claiming they prove causes or implemented business improvements.

## Data sources

The database design follows the Food Delivery Management project brief and its ER diagram. The project datasets are included in the data folder:

- data/customers.csv
- data/restaurants.csv
- data/menu_items.csv
- data/orders.csv
- data/order_items.csv
