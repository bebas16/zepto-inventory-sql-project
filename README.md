# zepto-inventory-sql-project
SQL-based exploratory data analysis on e-commerce product data focusing on pricing, discounts, inventory, and category insights using PostgreSQL.

## Overview
This project performs exploratory data analysis (EDA) on an e-commerce product dataset using SQL.  
The goal is to analyze pricing, discounts, inventory availability, and category-level performance to derive business insights.

## Dataset
The dataset contains product-level information such as:
- Product name
- Category
- MRP and selling price
- Discount percentage
- Product weight
- Stock availability
- Available quantity

## Key Analysis Performed
- Top discounted products
- High MRP but out-of-stock products
- Category-wise revenue estimation
- Average discount percentage by category
- Price-per-gram analysis to identify best-value products
- Product segmentation by weight (Low / Medium / Bulk)
- Data cleaning and unit conversion (paise to rupees)

## Tools & Technologies
- PostgreSQL
- pgAdmin 4
- SQL

## SQL Concepts Used
- Filtering and sorting
- Aggregate functions
- GROUP BY and HAVING
- CASE statements
- Data cleaning with UPDATE and DELETE

## Project Structure
- `analysis.sql` → All analysis queries
- `data_cleaning.sql` → Queries used for cleaning and transformations
- `schema.sql` → Table structure (if applicable)
- `screenshots/` → Query outputs (optional)

## How to Use
1. Load the dataset into PostgreSQL
2. Run the schema file (if provided)
3. Execute queries from `analysis.sql`

## Key Learnings
- Writing business-focused SQL queries
- Performing exploratory analysis on real-world datasets
- Cleaning and transforming data for analysis
- Deriving insights from raw transactional data
