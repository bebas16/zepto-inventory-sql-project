DROP TABLE IF EXISTS ZEPTO;

CREATE TABLE ZEPTO(
	sku_id SERiAL PRIMARY KEY,
	category VARCHAR(120),
	name VARCHAR(150) NOT NULL,
	mrp NUMERIC(8,2),
	discountPercent NUMERIC(5,2),
	availableQuantity INTEGER,
	discountSellingPrice NUMERIC(8,2),
	weightInGrams INTEGER,
	outOfStock BOOLEAN,
	quantity INTEGER
	);

--DATA EXPLORATION

SELECT COUNT(*) FROM ZEPTO;

--SAMPLE DATA

SELECT * FROM ZEPTO
LIMIT 10 ;

--LOOKING FOR NULL VALUES

SELECT * FROM ZEPTO 
WHERE NAME IS NULL
OR 
NAME IS NULL
OR 
MRP is null
OR 
discountPercent is null
OR 
discountSellingPrice is null
OR 
weightInGrams is null
OR 
outOfStock IS NULL
OR
quantity IS NULL;

--DEFFERENT PRODUCT CATEGORIES

SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- IN STOCK AND OUT OF STOCK

SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- 

SELECT name, count(sku_id) as "number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC; 

--data cleaning
SELECT * from zepto 
WHERE mrp = 0 
OR
discountSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--CONVERT PAISE TO RUPEES
UPDATE zepto
SET
  mrp = mrp / 100.00,
  discountSellingPrice = discountsellingprice / 100.00;

  SELECT mrp, discountSellingPrice FROM zepto;


--ANALYSIS 

SELECT * FROM zepto;

--Q1. Find the top 10 best-value products based on the discount percentage.
SELECT name, mrp, discountPercent FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2. What are the Products with High MRP but Out of Stock
SELECT name, mrp FROM zepto 
WHERE  outofstock = TRUE 
ORDER BY MRP DESC;

--Q3. Calculate Estimated Revenue for each category
SELECT category,
SUM(discountSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent 
FROM zepto
WHERE mrp>500 AND discountPercent<10
ORDER BY mrp, discountPercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
AVG(discountpercent) AS avgDiscount
FROM zepto
GROUP BY category
ORDER BY avgDiscount DESC
LIMIT 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
SELECT name, discountsellingprice, weightingrams, 
ROUND(discountsellingprice/weightingrams,2) AS pricePerGram
FROM zepto
WHERE weightingrams >= 100
ORDER BY pricePerGram DESC;

--Q7. Group the products into categories like Low, Medium, Bulk.?
SELECT DISTINCT name, weightInGrams,
CASE WHEN weightInGrams < 1000 THEN 'Low'
	WHEN weightInGrams < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8. What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGrams * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

