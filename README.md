# City-Level SLA & Operations Bottleneck Analysis (SQL)

## Business Problem
Operations teams observed SLA degradation and delivery delays across cities. This project analyzes order-level data to identify underperforming regions, measure SLA %, and uncover operational bottlenecks.

## Dataset
Order-level operational data containing:
- Order ID
- Order Date
- City
- Promised Delivery Time
- Actual Delivery Time
- Order Amount

## Analysis Performed
- Classified orders as SLA Met or SLA Breached using CASE logic
- Calculated overall SLA percentage
- Analyzed SLA performance city-wise
- Measured average delivery delays to assess severity
- Tracked month-over-month SLA trends

## Key Insights
- SLA performance varies significantly by city
- High-demand cities tend to show lower SLA percentages
- Average delay analysis highlights severity beyond simple SLA breaches
- Monthly trends help identify emerging operational risks

## Tools Used
- MySQL
- Aggregate functions
- CASE statements
- GROUP BY and filtering

## Outcome
This analysis supports data-driven decisions for capacity planning, SLA improvement, and operational optimization.

## How to Use
1. Create the database and table using `schema.sql`.
2. Insert sample data and run analysis queries from `queries.sql`.
3. Review query outputs to understand SLA performance, delivery delays, and city-level bottlenecks.