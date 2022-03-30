# Before Insert Trigger

create table student
(st_roll int, age int, name varchar(30), mark float);

delimiter //
create trigger marks_verify
before insert on student
for each row
if new.mark < 0 then set new.mark = 50;
end if ; //

insert into student(st_roll, age, name, mark) 
values(501, 10, 'Ruth', 75.0),
(502, 12, 'Mike', -20.5),
(503, 13, 'Dave', 90.0),
(504, 10, 'Jacobs', -12.5);

select * from student;

/** To delete a trigger **/

# drop trigger marks_verify; /** to delete the trigger **/

