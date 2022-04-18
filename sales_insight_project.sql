select * from sales.markets;

select * from sales.transactions where market_code = 'Mark001';

select sum(transactions.sales_amount) from sales.transactions where market_code = 'Mark001';

select distinct product_code from sales.transactions where market_code = 'Mark001';


