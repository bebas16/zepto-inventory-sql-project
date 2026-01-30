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