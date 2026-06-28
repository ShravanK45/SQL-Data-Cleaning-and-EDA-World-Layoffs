# 🌍 World Layoffs Data Cleaning & Exploratory Data Analysis using MYSQL

## 📑 Table of Contents

- Project Overview
- Business Problem
- Dataset
- Tools Used
- Data Cleaning
- Exploratory Data Analysis
- SQL Concepts
- Key Insights
- Results & Screenshots
- Repository Structure
- Future Improvements
- Key Learnings
  

# 📌 Project Overview

This project demonstrates an end-to-end SQL workflow for cleaning, transforming, and analyzing the **World Layoffs Dataset** using **MySQL**.

The objective was to convert raw, inconsistent data into an analysis-ready dataset and answer meaningful business questions using SQL. The project covers the complete analytics pipeline—from data cleaning to exploratory data analysis (EDA)—using industry-standard SQL techniques.

---

# 🎯 Business Problem

Companies, investors, and analysts often need to understand workforce reduction trends across industries, countries, and time periods.

However, raw datasets usually contain:

- Duplicate records
- Missing values
- Inconsistent formatting
- Incorrect data types

The goal of this project is to clean the dataset and uncover actionable insights regarding global layoffs.

---

# 📂 Dataset

**Dataset:** World Layoffs Dataset

The dataset contains information about layoffs across various companies worldwide.

### Features

- Company
- Industry
- Country
- Location
- Total Laid Off
- Percentage Laid Off
- Funding Stage
- Funds Raised
- Date

---

# 🛠️ Tools Used

- MySQL
- MySQL Workbench
- SQL

---

# 🧹 Data Cleaning Process

The following cleaning operations were performed:

- Created a working copy of the original dataset
- Identified duplicate records using `ROW_NUMBER()`
- Removed duplicate entries
- Standardized company names using `TRIM()`
- Converted text dates into SQL `DATE` datatype
- Handled missing and blank values
- Removed invalid records with insufficient data
- Dropped unnecessary helper columns
- Prepared the dataset for analysis

---

# 📊 Exploratory Data Analysis

The following business questions were answered:

### 1. Which companies laid off the highest number of employees?

### 2. Which industries were impacted the most?

### 3. Which countries experienced the largest layoffs?

### 4. Which year recorded the highest layoffs?

### 5. What are the monthly layoff trends?

### 6. What is the cumulative (rolling) monthly layoff total?

### 7. Which companies ranked highest in layoffs every year?

---

## 🧠 SQL Concepts Demonstrated

### Data Cleaning

- TRIM()
- STR_TO_DATE()
- ALTER TABLE
- UPDATE
- DELETE

### Querying

- GROUP BY
- ORDER BY
- Aggregate Functions

### Advanced SQL

- Common Table Expressions (CTEs)
- ROW_NUMBER()
- DENSE_RANK()
- Window Functions
- PARTITION BY
- Rolling Aggregations

---

# 📈 Key Insights

- The Technology sector experienced significant workforce reductions.
- A small number of companies accounted for a large percentage of total layoffs.
- Big Tech companies like Oracle,Google,Amazon,Microsoft had higher layoffs than majority of the companies.
- Certain countries like USA,India experienced considerably higher layoffs than others.
- Layoffs peaked during specific years, highlighting periods of significant workforce reductions across industries.
- Monthly rolling analysis highlighted periods of accelerated workforce reductions.
- Ranking companies by year provided a clearer picture of industry-wide workforce changes.

---

# 📷 Results & Screenshots

### Dataset Preview

![Dataset_Preview](Screenshots/01_dataset_preview.png)


---

### Duplicate Detection

![duplicate_detection](Screenshots/02_duplicate_detection.png)

---

### Data Cleaning Process

![Data_Cleaning](Screenshots/03_data_cleaning.png)

---

### Top Companies by Layoffs

![Top Companies](Screenshots/04_top_companies.png)

---

### Industry-wise Layoffs

![Industry Analysis](Screenshots/05_industry_analysis.png)

---

### Country-wise Layoffs

![Country Analysis](Screenshots/06_country_analysis.png)

---

### Monthly Rolling Layoffs

![Rolling Total](Screenshots/07_rolling_total.png)

---

### Company Ranking using DENSE_RANK()

![Ranking_Company](Screenshots/08_company_ranking.png)

---

# 📁 Repository Structure

```text
SQL-Data-Cleaning-and-EDA-World-Layoffs
│
├── README.md
├── LICENSE
│
├── Dataset
│   └── world_layoffs.csv
│
├── SQL Scripts
│   ├── 01_Data_Cleaning.sql
│   └── 02_Exploratory_Data_Analysis.sql
│
├── Screenshots
│   ├── 01_dataset_preview.png
│   ├── 02_duplicate_detection.png
│   ├── 03_data_cleaning.png
│   ├── 04_top_companies.png
│   ├── 05_industry_analysis.png
│   ├── 06_country_analysis.png
│   ├── 07_rolling_total.png
│   └── 08_company_ranking.png
```
# 🚀 Future Improvements

- Build an interactive Power BI dashboard
- Perform advanced trend analysis
- Create an automated reporting dashboard
- Develop predictive models using Machine Learning
- Build an end-to-end analytics pipeline using SQL + Python + Power BI

---

# 💡 Key Learnings

Through this project, I strengthened my understanding of:

- SQL Data Cleaning
- Exploratory Data Analysis (EDA)
- Window Functions
- Common Table Expressions (CTEs)
- Business-Oriented SQL Queries
- Query Optimization and Data Preparation

---

# 👨‍💻 Author

**Shravan Kundap**

### Connect with me

- LinkedIn: https://www.linkedin.com/in/shravan-kundap-803a97292
- GitHub: https://github.com/ShravanK45

---

⭐ If you found this project interesting, consider giving it a star!
