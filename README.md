# LITA_CAPSULE_PROJECT1
This is the documentation of my Data Analysis Bootcamp Project1 with @INCUBATOR HUB.

## Project Title
Sales Performance Analysis for a Retail Store 
 
[Project Overview](#project-overview)

[Data Source](#data-source)

[Tools Used](#tools-used)

[Data Cleaning and Preparations](#data-cleaning-and-preparations)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Data Analysis](#data-analysis)

[Data Visualization](#data-visualization)


### Project Overview
---
In this project, I am tasked with analysing sales performance of a retail store. it involves exploring sales data to uncover key insights, such as top-selling products, regional performance, and monthly sales trends. The goal is to produce an interactive Power BI dashboard that highlights these findings. 

### Data Source
---
The data used is Lita_Capsule_Dataset (SalesData), which was shared by Ladies In Tech Africa (LITA) through LMS, to be downloaded by her enrolled Data Analysis Students for the Lita_Capsule_Project.

### Tools Used
---
- Microsoft Excel 
  1. For Data Cleaning
  2. For Analysis
  3. For Visualization
     
- SQL - Structured Query Language for Querying of Data

- Power BI - Power Business Intelligence for Data Visualization

- Github for
  1. Portfolio Building
  2. Project Submission 

### Data Cleaning and Preparations
---
This involves identifying data errors and then changing, updating or removing data to correct them.
1. Data loading and Inspection
2. Verifying blank cells
3. Data Cleaning and Formatting

### Exploratory Data Analysis
---
_Excel_
- What is the total sales by:
   1. Product
   2. Region and
   3. Month
- Calculate Metrics such as:
   1. Average sales per product
   2. Total revenue by region
      using Excel formulas

### Data Analysis
---

![Screenshot 2024-11-03 224839](https://github.com/user-attachments/assets/6f36cddb-8daf-4229-bbfc-8ed40d238be7)

```SQL

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
WHERE
Product NOT IN(
    SELECT Product FROM [dbo].[ProjectSalesData]
    WHERE OrderDate >= DATEADD(qq,DATEDIFF(QUARTER,0,GETDATE())-1,0)
    AND OrderDate <= DATEADD(qq,DATEDIFF(QUARTER,0,GETDATE()),0)
    GROUP BY Product
)
GROUP BY Product```
### Data Visualization



|Heading1|Heading2|Heading3|
|--------|--------|--------|
|Table1|Table2|Table3|

