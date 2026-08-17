Project Title: **Retail-Sales-SQL-Analysis**

A SQL-based Retail Sales Analysis project built using PostgreSQL. This project analyzes customer behavior, product performance, sales trends, regional performance, and profitability to uncover business insights that support data-driven decision-making.

The project demonstrates practical SQL skills including data exploration, data cleaning, joins, aggregations, CTEs, subqueries, window functions, ranking, running totals, and month-over-month analysis.

Preview

<img width="459" height="462" alt="7TxCd1yO1ZO1EuowppSI2NM9fvk6bP9Utn9n0GTtJSgeoT6JBNetjcGPQwhvWOFU_fNHzA5VbQrxrRXqAjBVm3wrY_6mVJNueqvKVzgsdZhDokkujbW-A7ljhsYXzl7m6lUR1-8bUk_BshXftPH703c8b04WcYrkATrNK-ja1VmjrB144ih03w-dIKHdgh5n" src="https://github.com/user-attachments/assets/3a2f3938-e351-4eed-9c93-4384ce12d54a" />

<img width="731" height="547" alt="f-PclHxlG-MFneleJwAoJHlefcme3UBG8Xk9-fZhywIARclxyqwTYpUNgai4Z3sAZ1QwvHpPDMXN80aV9cEjS5ecrnqzYm5SRfpaOwNXu8uj4xvEQhvH6lAjoBetm6k9H5rVnVTXZE4umNW2ybY_IEMbqv1FFs5n5RkAvRrrCs7NjCJBvjoZfkcWKs8oSe0z" src="https://github.com/user-attachments/assets/e234e0d6-144d-4080-b3d2-d82578f971be" />


SQL Analysis : The project contains a collection of SQL queries covering sales, customer, product, and advanced business analysis.

## Table of Contents

