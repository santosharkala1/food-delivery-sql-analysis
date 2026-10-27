# Food Delivery Management — Business Insights

Santosh Kumar | Food Delivery Management

## Scope and definitions

This report presents the exploratory findings and 43 business analyses across customer behaviour, restaurant and menu activity, order patterns, payments and delivery. Two additional analyses describe the restaurant catalogue. Calculations use the five project datasets and the metric definitions below.

Order dates: 1 February 2025–1 August 2026. Tenure reference: 1 August 2026. August 2026 is a partial month. Currency is presented in INR following the project discussion.

Delivered analyses filter orders.order_status = Delivered. Other analyses include all statuses unless stated. Customers and restaurants are grouped by IDs. Item sales use historical order_items.unit_price, not current menu prices. Recommendations are proposals to test, not demonstrated business outcomes.

## Sprint 3 — Basic exploration

| Brief question | Result and interpretation |
|---|---|

| Q11: Customers | 500 registered customers; the population for customer-level percentages. |
| Q12: Restaurants | 40 restaurant listings; a catalogue count, not necessarily active supply. |
| Q13: Cuisines | 15 restaurant cuisine types; variety does not by itself establish demand. |
| Q14: Active customers | 413, or 82.6%; 87 are Inactive. |
| Q15: Payment methods | Six: Wallet, Net Banking, UPI, Cash on Delivery, Credit Card and Debit Card. |
| Q16: Delivered order value | ₹16,33,864.63 from 1,498 Delivered orders. |
| Q17: Menu categories | Eight categories; see Sprint 4 Q16 for their distribution. |
| Q18: Orders | 2,000 orders across all statuses. |
| Q19: Order statuses | Delivered 1,498; Cancelled 246; Processing 163; Pending 93. |
| Q20: Recorded discounts | ₹62,738.54 across all order statuses; not all are realised discounts. |

## Introductory restaurant questions

**Restaurant count by cuisine:** North Indian leads with six restaurants (15%), followed by Street Food with five (12.5%). Restaurant availability is not a measure of customer preference.

**Restaurant status:** 38 of 40 restaurants (95%) are Active; two (5%) are Inactive. Current status does not establish historical operating status.

## Sprint 4 — Findings by question

### Q1. Customers by status

413 customers (82.6%) are Active and 87 (17.4%) are Inactive. Review engagement among inactive customers before selecting a reactivation audience. Status alone does not establish when or why a customer stopped ordering.

Results:

| customer status | Count |
| --- | --- |
| Active | 413 |
| Inactive | 87 |

### Q2. Customers by city

Vadodara has the largest registered customer base with 26 customers (5.2%), followed by Chennai with 23 (4.6%). Customer registrations are spread across 30 cities. Assess delivered spending and repeat ordering before prioritising a city for marketing.

Results:

| city | Count |
| --- | --- |
| Vadodara | 26 |
| Chennai | 23 |
| Indore | 22 |
| Guwahati | 22 |
| Udaipur | 20 |
| Patna | 20 |
| Jaipur | 20 |
| Delhi | 20 |
| Visakhapatnam | 19 |
| Thiruvananthapuram | 19 |
| Ranchi | 19 |
| Hyderabad | 19 |
| Kochi | 18 |
| Ludhiana | 17 |
| Pune | 16 |
| Lucknow | 16 |
| Amritsar | 16 |
| Surat | 15 |
| Mysore | 15 |
| Kolkata | 15 |
| Bangalore | 15 |
| Chandigarh | 14 |
| Nagpur | 13 |
| Mumbai | 13 |
| Kanpur | 13 |
| Bhopal | 13 |
| Raipur | 11 |
| Nashik | 11 |
| Ahmedabad | 11 |
| Coimbatore | 9 |

### Q3. Orders per customer

432 of 500 customers (86.4%) have at least one recorded order. Pankaj (CUST0007) has the most orders at 18. There are 4 orders per registered customer on average; this includes all statuses and does not measure successful purchases alone.

