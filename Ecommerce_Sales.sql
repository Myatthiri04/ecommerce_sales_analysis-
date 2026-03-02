SELECT * 
FROM ecommerce.ecommerce_transactions_dataset
LIMIT 10;

SELECT COUNT(*) AS total_rows 
FROM ecommerce.ecommerce_transactions_dataset;

SELECT COUNT(OrderID) AS missing_orderid, 
COUNT(CustomerEmail) AS missing_customer_email,
COUNT(`TotalPrice($)`) AS missing_total_price
FROM ecommerce.ecommerce_transactions_dataset;

SELECT SUM(`TotalPrice($)`) AS total_revenuce 
FROM ecommerce.ecommerce_transactions_dataset;

SELECT City, SUM(`TotalPrice($)`) AS revenue 
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY City ORDER BY revenue DESC;

SELECT PaymentMethod, SUM(`TotalPrice($)`) AS revenue 
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY PaymentMethod
ORDER BY revenue DESC;

SELECT Product, SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY Product 
ORDER BY revenue DESC
LIMIT 10;
##Customer Analysis 
##Total Customers
SELECT COUNT(DISTINCT CustomerEmail) AS total_customers
FROM ecommerce.ecommerce_transactions_dataset;

##Top Customers by revenue 
SELECT CustomerName,CustomerEmail,SUM(`TotalPrice($)`) AS revenue
FROM ecommerce_transactions_dataset
GROUP BY CustomerName,CustomerEmail
ORDER BY revenue DESC
LIMIT 10;
##SALES TRENDS 
##Monthly revenue trends 
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS month,
SUM(`TotalPrice($)`) AS revenue 
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY month
ORDER BY month;
##Orders Per Month 
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS month,
COUNT(OrderID) AS orders
FROM ecommerce_transactions_dataset
GROUP BY month 
ORDER BY month;
##DISCOUNTS AND OPERATIONS
##Average Discount
SELECT AVG(`Discount(%)`) AS avg_discount 
FROM ecommerce_transactions_dataset;
##Shipped vs. Unshipped 
SELECT Shipped, COUNT(OrderID) AS num_of_orders, 
SUM(`TotalPrice($)`) AS revenue
FROM ecommerce_transactions_dataset
GROUP BY Shipped;

