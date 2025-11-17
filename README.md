# Exploratory_data_analysis_using_sql
This repository contains a full Exploratory Data Analysis (EDA) of the E-Commerce Sales Report dataset downloaded from Kaggle. The project demonstrates SQL-based data analysis, data cleaning, grouping, filtering, visualization preparation, performance tuning, and creation of reusable database views.
The dataset contains SKU-level inventory details including:

SKU Code

Design Number

Stock

Category

Size

Color

This analysis helps identify:

Category-wise sales distribution

Stock availability patterns

Color and size-wise trends

Design-level performance

Insights for restocking & forecasting

🧪 SQL EDA Coverage
✔ 1. Basic Data Exploration

Preview top/bottom rows

Detect missing values

Check dataset statistics

✔ 2. Filtering, Sorting, Grouping

SELECT, WHERE, ORDER BY, GROUP BY

Stock distribution

Category performance

✔ 3. Aggregation & Metrics

Total stock

Average stock per category

Color-wise summary

✔ 4. Joins (INNER, LEFT, RIGHT)

SKU master joins

Category mapping

✔ 5. Subqueries

Above-average stock

Top category extraction

Color-based stock filters

✔ 6. Views for Reusable Analytics

Stock per design

Summary views for dashboards

✔ 7. Performance Optimization

Indexing on common search columns

Query tuning practices

📊 Example Insights

Which categories have the highest stock?

What is the most common color & size combination?

Which design numbers require restocking?

Stock distribution across SKUs

These insights can be built into a Power BI / Tableau dashboard.

🚀 How To Use This Repository
✔ Step 1: Clone the repository
git clone https://github.com/yourusername/E-Commerce-Sales-SQL-Analysis.git
✔ Step 2: Add the dataset

Place your sales_report.csv inside the data/ folder.

✔ Step 3: Import into your database

Use Oracle / PostgreSQL / MySQL depending on your SQL engine.

✔ Step 4: Run SQL scripts

Execute SQL files inside the sql/ folder in order.

📌 Project Goals

Showcase SQL proficiency

Build a structured EDA pipeline

Prepare a portfolio-ready data analysis project

Create reusable SQL views and optimized queries