Result extract (first 5 of 500 rows):

| customer id | first name | Count |
| --- | --- | --- |
| CUST0007 | Pankaj | 18 |
| CUST0138 | Isha | 17 |
| CUST0040 | Deepika | 17 |
| CUST0022 | Meera | 16 |
| CUST0416 | Isha | 15 |

### Q4. Repeat-order customers

363 customers placed more than one order: 72.6% of all customers and 84.0% of the 432 customers with orders. This is repeat order placement across the dataset, not a cohort retention rate or a repeat Delivered-purchase rate.

Result extract (first 5 of 363 rows):

| customer id | first name | Count |
| --- | --- | --- |
| CUST0007 | Pankaj | 18 |
| CUST0138 | Isha | 17 |
| CUST0040 | Deepika | 17 |
| CUST0022 | Meera | 16 |
| CUST0416 | Isha | 15 |

### Q5. Customers without orders

68 customers (13.6%) have no recorded orders. Review signup experience, service coverage and first-order engagement for this group. The data does not identify the reason for non-ordering.

Result extract (first 5 of 68 rows):

| customer id | first name | city |
| --- | --- | --- |
| CUST0004 | Diya | Visakhapatnam |
| CUST0006 | Rajesh | Patna |
| CUST0013 | Joseph | Pune |
| CUST0015 | Priya | Ranchi |
| CUST0019 | Sai | Hyderabad |

### Q6. Delivered spending per customer

410 customers have Delivered orders, totalling ₹16,33,864.63. Mean Delivered spending per such customer is ₹3,985.04. This identifies customers with completed-order value; it is not platform profit or necessarily collected cash.

Result extract (first 5 of 410 rows):

| customer id | first name | Amount (INR) |
| --- | --- | --- |
| CUST0295 | Pooja | 16176.88 |
| CUST0134 | Suresh | 15127.59 |
| CUST0138 | Isha | 14968.8 |
| CUST0007 | Pankaj | 14728.94 |
| CUST0184 | Riya | 13509.63 |

### Q7. Top five customers by Delivered spending

Pooja (CUST0295) leads with ₹16,176.88, followed by Suresh (CUST0134), Isha (CUST0138), Pankaj (CUST0007) and Riya (CUST0184). Together the top five contribute ₹74,511.84, or 4.56% of Delivered order value. Consider testing a loyalty offer, with measured incremental results.

Results:

| customer id | first name | Amount (INR) |
| --- | --- | --- |
| CUST0295 | Pooja | 16176.88 |
| CUST0134 | Suresh | 15127.59 |
| CUST0138 | Isha | 14968.8 |
| CUST0007 | Pankaj | 14728.94 |
| CUST0184 | Riya | 13509.63 |

### Q8. Average Delivered order value per customer

Anjali (CUST0074) has the highest average Delivered order value at ₹3,592.81, based on only one order. Pair average order value with frequency when identifying valuable customers; one large order does not establish sustained spending.

Result extract (first 5 of 410 rows):

| customer id | first name | orders | Amount (INR) |
| --- | --- | --- | --- |
| CUST0074 | Anjali | 1 | 3592.81 |
| CUST0396 | Ryan | 1 | 2954.6 |
| CUST0010 | Krishna | 2 | 2523.93 |
| CUST0402 | Anika | 1 | 2404.44 |
| CUST0432 | Riya | 1 | 2383.7 |

### Q9. Preferred payment methods

Wallet is the most stated preference with 91 customers (18.2%), narrowly ahead of Net Banking with 89 (17.8%). Preferences are distributed across six methods. Wallet is the largest group, not a majority, and preferences are distinct from actual payment usage.

Results:

| preferred payment method | Count |
| --- | --- |
| Wallet | 91 |
| Net Banking | 89 |
| UPI | 85 |
| Cash on Delivery | 83 |
| Credit Card | 81 |
| Debit Card | 71 |

### Q10. Customer gender

