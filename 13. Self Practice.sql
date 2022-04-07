select * from emp_details;

select count(Name) as 'Total Employees' 
from emp_details;

select sum(salary) as 'Total Salary'
from emp_details;

select avg(salary) as 'Average Salary'
from emp_details;

select Name, City, Salary from emp_details;

select name, age, sex, doj, salary from emp_details;

select * from emp_details;

select name, city, salary from emp_details
where salary > 50000;

select name, doj, city, Salary 
from emp_details
where doj > '2009-01-01';

select * from emp_details where Sex = 'M';

select * from emp_details where Age > 30;

select * from emp_details where city in ('Chicago', 'New York');

select * from emp_details where age between 30 and 40;

select * from emp_details where age between 30 and 40 
and doj between '2000-01-01' and '2017-01-01';

select sex, sum(Salary) as 'Total Salary' from emp_details 
group by sex;

select * from emp_details 
order by Name asc;

select * from emp_details order by Salary desc;

select 12+13;

select sum(23+ 40);

select 23+40;

select avg(salary) as 'Avg_Salary' from emp_details;

select length('Apple') total_length;
select length('Bhagalpur') as total_length;

select repeat('25 ', 5) end;

select upper('Bihar Patna @ 123 a');

select concat('Mirzachowki ', 'Barahat');

select current_timestamp();

select now();

select curdate();

select current_date();

select current_user();

select year(curtime());

select day(now());

select sex, sum(salary) as 'Total_Salary' 
from emp_details group by sex;


select * from emp_details order by salary;

select * from emp_details order by age desc;

select upper('Bihar');

select lower('MADRAS');

select upper ( 'abc@gmail.com');

select ucase('user1@avcm.com');

select lcase('MADRAS@GAMIL.COM');

select character_length('abcd');

select char_length('a2334klajdf');

select name, char_length(name) as char_len from emp_details;

select concat('India ', 'is ', 'great ') as concatenation;

select concat(name, ' ', age, ' ', city) as name_age_city from emp_details ;

select reverse('India') as reverse;

select reverse('Bhagalpur') as reverse;

select replace('India is great', 'great', 'greatest');

select *, replace(city, 'Seattle', 'M') changing_gender from emp_details; 

select ltrim('        Hey          ');

select rtrim('     You       ');

select length(ltrim('        Hey          '));

select length(rtrim('      You      '));

select length(trim('      You      '));


select position('is' in 'Orange is fruit');

select *, position('York' in city) from emp_details; 

select ascii('a');

select ascii('0');

describe employees;
 
select dept, avg(salary) as avg_salary from employees
group by dept;

select Gender, avg(salary) as avg_salary 
from employees group by Gender;

select distinct dept, avg(salary) as avg_salary from employees
group by dept;

select distinct city from employees;

select distinct dept from employees;

select avg(age) as avg_age from employees;

select dept, avg(age) as avg_age from employees group by dept;

select dept, round(avg(age), 2) as avg_age from employees group by dept;

select dept, sum(salary) as total_salary from employees group by dept;

select city, count(Emp_Id) as total_emp from employees
group by city
order by total_emp desc;

select * from employees;

select year(doj) as Year, count(emp_id) as Total_emp
from employees
group by year
order by total_emp desc, year;

select * from sales;


