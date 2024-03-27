create database swiggy;
use swiggy;


-- order analysis
select*from orders;

-- check null value 
select order_id from orders
where order_total is null or restaurant_name is null or order_time is null or rain_mode is null or on_time is null;
 -- no null value in the above query
 
 -- check how many distanct on time delivery (1 means delivery on time and 0 means delivery is not on time)
 select count(distinct order_id) as on_time_delivery from orders 
 where on_time = 1;
 
 -- check how many distinct restaurant we have order from
select count(distinct restaurant_name ) as total_restaurant from orders;

-- check which is favourite restaurant
select restaurant_name, count(restaurant_name) as no_of_times from orders
group by restaurant_name
order by no_of_times desc;


-- check latest order we made 
select max(order_time) as latest_order from orders;


-- items analysis 
select* from items;

-- check the no.of items
select distinct name from items;

-- check no of veg items 
select count(name) as total_veg_items from items 
where is_veg=1;

-- check name of veg items 
select name  from items
where is_veg=1 ;
 
-- check which items are other than veg or non veg
select name from items
where is_veg!=1 and is_veg!=0;

-- check items that are made of paneer
select * from items
where name like '%paneer%';

-- how many times each item is ordered
select name ,count(*) as no_of_times from items
group by name
order by no_of_times desc;
 
