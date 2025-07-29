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
   1.Database Creation: The project starts by creating a database named p1_retail_db.
   2.Table Creation: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category,     quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.
   Create table Retail_Salesnew
               (
				transactions_id INT PRIMARY KEY,
                sale_date	DATE,
                sale_time	TIME,
                customer_id	 INT,
                gender VARCHAR(25),
                age	INT,
                category VARCHAR(30),	
				quantiy	INT,
                price_per_unit	INT,
                cogs	INT,
				total_sale INT

               );
SELECT * FROM ret
