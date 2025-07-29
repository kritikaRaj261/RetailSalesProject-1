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
```
