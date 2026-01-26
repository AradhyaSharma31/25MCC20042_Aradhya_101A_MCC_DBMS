--- Step 1: Create Customer Order Table

create table customer_orders(
id serial primary key,
customer_name varchar(20),
product varchar(20),
quantity int,
price numeric(10,2),
order_date date
);

insert into customer_orders(customer_name, product, quantity, price, order_date) values
('Aradhya', 'Laptop', 2, 64000, '2026-01-03'),
('Rohan', 'Speaker', 1, 32000, '2026-01-07'),
('Raj', 'Headset', 10, 2000, '2026-01-10'),
('Hanna', 'Laptop', 5, 80000, '2026-01-12'),
('Harry', 'Keyboard', 3, 15000, '2026-01-15'),
('Mary', 'Mobile', 1, 28000, '2026-01-15'),
('Chandra', 'Charger', 3, 1500, '2026-01-23');

-- Display Customer Orders
select * from customer_orders;


-- Step 2: Filter data using conditions
select id, customer_name, product, quantity, price
from customer_orders
where price > 30000;

-- Step 3: Sorting Query Results
-- Sorting Query Results (Ascending Order)
select id, customer_name, product, quantity, price
from customer_orders
where price > 30000
order by price;

-- Sorting Query Results (Decending Order)
select id, customer_name, product, quantity,price
from customer_orders
where price > 30000
order by price desc;

-- Step 4: Grouping Data for Aggregation
select product, count(*) as total_sales
from customer_orders
group by product;


--Step 5: Applying Conditions On Aggregated Data
select product, sum(quantity * price) as total_revenue
from customer_orders
group by product
having sum(quantity * price) > 60000;

-- Step 6: Filtering VS Aggregation conditions
select product, sum(quantity * price) as total_revenue
from customer_orders
where order_date >= '2026-01-01'
group by product
having sum(quantity * price) > 60000;