Male customers represent 50.6% (253), and Female customers represent 49.4% (247). The split is almost even. Gender counts alone do not establish different buying preferences.

Results:

| gender | Count |
| --- | --- |
| Male | 253 |
| Female | 247 |

### Q11. Customers by state

Maharashtra has 53 customers (10.6%) and Gujarat has 52 (10.4%). Together they account for 21% of registrations. Combine this distribution with service availability and order performance before choosing expansion markets.

Results:

| state | Count |
| --- | --- |
| Maharashtra | 53 |
| Gujarat | 52 |
| Punjab | 47 |
| Rajasthan | 40 |
| Kerala | 37 |
| Madhya Pradesh | 35 |
| Tamil Nadu | 32 |
| Karnataka | 30 |
| Uttar Pradesh | 29 |
| Assam | 22 |
| Delhi | 20 |
| Bihar | 20 |
| Telangana | 19 |
| Jharkhand | 19 |
| Andhra Pradesh | 19 |
| West Bengal | 15 |
| Chhattisgarh | 11 |

### Q12. Individual customer tenure

As of 1 August 2026, registration tenure ranges from 4 to 1,308 days. Ryan (CUST0408) has the longest tenure. Registration age can support lifecycle segmentation but does not measure continuous activity.

Result extract (first 5 of 500 rows):

| customer id | first name | Tenure days |
| --- | --- | --- |
| CUST0408 | Ryan | 1308 |
| CUST0080 | Deepak | 1303 |
| CUST0416 | Isha | 1295 |
| CUST0090 | Charlotte | 1292 |
| CUST0434 | John | 1291 |

### Q13. Average customer tenure

Average registration tenure is 631.45 days, approximately 1.73 years, as of 1 August 2026. Combine tenure with recent ordering to distinguish long-standing active customers from dormant accounts.

### Q14. Average restaurant rating by cuisine

Japanese cuisine has the highest restaurant-average rating (4.80), followed by Continental (4.60), but each group contains just one restaurant. Mughlai and Mexican both average 4.00 across four and three restaurants respectively. These are unweighted averages of restaurant ratings; review counts are unavailable.

Results:

| cuisine type | Count | rating |
| --- | --- | --- |
| Japanese | 1 | 4.8 |
| Continental | 1 | 4.6 |
| Mughlai | 4 | 4.0 |
| Mexican | 3 | 4.0 |
| Thai | 1 | 3.9 |
| Punjabi | 3 | 3.9 |
| Italian | 2 | 3.85 |
| Healthy Food | 2 | 3.8 |
| North Indian | 6 | 3.78 |
| Street Food | 5 | 3.74 |
| Fast Food | 2 | 3.7 |
| Chinese | 3 | 3.6 |
| Biryani Specialist | 2 | 3.6 |
| Bakery & Desserts | 2 | 3.5 |
| South Indian | 3 | 3.3 |

### Q15. Restaurants by city

Hyderabad, Mysore, Patna and Udaipur tie at four restaurants each, or 10% of the restaurant catalogue per city. The 40 restaurants span 19 cities. Listing counts alone do not measure capacity, coverage quality or delivery radius.

Results:

| city | Count |
| --- | --- |
| Udaipur | 4 |
| Patna | 4 |
| Mysore | 4 |
| Hyderabad | 4 |
| Pune | 3 |
| Bangalore | 3 |
| Vadodara | 2 |
| Kochi | 2 |
| Guwahati | 2 |
| Delhi | 2 |
| Bhopal | 2 |
| Thiruvananthapuram | 1 |
| Surat | 1 |
| Mumbai | 1 |
| Lucknow | 1 |
| Jaipur | 1 |
| Coimbatore | 1 |
| Chennai | 1 |
| Amritsar | 1 |

### Q16. Menu items by category

Dessert has the largest selection with 46 listings (15.3%), followed by Starter with 43 (14.3%). There are eight categories. Selection breadth should be compared with units purchased before expanding a category.

Results:

