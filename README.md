# Food Delivery Business Analytics Using MySQL

## Project Overview

This course project analyzes food delivery data to understand customer activity, restaurant performance, menu demand, order trends, cancellations and payment outcomes.

The analysis uses MySQL to answer 43 business questions and develop recommendations for further investigation.

## Dataset

The supplied dataset contains five related tables:

| Table | Records |
|---|---:|
| Customers | 500 |
| Restaurants | 40 |
| Menu items | 300 |
| Orders | 2,000 |
| Order items | 5,000 |

Order dates cover 1 February 2025 to 1 August 2026. The incomplete August 2026 period is excluded from monthly trend comparisons.

## Tools and SQL Techniques

- MySQL and MySQL Workbench
- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- Aggregate functions
- CASE expressions
- Date functions and NULL checks
- Data validation and reconciliation

## Key Findings

- 1,498 orders were delivered, representing 74.9% of all orders.
- Delivered order value totaled ₹16,33,864.63.
- 246 orders were cancelled, giving a cancellation rate of 12.3%.
- 68 customers had no recorded orders.
- 57 menu listings had never appeared in an order.
- April 2026 had the highest monthly order count, with 172 orders.

## Recommendations

- Investigate why registered customers have not placed a first order.
- Review restaurants with frequent cancellations and collect cancellation reasons.
- Check availability, pricing and visibility of menu listings without orders.
- Investigate failed and pending payment records by payment method.

These actions are proposals for testing. The project does not claim measured business improvements.

## Repository Contents

- [SQL scripts](sql/)
- [Presentation and PDF](presentation/)
- [Business findings and recommendations](reports/)

## Analytical Considerations

Order-level totals and item-level calculations are handled separately to avoid double counting.

Cancellation counts are compared with cancellation rates to account for differences in restaurant order volumes.

## Limitations

Costs and commissions are unavailable, so profit cannot be calculated. Cancellation reasons and actual delivery timestamps are also unavailable.

Findings describe the supplied project dataset and do not establish the causes of observed patterns.

## Author

**Arkala Santosh Kumar**

[LinkedIn](https://www.linkedin.com/in/santosh-kumar-arkala-115664371/)  
[GitHub](https://github.com/santosharkala1)
