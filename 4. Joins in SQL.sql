/** 'inner join' in SQL **/

create database sql_joins;

use sql_joins;

show databases;

create table cricket ( cricket_id int auto_increment, name varchar(30), primary key(cricket_id));

create table football ( football_id int auto_increment, name varchar(30), primary key(football_id));

insert into cricket(name) values('Stuart'),('Micheal'),('Johnson'), ('Haydon'), ('Fleming');

select * from cricket;

insert into football(name) values('Stuart'),('Johnson'), ('Haydon'), ('Langer'), ('Astle');

select * from football;

select * from cricket inner join football on cricket.name = football.name;

/* When the names of columns in both the table are same */

select * from cricket
inner join football
using(name);

select c.cricket_id, c.name, f.football_id, f.name
from cricket as c
inner join football as f
on c.name = f.name;

select c.cricket_id, c.name, f.football_id, f.name
from cricket as c 
inner join football as f
using(name);  /** Since 'name' column is same in both the table **/

select name, c.cricket_id, f.football_id, 
sum(c.cricket_id+f.football_id) as sum_of_ids from cricket as c
left join football as f
using(name)
group by name
union
select name, c.cricket_id, f.football_id, 
sum(c.cricket_id+f.football_id) as sum_of_ids from cricket as c
right join football as f
using(name)
group by name
order by name desc;



/** Using classicmodels database **/



use classicmodels;

show tables;

select * from products;

select productLine as Products,
sum(quantityInStock*buyPrice) as Revenue
from products
group by productLine
order by Revenue desc;



select * from productlines;

/** Inner Join of two tables **/

select a.productCode, a.productName, b.textDescription 
from products as a
inner join productlines as b
using(productLine);

/** Inner Join of three tables **/

select * from orderdetails;

/* Joining Three tables together */

select o.orderNumber, o.status, p.productName,
sum(od.quantityOrdered * od.priceEach) as Revenue
from orders as o
inner join orderdetails as od
on o.orderNumber = od.orderNumber
inner join products as p
on od.productCode = p.productCode
group by orderNumber;

/** Left join of two tables **/

select * from customers;
select * from orders;

select c.customerNumber, c.customerName, o.orderNumber, o.status, o.customerNumber
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber;

/** using null operator with left join statement **/

select c.customerNumber, c.customerName, o.orderNumber, o.status
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
where orderNumber is null;

/** Right joins of tables **/

select * from customers;
select * from employees;

select c.customerName, c.phone, e.employeeNumber, e.email
from customers as c
right join employees as e
on e.employeeNumber = c.salesRepEmployeeNumber
order by employeeNumber;

/** Self join of tables **/

select * from employees;

select concat(E.firstName, ' ', E.lastName) as Employee, concat(M.firstName, ' ', M.lastName) as Manager
from employees as E
left join employees as M
on E.reportsTo = M.employeeNumber
order by Manager;


/** full join of tables **/

select * from customers;
select * from orders;

select c.customerName, o.orderNumber
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
union
select c.customerName, o.orderNumber
from customers as c
right join orders as o
on c.customerNumber = o.customerNumber;