| item category | Count |
| --- | --- |
| Dessert | 46 |
| Starter | 43 |
| Pizza | 40 |
| Burger | 40 |
| Noodles & Rice | 38 |
| Main Course | 35 |
| Beverage | 34 |
| Snack | 24 |

### Q17. Restaurants by price range

Mid-Range restaurants account for 22 of 40 listings (55%), Premium for 11 (27.5%) and Budget for 7 (17.5%). Supply is concentrated in the Mid-Range segment. Actual customer price preference requires order analysis.

Results:

| price range | Count |
| --- | --- |
| Mid-Range | 22 |
| Premium | 11 |
| Budget | 7 |

### Q18. Menu vegetarian classification

216 menu items (72%) are classified vegetarian and 84 (28%) non-vegetarian. The catalogue has a larger vegetarian selection. This measures supply, not sales.

Results:

| vegetarian | Count |
| --- | --- |
| Yes | 216 |
| No | 84 |

### Q19. Menu availability

261 menu items (87%) are marked available and 39 (13%) unavailable. Review whether unavailable items are temporary outages or outdated listings. Current availability does not establish availability at the time of historical orders.

Results:

| availability | Count |
| --- | --- |
| Yes | 261 |
| No | 39 |

### Q20. Menu item status

280 menu items (93.3%) are Active and 20 (6.7%) Inactive. Item status and availability are separate fields; inspect both before planning promotion or catalogue cleanup.

Results:

| item status | Count |
| --- | --- |
| Active | 280 |
| Inactive | 20 |

### Q21. Menu items per restaurant

All 40 restaurants have menu listings, with seven or eight items each. No restaurant has an empty menu in this dataset. Similar catalogue sizes do not imply similar demand or sales.

Result extract (first 5 of 40 rows):

| restaurant id | restaurant name | Count |
| --- | --- | --- |
| REST040 | Little Italy Bistro | 8 |
| REST039 | Flavours of Treats | 8 |
| REST038 | Tandoor Treats | 8 |
| REST036 | Royal Diner | 8 |
| REST035 | The Kitchen of Treats | 8 |

### Q22. Average listed item price per restaurant

Delight Eatery (REST002) has the highest average menu price at ₹351.02. Little Italy Junction (REST001) has the lowest at ₹197.74. This is an unweighted menu-price average, not average customer spend or a sales-weighted selling price.

Result extract (first 5 of 40 rows):

| restaurant id | restaurant name | Amount (INR) |
| --- | --- | --- |
| REST002 | Delight Eatery | 351.02 |
| REST033 | Delight Kitchen | 344.18 |
| REST003 | The Kitchen of Eatery | 336.09 |
| REST007 | Fresh Treats | 318.7 |
| REST040 | Little Italy Bistro | 308.55 |

### Q23. Orders per restaurant

Royal Diner (REST036) receives the most orders at 109 (5.45% of all orders), followed by Delight Eatery (REST002) at 102. All 40 restaurants have orders. Evaluate cancellations and Delivered value alongside volume.

Result extract (first 5 of 40 rows):

| restaurant id | restaurant name | Count |
| --- | --- | --- |
| REST036 | Royal Diner | 109 |
| REST002 | Delight Eatery | 102 |
| REST022 | Fresh Corner | 91 |
| REST015 | Urban Bistro | 88 |
| REST003 | The Kitchen of Eatery | 87 |

### Q24. Delivered value by restaurant cuisine

North Indian leads with ₹2,61,791.70, followed by Street Food at ₹2,43,505.60. Their combined contribution is approximately 30.93% of Delivered order value. This uses the restaurant cuisine classification, which need not match each menu item’s cuisine.

Results:

