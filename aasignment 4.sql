--1. Create a stored procedure in the Northwind database that will calculate the average 
--value of Freight for a specified customer.Then, a business rule will be added that will 
--be triggered before every Update and Insert command in the Orders controller,and 
--will use the stored procedure to verify that the Freight does not exceed the average 
--freight. If it does, a message will be displayed and the command will be cancelled.






--2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Employee Sales by Country
select e.employeeid, e.country, sum((od.unitprice*od.quantity)) as salesfrom "orders" as Ojoin "order details" as OD on OD.orderid = o.orderidjoin employees as E on O.employeeid = E.employeeidgroup by e.employeeid, e.country

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
select  YEAR(o.OrderDate), sum((od.unitprice*od.quantity)) as salesfrom "orders" as Ojoin "order details" as OD on OD.orderid = o.orderidjoin employees as E on O.employeeid = E.employeeidgroup by YEAR(o.OrderDate)

--4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Sales By Category
select  p.categoryid, sum((od.unitprice*od.quantity)) as salesfrom "products" as  Pjoin "order details" as OD on P.productid= od.productidjoin categories as C on C.categoryid=p.categoryidgroup by p.categoryid


--5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
--Ten Most Expensive Product.
select top 10 unitprice from Productsorder by UnitPrice desc

--6. insert customer order details
create procedure spinsert_customerorderdetails @OrderID INT  ,@ProductID INT  ,@UnitPrice MONEY ,@Quantity SMALLINT ,@Discount REALASBEGIN set identity_insert "Orders" on INSERT INTO "Order Details" VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)END

--7 update customer order details