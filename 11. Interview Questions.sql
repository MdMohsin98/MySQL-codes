# Find the lowest salary of each department
 select * from employees;
 
 select dept, min(Salary) as lowest_Salary from employees
 group by dept;
 
 # Find unique department with its length
 
select distinct dept from employees;

select distinct dept , length(dept) as total_length from employees; 


# datediff function

select datediff(now(), '2004-01-13');

select datediff('2021-04-10', '2021-03-30');

# An sql query to

select dept, count(Emp_name) as total_employees
from employees
group by dept
having total_employees >2;

# Question 9

select * from employees where dept <> 'Marketing';

# or

select * from employees where dept != 'Marketing';

# Question 10

select * from employees 
where Doj < '2010-03-31' and doj > '2005-05-31';

# Question 11

select * from ( select * from employees order by Salary desc limit 3) as T
order by Salary asc limit 1;

# Question 12 printing alternate records of a table 

select * from employees where (Emp_Id%2 = 1);

#or

with CTE as 
(
	select * , row_number() over (order by emp_id) as rn
    from employees 
)
select * from cte where rn % 2 = 1;    


create table dup_employees (e_id int, name varchar(30), age int);

insert into dup_employees values
(101, 'Sam', 40), 
(102, 'Tom', 35), 
(103, 'Mary', 28),
(101, 'Sam', 40), 
(103, 'Mary', 30);  

select * from dup_employees;

# Question 13 Finding Duplicate Records

select e_id, name, age, count(*) as dup_count from dup_employees
group by e_id, name, age
having count(e_id) > 1  and count(name) > 1 and count(age) > 1;

# Question 14 finding 2 'a' in names

select * from employees;

select length(replace(upper(Emp_Name), 'A', '')) from employees;

select * from employees 
where length(Emp_Name) - length(replace(upper(Emp_Name), 'A', '')) = 2;
 
# Question 15 Extracting Strings from a character

select substr('Michael Ballack', 2, 4);

select substring('Micheal Ballack', 4, 4);

# Question 16 Self Joins of tables

create table Emp_Manager 
(Emp_id int primary key, Emp_name varchar(30), Salary float, Manager_id int);

insert into Emp_Manager values
(1, 'Garry', 11000, 3),
(2, 'Gibbs', 10000, 1),
(3, 'Smith', 19000, 4),
(4, 'Lanthum', 25000, Null),
(5, 'Jimmy', 12000, 3);

select * from Emp_Manager;

select E.Emp_name as Employee, M.Emp_name as Manager
from Emp_Manager as E
left join Emp_Manager as M
on M.Emp_id = E.Manager_id;

# Question 18 : How the find the same salary of employees of a table

select distinct e.Emp_Id, e.Emp_Name, e.Salary
from employees as e, employees as e1
where e.Salary = e1.Salary and e.Emp_id <> e1.Emp_id;

# Question 19 : Printing one row twice of a table

select e.Emp_Id, e.Emp_Name, e.Dept, e.Salary
from employees as e
where e.Dept = 'HR'
union all
select e.Emp_Id, e.Emp_Name, e.Dept, e.Salary
from employees as e
where e.Dept = 'HR';

# Question 20 : Using 'case' statement

select * from num;

create table num (n_id int);

insert into num values(0), (3), (3), (1), (2), (0), (2), (3), (1), (0), (2), (1);

select n_id,
case when n_id = 0 then n_id + 10
when n_id = 1 then n_id + 20
else n_id
end as num_add
from num;

# Question 21 : Using case statement find the sum of positive and negative nos. separately

create table num1 (num_int int);

insert into num1 values(-3), (9), (-2), (1), (0), (-5), (8), (-4), (1);

select * from num1;

select
sum(case when num_int > 0 then num_int else 0 end) as sum_of_positive_nos,
sum(case when num_int < 0 then num_int else 0 end) as sum_of_negative_nos
from num1; 


# Question 24 : Chech Constraint

create table dummy_sql 
( eid int primary key, 
city varchar(30) check (city = 'Mumbai'),
Age int check (Age > 0)); 

insert into dummy_sql values 
(101, 'Mumbai', 10);

select * from dummy_sql;

insert into dummy_sql values 
(102, 'Mumbai', -30);

# Question 25 : Using left join

create table A (id int);
create table B (id int);

insert into A values ( 122), (140), (190), (90), (70);

insert into B values ( 122), (150), (200), (90), (75);

select * from A;
select * from B;

select id from B
left join A
using (id)
where A.id is Null;