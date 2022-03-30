# Subqueries

use sql_intro;

create table employees(Emp_Id int, Emp_Name varchar(30), Age int, Gender char(1), Doj date , Dept varchar(20), 
City varchar(30), Salary int);

insert into employees values
(101, 'Jimmy', 35, 'M', '2005-05-30', 'Sales', 'Chicago', 70000),
(102, 'Shane', 30, 'M', '1999-06-25' , 'Marketing', 'Seattle', 55000),
(103, 'Marry', 28, 'F', '2009-03-10' , 'Product', 'Boston', 62000),
(104, 'Dwayne', 37, 'M', '2011-07-12' , 'Tech', 'Austin', 57000),
(105, 'Sara', 32, 'F', '2017-10-27' , 'Sales', 'New York', 72000),
(106, 'Ammy', 35, 'F', '2014-12-20' , 'IT', 'Seattle', 80000),
(107, 'Jack', 40, 'M', '2012-07-14' , 'Finance', 'Houston', 100000),
(108, 'Angela', 36, 'F', '2007-02-04' , 'Tech', 'New York', 110000),
(109, 'Marcus', 25, 'M', '2010-07-18' , 'HR', 'Boston', 90000),
(110, 'David', 34, 'M', '2009-08-25' , 'Product', 'Miami', 75000),
(111, 'Rose', 28, 'F', '2011-02-27' , 'Tech', 'Chicago', 60000),
(112, 'Sophia', 33, 'F', '2013-09-21' , 'HR', 'Houston', 65000),
(113, 'Amelia', 30, 'F', '2018-10-15' , 'Finance', 'Austin', 55000),
(114, 'Robert', 40, 'M', '2015-12-18' , 'Sales', 'Detroit', 95000),
(115, 'William', 36, 'M', '2016-04-20' , 'IT', 'Chicago', 83000),
(116, 'John', 32, 'M', '2004-08-09' , 'Marketing', 'Miami', 67000),
(117, 'Bella', 29, 'F', '2002-06-11' , 'Tech', 'Detroit', 72000),
(118, 'Maya', 25, 'F', '2018-10-15' , 'IT', 'Houston', 48000),
(119, 'Alice', 37, 'F', '2019-05-28' , 'Product', 'Seattle', 76000),
(120, 'Joseph', 45, 'M', '2016-11-23' , 'Sales', 'Chicago', 115000);


# Subqueries


select * from employees order by Emp_id;

select * from employees 
where Salary > (select avg(salary) from employees);

select Emp_Name, gender, Dept, Salary from employees
where salary > (select salary from employees where Emp_name = 'John');

/** using 'classicmodels' dataset **/

use classicmodels;

select * from orderdetails;
select * from products;

select p.productCode, p.productName, p.msrp
from products as p 
where productCode in (select productCode from orderdetails where priceEach < 100);

# Stored procedure

select * from employees_b;

delimiter &&
create procedure top_employees()
begin
select Emp_name, City, Salary
from employees_b where salary > 60000;
 End &&
 delimiter ;
 
 call top_employees();
 
 # Stored Procedure using 'IN' parameter

delimiter //
create procedure sp_sortBySalary(In var int)
begin
select Emp_Name, Age, Salary from employees_b
order by salary desc limit var;
end //
delimiter ;


call sp_sortBySalary(5);

/** Stored Procedure using 'update' and two times 'in' operator **/

delimiter //
create procedure update_salary(In temp_name varchar(20), In new_salary float)
begin
update employees_b set
salary = new_salary where Emp_name = temp_name;
end //

select * from employees_b;

call update_salary('Marry' , 80000);

/** Stored procedure using 'OUT' parameter **/

delimiter //
create procedure sp_countEmployees(OUT Total_emps int)
begin
select count(Emp_name) into Total_emps from employees_b
where Gender = 'F';
end //
delimiter ;

call sp_countEmployees(@F_emp);
select @F_emp as 'Female Employees';
