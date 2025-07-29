# Retail Sales Analysis Project-1
## Project Overview
Project Title: Retail Sales Analysis
Level: Beginner
Database: retail

This project aims to showcase essential SQL techniques commonly used by data analysts to explore, clean, and analyze retail sales data. It involves creating a retail sales database, conducting exploratory data analysis (EDA), and answering key business questions using SQL queries. Designed for beginners in data analytics, this project helps lay a strong foundation in SQL by applying it to real-world retail scenarios.
## Objectives
 1.Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
 2.Data Cleaning: Identify and remove any records with missing or null values.
 3.Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
 4.Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

 ## Project Structure
  ### 1.Database Setup
   1.Database Creation: The project starts by creating a database named retail.
   2.Table Creation: A table named retail_salesnew is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category,     quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.
              CREATE DATABASE retail;

```sql
CREATE TABLE retail_sales (
  transactions_id INT PRIMARY KEY,
  sale_date DATE,
  sale_time TIME,
  customer_id INT,
  gender VARCHAR(10),
  age INT,
  category VARCHAR(35),
  quantity INT,
  price_per_unit FLOAT,
  cogs FLOAT,
  total_sale FLOAT
);
```
## 2. Data Exploration & Cleaning
1.Record Count: Determine the total number of records in the dataset.
2.Customer Count: Find out how many unique customers are in the dataset.
3.Category Count: Identify all unique product categories in the dataset.
4.Null Value Check: Check for any null values in the dataset and delete records with missing data.

```sql
-- Total number of rows in a table
select count(*) from retail_salesnew 

-- Chcek is there any Null in the columns
select * from retail_salesnew 
where transactions_id is NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL

--  How many sales or records we have------
select count(*) as total_Count from retail_salesnew

-- How many unique customer we have -----
select count(distinct customer_id) as customerCount from retail_salesnew;

--  distinct Category --
select distinct category from retail_salesnew
```
## 3. Data Analysis & Findings
**1.rite a SQL query to retrieve all columns for sales made on '2022-11-05:**
```sql
select * 
from retail_salesnew
where sale_date='2022-11-05'
```
**2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:**
```sql
select *
from retail_salesnew
where category='Clothing'
and quantiy>=4
and month(sale_date)='11'
and year(sale_date)='2022'
```
**3.Write a SQL query to calculate the total sales (total_sale) for each category.:**
```sql
select  category,sum(total_sale) as total_Sales
from retail_salesnew
group by category
```
**4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**
```sql
select round(AVG(Age),2) as avg_age
from retail_salesnew
where category='Beauty'
```
**5. Write a SQL query to find all transactions where the total_sale is greater than 1000.**
```sql
select * 
from retail_salesnew
where total_sale>1000;
```
**6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**
```sql
select gender,Category ,count(transactions_id) as Total_Transaction
from retail_salesnew
group by gender,Category
order by  2
```
**7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**
```sql
with CT_AvgSale as (
select Month(sale_date) as Month,year(sale_date) as year ,AVG(total_sale) as Avg_sales,
RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rk
from retail_salesnew
group by Month(sale_date),year(sale_date)
order by Month(sale_date) asc
)
select year,Month,Avg_sales
from CT_AvgSale
where rk=1
```
**8.Write a SQL query to find the top 5 customers based on the highest total sales**
```sql
 select customer_id,sum(total_sale) as totalSales
from retail_salesnew
 group by customer_id
 order by sum(total_sale) desc
 Limit 5
```
**9. Write a SQL query to find the number of unique customers who purchased items from each category.**
```sql
 select category,count(distinct customer_id) as customer_count
 from retail_salesnew
 group by category
```
**10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**
```sql
SELECT 
  CASE 
    WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS Shift,
  count(transactions_id) as orderCount 
FROM retail_salesnew
group by shift
```
## Findings
**1.Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
**2.High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
**3.Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
**4.Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports
**1.Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
**2.rend Analysis**: Insights into sales trends across different months and shifts.
**3.Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.


