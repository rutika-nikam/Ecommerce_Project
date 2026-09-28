/* -------------------------- E-COMMERCE DATABASE------------------------------*/

create database ecommerce;
use ecommerce;

create table customer( customer_id int primary key, 
                       customer_name varchar(50),
                       city varchar(50),
                       phone varchar(50));
show tables;  
desc customer;

insert into customer  values (1,'jon','pune','1234567890'),
							 (2,'bon','mumbai','1134567890'),
							 (3,'ron','pune','1334567890'),
							 (4,'son','jaipur','1244567890'),
                             (5,'mon','nampur','1434567890');

drop table customer;

create table customer( customer_id int primary key, 
                       customer_name varchar(50),
                       city varchar(50),
                       phone varchar(50));
show tables;  
desc customer;
 
insert into customer  values (1,'jon','pune','1234567890'),
							 (2,'bon','mumbai','1134567890'),
							 (3,'ron','pune','1334567890'),
							 (4,'son','jaipur','1244567890'),
                             (5,'mon','nampur','1434567890'); 
select * from customer;

create table categories( category_id int primary key, category_name varchar(50));

insert into categories values(11,'electronics'),
                              (12,'beauty'),
                              (13,'shoes'),
                              (14,'clothes'),
                              (15,'glosary');
select * from categories; 

create table products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);                             
                              
insert into products values	(111,'laptop',11,45000,15),
                            (112,'facewash',12,450.00,1),	
                            (113,'shoes',13,500,10),	
                            (114,'mobile',14,9000,5),	
                            (115,'potato',15,40,20);
select * from products; 
                            
                            
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2026-09-01', 'Delivered'),
(1002, 2, '2026-09-02', 'Shipped'),
(1003, 3, '2026-09-03', 'Pending'),
(1004, 1, '2026-09-04', 'Delivered'),
(1005, 4, '2026-09-05', 'Cancelled'),
(1006, 5, '2026-09-06', 'Delivered');

select * from orders;

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_details
(order_detail_id, order_id, product_id, quantity)
VALUES
(1111, 1001, 111, 1),
(1112, 1001, 112, 2),
(1113, 1002, 113, 2),
(1114, 1003, 115, 1),
(1115, 1004, 111, 1);
select * from order_details;


select * from customer
where city='pune';


select * from customer
where customer_id>3;

select * from products
where price >1000;

select * from products
order by price desc;

select * from products
order by price desc
limit 1;

select avg(price) as average_price
from products;

select max(price) as maximum_price
from products;

select min(price) as minimum_price
from products;

select count(*) as total_products
from products;

select * from products
where stock >20;

select * from orders
where order_status='delivered';

select count(*)as delivered_order from orders
where order_status='delivered';

select order_id,order_date,order_status
from orders
order by order_date desc;

select customer.customer_name,orders.order_id
from customer
inner join orders
on customer.customer_id=orders.customer_id;

select customer.customer_name,
count(orders.order_id) as
total_orders
from customer
inner join orders
on customer.customer_id=
orders.customer_id
group by customer.customer_name;


select customer.customer_name,
count(orders.order_id) as
total_orders
from customer
inner join orders
on customer.customer_id=
orders.customer_id
group by customer.customer_name
order by total_orders desc
limit 1;


select city,count(*) as
total_customer
from customer
group by city;

select distinct city from customer;

select  row_number() over (order by city desc)as row_no,customer_id,customer_name,city,phone
from customer;

select  rank() over (order by city desc)as rk,customer_id,customer_name,city,phone
from customer;

select  dense_rank() over (order by city desc)as dence_rk,customer_id,customer_name,city,phone
from customer;

select  *,lag(city) over() from customer;

select  *,lag(customer_id) over() from customer;

select * , lag(price) over(order by price desc) as one_higher from products;

select * , lead(price) over(order by price desc) as one_lower from products;

select order_status,count(*)as
total_orders
from orders
group  by order_status;

select products.product_name, categories.category_name
from products
inner join categories
on products.category_id=categories.category_id;

select * from categories;
update product set category_id=1
where product_id=114;




