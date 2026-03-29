-- create database
create database zepto;

-- use data base
use zepto;

-- table cretaed
create table sales_2 (
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

-- number of rows
select count(*) from sales_2;

-- sample data
select * from sales_2
limit 10;

-- null value
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- all prodcut category
select distinct category
from sales_2
order by category;

-- convert paise to rupees
UPDATE sales_2
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

-- data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name ,mrp ,discountPercent
from sales_2
order by discountPercent desc 
limit 10;

-- Q2.What are the Products with High MRP but Out of Stock
select distinct name ,mrp ,outOfStock
from sales_2
where outOfStock = 'True' and mrp > 300
order by mrp desc
limit 10;

-- Q3.Calculate Estimated Revenue for each category
select category ,
sum(discountedSellingPrice*availableQuantity) as revenue
from sales_2
group by category
order by revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name ,mrp ,discountPercent
from sales_2
where mrp > 500 and discountPercent < 10
order by mrp desc , discountPercent  desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select 
category ,
round(avg(discountPercent),1) as avg_discount_percentage
from sales_2
group by category
order by avg_discount_percentage desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select 
distinct name ,mrp ,discountedSellingPrice ,
round(weightInGms/discountedSellingPrice,1) as per_gram_price
from sales_2
where weightInGms >= 100
order by per_gram_price;

-- Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name ,weightInGms ,
case 
when weightInGms < 1000 then 'low'
when weightInGms < 5000 then 'medium'
else 'high'
end as weith_group
from sales_2;

-- Q8.What is the Total Inventory Weight Per Category 
select 
category ,
sum(weightInGms * availableQuantity) as total_inventory
from sales_2
group by category
order by total_inventory desc;













