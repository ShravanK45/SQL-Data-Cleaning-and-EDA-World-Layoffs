/*==========================================================
PROJECT : World Layoffs Data Cleaning & Exploratory Data Analysis

Author : Shravan Kundap

Tools : MySQL

Description:
This project demonstrates an end-to-end SQL workflow involving
data cleaning, preprocessing, and exploratory data analysis
using the World Layoffs dataset.
==========================================================*/
USE world_layoffs;

SELECT * 
FROM layoffs;

/*==========================================================
STEP 1 : Creating a Working Copy of the Original Dataset
==========================================================*/
CREATE TABLE layoffs_duplicate
LIKE layoffs;

INSERT layoffs_duplicate
SELECT *
FROM layoffs;

/*==========================================================
STEP 2 : Identifying Duplicate Records
==========================================================*/
-- ROW_NUMBER() assigns a unique sequence number to each row
-- Within identical records, making duplicate identification easy.

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,stage,funds_raised,country,`date`) AS row_num
FROM layoffs_duplicate;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,stage,funds_raised,country,`date`) AS row_num
FROM layoffs_duplicate
)
SELECT * 
FROM duplicate_cte
WHERE row_num>1;

-- create another table to delete the duplicates with the column we want to delete the data(row num)
CREATE TABLE `layoffs_duplicate1` (
  `company` text,
  `location` text,
  `total_laid_off` text,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` text,
  `country` text,
  `date_added` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_duplicate1
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,stage,funds_raised,country,`date`) AS row_num
FROM layoffs_duplicate;

SELECT * 
FROM layoffs_duplicate1;

SET SQL_SAFE_UPDATES=0;  #To delete the duplicates from the column turn the safe updates off for this DB

/*==========================================================
STEP 3 : Removing Duplicate Records
==========================================================*/
-- Duplicate rows are deleted while preserving the first occurrence.

DELETE    
FROM layoffs_duplicate1
WHERE row_num>1;

/*==========================================================
STEP 4 : Standardizing Data
==========================================================*/

-- Remove unnecessary spaces
UPDATE layoffs_duplicate1
SET company=TRIM(company);

-- Convert text dates into DATE datatype
-- Prepare the dataset for time-based analysis
SELECT `date`,
str_to_date(`date`,'%m/%d/%Y')
FROM layoffs_duplicate1;

UPDATE layoffs_duplicate1
SET `date`=str_to_date(`date`,'%m/%d/%Y');

SELECT * 
FROM layoffs_duplicate1;

ALTER TABLE layoffs_duplicate1
MODIFY COLUMN `date` DATE;

/*==========================================================
STEP 5 : Handling Missing Values
==========================================================*/

-- Records with both Total Laid Off and Percentage Laid Off missing cannot contribute to analysis and are removed.

SELECT *
FROM layoffs_duplicate1
WHERE 
percentage_laid_off='' 
AND
total_laid_off='';

# if there is tow rows with same company but have industry blank then we can populate the null value by joining the same tables to each other
-- on the value and then updating that value where t1 is null and t2 is not null and set that value to the same as the t2 on te t1
-- so we update the table by using the second row present in the same table

SELECT * 
FROM layoffs_duplicate1
WHERE industry='';

SELECT * 
FROM layoffs_duplicate1
WHERE company='Appsmith';

-- here we cant update the null on the laid off columns as we dont have the required data and we cant just use the other data to fill in the values there

DELETE
FROM layoffs_duplicate1
WHERE 
percentage_laid_off='' 
AND
total_laid_off='';

SELECT * 
FROM layoffs_duplicate1;

ALTER TABLE layoffs_duplicate1
DROP COLUMN row_num;
