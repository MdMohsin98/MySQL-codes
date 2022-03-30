use classicmodels;

select * from customers;

# Creating 'view' table

create view cust_details
as 
select customerName, phone, city
from customers;

select * from cust_details;

# Creating 'view' table using joins

select * from products;
select * from productlines;

create view product_description
as select productName, quantityInStock, msrp, textDescription
from products as p
inner join productlines as pl
on p.productLine = pl.productLine;

select * from product_description;

# Renaming the view table

rename table product_description 
to vehicle_description;

select * from vehicle_description;

# Display 'views' tables

show full tables
where table_type = 'VIEW';

# To 'delete' a 'view' table

drop view cust_details;

# 'windows' function

use sql_intro;

select * from employees;

select Emp_name, Age, Dept, sum(Salary) over (partition by dept) as 'Total Salary'
from employees;

# Row number Function

select row_number() over (order by salary) as row_num, Emp_name, Salary 
from employees order by salary; 

create table demo ( st_id int, st_name varchar(20));

insert into demo values ( 101, 'Shane'), (102, 'Bradley'), (103, 'Herath'), (103, 'Herath'),
(104, 'Nathan'), (105, 'Kevin'), (105, 'Kevin');

select * from demo;

select st_id, st_name, 
row_number() over (partition by st_id, st_name order by st_id) as row_num
from demo;

# Rank function

create table demo1(var_a int);

insert into demo1 values (101), (102),(103),(103),(104),(105),(106),(106),(107);

select var_a, rank() over (order by var_a) as test_rank 
from demo1;

# 'first value()' function

select * from employees;

select Emp_name, age, Salary, first_value(Emp_name)
over (order by salary desc) as highest_salary from employees;

select Emp_name, dept, salary, first_value(Emp_name) 
over (partition by dept order by salary desc) as highest_salary
from employees;  