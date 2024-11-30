# Amazon Sales (Data Engineering Project)

## Project Overview
This project focuses on designing, building, and analyzing a data architecture for a sales-based dataset. We started with the database design in SQL Server, followed by data analysis in SQL, exploratory data analysis (EDA) and forecasting in Python, and ultimately data warehousing in Azure Synapse Analytics.[`project presentation.pptx`](https://github.com/AhmedAboelkasem/Amazon-Sales/blob/main/Final%20project%20presentation.pptx)

## Project Steps

### 1. Database Design and ERD Modeling
   - Designed the Entity-Relationship Diagram (ERD) to visually map out the database structure and relationships.
   - **ERD Image**: <img src="https://github.com/AhmedAboelkasem/Amazon-Sales/blob/main/ERD%20image.png?raw=true">
   - Created a relational database in SQL Server.[`AmazonSales_backup.bak`](https://github.com/AhmedAboelkasem/Amazon-Sales/blob/main/AmazonSales.bak)

     
### 2. Data Analysis in SQL
   - Conducted analysis using SQL queries on the raw data to gain initial insights into sales patterns, trends, and customer behavior.[`AmazonSales_SQL Analysis`](https://github.com/Mariam-elkenany/Amazon-Sales/blob/main/final%20SQL%20queries.sql)



### 3. Exploratory Data Analysis (EDA) and Sales Forecasting in Python
   - Performed EDA on the dataset to understand distributions, correlations, and data quality.
   - Built a sales forecasting model in Python to predict future sales trends based on historical data.[`Amazon Sales EDA and Forecast`](https://github.com/Mariam-elkenany/Amazon-Sales/blob/main/E-Commerce%20Sales%20Forecast.ipynb)


### 4. Data Warehousing and ETL with Snowflake Schema
   - Designed and implemented a data warehouse using the Snowflake schema model.
   - **DWH Image** : <img src="https://github.com/AhmedAboelkasem/Amazon-Sales/blob/main/QuickDBD-Amazon%20Sales%20DB.png?raw=true">
   - Developed an ETL pipeline in Python to extract data from SQL Server, perform necessary transformations, and load the processed data as CSV files.[`Amazon Sales ETL`](https://github.com/Mariam-elkenany/Amazon-Sales/blob/main/files%20preparation%20_%20ETL.ipynb)


### 5. Loading Data into Azure Synapse Analytics
   - Loaded CSV files into the dedicated SQL pool in Microsoft Azure, setting up a scalable environment for reporting, analytics, and future integrations.[`Final project presentation.pptx`](https://github.com/AhmedAboelkasem/Amazon-Sales/blob/main/Final%20project%20presentation.pptx)

