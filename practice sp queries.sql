
SELECT * FROM categories
select * from Products
select * from "orders"
select * from "order details"

select  YEAR(o.OrderDate), sum((od.unitprice*od.quantity)) as sales