- [Overview](#overview)  
- [Dataset](#dataset)
- [Database Schema](#database-schema)
- [Technologies Used](#technologies-used)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Analysis & SQL Queries](#analysis--sql-queries)  
- [Conclusion](#conclusion)  
- [Credits](#credits)  
- [License](#license)  

---

## Overview

- **Motivation:** Retail businesses generate large amounts of transactional data, but extracting meaningful insights from this data requires effective data analysis. This project was created to explore retail sales data using SQL and identify patterns in customer behaviour, product performance, revenue, and profitability.
- **Objective:** The main objective of this project is to analyze retail sales data using PostgreSQL and answer practical business questions related to revenue, customers, products, regions, and sales performance.
- **Learning Outcomes:** While building this project, I developed and applied SQL skills including data exploration, data cleaning, joins, aggregations, Common Table Expressions (CTEs), subqueries, window functions, ranking, running totals, customer segmentation, and business-focused analysis.

---

## Dataset

Dataset Information

- Dataset Type: Retail Sales Dataset  
- Customers: 1,200
- Products: 60
- Orders: 7,000
- Order Items: 20,000+
- Time Period: 2024–2025

Tables Included

<img width="661" height="221" alt="Screenshot 2026-08-17 at 12 35 03 PM" src="https://github.com/user-attachments/assets/be5048d5-6a6d-4abb-881e-1553f49357af" />


Data Preparation

The dataset was prepared and structured for PostgreSQL analysis.
The project includes:

- Data-quality checks 
- Duplicate detection
- Missing-value checks
- Invalid price checks
- Invalid quantity checks
- Referential integrity checks
- Revenue calculations
- Profit calculations
---

## Database Schema

The project follows a relational database structure connecting customers, orders, products, and order items.

<img width="319" height="329" alt="Screenshot 2026-08-17 at 12 41 44 PM" src="https://github.com/user-attachments/assets/e371f531-1b08-4bc5-87b5-70f2e5e685f0" />

Key Relationships


- One customer can have multiple orders
- One order can contain multiple products
- One product can appear in multiple orders
- orders connects customers with transactions
- order_items connects orders with products
---

<h2>Technologies Used</h2>

<ul>
  <li><strong>Tools & Platforms:</strong> PostgreSQL, Git, GitHub</li>
  <li><strong>Skills Applied:</strong> Data Cleaning, Data Exploration, Data Analysis, Business Intelligence, SQL Query Development</li>
</ul>

<p>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/CSV-FFB000?style=for-the-badge&logo=filezilla&logoColor=white" alt="CSV">
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
</p>

SQL Concepts Used


- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- CASE WHEN
- Subqueries
- CTEs
- Window Functions
- RANK
- DENSE_RANK
- ROW_NUMBER
- LAG
- NTILE
- Running Totals
- Percentage Calculations
- Date Function
---

## Installation

To explore this project locally:

```bash

# Clone the repository git clone https://github.com/eldinbr/Retail-Sales-SQL-Analysis.git

# Navigate into the project directory cd Retail-Sales-SQL-Analysis


```

Database Setup

1. Create a PostgreSQL database.
2. Run the database schema: (sql/00_schema.sql)
3. Import the CSV files from the data folder.
4. Execute the SQL scripts in numerical order.

## Usage

Instructions for using the project:

1. Download or clone the repository 
2. Create a PostgreSQL database.
3. Create the required tables using 00_schema.sql.
4. Import the CSV datasets.
5. Run the SQL queries.
6. Review the results and business insights.

The project allows users to:

- Analyze overall sales performance
- Identify top-performing products
- Analyze customer purchasing behavior
- Compare regional sales
- Calculate average order value
- Analyze customer retention
- Measure month-over-month revenue growth
- Calculate product revenue contribution
- Rank customers and products
- Analyze gross profit
- Perform RFM-style customer segmentation

---

## Analysis & SQL Queries


**1. Data Exploration**

The initial analysis explores the structure and quality of the dataset.

Examples include:

- Row counts across tables
- Orders by status
- Customers by segment
- Customers by region
- Products by category

**2. Sales Analysis**

The sales analysis focuses on overall business performance.

Key questions include:

- What is the total revenue?
- What is the monthly revenue?
- Which regions generate the highest revenue?
- What is the average order value?
- Which product categories generate the most revenue?

Example:

<img width="591" height="378" alt="Screenshot 2026-08-17 at 1 07 18 PM" src="https://github.com/user-attachments/assets/37e31163-3371-4e45-adb4-3c2b7578f0ea" />

**3. Customer Analysis**

Customer analysis focuses on purchasing behavior and customer value.

Key questions include:

- Who are the top 10 customers?
- What percentage of customers are repeat customers?
- What is customer lifetime revenue?
- Which customers have never completed an order?

The analysis helps identify high-value customers and potential retention opportunities.

**4. Product Analysis**

Product analysis evaluates product-level performance.

Key questions include:

- Which products generate the most revenue?
- What are the top 3 products in each category?
- Which products generate the highest gross profit?
- Which product categories perform best?

Window functions are used to rank products within their categories.

Example:

<img width="252" height="129" alt="Screenshot 2026-08-17 at 1 12 12 PM" src="https://github.com/user-attachments/assets/00865e0f-9394-46a2-a013-e60fce8b1a0c" />

**5. Advanced SQL Analysis**

Advanced SQL techniques are used to answer more complex business questions.

**Month-over-Month Growth**

The LAG() window function is used to compare current revenue against the previous month.

<img width="224" height="97" alt="Screenshot 2026-08-17 at 3 52 19 PM" src="https://github.com/user-attachments/assets/72b0dad7-61ed-4d0e-acf6-9850590c12f8" />

**Running Revenue**

A running total is calculated using:

<img width="233" height="92" alt="Screenshot 2026-08-17 at 3 53 38 PM" src="https://github.com/user-attachments/assets/36c88c05-b54b-4c1c-8c75-17f25091b987" />

**Customer Ranking**

Customers are ranked based on their total revenue using:

<img width="258" height="94" alt="Screenshot 2026-08-17 at 3 54 49 PM" src="https://github.com/user-attachments/assets/ca769145-2e68-4b30-b847-d1cc44b3ac6b" />

**RFM-Style Customer Segmentation**

Customers are evaluated based on:

- Recency – How recently they purchased
- Frequency – How frequently they purchase
- Monetary Value – How much they spend

The NTILE() window function is used to create customer scores.

**Key Insights**

After running the SQL analysis, the following areas can be evaluated:

- Overall revenue performance
- Monthly sales trends
- Highest-performing regions
- Top-performing product categories
- Highest-value customers
- Repeat customer percentage
- Product revenue contribution
- Gross profit performance
- Customer purchasing patterns
- Month-over-month revenue growth

The SQL queries are designed to generate the actual values directly from the database rather than relying on manually entered results.

**Business Value**

The analysis can support business decisions related to:

- Customer Retention: Identify high-value and repeat customers.
- Product Strategy: Identify products and categories generating the most revenue and profit.
- Regional Strategy: Compare sales performance across regions.
- Marketing: Target high-value customer segments.
- Inventory Planning: Prioritize high-performing products.
- Revenue Management: Monitor monthly revenue and growth trends.
- Profitability: Identify products generating the strongest gross profit.





---

## Conclusion 

The Retail Sales SQL Analysis project provides a practical demonstration of how SQL can be used to transform transactional data into meaningful business insights.
Through PostgreSQL and advanced SQL techniques, the project analyzes sales performance, customer behavior, product performance, regional trends, and profitability.
The project demonstrates the ability to move from raw transactional data → SQL analysis → business insights → recommendations, reflecting a practical Data Analyst workflow.

**Recommendations**

- Develop targeted retention strategies for high-value customers.
- Monitor month-over-month revenue trends to identify growth opportunities.
- Prioritize high-performing and high-margin products.
- Investigate regions with weaker sales performance.
- Use customer segmentation to support targeted marketing campaigns.
- Monitor discount levels to ensure they do not negatively impact profitability.

---

## Credits

- **Collaborators:** Eldin 
- **Dataset:** Retail Sales Dataset
- **Database:** PostgreSQL
- **Analysis Tool:** SQL
- **Version Control:** GitHub 

---

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/) – feel free to use and modify it.  

---

<p align="center"><strong>Thanks for visiting! 🚀</strong></p>
