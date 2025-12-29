CREATE DATABASE IF NOT EXISTS ops_analysis;
USE ops_analysis;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    city VARCHAR(50),
    promised_hours INT,
    actual_hours INT,
    order_amount DECIMAL(10,2)
);
