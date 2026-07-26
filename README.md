# 🍕 Pizza Sales Analysis Dashboard

## 📌 Overview
This project presents an end-to-end analysis of a pizza restaurant's sales data. I cleaned and queried the data in MySQL, then built an interactive Power BI dashboard to derive business insights such as top-selling pizzas, peak sales hours, and category-wise revenue trends.

## 🎯 Business Problem
Restaurant management had no visibility into which pizzas sold the most, when peak order hours occurred, and which category generated the most revenue. This dashboard provides a data-driven answer to those questions.

## 🛠️ Tools & Tech Stack
- MySQL — data cleaning and querying
- Power BI — dashboard and visualization
- DAX — calculated measures
- ODBC Connector — MySQL to Power BI connection

## 📊 Dashboard Preview

## 🔑 Key Insights
- Total Revenue: 817.86K | Total Orders: 49K | Total Pizzas Sold: 50K
- Avg Pizzas per Order: 1.02 | Avg Order Value: 16.82
- Top pizza by revenue: The Thai Chicken Pizza and The Barbecue Chicken Pizza (tied, 43K each), followed by The California Chicken Pizza (41K), The Classic Deluxe Pizza (38K), and The Spicy Italian Pizza (35K)
- Top pizza by quantity sold: The Spinach Pesto Pizza (16K units)
- Revenue by category: Classic (26.91%), Supreme (25.46%), Chicken (23.96%), Veggie (23.68%) — fairly evenly distributed
- Revenue by size: Large pizzas dominate at 45.89%, followed by Medium (30.49%) and Small (21.77%); XL/XXL sizes are a negligible share (~1.7%)
- Weakest performers: The Brie Carre Pizza consistently ranks lowest across revenue, quantity, and orders

## 📈 DAX Measures Used
```dax
Total Revenue = SUM(pizza_sales[total_price])

Total Orders = DISTINCTCOUNT(pizza_sales[order_id])

Avg Order Value = DIVIDE([Total Revenue], [Total Orders])

Avg Pizzas Per Order = DIVIDE([Total Pizzas Sold], [Total Orders])
```

## 🗄️ SQL Queries
The MySQL queries used for data cleaning and analysis are available in `pizza_sales_queries.sql`, covering the top 5/bottom 5 selling pizzas, category-wise sales, and time-based trends.

## ⚙️ How to Run
1. Import `pizza_sales.csv` into MySQL
2. Run `pizza_sales_queries.sql` to set up the tables/views
3. In Power BI Desktop, connect to the MySQL database using the ODBC Connector
4. Open `pizza_sales_dashboard.pbix` and refresh the data

## 🚧 Challenges Faced
- Fixed MySQL syntax for the bottom-5 selling pizzas query
- Resolved CSV import issues involving `LOAD DATA INFILE` and `STR_TO_DATE`
- Set up Power BI's connection to MySQL using the ODBC Connector (instead of Connector/NET)

## 📬 Contact
Dravid Kumar | [linkedin.com/in/dravid-kumar-08a8a9362] | [kumardravid9336@gmail.com]
