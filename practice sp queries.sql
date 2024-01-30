
SELECT * FROM categories
select * from Products
select * from "orders"
select * from "order details"

select  YEAR(o.OrderDate), sum((od.unitprice*od.quantity)) as salesfrom "orders" as Ojoin "order details" as OD on OD.orderid = o.orderidjoin employees as E on O.employeeid = E.employeeidgroup by YEAR(o.OrderDate)select YEAR(orderdate) from ordersselect   sum((od.unitprice*od.quantity)) as salesfrom "products" as  Pjoin "order details" as OD on P.productid= od.productidjoin categories as C on C.categoryid=p.categoryidgroup by od.