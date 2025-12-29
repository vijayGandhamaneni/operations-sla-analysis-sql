-- Sample data insertion (for testing and demonstration)

INSERT INTO orders (order_id, order_date, city, promised_hours, actual_hours, order_amount) VALUES
(1, '2024-01-05', 'Bengaluru', 24, 26, 499.00),
(2, '2024-01-06', 'Bengaluru', 24, 22, 299.00),
(3, '2024-01-07', 'Chennai', 24, 28, 399.00),
(4, '2024-01-08', 'Chennai', 24, 24, 199.00),
(5, '2024-01-09', 'Hyderabad', 24, 20, 349.00),
(6, '2024-01-10', 'Hyderabad', 24, 27, 449.00),
(7, '2024-02-02', 'Bengaluru', 24, 25, 549.00),
(8, '2024-02-03', 'Chennai', 24, 23, 259.00),
(9, '2024-02-04', 'Hyderabad', 24, 29, 379.00),
(10,'2024-02-05', 'Bengaluru', 24, 21, 599.00);

-- SLA classification
SELECT
    order_id,
    city,
    promised_hours,
    actual_hours,
    CASE
        WHEN actual_hours <= promised_hours THEN 'SLA Met'
        ELSE 'SLA Breached'
    END AS sla_status
FROM orders;

-- Overall SLA percentage
SELECT
    ROUND(
        COUNT(CASE WHEN actual_hours <= promised_hours THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS overall_sla_percentage
FROM orders;

-- City-level SLA performance
SELECT
    city,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN actual_hours <= promised_hours THEN 1 END) AS sla_met_orders,
    ROUND(
        COUNT(CASE WHEN actual_hours <= promised_hours THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS sla_percentage
FROM orders
GROUP BY city;

-- Average delivery delay by city
SELECT
    city,
    ROUND(AVG(actual_hours - promised_hours), 2) AS avg_delay_hours
FROM orders
WHERE actual_hours > promised_hours
GROUP BY city;

-- Month-over-month SLA trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(
        COUNT(CASE WHEN actual_hours <= promised_hours THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS sla_percentage
FROM orders
GROUP BY month
ORDER BY month;
