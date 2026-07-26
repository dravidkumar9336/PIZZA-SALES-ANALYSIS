create database pizza_sales;
use pizza_sales;


select *from  pizza_sales;

##### Total Revenue####

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales


#######Average Order Value#########

SELECT max(order_id) AS Total_Orders, SUM(total_price) AS Total_Revenue, SUM(total_price) / max(order_id) AS Average_Order_Value
FROM pizza_sales


######Total Pizzas Sold####

SELECT SUM(quantity)
FROM pizza_sales

###### Total Orders (Two methods shown to confirm)

SELECT COUNT(DISTINCT order_id) AS 'distinct', MAX(order_id) AS max
FROM pizza_sales


##### Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(MAX(order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS avg_pizzas_ordered
FROM pizza_sales;

####### Daily Trend for Total Orders


SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC;

######### Monthly Trend for Total Orders
SELECT 
    MONTHNAME(order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date), MONTH(order_date)
ORDER BY total_orders DESC;

####### Percentage of Sales by Pizza Category

SELECT pizza_category, SUM(total_price) AS total_sales, Sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS 'percent'
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

###### Percentage of Sales by Pizza Size

SELECT pizza_size, SUM(total_price) AS total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS 'percent'
FROM pizza_sales
GROUP BY pizza_size
ORDER BY 'percent' DESC


######## Total Pizzas Sold by Pizza Category

SELECT pizza_category, COUNT(quantity) AS pizzas_sold
FROM pizza_sales
GROUP BY pizza_category

##### Top 5 Best Sellers by Revenue

SELECT 
    pizza_name,
    SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

### Bottom 5 Best Sellers by Revenue
SELECT 
    pizza_name,
    SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue ASC
LIMIT 5;

#### Top 5 Best Sellers by Total Quantity

SELECT 
    pizza_name,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;


#### Bottom 5 Best Sellers by Total Quantity

SELECT 
    pizza_name,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

########Top 5 Best Sellers by Total Orders

SELECT 
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;


###### Bottom 5 Best Sellers by Total Orders

SELECT 
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;



