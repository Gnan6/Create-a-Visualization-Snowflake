--Create an visualisation in Snowflake Snowsight

create database business;
create schema business.target;
-- Create the sales table
CREATE TABLE sales (
    order_id INTEGER,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    quantity INTEGER,
    price FLOAT,
    order_date DATE
);

-- Insert sample data into the sales table
INSERT INTO sales (order_id, product_name, product_category, quantity, price, order_date)
VALUES
    (1, 'Product A', 'Electronics', 10, 50.0, '2023-01-01'),
    (2, 'Product B', 'Clothing', 5, 75.0, '2023-01-02'),
    (3, 'Product C', 'Electronics', 8, 100.0, '2023-01-03'),
    (4, 'Product D', 'Furniture', 3, 150.0, '2023-01-04'),
    (5, 'Product E', 'Clothing', 6, 80.0, '2023-01-05');


INSERT INTO sales (order_id, product_name, product_category, quantity, price, order_date)
VALUES
    (6, 'Product F', 'Electronics', 12, 120.0, '2023-01-06'),
    (7, 'Product G', 'Furniture', 4, 200.0, '2023-01-07'),
    (8, 'Product H', 'Clothing', 7, 90.0, '2023-01-08'),
    (9, 'Product I', 'Electronics', 15, 110.0, '2023-01-09'),
    (10, 'Product J', 'Furniture', 2, 250.0, '2023-01-10'),
    (11, 'Product K', 'Clothing', 9, 70.0, '2023-01-11'),
    (12, 'Product L', 'Electronics', 6, 130.0, '2023-01-12'),
    (13, 'Product M', 'Furniture', 3, 180.0, '2023-01-13'),
    (14, 'Product N', 'Clothing', 8, 85.0, '2023-01-14'),
    (15, 'Product O', 'Electronics', 10, 140.0, '2023-01-15'),
    (16, 'Product P', 'Furniture', 5, 220.0, '2023-01-16'),
    (17, 'Product Q', 'Clothing', 4, 95.0, '2023-01-17'),
    (18, 'Product R', 'Electronics', 7, 150.0, '2023-01-18'),
    (19, 'Product S', 'Furniture', 3, 190.0, '2023-01-19'),
    (20, 'Product T', 'Clothing', 6, 100.0, '2023-01-20');
    


DashBoard creation step:
--------------------------------------------
Go to Projects --> Dashboards -->  create new 
Then execute the below.
--------------------------------------------

    SELECT
    product_category,
    COUNT(*) AS num_orders
FROM
    sales
GROUP BY
    product_category;
	
	
	
------------------------------------------------

SELECT
    order_date,
    SUM(quantity) AS total_quantity,
    SUM(price) AS total_sales_amount
FROM
    sales
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-01-10' -- Specify your desired date range here
GROUP BY
    order_date
ORDER BY
    order_date;
	
--################################################################


SELECT 
    DATE_TRUNC('month', order_date) AS month,
    product_category,
    SUM(quantity * price) AS total_revenue
FROM 
    sales
WHERE 
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    month,
    product_category
ORDER BY 
    month,
    total_revenue DESC;


### Explanation:
- This query aggregates the total revenue by month and product category from the "sales" table.
- It calculates the total revenue by multiplying the quantity and price for each product sold.
- The `DATE_TRUNC` function is used to truncate the `order_date` to the month level.
- The `WHERE` clause filters the data for the specified date range (in this case, for the year 2023).
- The results are grouped by month and product category.
- Finally, the results are ordered by month and total revenue in descending order.

You can use the output of this query to create a dashboard visualizing the total revenue trends over time by product category. For example, you can create line charts or bar charts to visualize the monthly revenue for each product category.
	