use  retail
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
SELECT * FROM retail_salesnew        

-- ------------------------------DATA CLEANING------------------

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

--  ---------------------------DATA EXPLORATION ---------------------------------------------------------

--  How many sales or records we have------
select count(*) as total_Count from retail_salesnew

-- How many unique customer we have -----
select count(distinct customer_id) as customerCount from retail_salesnew;

--  distinct Category --
select distinct category from retail_salesnew

-- ---------------DATA ANALYSIS AND BUSINESS KEY PROBLEMS AND ANSWER--------------------------------------------  

-- 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select * 
from retail_salesnew
where sale_date='2022-11-05'

-- 2.Write a SQL query to retrieve all transactions where the category is 'Clothing' 
-- and the quantity sold is more than 4 in the month of Nov-2022:

select *
from retail_salesnew
where category='Clothing'
and quantiy>=4
and month(sale_date)='11'
and year(sale_date)='2022'

-- 3.Write a SQL query to calculate the total sales (total_sale) for each category.:
select  category,sum(total_sale) as total_Sales
from retail_salesnew
group by category

-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select round(AVG(Age),2) as avg_age
from retail_salesnew
where category='Beauty'

-- 5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:

select * 
from retail_salesnew
where total_sale>1000;

-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select gender,Category ,count(transactions_id) as Total_Transaction
from retail_salesnew
group by gender,Category
order by  2

-- 7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

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
       
 -- 8.**Write a SQL query to find the top 5 customers based on the highest total sales **:
 
 select customer_id,sum(total_sale) as totalSales
from retail_salesnew
 group by customer_id
 order by sum(total_sale) desc
 Limit 5
 
 -- 9. Write a SQL query to find the number of unique customers who purchased items from each category.:
 select category,count(distinct customer_id) as customer_count
 from retail_salesnew
 group by category
 
 -- 10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
 
SELECT 
  CASE 
    WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS Shift,
  count(transactions_id) as orderCount 
FROM retail_salesnew
group by shift

