-- altering data types and adding primary key constraint
--products table 
--select * from [dbo].[products]

alter table [dbo].[products]
alter column productid int not null;

alter table [dbo].[products]
alter column productname varchar(30);

alter table [dbo].[products]
alter column designno varchar(10);

alter table [dbo].[products]
alter column categoryid int;

alter table [dbo].[products]
alter column size varchar(10);

alter table [dbo].[products]
alter column color varchar(25);

alter table [dbo].[products]
alter column price decimal(10, 2);

--warehouses table 
--select * from [dbo].[warehouses]

alter table [dbo].[warehouses]
alter column warehouseid int not null;

alter table [dbo].[warehouses]
alter column warehousename varchar(100) not null;

alter table [dbo].[warehouses]
alter column locationcity varchar(50) not null;

alter table [dbo].[warehouses]
alter column locationregion varchar(50) not null;

alter table [dbo].[warehouses]
alter column address varchar(150);

alter table [dbo].[warehouses]
alter column capacity int;

alter table [dbo].[warehouses]
alter column phone varchar(20);

alter table [dbo].[warehouses]
alter column managername varchar(100);

alter table [dbo].[warehouses]
alter column operationalstatus varchar(20);

--inventories table
--select * from [dbo].[inventories]

alter table [dbo].[inventories]
alter column inventoryid int not null;

alter table [dbo].[inventories]
alter column productid int;

alter table [dbo].[inventories]
alter column onshelfquantity int;

alter table [dbo].[inventories]
alter column warehouseid int;

--orders table
--select * from [dbo].[orders]

alter table [dbo].[orders]
alter column orderid int not null;

alter table [dbo].[orders]
alter column orderaltkey varchar(20);

alter table [dbo].[orders]
alter column customerid int;

alter table [dbo].[orders]
alter column orderdate date;

alter table [dbo].[orders]
alter column totalprice decimal(10, 2);

--customers table 
--select * from [dbo].[customers]

alter table [dbo].[customers]
alter column customerid int not null;

alter table [dbo].[customers]
alter column firstname varchar(50);

alter table [dbo].[customers]
alter column lastname varchar(50);

alter table [dbo].[customers]
alter column gender varchar(20);

alter table [dbo].[customers]
alter column email varchar(255);

alter table [dbo].[customers]
alter column phonenumber varchar(50);

alter table [dbo].[customers]
alter column firstline varchar(255);

alter table [dbo].[customers]
alter column secondline varchar(255);

alter table [dbo].[customers]
alter column district varchar(100);

alter table [dbo].[customers]
alter column city varchar(255);

alter table [dbo].[customers]
alter column country varchar(255);

alter table [dbo].[customers]
alter column signupdate date;

--salesorderdetails table 
--select * from [dbo].[salesorderdetails]

alter table [dbo].[salesorderdetails]
alter column orderlineid int not null;

alter table [dbo].[salesorderdetails]
alter column orderid int;

alter table [dbo].[salesorderdetails]
alter column orderaltkey varchar(50);

alter table [dbo].[salesorderdetails]
alter column date date;

alter table [dbo].[salesorderdetails]
alter column status varchar(50);

alter table [dbo].[salesorderdetails]
alter column fulfilment varchar(50);

alter table [dbo].[salesorderdetails]
alter column sales_channel varchar(50);

alter table [dbo].[salesorderdetails]
alter column ship_service_level varchar(50);

alter table [dbo].[salesorderdetails]
alter column productid int;

alter table [dbo].[salesorderdetails]
alter column size varchar(10);

alter table [dbo].[salesorderdetails]
alter column asin varchar(20);

alter table [dbo].[salesorderdetails]
alter column courier_status varchar(50);

alter table [dbo].[salesorderdetails]
alter column qty int;

alter table [dbo].[salesorderdetails]
alter column currency varchar(3);

alter table [dbo].[salesorderdetails]
alter column unitprice int ;

alter table [dbo].[salesorderdetails]
alter column subtotal decimal(10, 2);

alter table [dbo].[salesorderdetails]
alter column ship_country varchar(2);

alter table [dbo].[salesorderdetails]
alter column fulfilledby varchar(20);

alter table [dbo].[salesorderdetails]
alter column b2b varchar(10);

