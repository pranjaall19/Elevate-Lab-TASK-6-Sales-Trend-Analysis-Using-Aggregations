-- Task 6: Sales Trend Analysis using Aggregations
-- Dataset: bike_sales.csv

-- Query 1: Extract Month and Year from Date
SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS month
FROM bike_sales;

-- Query 2: Calculate Monthly Revenue
SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS month,
  SUM(Sales) AS total_revenue
FROM bike_sales
GROUP BY year, month;

-- Query 3: Calculate Monthly Order Volume
SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS month,
  COUNT(DISTINCT Sale_ID) AS order_volume
FROM bike_sales
GROUP BY year, month;

-- Query 4: Monthly Revenue + Order Volume with Date Filter and Sorting
SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS month,
  SUM(Sales) AS total_revenue,
  COUNT(DISTINCT Sale_ID) AS order_volume
FROM bike_sales
WHERE STR_TO_DATE(Date, '%d-%m-%Y') BETWEEN '2021-01-01' AND '2023-12-31'
GROUP BY year, month
ORDER BY year, month;

-- Query 5: Top 3 Months by Revenue
SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS month,
  SUM(Sales) AS total_revenue
FROM bike_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;
