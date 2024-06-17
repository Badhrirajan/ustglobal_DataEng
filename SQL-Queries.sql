--SELECT * FROM sales.customers

--select first_name,last_name,email from sales.customers

--select first_name + ' ' + last_name "Fullname" from sales.customers

--select s.email from sales.customers as s

/* Sorting of Data
- Order by Clause
- Order it in ascending
- Order it in descending



select first_name,last_name,city,zip_code 
from sales.customers
order by first_name desc, last_name desc

select first_name,last_name,zip_code
from sales.customers
order by zip_code, first_name desc



Where clause filters
Relational Operatos like(==,!=,>,<,<=,>=)
In, not in,
Is null, is not null
like(%,_)
Logical operator like (AND,Or,Not)
Between, not Between


--Filtering : Where Clause

--select * from sales.customers where zip_code = '12010'

--select * from sales.customers where zip_code != '12010' order by zip_code

--select * from production.stocks where quantity >= 20 order by quantity;

select * from production.stocks where 
quantity <= 20 and quantity > 0 and store_id = 1
order by quantity


select state,first_name from sales.customers where 
state= 'CA' or state = 'NY'

For Getting Unique value
select distinct state from sales.customers


select state, first_name from sales.customers where
city = 'Apple Valley' or (state != 'CA' and state != 'NY')


select state, first_name,city from sales.customers
where state not in ('CA','NY')

select * from sales.customers where phone is null

select * from sales.customers where first_name like 'An%' --For first name starting with An


select * from sales.customers where last_name like '%A' -- Name ending with A

select * from sales.customers where first_name like '%St%' -- For searching in middle of the name


select * from sales.customers where first_name like '____St%'


select * from sales.customers where first_name like 'Er__St'

select * from production.products
where model_year between 2016 and 2018
/* Aggregation and filtering: Group By and Having Clause */

/* Group Function */

--select count(*) from production.products

--select count(*) from sales.customers

--select count(phone), count(*) from sales.customers

--select count(model_year), count(distinct model_year) from production.products

--select count(*) as TotalNumber ,max(list_price) as Maximum,min(list_price) as Minimum, avg(list_price) as average 
--from production.products where model_year = 2019


--select count(*) as total, max(list_price) as maximum, min(list_price) as minimum, avg(list_price) as average from production.products
--group by model_year

/*
select model_year, count(model_year) "no of products", sum(list_price) "total price", avg(list_price) as "Average Price"
from production.products
group by model_year
having count(model_year) > 50


select product_name,model_year,list_price,
avg(list_price) over (partition by model_year) as "avgprice",
list_price - avg(list_price) over (partition by model_year) as "difference"
from production.products
having avg(list_price) > 750

--select format(8999963947, '###-###-####')
/*
select list_price,
format(list_price, N'C', N'en-In') from production.products

select format(Getdate(),'yyyy-MMM-dd')

select * from production.products

select upper(category_name),left(category_name,5), len(category_name), right(category_name,5) from production.categories



update production.categories
set category_name = trim(category_name)

select category_name, patindex('%BI_y%',category_name) from production.categories


select category_name, replace(category_name,'Bikes','MoterBikes'),
reverse(category_name)
from production.categories
*/

/*
select list_price, len(list_price), str(list_price)
from production.products

select substring(product_name,5,10) from production.products


select CURRENT_TIMESTAMP, GETDATE()

select YEAR(Getdate()),Month(GETDATE()),DAY(GETDATE())

select dateadd(year,2,getdate()) "2 year after current date",
dateadd(year,-2,getdate()) "2 years before current date"

select dateadd(MONTH,2,getdate()) "2 mon after current date",
dateadd(MONTH,-2,getdate()) "2 mon before current date"

--DAY,WEEK,HOUR,MINUTE,SECOND,MILLISECOND

Select * from dbo.emp

select hiredate, 
DATEDIFF(YEAR,hiredate,format(GETDATE(),'yyyy-mm-dd')),
DATEDIFF(MONTH,hiredate,format(GETDATE(),'yyyy-mm-dd')),
Datename(Month,hiredate),
Datename(Weekday,hiredate)
from emp

select ISDATE('2021-11-23')

select ISDATE('2021-11-23'), SYSDATETIME(),GETDATE()

select * from emp

select sal, comm, round(sal,0) from emp

select list_price, round(list_price,0), 
CEILING(list_price),
floor(list_price),
abs(-10)
from production.products

select rand(10)
*/