alter table [dbo].[salesorderdetails]
alter column promotions_used varchar(3000);

alter table [dbo].[salesorderdetails]
alter column category varchar(50);

-- adding primary and foreign key constraints

alter table [dbo].[salesorderdetails] 
add constraint pk_amazonsalesorderdetails primary key (orderlineid);

alter table [dbo].[inventories]
add constraint pk_inventory primary key (inventoryid);

alter table [dbo].[products]
add constraint pk_product primary key (productid);

alter table [dbo].[warehouses]
add constraint pk_warehouse primary key (warehouseid);

alter table [dbo].[customers]
add constraint pk_customers primary key (customerid);

alter table [dbo].[orders]
add constraint pk_orders primary key (orderid);

-- add foreign key constraints
alter table [dbo].[inventories] 
add constraint fk_inventories_w 
foreign key (warehouseid) references [dbo].[warehouses](warehouseid);

alter table [dbo].[inventories] 
add constraint fk_inventories_p 
foreign key (productid) references [dbo].[products](productid);

alter table [dbo].[salesorderdetails] 
add constraint fk_salesorderdetails_productid 
foreign key (productid) references [dbo].[products](productid);

alter table [dbo].[orders] 
add constraint fk_orders_customerid 
foreign key (customerid) references [dbo].[customers](customerid);

alter table [dbo].[salesorderdetails] 
add constraint fk_salesorderdetails_orderid 
foreign key (orderid) references [dbo].[orders](orderid);

--Retrieve customer details with their orders
select c.customerid, c.firstname, c.lastname, c.email, o.orderid, o.orderdate, o.totalprice
from customers c
inner join orders o
on c.customerid = o.customerid;

--Count the total number of orders per customer
select c.customerid, c.firstname, c.lastname, count(o.orderid) as total_orders
from customers c
inner join orders o
on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
order by total_orders desc;

--Get customers who have placed orders in a specific date range
select c.customerid, c.firstname, c.lastname, o.orderid, o.orderdate
from customers c
inner join orders o
on c.customerid = o.customerid
where o.orderdate between '2024-01-01' and '2024-12-31';

--Find customers who have spent the most (top 10)
select top 10 c.customerid, c.firstname, c.lastname, sum(o.totalprice) as total_spent
from customers c
inner join orders o
on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
order by total_spent desc;

--List customers who haven't placed any orders
select c.customerid, c.firstname, c.lastname, c.email
from customers c
left join orders o
on c.customerid = o.customerid
where o.orderid is null;

--List the most recent signup dates for customers
select c.customerid, c.firstname, c.lastname, c.email, c.signupdate
from customers c
order by c.signupdate desc;

--List customers and the products they ordered
select c.customerid, c.firstname, c.lastname, p.productname, sod.qty, sod.unitprice
from customers c
inner join orders o
on c.customerid = o.customerid
inner join salesorderdetails sod
on o.orderid = sod.orderid
inner join products p
on sod.productid = p.productid;

--Calculate the total quantity ordered per product for each customer
select c.customerid, c.firstname, c.lastname, p.productname, sum(sod.qty) as total_quantity_ordered
from customers c
inner join orders o
on c.customerid = o.customerid
inner join salesorderdetails sod
on o.orderid = sod.orderid
inner join products p
on sod.productid = p.productid
group by c.customerid, c.firstname, c.lastname, p.productname;

-- Calculate the average order value (AOV) 
--and compare customers with high vs low AOV
with customer_aov as (
    select c.customerid, c.firstname, c.lastname, avg(o.totalprice) as avg_order_value
    from customers c
    inner join orders o
    on c.customerid = o.customerid
    group by c.customerid, c.firstname, c.lastname
),
overall_aov as (
    select avg(totalprice) as overall_avg
    from orders
)
select ca.customerid, ca.firstname, ca.lastname, ca.avg_order_value,
       case when ca.avg_order_value > oa.overall_avg then 'High AOV' else 'Low AOV' end as aov_category
from customer_aov ca, overall_aov oa
order by ca.avg_order_value desc;


