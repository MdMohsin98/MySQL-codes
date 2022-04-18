SELECT * FROM sales.date;


select transactions.* , date.year from 
transactions inner join date on transactions.order_date = date.date where date.year = 2020 and date.month_name = 'January';


select sum(transactions.sales_amount) , date.year from 
transactions inner join date on transactions.order_date = date.date where date.year = 2020;


select sum(transactions.sales_amount) , date.year from 
transactions inner join date on transactions.order_date = date.date where date.year = 2018;




select sum(transactions.sales_amount) from 
transactions inner join date on 
transactions.order_date = date.date where date.year = 2020 and date.month_name = 'January';





select sum(transactions.sales_amount) from 
transactions inner join date on 
transactions.order_date = date.date where date.year = 2020 and date.month_name = 'March';




select sum(transactions.sales_amount) from 
transactions inner join date on 
transactions.order_date = date.date 
where date.year = 2020 and transactions.market_code = 'Mark001';





select sum(transactions.sales_amount) from 
transactions inner join date on 
transactions.order_date = date.date 
where date.year = 2020 and transactions.market_code = 'Mark008';