| cuisine type | Amount (INR) |
| --- | --- |
| North Indian | 261791.7 |
| Street Food | 243505.6 |
| Chinese | 185551.85 |
| Mughlai | 175806.03 |
| Punjabi | 110606.27 |
| Mexican | 101075.17 |
| South Indian | 87993.28 |
| Continental | 69573.48 |
| Healthy Food | 68429.02 |
| Italian | 64585.79 |
| Thai | 59005.0 |
| Fast Food | 58276.25 |
| Japanese | 54486.89 |
| Biryani Specialist | 50415.65 |
| Bakery & Desserts | 42762.65 |

### Q25. Monthly order count

April 2026 has the highest order count at 172; July 2026 has 153. The series fluctuates, so it is not uninterrupted month-on-month growth. August 2026 contains only 1 August and four orders: exclude this partial month from full-month performance comparisons.

Results:

| month | Count |
| --- | --- |
| 2025-02 | 62 |
| 2025-03 | 84 |
| 2025-04 | 80 |
| 2025-05 | 90 |
| 2025-06 | 89 |
| 2025-07 | 84 |
| 2025-08 | 111 |
| 2025-09 | 100 |
| 2025-10 | 88 |
| 2025-11 | 120 |
| 2025-12 | 108 |
| 2026-01 | 120 |
| 2026-02 | 130 |
| 2026-03 | 140 |
| 2026-04 | 172 |
| 2026-05 | 127 |
| 2026-06 | 138 |
| 2026-07 | 153 |
| 2026-08 | 4 |

### Q26. Monthly Delivered order value

April 2026 has the highest Delivered order value at ₹1,41,291.81. July 2026 records ₹1,22,455.84. August 2026 records ₹3,915.54 from one day only, so the apparent drop is not evidence of a monthly business decline.

Results:

| month | Count | Amount (INR) |
| --- | --- | --- |
| 2025-02 | 41 | 47506.6 |
| 2025-03 | 58 | 64930.44 |
| 2025-04 | 60 | 64436.3 |
| 2025-05 | 61 | 66783.54 |
| 2025-06 | 68 | 72647.13 |
| 2025-07 | 65 | 69522.3 |
| 2025-08 | 75 | 75656.96 |
| 2025-09 | 71 | 81257.3 |
| 2025-10 | 58 | 59832.5 |
| 2025-11 | 99 | 114157.18 |
| 2025-12 | 76 | 86307.48 |
| 2026-01 | 93 | 102291.26 |
| 2026-02 | 107 | 124722.77 |
| 2026-03 | 107 | 104839.26 |
| 2026-04 | 135 | 141291.81 |
| 2026-05 | 103 | 112242.29 |
| 2026-06 | 110 | 119068.13 |
| 2026-07 | 107 | 122455.84 |
| 2026-08 | 4 | 3915.54 |

### Q27. Orders and average value by customer status

Customers currently marked Active account for 1,667 orders (83.35%) with an average order value of ₹1,088.35. Inactive customers account for 333 orders with an average of ₹1,041.54. Historical orders are grouped by the customer status recorded in the dataset snapshot, not proven status at order time.

Results:

| customer status | Count | Amount (INR) |
| --- | --- | --- |
| Active | 1667 | 1088.35 |
| Inactive | 333 | 1041.54 |

### Q28. Discounts by order status

Delivered orders carry ₹46,564.49 of recorded discounts, followed by Cancelled orders at ₹7,672.77. Total recorded discounts across statuses are ₹62,738.54. Discounts attached to cancelled or pending orders should not automatically be treated as realised promotional expenditure.

Results:

| order status | Amount (INR) |
| --- | --- |
| Delivered | 46564.49 |
| Cancelled | 7672.77 |
| Processing | 5644.25 |
| Pending | 2857.03 |

### Q29. Actual payment-method usage

Cash on Delivery is the most used method: 366 orders (18.3%), followed by Debit Card at 350 (17.5%). Wallet leads stated preferences but accounts for 319 orders (15.95%). These distributions have different denominators: customers versus orders.

Results:

| payment method | Count |
| --- | --- |
| Cash on Delivery | 366 |
| Debit Card | 350 |
| Credit Card | 338 |
| Net Banking | 323 |
| Wallet | 319 |
| UPI | 304 |

