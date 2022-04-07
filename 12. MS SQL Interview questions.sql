--Question 26 : Customers with no orders

select * from Customers;

select * from Orders;

select distinct customerid from Customers;

select distinct customerid from orders;

select distinct customerid from Customers
where CustomerID not in (select customerid from Orders);

-- Question 27 : Month end orders

select EmployeeID, OrderID, OrderDate from Orders
where OrderDate = EOMONTH(OrderDate)
order by EmployeeID , OrderID;

--Question 28 : Top 5 countries with highest freight charges in the year 1997

select top 5 shipcountry , avg(freight) as average_freight
from Orders
where YEAR(OrderDate) = 1997
group by ShipCountry
order by average_freight desc;

--Question 29 : Display the total no. of product in each category

select * from Products;

select * from Categories;

select Categoryname, count(*) as total_products
from Products as p
inner join Categories as c 
on p.CategoryID = c.CategoryID
group by CategoryName
order by count(*) desc;

--Question 30 : Find the list of late orders of all the employees;

select * from Employees;

select e.employeeid, e.firstname, count(*) as late_orders
from orders as o
inner join Employees as e
on e.EmployeeID = o.EmployeeID
where RequiredDate <= ShippedDate
group by e.EmployeeID, e.FirstName
order by late_orders desc;