--Analyze product performance by region (warehouse location)
select w.locationregion, p.productname, sum(sod.qty) as total_units_sold
from salesorderdetails sod
inner join products p on sod.productid = p.productid
inner join inventories i on p.productid = i.productid
inner join warehouses w on i.warehouseid = w.warehouseid
group by w.locationregion, p.productname
order by total_units_sold desc;

--Detect customers with a high return rate (products returned to inventory)
with customer_returns as (
    select c.customerid, c.firstname, c.lastname,
           sum(sod.qty) as total_ordered_qty,
           sum(case when i.onshelfquantity > 0 then sod.qty else 0 end) as returned_qty
    from customers c
    inner join orders o on c.customerid = o.customerid
    inner join salesorderdetails sod on o.orderid = sod.orderid
    inner join inventories i on sod.productid = i.productid
    group by c.customerid, c.firstname, c.lastname
)
select customerid, firstname, lastname, total_ordered_qty, returned_qty,
       cast(returned_qty as float) / total_ordered_qty as return_rate
from customer_returns
where cast(returned_qty as float) / total_ordered_qty > 0.3;

-- Find the average delivery time for orders by fulfillment type
select sod.fulfilledBy, avg(datediff(day, o.orderdate, sod.date)) as avg_delivery_time
from salesorderdetails sod
inner join orders o
on sod.orderid = o.orderid
group by sod.fulfilledBy;

--Analyze total sales per category across different sales channels
select sod.category, sod.sales_channel, sum(sod.subtotal) as total_sales
from salesorderdetails sod
group by sod.category, sod.sales_channel
order by total_sales desc;

--Identify top-selling products and their inventory levels
with product_sales as (
    select p.productid, p.productname, sum(sod.qty) as total_sold
    from salesorderdetails sod
    inner join products p on sod.productid = p.productid
    group by p.productid, p.productname
)
select ps.productname, ps.total_sold, i.onshelfquantity
from product_sales ps
inner join inventories i
on ps.productid = i.productid
order by ps.total_sold desc;

-- Track high-value customers (customers who spent more than a certain threshold)
select c.customerid, c.firstname, c.lastname, sum(o.totalprice) as total_spent
from customers c
inner join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
having sum(o.totalprice) > 10000 -- Example threshold value
order by total_spent desc;

--Calculate fulfillment performance: orders delivered on time vs late
select sod.Fulfilment,
       sum(case when sod.Courier_Status = 'Delivered' and sod.date <= o.orderdate then 1 else 0 end) as on_time,
       sum(case when sod.Courier_Status = 'Delivered' and sod.date > o.orderdate then 1 else 0 end) as late
from salesorderdetails sod
inner join orders o on sod.orderid = o.orderid
group by sod.Fulfilment;

--Identify Products with Low Stock
select p.productid, p.productname, i.onshelfquantity
from products p
inner join inventories i on p.productid = i.productid
where i.onshelfquantity < 10 -- Example low stock threshold
order by i.onshelfquantity;

--Analyze Sales Trends by Month
select month(o.orderdate) as sales_month, sum(o.totalprice) as total_sales
from orders o
group by month(o.orderdate)
order by sales_month;

--Find Top Customers by Category
select c.customerid, c.firstname, c.lastname, p.categoryid, sum(sod.qty) as total_qty
from customers c
inner join orders o on c.customerid = o.customerid
inner join salesorderdetails sod on o.orderid = sod.orderid
inner join products p on sod.productid = p.productid
where p.categoryid = 2 -- Example category id
group by c.customerid, c.firstname, c.lastname, p.categoryid
order by total_qty desc;

--Analyze Customer Retention Rate
select c.customerid, c.firstname, c.lastname, count(o.orderid) as total_orders,
       case when count(o.orderid) > 1 then 'Repeat Customer' else 'One-Time Customer' end as customer_type
from customers c
inner join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
order by total_orders desc;

--Track Inventory Replenishment
select p.productid, p.productname, sum(i.onshelfquantity) as total_replenished
from inventories i
inner join products p on i.productid = p.productid
group by p.productid, p.productname
order by total_replenished desc;

--Total orders and total spent
select c.country, count(o.orderid) as total_orders, sum(o.totalprice) as total_spent
from customers c
inner join orders o on c.customerid = o.customerid
group by c.country
order by total_spent desc;