### Q30. Payment status

1,768 orders (88.4%) have payment status Success, 139 (6.95%) Failed and 93 (4.65%) Pending. Review failed and pending records to identify follow-up needs. These are order-level statuses; the dataset does not contain individual payment attempts or refund events.

Results:

| payment status | Count |
| --- | --- |
| Success | 1768 |
| Failed | 139 |
| Pending | 93 |

### Q31. Delivery status

1,498 orders (74.9%) are Delivered, 246 (12.3%) Cancelled, 163 (8.15%) Out for Delivery and 93 (4.65%) Pending. Review unresolved orders with operational context. The snapshot cannot establish lateness without delivery timestamps or deadlines.

Results:

| delivery status | Count |
| --- | --- |
| Delivered | 1498 |
| Cancelled | 246 |
| Out for Delivery | 163 |
| Pending | 93 |

### Q32. Payment method and payment status

Cash on Delivery has the most Failed-labelled orders (32 of 366, 8.74%), while Net Banking has 17 of 323 (5.26%). Debit Card has 313 Success records out of 350 (89.43%). Compare within-method percentages, not just counts. A Failed cash-on-delivery status should not be described as a payment-gateway failure.

Results:

| payment method | payment status | Count |
| --- | --- | --- |
| Cash on Delivery | Success | 320 |
| Cash on Delivery | Failed | 32 |
| Cash on Delivery | Pending | 14 |
| Credit Card | Success | 299 |
| Credit Card | Failed | 22 |
| Credit Card | Pending | 17 |
| Debit Card | Success | 313 |
| Debit Card | Failed | 23 |
| Debit Card | Pending | 14 |
| Net Banking | Success | 288 |
| Net Banking | Pending | 18 |
| Net Banking | Failed | 17 |
| UPI | Success | 263 |
| UPI | Failed | 25 |
| UPI | Pending | 16 |
| Wallet | Success | 285 |
| Wallet | Failed | 20 |
| Wallet | Pending | 14 |

### Q33. Cancelled orders by restaurant

Little Italy Restaurant (REST034) has the highest cancellation count at 15; Fresh Corner (REST022) and Urban Bistro (REST015) each have 14. Cancellations occur at 39 of the 40 restaurants. Compare rates and order volumes before prioritising investigation.

Result extract (first 5 of 39 rows):

| restaurant id | restaurant name | Count |
| --- | --- | --- |
| REST034 | Little Italy Restaurant | 15 |
| REST022 | Fresh Corner | 14 |
| REST015 | Urban Bistro | 14 |
| REST037 | Southern Eatery | 12 |
| REST033 | Delight Kitchen | 12 |

### Q34. Delivery partner assignment volume

Suresh Yadav has the most assigned orders at 138, followed by Vikas Rao at 131. Counts range from 33 to 138 across 24 partner names. This is historical assignment volume across all statuses, not deliveries per shift or delivery speed. Names may not be unique person identifiers.

Results:

| delivery partner name | Count |
| --- | --- |
| Suresh Yadav | 138 |
| Vikas Rao | 131 |
| Ramesh Das | 128 |
| Manoj Gupta | 128 |
| Sanjay Verma | 118 |
| Ravi Kumar | 117 |
| Pradeep Joshi | 115 |
| Sunil Reddy | 109 |
| Naresh Iyer | 108 |
| Anil Patil | 108 |
| Ajay Mehta | 107 |
| Vinod Chopra | 100 |
| Deepak Sharma | 97 |
| Amit Singh | 96 |
| Rakesh Nair | 95 |
| Vikram Singh | 34 |
| Rohit Verma | 34 |
| Rahul Sharma | 34 |
| Naveen Kumar | 34 |
| Manish Gupta | 34 |
| Karan Mehta | 34 |
| Arjun Patel | 34 |
| Amit Kumar | 34 |
| Deepak Singh | 33 |

### Q35. Hourly order placement

