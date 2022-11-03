CREATE DATABASE sales;

USE sales;

DROP TABLE sales;

--creating tables

CREATE TABLE transactions (
    product_code VARCHAR(255),
    customer_code VARCHAR(255),
    markets_code VARCHAR(255),
    order_date DATE,
    sales_qty INT,
    sales_amount INT,
    currency VARCHAR(255),
    profit_margin INT,
    profit INT,
    cost_price INT
  );

CREATE TABLE date (
    date DATE,
    cy_date DATE,
    year YEAR,
    month_name VARCHAR(255),
    date_yy__mmm DATE
  );

CREATE TABLE customers (
    customer_code VARCHAR(255),
    customer_name VARCHAR(255),
    customer_type VARCHAR(255)
  );

CREATE TABLE products (
    product_code VARCHAR(255),
    product_type VARCHAR(255)
  );

CREATE TABLE markets (
    markets_code VARCHAR(255),
    markets_name VARCHAR(255),
    zone VARCHAR(255)
  );
  
--data analysis

--looking for customer details
SELECT * FROM sales.customers;

--looking for transaction details
SELECT * FROM sales.transactions;

--looking for product details
SELECT * FROM sales.products;

--looking for market details
SELECT * FROM sales.markets;

--looking for time details
SELECT * FROM sales.date;

--total number of transactions taken place
SELECT count(*) FROM sales.transactions;

--looking for transactions with particular currency
SELECT * FROM transactions WHERE currency = "USD";

--looking for transactions from specific market code
SELECT * FROM sales.transactions WHERE markets_code = "Mark001";
SELECT count(*) FROM sales.transactions WHERE markets_code = "Mark001";

--looking for transactions that took place in particular year or month
SELECT * FROM sales.date;
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020;
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date = date.date WHERE date.year=2020 AND date.month_name = "January" AND (transactions.currency = "INR\r" OR transactions.currency = "USD\r");

--total revenue earned in a particular year
SELECT SUM(sales.transactions.sales_amount), sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020;

--finding the average of profit_margin
SELECT AVG(profit_margin) FROM sales.transactions;

--total revenue earned in a particular year and in particular market
SELECT SUM(sales.transactions.sales_amount), sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020 AND sales.transactions.markets_code = "Mark001";

--distinct product sold in particular market
SELECT DISTINCT product_code FROM sales.transactions WHERE market_code = "Mark001";
