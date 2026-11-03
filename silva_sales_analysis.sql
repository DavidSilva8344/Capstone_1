-- CHOSEN REGION: West (Colorado and Online)--
select*
from store_locations
where state like 'colorado'
;
select *
from online_sales
;
select*
from management;

select *
from store_sales
;
select sum(Sale_Amount)
from store_sales
Where Store_ID between 701 and 718
-- Store Sales = 6,422,632.22
;
select sum(SalesTotal)
from online_sales
-- total revenue from Online Sales = 68,004,827.05
-- total revenue of West Region= 74,427,459.27 from 01-01-2022 to 12-31-2025
;
select sales_year, sum(revenue)
from(
	select year(Transaction_Date) as sales_year, Sale_Amount as revenue
	from store_sales
	Where Store_ID between 701 and 718
	union all
	select year(Date), SalesTotal
    from online_sales
) as combined_sales
	group by sales_year
    order by sales_year
-- revenue by year
;
select sales_month, sales_year, sum(revenue)
from(
	select month(Transaction_Date) as sales_month,
    year(Transaction_Date) as sales_year, Sale_Amount as revenue
	from store_sales
	Where Store_ID between 701 and 718
	union all
	select month(Date), year(Date), SalesTotal
    from online_sales
) as combined_sales
	group by sales_year, sales_month
    order by sales_year, sales_month
-- Revenue By Month
;
select sum(Sale_Amount)
from store_sales
where Store_ID between 701 and 718
;
select sum(SalesTotal)
from online_sales
-- Last two queries are the totals of the distinct territories in the West Region