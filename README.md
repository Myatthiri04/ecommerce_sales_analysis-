E-Commercne Sales & Customer Anlaytics (SQL Project)

**Business Objective**
The objective of this project was to analyse transactional e-commerce data to: 
1.Identify key revenue drivers
2.Understand customer purchasing behaviour 
3.Track monthly sales trends 
4.Evaluate operational performance (shipping & discounts)
5.Support data-driven decision-making using SQL

**Data Exploration & Validation**
Initial exploration included:
1.Previewing dataset structure using "LIMIT"
2.Validating dataset size using "COUNT(*)"
3.Checking for missing values in key columns:
-Order ID, CustomerEmail,TotalPrice($)

**Revenue Analysis**
Calculated total revenue using: 

SELECT SUM(`TotalPrice($)`) AS total_revenue
FROM ecommerce.ecommerce_transactions_dataset;
This provided an overall performance benchmark for the business. 

**Revenue by City**

SELECT City, SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY City
ORDER BY revenue DESC;
**Insight**
Revenue was concentrated in specific cities, indicating stronger regional demand. This could support targeted marketing strategies and regional expansion decisions. 

**Revenue by Payment Method**

SELECT PaymentMethod, SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY PaymentMethod
ORDER BY revenue DESC;

**Insight**
Certain payment methods contributed significantly more revenue than others, suggesting customer payment preferences that could inform checkout optimization strategies. 

**Top 10 Products by Revenue**

SELECT Product, SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY Product
ORDER BY revenue DESC
LIMIT 10;

**Insight**
A small group of products generated a disproportionate share of revenue, highlighting high-performaning SKUs and potential candidates for upselling or inventory prioritization. 

**Customer Analysis**

##Total Unique Customers 

SELECT COUNT(DISTINCT CustomerEmail) AS total_customers
FROM ecommerce.ecommerce_transactions_dataset;

This metric helps measure customer base size and market reach. 

##Top Customers by Revenue 

SELECT CustomerName, CustomerEmail,
       SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY CustomerName, CustomerEmail
ORDER BY revenue DESC
LIMIT 10;

**Insights**
Revenue was partially driven by high-value customers, indicating potential opportunitites for loyalty programs or VIP targeting strategies. 

**Sales Trends**

##Monthly Revenue Trend##

SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS month,
       SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY month
ORDER BY month;

**Insight**

Revenue trends over time showed fluctuations that may indicate seasonality or promotional impacts. Identifying peak and low-performing months can help forecast demand and optimize marketing campaigns. 

##Orders Per Month##

SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS month,
       COUNT(OrderID) AS orders
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY month
ORDER BY month;

This allows comparison between order volume and revenue trends to determinse whether revenue growth was driven by high order frequency or higher transcation value. 

**Discounts & Operational Performance**

##Average Discount##

SELECT AVG(`Discount(%)`) AS avg_discount
FROM ecommerce.ecommerce_transactions_dataset;

This helps assess pricing strategy and discount reliance. 

##Shipped vs. Unshipped Orders##

SELECT Shipped,
       COUNT(OrderID) AS num_of_orders,
       SUM(`TotalPrice($)`) AS revenue
FROM ecommerce.ecommerce_transactions_dataset
GROUP BY Shipped;

**Insight**

Analyzing shipped vs. unshipped orders provides visibility into operational efficiency and potential revenue risk from incomplete fulfilment. 

