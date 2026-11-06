select *
From store_locations
where State like 'New York'
order by StoreId asc
;


select sum(Sale_Amount)
from store_sales
where Store_ID between 840 and 851
-- total sales from 01-01-2022 to 12-31-2025 = 4,330,817.09
;


select sum(Sale_Amount), year(Transaction_Date), month(Transaction_Date)
from store_sales
where Store_ID between 840 and 851
group by year(Transaction_Date), month(Transaction_Date)
-- breaks down revenue by month and year
;


select *
from management
-- conneticut is included in the East
;


select *
From store_locations
where State = 'Connecticut'
-- gives store ID of stores in Connecticut which is also in the East Region
;


select sum(Sale_Amount)
from store_sales
where Store_ID between 865 and 872
UNION ALL 
select sum(Sale_Amount)
from store_sales
where Store_ID between 840 and 851
-- connecticut total revenue= 2,392,222.44, approximately $2 million less than New York 
;


select sum(total_rev)
	from (select sum(Sale_Amount) as total_rev
	from store_sales
	where Store_ID between 865 and 872
	UNION ALL
	select sum(Sale_Amount) as total_rev
	from store_sales
	where Store_ID between 840 and 851
) as region_rev
-- Total Region Revenue=6,723,039.53
;


select products.Categoryid, Avg(store_sales.Sale_Amount) As average_transaction
from store_sales
Join products
	ON store_sales.Prod_Num = products.ProdNum
where store_sales.Store_ID between 840 and 851
Group By products.Categoryid
order by average_transaction desc
-- Average transaction amount by category
;


select count(id), year(Transaction_Date), month(Transaction_Date)
from store_sales
where Store_ID between 840 and 851
group by year(Transaction_Date), month(Transaction_Date)
-- shows number of transactions per month
;


select products.Categoryid, store_sales.Store_ID,
count(store_sales.id) As num_of_transactions,
year(store_sales.Transaction_Date), month(store_sales.Transaction_Date)
from store_sales
Join products
	ON store_sales.Prod_Num = products.ProdNum
where store_sales.Store_ID between 840 and 851
Group By products.Categoryid,year(store_sales.Transaction_Date), 
month(store_sales.Transaction_Date),Store_ID
order by year(store_sales.Transaction_Date), month(store_sales.Transaction_Date)


-- Shows number of transactions per month by category
;



select count(id)
from store_sales
where Store_ID between 840 and 851
-- total transactions in territory
;


select sum(Sale_Amount) as sales_performance, Store_ID
From store_sales
where Store_ID between 840 and 851
group by Store_ID
order by sales_performance asc
-- ranks each store's sales performance
;


select Round(sum(Sale_Amount)/count(distinct Store_ID),2) as avg_sales
from store_sales
where Store_ID between 840 and 851
-- Average Sales of all stores= 360,901.42
;


select count(id), Store_ID
from store_sales
where Store_ID between 840 and 851
group by Store_ID
order by count(id) asc

-- Ny recommendation is to focus sales attention on store 851, 
-- priortizing improving sales at store 851. Store 851 falls way below average while 
-- also being the only store to have revenue below $300,000. It also has the fewest amount of transactions; for
-- although it does not deviate greatly from the number of transactions at 
-- better performing stores. There could be a higher demand for lower priced items in the store's area or
-- less emphasis on selling higher priced items. 
;
select Month(Transaction_Date), Year(Transaction_Date),Count(id),Store_ID
from store_sales
where Store_ID between 840 and 851
group by Store_ID, Month(Transaction_Date), Year(Transaction_Date)
order by Month(Transaction_Date), Year(Transaction_Date),Store_ID 

-- breaks down # of transactions at each store per month
;

select products.Categoryid, store_sales.Store_ID,
count(store_sales.id) As num_of_transactions,
year(store_sales.Transaction_Date)
from store_sales
Join products
	ON store_sales.Prod_Num = products.ProdNum
where store_sales.Store_ID between 840 and 851 and Transaction_Date like '%2025%'
Group By products.Category,year(store_sales.Transaction_Date),store_sales.Store_ID
order by year(store_sales.Transaction_Date), products.Categoryid