Midnight (00:00–00:59) has the highest count at 100 orders (5%), and 07:00–07:59 has the lowest at 67. Orders are fairly evenly spread through the day, with no pronounced lunch or dinner peak in these totals. These are aggregate counts across dates, not daily hourly averages.

Results:

| hour | Count |
| --- | --- |
| 00 | 100 |
| 01 | 97 |
| 02 | 81 |
| 03 | 81 |
| 04 | 76 |
| 05 | 91 |
| 06 | 71 |
| 07 | 67 |
| 08 | 98 |
| 09 | 73 |
| 10 | 78 |
| 11 | 81 |
| 12 | 76 |
| 13 | 86 |
| 14 | 97 |
| 15 | 85 |
| 16 | 82 |
| 17 | 78 |
| 18 | 91 |
| 19 | 84 |
| 20 | 79 |
| 21 | 82 |
| 22 | 75 |
| 23 | 91 |

### Q36. Order and delivery status combinations

All 1,498 Delivered orders also have Delivered delivery status, and all 246 Cancelled orders have Cancelled delivery status. Processing maps to Out for Delivery for 163 orders, and Pending maps to Pending for 93. No exceptions to these four mappings occur in the project data; this does not validate actual delivery timing.

Results:

| order status | delivery status | Count |
| --- | --- | --- |
| Delivered | Delivered | 1498 |
| Cancelled | Cancelled | 246 |
| Processing | Out for Delivery | 163 |
| Pending | Pending | 93 |

### Q37. Restaurant cancellation percentage

Urban Treats (REST025) has the highest cancellation rate at 25% (4 of 16 orders). The Kitchen of Café (REST031) follows at 20% (9 of 45). Little Italy Restaurant has 19.74% (15 of 76), combining a high rate with the most cancellations. Compare these with the overall 12.3% rate, keeping small sample sizes in mind.

Result extract (first 5 of 40 rows):

| restaurant id | restaurant name | Count | cancelled | Cancellation % |
| --- | --- | --- | --- | --- |
| REST025 | Urban Treats | 16 | 4 | 25.0 |
| REST031 | The Kitchen of Café | 45 | 9 | 20.0 |
| REST034 | Little Italy Restaurant | 76 | 15 | 19.74 |
| REST033 | Delight Kitchen | 63 | 12 | 19.05 |
| REST016 | Royal Point | 32 | 6 | 18.75 |

### Q38. Delivered units by menu item

Margherita Pizza (MENU0014) leads with 87 units, followed by BBQ Chicken Pizza (MENU0011) and Kulfi (MENU0269), both with 76. Delivered orders contain 6,169 units across 243 menu listings. Rank by menu item ID so identically named listings remain separate.

Result extract (first 5 of 243 rows):

| menu item id | item name | Total quantity |
| --- | --- | --- |
| MENU0014 | Margherita Pizza | 87 |
| MENU0269 | Kulfi | 76 |
| MENU0011 | BBQ Chicken Pizza | 76 |
| MENU0012 | Singapore Noodles | 73 |
| MENU0013 | Butter Chicken | 72 |

### Q39. Delivered item sales value

Singapore Noodles (MENU0012) generates the highest item sales value at ₹43,806.57, followed by Margherita Pizza (MENU0014) at ₹38,476.62. Total Delivered item sales value is ₹16,80,429.12 before order-level discounts. Subtracting ₹46,564.49 of Delivered discounts reconciles to ₹16,33,864.63 of Delivered order value. These figures do not represent platform commission or profit.

Result extract (first 5 of 243 rows):

| menu item id | item name | Amount (INR) |
| --- | --- | --- |
| MENU0012 | Singapore Noodles | 43806.57 |
| MENU0014 | Margherita Pizza | 38476.62 |
| MENU0011 | BBQ Chicken Pizza | 35397.76 |
| MENU0018 | Singapore Noodles | 29944.65 |
| MENU0268 | Paneer Butter Masala | 29208.0 |

