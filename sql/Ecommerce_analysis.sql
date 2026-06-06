CREATE DATABASE Ecommerce;

USE ecommerce;

SELECT *
FROM cleaned_orders;

SELECT COUNT(*) AS total_rows
FROM cleaned_orders;

SELECT
SUM(TotalPrice) AS total_revenue
FROM cleaned_orders;

SELECT
COUNT(OrderID) AS total_orders
FROM cleaned_orders;

SELECT
COUNT(DISTINCT CustomerID)
AS total_customers
FROM cleaned_orders;

SELECT
SUM(TotalPrice) / COUNT(OrderID)
AS average_order_value
FROM cleaned_orders;

SELECT
Product,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY Product
ORDER BY revenue DESC;

SELECT
Product,
SUM(Quantity) AS total_quantity
FROM cleaned_orders
GROUP BY Product
ORDER BY total_quantity DESC;

SELECT
Product,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY Product
ORDER BY revenue DESC
LIMIT 1;

SELECT
Product,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY Product
ORDER BY revenue ASC
LIMIT 10;

SELECT
Product,
SUM(Quantity) AS quantity_sold
FROM cleaned_orders
GROUP BY Product
ORDER BY quantity_sold ASC
LIMIT 10;

SELECT 
Product,
AVG(UnitPrice) AS average_price
FROM cleaned_orders
GROUP BY product;

SELECT 
CustomerID,
SUM(TotalPrice) AS total_spending
FROM cleaned_orders
GROUP BY CustomerID
ORDER BY Total_spending DESC
LIMIT 10;

SELECT 
CustomerID,
COUNT(OrderID) AS total_orders
FROM cleaned_orders
GROUP BY CustomerID
ORDER BY total_orders DESC;

SELECT 
CustomerID,
COUNT(OrderID) AS total_orders
FROM cleaned_orders
GROUP BY CustomerID
HAVING total_orders > 1;

SELECT
    CustomerID,
    SUM(TotalPrice) AS spending,

    CASE
        WHEN SUM(TotalPrice) > 5000 THEN 'High Value'
        WHEN SUM(TotalPrice) > 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM cleaned_orders
GROUP BY CustomerID;

SELECT 
PaymentMethod,
COUNT(*) AS total_orders
FROM cleaned_orders
GROUP BY PaymentMethod;

SELECT 
PaymentMethod,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY PaymentMethod
ORDER BY revenue DESC;

SELECT 
OrderStatus,
COUNT(*) AS total_orders
FROM cleaned_orders
GROUP BY OrderStatus;

SELECT
OrderStatus,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY OrderStatus;

SELECT
Product,
COUNT(*) AS cancelled_orders
FROM cleaned_orders
WHERE OrderStatus = 'Cancelled'
GROUP BY Product
ORDER BY cancelled_orders DESC;

SELECT
Month,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY Month
ORDER BY revenue DESC;

SELECT 
Year,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY year;

SELECT 
Date,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY Date
ORDER BY Date;

SELECT
DayName,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY DayName
ORDER BY revenue DESC;

SELECT 
AVG(ItemsInCart) AS avg_items_in_cart
FROM cleaned_orders;

SELECT * 
FROM cleaned_orders
ORDER BY ItemsInCart DESC;

SELECT 
CouponCode,
COUNT(*) AS usage_count
FROM cleaned_orders
GROUP BY CouponCode
ORDER BY usage_count DESC;

SELECT
CouponCode,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY CouponCode
ORDER BY revenue DESC;

SELECT 
ReferralSource,
SUM(TotalPrice) AS revenue
FROM cleaned_orders
GROUP BY ReferralSource
ORDER BY revenue DESC;

SELECT 
ReferralSource,
COUNT(*) AS total_orders
FROM cleaned_orders
GROUP BY ReferralSource;

SELECT 
Product,
SUM(TotalPrice) AS revenue,

RANK()
OVER(ORDER BY SUM(TotalPrice) DESC)
AS ranking

FROM cleaned_orders
GROUP BY Product;

SELECT 
Product,
SUM(TotalPrice) AS revenue,

DENSE_RANK()
OVER(ORDER BY SUM(TotalPrice) DESC)
AS ranking

FROM cleaned_orders
GROUP BY Product;

SELECT 
Date,
SUM(TotalPrice)
OVER(ORDER BY Date)
AS running_revenue
FROM cleaned_orders;

SELECT
    Month,
    monthly_sales,

    LAG(monthly_sales)
    OVER(ORDER BY Month) AS previous_month_sales

FROM
(
    SELECT
        Month,
        SUM(TotalPrice) AS monthly_sales
    FROM cleaned_orders
    GROUP BY Month
) AS sales_data;


WITH customer_spending AS (

SELECT
CustomerID,
SUM(TotalPrice) AS spending

FROM cleaned_orders

GROUP BY CustomerID

)

SELECT *
FROM customer_spending
WHERE spending > 5000;