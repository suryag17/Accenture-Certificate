SELECT * FROM excel.pizza_sales_excel_file;
select sum(total_price) as total_revenue from pizza_sales_excel_file;
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales_excel_file;
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales_excel_file;
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file;
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order FROM pizza_sales_excel_file;



SELECT date_format(order_date, '%W') AS order_day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales_excel_file GROUP BY date_format(order_date, '%W');

SELECT date_format(order_date,'%m') AS order_day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales_excel_file GROUP BY date_format(order_date,'%m');


SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_excel_file)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_excel_file
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_excel_file)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_excel_file
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales_excel_file
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;


SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold asc
limit 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders asc
limit 5;