show databases;

use world;

show tables;

select * from city;

describe city;

create database sql_intro;

show databases;

use sql_intro;

create table emp_details (Name varchar(25), Age int, Sex char(1), doj date, City varchar(15),
Salary float);

describe emp_details;

insert into emp_details
values("Jimmy", 35, "M", "2005-05-30", "Chicago", 70000),
("Shane", 30, "M", "1999-06-25", "Seattle", 55000),
("Marry", 28, "F", "2009-03-10", "Boston", 62000),
("Dwayne", 37, "M", "2011-07-12", "Austin", 57000),
("Sara", 32, "F", "2017-10-27", "New York", 72000),
("Ammy", 35, "F", "2014-12-20", "Seattle", 80000);

select * from emp_details;

select distinct city from emp_details;

select count(Name) from emp_details;

select count(Name) as "Total Employees" from emp_details;

select sum(salary) as "Total Salary " from emp_details;

select avg(salary) as "Average Salary " from emp_details;

select name, salary from emp_details;

select name, age, city from emp_details;

select name,age from emp_details where age>30;

select * from emp_details where age > 30;

select name, sex, city from emp_details where Sex = "F";

select * from emp_details where City = "Chicago"  or City = "Boston";

select * from emp_details where City = "Chicago"  or City = "Austin";

select * from emp_details where city in ('Chicago' , 'Austin');

select * from emp_details;

select * from emp_details where doj between '2000-01-01' and '201-01-01';

select * from emp_details where Salary between 55000 and 65000;

select * from emp_details where doj between '2000-01-01' and '2010-12-31';

select * from emp_details
where age > 30 and Sex = 'M';

select sex, sum(Salary) as total_salary from emp_details
group by Sex;

select * from emp_details order by name ASC;

select * from emp_details order by city desc;

select * from emp_details order by Salary;

select * from emp_details order by Salary desc;

/** Basic Mathematical Operations **/

select (10+20) as total;

select (10*2) as multiply;

select (10-20) as subtraction;

select length('Kashmeer') length_char;

select repeat('@', 5);

select upper('bihar');

select lower('INDIA');

select current_timestamp();

select current_date();

select current_time();

select current_user();

select day(curdate());

select now();



select sex, sum(salary) as 'Total Salary' from emp_details 
group by sex;

select * from emp_details order by salary;

select * from emp_details order by salary desc;

select * from emp_details order by name desc;