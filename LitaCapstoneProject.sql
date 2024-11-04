CREATE DATABASE LitaProject1

SELECT * FROM [dbo].[ProjectSalesData]

---Retrieve the total sales for each product category-----
SELECT Product, SUM(Sales) AS SalesPerProduct
FROM ProjectSalesData 
GROUP BY Product
ORDER BY 2 DESC

---Find the number of sales transactions in each region-----
SELECT Region, COUNT(Sales) AS TransactionsPerRegion
FROM ProjectSalesData 
GROUP BY Region

---Find the highest-selling product by total sales value------
SELECT MAX(Product) AS HighestSellingProduct, SUM(Sales) AS TotalSales
FROM ProjectSalesData

---Calculate total revenue per product----
SELECT Product, SUM(Sales) AS TotalRevenue
FROM ProjectSalesData
GROUP BY Product

---Calculate monthly sales totals for the current year-----
SELECT MONTH(OrderDate) AS Month, SUM(Sales) AS CurrentYearMonthlySales
FROM ProjectSalesData 
WHERE
YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate)
ORDER BY 1 ASC

---Find the top 5 customers by total purchase amount----
SELECT TOP 5 Customer_Id, SUM(Sales) AS TotalPurchaseAmount
FROM ProjectSalesData
GROUP BY Customer_Id
ORDER BY TotalPurchaseAmount DESC

---Calculate the percentage of total sales contributed by each region---
SELECT Region, SUM(Sales) AS TotalSales, 
(CAST (SUM(Sales) AS FLOAT) /  (SELECT SUM(Sales) FROM ProjectSalesData) * 100) AS TotalSalesPercentage
FROM ProjectSalesData
GROUP BY Region
ORDER BY TotalSalesPercentage DESC  ------------OR----------

SELECT Region, SUM(Sales) AS TotalSales, 
(SUM(Sales)  * 100.0 /  (SELECT SUM(Sales) FROM ProjectSalesData)) AS TotalSalesPercentage
FROM ProjectSalesData
GROUP BY Region
ORDER BY TotalSalesPercentage DESC

---Identify products with no sales in the last quarter------
SELECT Product FROM [dbo].[ProjectSalesData]
WHERE Product NOT IN
(
    SELECT Product FROM [dbo].[ProjectSalesData]
    WHERE OrderDate >= DATEADD(qq,DATEDIFF(QUARTER,0,GETDATE())-1,0)
    AND OrderDate <= DATEADD(qq,DATEDIFF(QUARTER,0,GETDATE()),0)
    GROUP BY Product
)
GROUP BY Product
-----------------END---------------------------------


----------------------Exploration-----------------------------------
SELECT DATEPART(QUARTER,GETDATE()) 
FROM ProjectSalesData

SELECT DATEPART(QUARTER,OrderDate) 
FROM ProjectSalesData

SELECT Product, 
SUM(Sales) AS TotalSales FROM [dbo].[ProjectSalesData]
WHERE
  OrderDate >= DATEADD(QUARTER,DATEDIFF(QUARTER,0,GETDATE())-1,0)
AND OrderDate <= DATEADD(QUARTER,DATEDIFF(QUARTER,0,GETDATE()),0)
GROUP BY Product
ORDER BY 2 DESC
---------------------------------------------------
