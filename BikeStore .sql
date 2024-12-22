-- Which bike is most expensive? 
select product_id,product_name,brand_id
from production.products
where list_price= (select max(list_price) most_expensive from production.products)
-- What could be the motive behind pricing this bike at the high price? 
select brand_name,brand_id
from production.brands
where brand_id=9
--How many total customers does BikeStore have? 
select count(distinct customer_id) #customers
from sales.customers
--Would you consider people with order status 3 as customers substantiate your answer? 
select order_status,count(distinct customer_id) #customers
from sales.orders
group by order_status
--How many stores does BikeStore have? 
select count(distinct store_id) #stores
from sales.stores
--What is the total price spent per order? 
Alter table sales.order_items add total_price float 
update sales.order_items
set total_price=[list_price] *[quantity]*(1-[discount]) 
select order_id,sum(total_price) Total_Price
From sales.order_items
group by order_id
--What’s the sales/revenue per store? 
select store_name,sum(total_price) Total_Price
from sales.orders ord
inner join sales.order_items it
on ord.order_id=it.order_id
inner join sales.stores ss
on ord.store_id=ss.store_id
group by store_name
--Which category is most sold? 
select top(1) category_name , sum(total_price) most_sold
From sales.order_items it 
inner join production.products pp
on it.product_id=pp.product_id
inner join production.categories pc
on pp.category_id=pc.category_id
group by category_name
order by most_sold DESC
--Which category rejected more orders? 
select top(1) category_name , count(order_status) most_reject
from sales.orders so
inner join production.stocks ps
on so.store_id=ps.store_id
inner join production.products pp
on ps.product_id=pp.product_id
inner join production.categories pc
on pp.category_id=pc.category_id
where order_status=3
group by category_name
order by most_reject DESC
--Which bike is the least sold? 
select top(1) product_name, sum(total_price) Total_Price
From sales.order_items it
inner join production.products pp
on it.product_id=pp.product_id
group by product_name
order by Total_Price Asc
--What’s the full name of a customer with ID 259? 
select first_name+' '+last_name Full_Name
from sales.customers
where customer_id=259
--What did the customer on question 9 buy and when? What’s the status of this order?
select customer_id,order_date,order_status,product_name
from sales.orders o
inner join sales.order_items it
on o.order_id=it.order_id
inner join production.products pp
on it.product_id=pp.product_id
where customer_id=259
--Which staff processed the order of customer 259? And from which store? 
Select customer_id, first_name+' '+last_name Full_Name_Staff , store_name
From sales.orders o
inner join sales.staffs ss
on o.staff_id=ss.staff_id
inner join sales.stores st
on o.store_id=st.store_id
where customer_id=259
--How many staff does BikeStore have?
select count(distinct staff_id) #staff
from sales.staffs

--Who seems to be the lead Staff at BikeStore? 
select first_name+' '+last_name Full_Name
from sales.staffs
where manager_id is null
--which brand is the most liked? 
Select top(1) brand_name ,pb.brand_id,sum(quantity) #quantity
from sales.order_items it
inner join production.products pp
on it.product_id=pp.product_id
inner join production.brands pb
on pp.brand_id=pb.brand_id
group by brand_name,pb.brand_id
order by #quantity DESC
--How many categories does BikeStore have
select count(distinct category_id) #categories
from production.categories
--and which one is the least liked? 
Select top(1) category_name ,sum(quantity) #quantity
from sales.order_items it
inner join production.products pp
on it.product_id=pp.product_id
inner join production.categories pc
on pp.category_id=pc.category_id
group by category_name
order by #quantity ASC
--which store still have more products of the most liked brand? (Electra,ID=1)
Select top(1) store_name,count(brand_id) #Electra
from sales.stores ss
inner join production.stocks ps
on ss.store_id=ps.store_id
inner join production.products pp
on ps.product_id=pp.product_id
where brand_id=1
group by store_name
order by #Electra DESC
--Which state is doing better in terms of sales? 
Select top(1) state ,sum(list_price) Total_Price
From sales.stores ss
inner join production.stocks ps
on ss.store_id=ps.store_id
inner join production.products pp
on ps.product_id=pp.product_id
group by state 
order by Total_Price DESC
--What’s the discounted price of product id 259? 
Select product_id, discount
From sales.order_items
Where product_id=259
--What’s the product name, quantity, price, category, model year and brand name of product number 44?
Select product_name,sum(quantity) #quantity,it.list_price,category_name,model_year,brand_name
From sales.order_items it
inner join production.products pp
on it.product_id=pp.product_id
inner join production.categories pc
on pp.category_id=pc.category_id
inner join production.brands pb
on pp.brand_id=pb.brand_id
where it.product_id=44
group by product_name,it.list_price,category_name,model_year,brand_name
--what’s the zip code of CA? 
Select state , zip_code
From sales.stores
where state='ca'
--How many states does BikeStore operate in? 
Select count(distinct state)
From sales.stores
--How many bikes under the children category were sold in the last 8 months? 
SELECT MAX(order_date) AS last_order_date
FROM sales.orders

select sum(it.quantity) #bikes_sold
from sales.order_items it
inner join production.products pp
on it.product_id=pp.product_id
inner join sales.orders so
on it.order_id=so.order_id
inner join production.categories pc
on pc.category_id =pp.category_id
where pc.category_name='Children Bicycles' 
and so.order_date>=DATEADD(MONTH,-8,2018-12-28)
--What’s the shipped date for the order from customer 523 
Select shipped_date 
From sales.orders
where customer_id=523
--How many orders are still pending? 
Select count(distinct order_id) #pending
From sales.orders
where order_status=1
--What’s the names of category and brand does "Electra white water 3i - 2018" fall under? 
Select category_name , brand_name
from production.products pp
inner join production.categories pc
on pp.category_id=pc.category_id
inner join production.brands pb
on pp.brand_id=pb.brand_id
where product_name='Electra white water 3i - 2018'
