# Final conclusion and recommendations

The project analysed 2,000 orders across 500 customers, 40 restaurants and 300 menu listings, using 5,000 order-item records. Data covers 1 February 2025 through 1 August 2026.

Delivered orders represent 74.9% of orders and ₹16,33,864.63 in order value after recorded discounts. The overall cancellation rate is 12.3%. Customer analysis identified 68 registered customers with no recorded orders and 363 customers with more than one order across all statuses. Catalogue analysis identified 57 menu listings without any recorded orders.

These findings identify areas for investigation and testing. They do not establish cancellation causes or quantify the impact of proposed changes.

## Recommended actions

1. Investigate restaurants with both high cancellation counts and elevated rates. Little Italy Restaurant has 15 cancellations from 76 orders (19.74%). Urban Treats has a higher rate of 25%, but only 16 orders, so its rate is less stable.
2. Review onboarding and service coverage for customers without orders. Test a first-order intervention and measure incremental Delivered orders against a comparison group.
3. Audit never-ordered menu listings for availability, status, pricing and visibility before removing them or funding promotions.
4. Review Failed and Pending payment records by method. The dataset contains order-level payment statuses, not individual payment attempts or gateway failure causes.
5. Protect availability of high-volume items and monitor completed orders, units and cancellations after any changes.
6. Compare complete months only. August 2026 contains a single day and cannot support a full-month decline claim.

## Measurement boundaries

Order value and item sales are not platform profit or commission revenue. Snapshot customer status, availability and restaurant ratings do not establish historical values. Listed preparation times are not measured delivery durations. No actual improvement in revenue, cancellations or retention is claimed.

## Technical approach

MySQL tables with primary and foreign keys; CSV import; row-count and data-quality checks; INNER and LEFT JOINs; GROUP BY and HAVING; conditional aggregation; date functions; NULL checks; and ranked outputs using ORDER BY and LIMIT. Derived-table aggregation is used in the validation script to reconcile order totals without duplicate counting.
