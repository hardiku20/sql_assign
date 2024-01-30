--1. Create a stored procedure in the Northwind database that will calculate the average 
--value of Freight for a specified customer.Then, a business rule will be added that will 
--be triggered before every Update and Insert command in the Orders controller,and 
--will use the stored procedure to verify that the Freight does not exceed the average 
--freight. If it does, a message will be displayed and the command will be cancelled.






--2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Employee Sales by Country
select e.employeeid, e.country, sum((od.unitprice*od.quantity)) as sales

--CREATE PROCEDURE `Employee Sales by Country` (IN AtBeginning_Date DATE, IN AtEnding_Date DATE)
--BEGIN
--SELECT
--Employees.Country,
--Employees.LastName,
--Employees.FirstName,
--Orders.ShippedDate,
--Orders.OrderID,
--Order_Subtotals.Subtotal AS SaleAmount
--FROM Employees
--INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
--INNER JOIN Order_Subtotals ON Orders.OrderID = Order_Subtotals.OrderID
--WHERE Orders.ShippedDate BETWEEN AtBeginning_Date AND AtEnding_Date;
--END


--3. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales by Year
select  YEAR(o.OrderDate), sum((od.unitprice*od.quantity)) as sales

--4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales By Category
select  p.categoryid, sum((od.unitprice*od.quantity)) as sales


--5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Ten Most Expensive Product.
select top 10 unitprice from Products

--6. insert customer order details
create procedure spinsert_customerorderdetails 

--7 update customer order details