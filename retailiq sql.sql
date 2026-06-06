CREATE DATABASE RetailIQ;
USE RetailIQ;


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(200),
    Region VARCHAR(50),
    Quantity INT,
    Sales_Amount DECIMAL(10,2),
    Profit DECIMAL(10,2)
);


INSERT INTO Orders VALUES
(1001,'2025-01-10',101,'Rahul Kumar','Electronics','Laptop','South',2,80000,12000),
(1002,'2025-01-11',102,'Priya Sharma','Furniture','Office Chair','North',3,15000,2500),
(1003,'2025-01-12',103,'Arjun Reddy','Clothing','Jacket','West',5,10000,1800),
(1004,'2025-01-15',101,'Rahul Kumar','Electronics','Mobile','South',2,40000,6000),
(1005,'2025-01-18',104,'Sneha Gupta','Furniture','Table','East',1,12000,2000);



SELECT
SUM(Sales_Amount) AS Total_Revenue
FROM Orders;

SELECT
SUM(Profit) AS Total_Profit
FROM Orders;


SELECT
Product_Category,
SUM(Sales_Amount) AS Revenue
FROM Orders
GROUP BY Product_Category
ORDER BY Revenue DESC;

SELECT
Customer_Name,
SUM(Sales_Amount) AS Total_Spent
FROM Orders
GROUP BY Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT
Region,
SUM(Sales_Amount) AS Revenue,
SUM(Profit) AS Profit
FROM Orders
GROUP BY Region;

DELIMITER //

CREATE PROCEDURE GetCategorySales()
BEGIN
    SELECT
        Product_Category,
        SUM(Sales_Amount) AS Revenue
    FROM Orders
    GROUP BY Product_Category;
END //

DELIMITER ;


CALL GetCategorySales();


CREATE VIEW SalesSummary AS
SELECT
    Region,
    SUM(Sales_Amount) AS Revenue,
    SUM(Profit) AS Profit
FROM Orders
GROUP BY Region;


use RetailIQ;
select * from orders;

