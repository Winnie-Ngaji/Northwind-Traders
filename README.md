# Northwind-Traders
# Sales and Operational Analysis
## by Winnie Ngaji
![](images/NW_Logo.png)  
___
# INTRODUCTION
This project involves an in-depth analysis of the sales and order data from Northwind Traders, a fictional gourmet food supplier specializing in the import and export of unique food products from various countries. The dataset contains information on customers, products, orders, shippers, and employees, giving details on the operational dynamics of Northwind Traders. Through this analysis, I aim to derive valuable insights into the company's business trends and customer interactions, contributing to a better understanding of its market presence and operational performance.
___
# PROJECT OBJECTIVES
I will be using the provided dataset to understand customer spending patterns and make changes to the companies' sales and operational strategies to improve performance. Specifically, I aim to achieve the following goals:

1. Are there any noticeable sales trends over time?
2. Which are the best and worst-selling products?
3. Can you identify any key customers?
4. Are shipping costs consistent across providers?
5. Assess the sales contributions of individual employees
6. Investigate products that have been discontinued but are still being ordered
7. Explore the shipping interval from the order date
___
# SKILLS DEMONSTRATED
For this project, I used the following skills and tools;
  ### EXCEL: I leveraged Excel for data cleaning; removing duplicate values, correcting formatting issues, handling missing data through imputation or deletion, and standardizing data formats for consistency, and transformation to ensure data quality.
  
  ### SQL: After cleaning and transforming my data on Excel, I created tables and imported the dataset into Postgresql for further analysis. I Utilized SQL queries to extract relevant information from the Northwind Traders database for in-depth analysis. I also integrated data from multiple tables using SQL join operations to establish meaningful relationships between different datasets.
![](images/sql_code.png)    
  
  ### Power BI: After loading the dataset into Power BI, I used measures and DAX to aggregate the necessary data I needed. I also created an interactive dashboard to answer the business questions stated in the project objective section
___
# DATA TRANSFORMATION
After importing the data to Power BI, I did some transformations to add a date table for efficient time analysis. 
![](images/Calendar_table.PNG)   

___
# DATA MODELLING
I have 8 tables and loading the dataset into Power BI creates an automatic model, but I will be making adjustments to the auto model created by Power BI by changing the 'cross-filter direction' to 'Both' to allow more dynamic filtering. This model can be seen in the schema below
![](images/Data_Model.PNG)   

___

# ANALYSIS AND VISUALIZATION
This report contains 2 pages/ dashboard
## SALES DASHBOARD
  This gives an overview and general information on sales like Total orders, Average order value, total customers, sales trends, best-selling products, top spending customers, etc.
![](images/Northwind_sales_analysis_dashboard.PNG)   

## OPERATIONAL ANALYSIS DASHBOARD
This gives an overview and general information on Operations like Average shipping time, Number of orders handled by the top 5 employees, the impact of discontinued products, etc.
![](images/Northwind_operational_analysis_dashboard.PNG)  

## LINK TO DASHBOARD ::: [Northwind Traders Dashboard](https://github.com/Winnie-Ngaji/Northwind-Traders/blob/580a122da57c0a3db695baba9b1d2d87705ffa96/Winnie's_NorthWind_Traders_Sales_Dashboard.pbix)   

## BUSINESS QUESTIONS AND INSIGHTS
### Are there any noticeable sales trends over the years?
![](images/Sales_trend.PNG)   
  * We can see a steady increase from 2013 to 2014 which is the best year with over $600K in sales, but since then, sales started declining.
  * April emerged as the standout month, commanding $176,831.635 in sales, while June, conversely, was the worst selling month
    
### 2013 Sales Trend
![](images/2013_Sales_Trend.PNG)   

### 2014 Sales Trend
![](images/2014_Sales_Trend.PNG)   

### 2015 Sales Trend
![](images/2015_Sales_Trend.PNG)

### Which are the best and worst-selling products?
![](images/Best_Selling_Products.PNG)   
* The top 5 selling products include Cote de Blaye($141k), Thuringer Rostbratwurst($80k), Raclette Courdavault($71k), Tarte au sucre($47k) and Camembert Perrot($47k).
  
![](images/Worst_Selling_Products.PNG)   
* Chocolade performed suboptimally, generating $1,368.71 in sales.

### Can you identify any key customers?
![](images/Key_Customers.PNG)   
* QUICK Stop emerged as a pivotal customer, contributing significantly with a noteworthy $110,277 in purchases.
* We had 91 customers across 21 different countries of the world with our top 5 sales coming from the USA with $252k, Germany with $242k, Austria with $132k, Brazil with $111k, and France with $88k. 

### Are shipping costs consistent across providers?
![](images/Shipping_Cost_by_Shipping_Company.PNG)   
* Shipping costs varied between the 3 shipping companies; United Package costs $86, Federal Shipping costs $80 while Speedy Express charges $65 on average

### Assess the sales contributions of individual employees
![](images/Number_of_Orders_Handled_by_top_5_Employees.PNG)   
* The employee with the most sales was Margaret Peacock with sales worth $232k and overseeing 420 orders.

### Investigate products that have been discontinued but are still being ordered
![](images/Impact_of_Discontinued_Products_on_Sales.PNG)    
* Despite being discontinued, Thuringer Rostbratwurst generated a substantial $80,368.67 in revenue, suggesting latent market demand.

### Explore the shipping interval from the order date
![](images/Total_Orders_by_Shipping_Time.PNG)    
* The average shipping time stood at a commendable 8 days. However, notable outliers, where orders surpassed 30 days for delivery, warrant attention for potential operational enhancements.

___
# RECOMMENDATION AND CONCLUSION
