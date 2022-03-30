# String Functions

select upper('India') as upper_case;

select lower('India') as lower_case;

select lcase('INDIA') as lower_case;

select ucase('india') as upper_case;

select character_length('abcdefghijklm nopqrstuvwxyz') length_character_of_english_alphabet;

select name, character_length(name) as char_len from emp_details;

select name, char_length(name) as char_len from emp_details;

select concat("India ", "is " , "in ", "Asia") as merged;

select * from emp_details;

select concat(name,' ', age, ' ',city) as concat_table from emp_details ;

select name, age, concat(name,' ', age) as name_age from emp_details;

select reverse("India") as reverse;

select name, reverse(name) as reverse_name from emp_details;

select replace('Orange is vegetable', 'vegetable', 'fruit') as replace_function;

select length('   Orange is fruit    ');

select ltrim('   Orange is fruit    '); /** It removes the spacing before and after of a word or sentence **/

select length('      ghk         ');

select ltrim('      ghk         ');

select length(ltrim('      ghk         ')); /** Removes all the blank spaces from left and then counts**/

select length(rtrim('      ghk         ')); /** Removes all the blank spaces from right and then counts**/

select length(trim('      ghk         ')); /** Removes all the blank spaces from left & right and then counts**/

select position("fruit" in "Orange is a fruit") as place_value; /** To find the place value of a string in another string **/

select ascii('a');

select ascii('1');
