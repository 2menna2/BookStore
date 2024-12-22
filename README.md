# BikeStore Database Analysis

## Project Overview
This project involves performing data analysis on the **BikeStore Database** using SQL Server Management Studio (SSMS). The analysis aims to extract insights related to the company's operations, sales, customer behavior, and staff performance. Queries will be written to explore data, calculate metrics, and answer specific business questions.

## Instructions
1. **Database Setup**:  
   - Use the attached `.sql` file to load the BikeStore Database into SQL Server.
   - Ensure the database is correctly connected to SSMS before starting the analysis.

2. **Query Execution**:  
   - Execute SQL queries directly in SSMS to answer the provided questions.
   - Follow the hints for calculations where applicable.

3. **Order Status Codes**:  
   - **1**: Pending  
   - **2**: Processing  
   - **3**: Rejected  
   - **4**: Completed  

## Analysis Steps
### A. Explore Data
- Display all data from the tables to understand the structure and relationships within the database.

### B. Analysis Questions
1. Identify the most expensive bike and analyze potential reasons for its high price.
2. Count the total customers and assess whether customers with "Rejected" orders should be included.
3. Determine the number of stores in the BikeStore network.
4. Calculate the total price spent per order using:  
   `total price = [list_price] * [quantity] * (1 - [discount])`
5. Calculate sales/revenue per store:  
   `sales revenue = [list_price] * [quantity] * (1 - [discount])`
6. Identify the most sold product category.
7. Find the category with the most rejected orders.
8. Determine the least sold bike.
9. Retrieve the full name of the customer with ID 259.
10. Retrieve purchase details for customer 259, including the order date and status.
11. Identify the staff member who processed the order for customer 259 and their store.
12. Count the total staff and identify the lead staff.
13. Find the most popular brand.
14. Count the product categories and identify the least popular one.
15. Determine which store has the most stock of the most popular brand.
16. Identify the state with the highest sales.
17. Calculate the discounted price of product ID 259.
18. Retrieve details (name, quantity, price, category, model year, brand) for product number 44.
19. Find the zip code of CA.
20. Count the states where BikeStore operates.
21. Count bikes sold under the "Children" category in the last 8 months.
22. Find the shipped date for the order from customer 523.
23. Count the number of pending orders.
24. Determine the category and brand of the bike "Electra white water 3i - 2018."

## Expected Output
The output will include:
- Insights and metrics derived from SQL queries.
- Supporting data for business decisions based on customer behavior, sales trends, and operational performance.

## Tools and Technologies
- SQL Server Management Studio (SSMS)
- SQL for data querying and analysis

## Notes
- Double-check query results to ensure accuracy.
- Document findings and interpretations of the results for future reference.