### Q40. Top five menu categories by units

Dessert leads with 935 units, narrowly ahead of Main Course with 931. Pizza contributes 861, Noodles & Rice 826 and Starter 813. The top five total 4,366 units, approximately 70.77% of Delivered units. Avoid overstating the four-unit difference between the leading categories.

Results:

| item category | Total quantity |
| --- | --- |
| Dessert | 935 |
| Main Course | 931 |
| Pizza | 861 |
| Noodles & Rice | 826 |
| Starter | 813 |

### Q41. Delivered units by vegetarian classification

Vegetarian items contribute 4,346 units (70.45%), and non-vegetarian items contribute 1,823 (29.55%). Vegetarian items also represent 72% of catalogue listings. Demand volume broadly reflects the larger vegetarian selection; these counts do not establish a causal dietary preference.

Results:

| vegetarian | Total quantity |
| --- | --- |
| Yes | 4346 |
| No | 1823 |

### Q42. Menu items never ordered

57 of 300 menu listings (19%) have never appeared in any recorded order, identified through a left join between menu_items and order_items. Review availability, item status, restaurant exposure and pricing before removal or promotion. A missing order in this period does not establish lifetime failure, and a dish name may sell under another menu item ID.

Result extract (first 5 of 57 rows):

| menu item id | item name |
| --- | --- |
| MENU0008 | Fish Fingers |
| MENU0009 | Farmhouse Pizza |
| MENU0010 | Veggie Supreme Pizza |
| MENU0026 | Chocolate Brownie |
| MENU0027 | Masala Chai |

### Q43. Average listed preparation time by category

Beverage has the highest average listed preparation_time at 30.56, followed by Noodles & Rice at 30.34; Dessert has the lowest at 27.28. The spread is only 3.28 time units. The source field does not specify a time unit, so results are reported in the original units. These are catalogue estimates, not measured preparation or delivery times.

Results:

| item category | Average listed preparation time |
| --- | --- |
| Beverage | 30.56 |
| Noodles & Rice | 30.34 |
| Main Course | 29.0 |
| Starter | 28.35 |
| Snack | 28.25 |
| Burger | 27.85 |
| Pizza | 27.32 |
| Dessert | 27.28 |

## Recommended business actions

1. Review first-order conversion for the 68 customers without orders. Segment by tenure and service coverage before testing an onboarding offer.

2. Investigate restaurant cancellations using both rate and volume. Start with Little Italy Restaurant (15 of 76), while treating Urban Treats’ 25% rate cautiously because it is based on only 16 orders.

3. Audit the 57 never-ordered menu listings for availability, item status and visibility. Compare with the 39 unavailable listings before choosing catalogue changes.

4. Review the 139 Failed and 93 Pending payment records by method and operational outcome. Do not attribute failures to gateways without transaction evidence.

5. Protect availability of high-volume items and categories, then test changes using incremental Delivered orders and value.

6. Use complete months for trend reporting. Keep August 2026 separate until a full month is available.

## Validation and interpretation limits

All source row counts match the imported totals: 500 customers, 40 restaurants, 300 menu items, 2,000 orders and 5,000 order items. Every order total reconciles to its summed item subtotals minus its recorded discount within ₹0.01. Delivered item-level sales and order-level value reconcile as shown in Q39.

Customer and restaurant status, menu availability, ratings and catalogue preparation times are snapshot fields. They do not establish historical status or performance at order time. No commission, cost, refund, actual delivery timestamp or cancellation-reason data was used. The findings describe this dataset; causes and financial benefits require additional evidence.

## Data sources

- data/customers.csv: customer profiles and registration information.
- data/restaurants.csv: restaurant profiles, ratings and operating attributes.
- data/menu_items.csv: menu catalogue, prices, availability and preparation estimates.
- data/orders.csv: order dates, amounts, discounts and operational statuses.
- data/order_items.csv: item quantities and recorded selling prices.

Project scope and database relationships follow the Food Delivery Management project brief.
