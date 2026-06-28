/*==========================================================
STEP 6 : Exploratory Data Analysis
==========================================================*/

SELECT MAX(total_laid_off),
       MAX(percentage_laid_off)
FROM layoffs_duplicate1;

/*----------------------------------------------------------
Business Question 1

Which companies laid off the highest number of employees?
----------------------------------------------------------*/
SELECT company,
       SUM(total_laid_off) AS total_layoff
FROM layoffs_duplicate1
GROUP BY company
ORDER BY 2 DESC;

-- Range of the date of the layoffs present in the dataset
SELECT MIN(`date`),
       MAX(`date`)
FROM layoffs_duplicate1;

/*----------------------------------------------------------
Business Question 2

Which industries experienced the largest layoffs?
----------------------------------------------------------*/
SELECT industry,
	   SUM(total_laid_off)
FROM layoffs_duplicate1
GROUP BY industry
ORDER BY 2 DESC;

/*----------------------------------------------------------
Business Question 3

Which countries were affected the most?
----------------------------------------------------------*/
SELECT country,
       SUM(total_laid_off)
FROM layoffs_duplicate1
GROUP BY country
ORDER BY 2 DESC;

/*----------------------------------------------------------
Business Question 4

How did layoffs change year by year?
----------------------------------------------------------*/
SELECT YEAR(`date`),
       SUM(total_laid_off)
FROM layoffs_duplicate1
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

/*----------------------------------------------------------
Business Question 5

Calculate cumulative layoffs over time using a rolling total.
----------------------------------------------------------*/
SELECT substring(`date`,1,7) AS `MONTHS`,
       SUM(total_laid_off)
FROM layoffs_duplicate1
GROUP BY `MONTHS`
ORDER BY 1 ASC;

WITH Monthly_Layoffs AS
(
SELECT substring(`date`,1,7) AS `MONTHS`,
       SUM(total_laid_off) as total_off
FROM layoffs_duplicate1
GROUP BY `MONTHS`
ORDER BY 1 ASC
)
SELECT `MONTHS`, 
        total_off,
         SUM(total_off) OVER ( ORDER BY `MONTHS`) AS rolling_total
FROM Monthly_Layoffs;

/*----------------------------------------------------------
Business Question 6

Rank companies with the highest layoffs every year.
----------------------------------------------------------*/
SELECT company,
	   YEAR(`date`),
	   SUM(total_laid_off)
FROM layoffs_duplicate1
GROUP BY company,YEAR(`date`);

WITH Company_Yearly_Layoffs(company,years,total_laid_off)  AS
(
SELECT company,
       YEAR(`date`),
       SUM(total_laid_off)
FROM layoffs_duplicate1
GROUP BY company,
         YEAR(`date`)
)
SELECT *, 
DENSE_RANK() 
OVER( 
	 PARTITION BY years 
	 ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Yearly_Layoffs
ORDER BY Ranking ASC;

/*==========================================================

PROJECT SUMMARY

The project demonstrates:

✔ Data Cleaning

✔ Duplicate Removal

✔ Data Standardization

✔ Missing Value Handling

✔ Window Functions

✔ Common Table Expressions

✔ Business-Oriented Exploratory Data Analysis

==========================================================*/
