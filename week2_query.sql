Drop database if exists Customers_orders_schema;
create database Customers_orders_schema;
use Customers_orders_schema;

create table customers(
customer_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) ,
email varchar(50) unique,
phone varchar(15) not null,
city varchar(50) not null,
created_at date 
);

create table products(
product_id int auto_increment primary key,
product_name varchar(50) not null,
category varchar(50) not null,
price decimal(10,2) not null,
cost decimal(10,2) not null,
check (price >= 0),
check (cost >= 0),
created_at date
);

create table orders(
order_id int auto_increment primary key,
customer_id int,
order_date date,
status  enum('Ordered','Shipped','Cancelled','Delivered') default'Ordered',
total_amount decimal(10,2)not null,
foreign key (customer_id) references customers(customer_id)
on update cascade
on delete cascade
);

create table order_items(
order_item_id int auto_increment primary key,
order_id int ,
product_id int,
quantity int not null,
unit_price decimal(10,2)not null,
line_total decimal(10,2) generated always as (quantity*unit_price) stored,
foreign key (order_id) references orders(order_id)
on update cascade
on delete cascade,
foreign key (product_id) references products(product_id)
on update cascade
on delete cascade
);

INSERT INTO customers (first_name, last_name, email, phone, city, created_at)
VALUES
('Yamini','Ravichandran','yamini@gmail.com','9999999999','Coimbatore','2024-01-01'),
('Srinidhi','Jeevanandam','srinidhi@gmail.com','8888888888','Coimbatore','2024-01-07'),
('Shobika','Sivakumar','shobika@gmail.com','7777777777','Hosur','2024-01-14'),
('Visalakshi','Venkat','visal@gmail.com','6666666666','Chennai','2024-02-01'),
('Sanjith','Shivakumar','sanjith@gmail.com','5555555555','Sathy','2024-02-07'),
('Syed','Hameed','syed@gmail.com','4444444444','Sathy','2024-02-14'),
('Kamal','Hasaan','kamal@gmail.com','3333333333','Ooty','2024-03-01'),
('Rajini','Kanth','rajini@gmail.com','2222222222','Bangalore','2024-03-07'),
('Surya','Sivakumar','surya@gmail.com','1111111111','Erode','2024-03-14'),
('Karthi','Selvam','karthi@gmail.com','0000000000','Erode','2024-04-01'),

('Shalini','Pandey','shalini@gmail.com','1212121212','Bangalore','2024-04-07'),
('Kiran','Josh','kiran@gmail.com','1313131313','Hosur','2024-04-14'),
('Sekar','Kumar','sekar@gmail.com','1414141414','Sathy','2024-05-01'),
('Madhu','Mitha','madhu@gmail.com','1515151515','Chennai','2024-05-01'),
('Kiruba','Shivakumar','kiruba@gmail.com','1616161616','Sathy','2024-05-07'),
('Janani','Ram','janani@gmail.com','1717171717','Sathy','2024-05-14'),
('Shruthi','Hasaan','shruthi@gmail.com','1818181818','Ooty','2024-06-01'),
('Soundarya','Kanth','soundarya@gmail.com','1919191919','Bangalore','2024-06-07'),
('Jyotika','Sivakumar','jyotika@gmail.com','2020202020','Erode','2024-06-14'),
('Tamanha','Bhat','tamanha@gmail.com','2121212121','Erode','2024-07-01'),

('Deepika','Raj','deepika@gmail.com','2323232323','Coimbatore','2024-07-07'),
('Alia','Bhat','alia@gmail.com','2424242424','Coimbatore','2024-07-07'),
('Kriti','Sanon','kriti@gmail.com','2525252525','Hosur','2024-07-14'),
('Mrunal','Thakur','mrunal@gmail.com','2626262626','Chennai','2024-08-01'),
('Rukmini','Kumar','rukmini@gmail.com','2727272727','Sathy','2024-08-07'),
('Kajal','Agarwal','kajal@gmail.com','2828282828','Sathy','2024-08-14'),
('Akshara','Hasaan','akshara@gmail.com','2929292929','Ooty','2024-09-01'),
('Aishwarya','Kanth','aishwarya@gmail.com','3030303030','Bangalore','2024-09-07'),
('Dev','Sivakumar','dev@gmail.com','3131313131','Erode','2024-09-14'),
('Diya','Selvam','diya@gmail.com','3232323232','Erode','2024-10-01'),

('Monica','Geller','monica@gmail.com','3434343434','Coimbatore','2024-10-01'),
('Rachel','Green','rachel@gmail.com','3535353535','Coimbatore','2024-10-07'),
('Joey','Tribiani','joey@gmail.com','3636363636','Hosur','2024-10-14'),
('Chandler','Bing','chandler@gmail.com','3737373737','Chennai','2024-11-01'),
('Phoebe','Buffay','phoebe@gmail.com','3838383838','Sathy','2024-11-07'),
('Janice','Hameed','janice@gmail.com','3939393939','Sathy','2024-11-14'),
('Richard','Hasaan','richard@gmail.com','4040404040','Ooty','2024-12-01'),
('Gunther','Kanth','gunther@gmail.com','4141414141','Bangalore','2024-12-07'),
('Emma','Sivakumar','emma@gmail.com','4242424242','Erode','2024-12-14'),
('Catherine','Selvam','catherine@gmail.com','4343434343','Erode','2025-01-01'),

('Michael','Scott','michael@gmail.com','4545454545','Coimbatore','2025-01-01'),
('Jim','Halpert','jim@gmail.com','4646464646','Coimbatore','2025-02-07'),
('Dwight','Schrute','dwight@gmail.com','4747474747','Hosur','2025-03-14'),
('Pam','Beesely','pam@gmail.com','4848484848','Chennai','2025-04-01'),
('Angela','Shivakumar','angela@gmail.com','4949494949','Sathy','2025-05-07'),
('Meredith','Palmer','meredith@gmail.com','5050505050','Sathy','2025-06-14'),
('Creed','Hasaan','creed@gmail.com','5151515151','Ooty','2025-07-01'),
('Andy',' Bernard','andy@gmail.com','5252525252','Bangalore','2025-08-07'),
('Toby','Flenderson','toby@gmail.com','5353535353','Erode','2025-09-14'),
('Kelly','Kapoor','kelly@gmail.com','0000000000','Erode','2025-10-01');

INSERT INTO products (product_name, category, price, cost, created_at)
VALUES
('iPhone 15', 'Electronics', 79999.00, 65000.00, '2024-01-10'),
('Samsung Galaxy S24', 'Electronics', 74999.00, 60000.00, '2024-01-15'),
('Dell Inspiron Laptop', 'Electronics', 55999.00, 48000.00, '2024-02-01'),
('Nike Running Shoes', 'Footwear', 4999.00, 3000.00, '2024-02-10'),
('Adidas Hoodie', 'Clothing', 2999.00, 1800.00, '2024-03-01'),
('Wooden Study Table', 'Furniture', 8999.00, 6500.00, '2024-03-15'),
('Office Chair', 'Furniture', 6999.00, 5000.00, '2024-04-01'),
('Bluetooth Headphones', 'Electronics', 2499.00, 1500.00, '2024-04-10'),
('Casio Watch', 'Accessories', 1999.00, 1200.00, '2024-05-01'),
('Backpack', 'Accessories', 1499.00, 900.00, '2024-05-15'),

('iPhone 15 Pro', 'Electronics', 79999.00, 65000.00, '2024-01-10'),
('Samsung Galaxy S24 Ultra', 'Electronics', 74999.00, 60000.00, '2024-01-15'),
('HP Pavilion Laptop', 'Electronics', 55999.00, 48000.00, '2024-02-01'),
('Puma Sports Shoes', 'Footwear', 4999.00, 3000.00, '2024-02-10'),
('Zara Winter Jacket', 'Clothing', 2999.00, 1800.00, '2024-03-01'),
('Modern Computer Desk', 'Furniture', 8999.00, 6500.00, '2024-03-15'),
('Ergonomic Office Chair', 'Furniture', 6999.00, 5000.00, '2024-04-01'),
('Wireless Earbuds', 'Electronics', 2499.00, 1500.00, '2024-04-10'),
('Titan Analog Watch', 'Accessories', 1999.00, 1200.00, '2024-05-01'),
('Travel Laptop Bag', 'Accessories', 1499.00, 900.00, '2024-05-15'),


('OnePlus 12', 'Electronics', 79999.00, 65000.00, '2024-01-10'),
('Google Pixel 8 Pro', 'Electronics', 74999.00, 60000.00, '2024-01-15'),
('Lenovo ThinkPad E14', 'Electronics', 55999.00, 48000.00, '2024-02-01'),
('Reebok Training Shoes', 'Footwear', 4999.00, 3000.00, '2024-02-10'),
('H&M Casual Sweatshirt', 'Clothing', 2999.00, 1800.00, '2024-03-01'),
('Glass Top Dining Table', 'Furniture', 8999.00, 6500.00, '2024-03-15'),
('Adjustable Study Chair', 'Furniture', 6999.00, 5000.00, '2024-04-01'),
('Noise Cancelling Headset', 'Electronics', 2499.00, 1500.00, '2024-04-10'),
('Fossil Leather Watch', 'Accessories', 1999.00, 1200.00, '2024-05-01'),
('Outdoor Travel Backpack', 'Accessories', 1499.00, 900.00, '2024-05-15'),

('Realme GT 6', 'Electronics', 79999.00, 65000.00, '2024-01-10'),
('Vivo X100 Pro', 'Electronics', 74999.00, 60000.00, '2024-01-15'),
('Asus VivoBook 15', 'Electronics', 55999.00, 48000.00, '2024-02-01'),
('Skechers Walking Shoes', 'Footwear', 4999.00, 3000.00, '2024-02-10'),
('Levis Denim Jacket', 'Clothing', 2999.00, 1800.00, '2024-03-01'),
('Engineered Wood Wardrobe', 'Furniture', 8999.00, 6500.00, '2024-03-15'),
('Mesh Back Office Chair', 'Furniture', 6999.00, 5000.00, '2024-04-01'),
('JBL Portable Speaker', 'Electronics', 2499.00, 1500.00, '2024-04-10'),
('Sonata Digital Watch', 'Accessories', 1999.00, 1200.00, '2024-05-01'),
('Waterproof Hiking Bag', 'Accessories', 1499.00, 900.00, '2024-05-15'),

('Motorola Edge 50', 'Electronics', 79999.00, 65000.00, '2024-01-10'),
('Nothing Phone 2', 'Electronics', 74999.00, 60000.00, '2024-01-15'),
('Acer Aspire 7', 'Electronics', 55999.00, 48000.00, '2024-02-01'),
('Under Armour Running Shoes', 'Footwear', 4999.00, 3000.00, '2024-02-10'),
('Allen Solly Casual Shirt', 'Clothing', 2999.00, 1800.00, '2024-03-01'),
('Compact TV Unit', 'Furniture', 8999.00, 6500.00, '2024-03-15'),
('Recliner Office Chair', 'Furniture', 6999.00, 5000.00, '2024-04-01'),
('Boat Wireless Earphones', 'Electronics', 2499.00, 1500.00, '2024-04-10'),
('Timex Classic Watch', 'Accessories', 1999.00, 1200.00, '2024-05-01'),
('Anti-Theft Travel Backpack', 'Accessories', 1499.00, 900.00, '2024-05-15');

INSERT INTO orders (customer_id, order_date, status, total_amount)
VALUES
('1','2024-01-05','Ordered','5000.00'),
('2','2024-01-20','Ordered','10000.00'),
('3','2024-02-14','Ordered','2000.00'),
('4','2024-03-01','Ordered','4000.00'),
('5','2024-03-25','Ordered','8000.00'),
('6','2024-04-10','Ordered','7000.00'),
('7','2024-05-18','Ordered','9000.00'),
('8','2024-06-30','Ordered','6000.00'),
('9','2024-07-12','Ordered','3000.00'),
('10','2024-08-05','Ordered','18000.00'),

('11','2024-02-15','Shipped','5000.00'),
('12','2024-02-10','Shipped','10000.00'),
('13','2024-03-24','Shipped','2000.00'),
('14','2024-03-21','Shipped','4000.00'),
('15','2024-04-15','Shipped','8000.00'),
('16','2024-04-20','Shipped','7000.00'),
('17','2024-05-08','Shipped','9000.00'),
('18','2024-06-30','Shipped','6000.00'),
('19','2024-10-12','Shipped','3000.00'),
('20','2024-08-05','Shipped','18000.00'),



('21','2025-01-05','Cancelled','5100.00'),
('22','2025-10-20','Cancelled','1000.00'),
('23','2025-02-14','Cancelled','2600.00'),
('24','2025-03-01','Cancelled','4100.00'),
('25','2025-09-25','Cancelled','8600.00'),
('26','2025-04-10','Cancelled','7500.00'),
('27','2025-05-18','Cancelled','9400.00'),
('28','2025-06-30','Cancelled','6300.00'),
('29','2025-07-12','Cancelled','3400.00'),
('30','2025-08-05','Cancelled','1800.00'),

('31','2024-01-06','Delivered','5000.00'),
('32','2024-01-21','Delivered','10000.00'),
('33','2024-02-15','Delivered','2000.00'),
('34','2024-03-02','Delivered','4000.00'),
('35','2024-03-26','Delivered','8000.00'),
('36','2024-04-11','Delivered','7000.00'),
('37','2024-05-19','Delivered','9000.00'),
('38','2024-06-29','Delivered','6000.00'),
('39','2024-07-13','Delivered','3000.00'),
('40','2024-08-06','Delivered','18000.00'),

('41','2024-01-05','Delivered','6000.00'),
('42','2024-01-20','Delivered','11000.00'),
('43','2024-02-14','Delivered','3300.00'),
('44','2024-03-01','Delivered','5000.00'),
('45','2024-03-25','Delivered','9000.00'),
('46','2024-04-10','Delivered','8000.00'),
('47','2024-05-18','Delivered','10000.00'),
('48','2024-06-30','Delivered','7000.00'),
('49','2024-07-12','Delivered','4000.00'),
('50','2024-08-05','Delivered','16000.00');


INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1,'1','2','74999.00'),
(2,'2','3','79999.00'),
(3,'3','5','55999.00'),
(4,'4','2','8999.00'),
(5,'5','5','4999.00'),
(6,'6','3','2999.00'),
(7,'7','1','6999.00'),
(8,'8','6','1499.00'),
(9,'9','4','4999.00'),
(10,'10','3','79999.00'),

(11,'11','2','74999.00'),
(12,'12','3','79999.00'),
(13,'13','5','55999.00'),
(14,'14','2','8999.00'),
(15,'15','5','4999.00'),
(16,'16','3','2999.00'),
(17,'17','1','6999.00'),
(18,'18','6','1499.00'),
(19,'19','4','4999.00'),
(20,'20','3','79999.00'),

(21,'21','2','74999.00'),
(22,'22','3','79999.00'),
(23,'23','5','55999.00'),
(24,'24','2','8999.00'),
(25,'25','5','4999.00'),
(26,'26','3','2999.00'),
(27,'27','1','6999.00'),
(28,'28','6','1499.00'),
(29,'29','4','4999.00'),
(30,'30','3','79999.00'),

(31,'31','2','74999.00'),
(32,'32','3','79999.00'),
(33,'33','5','55999.00'),
(34,'34','2','8999.00'),
(35,'35','5','4999.00'),
(36,'36','3','2999.00'),
(37,'37','1','6999.00'),
(38,'38','6','1499.00'),
(39,'39','4','4999.00'),
(40,'40','3','79999.00'),

(41,'41','2','74999.00'),
(42,'42','3','79999.00'),
(43,'43','5','55999.00'),
(44,'44','2','8999.00'),
(45,'45','5','4999.00'),
(46,'46','3','2999.00'),
(47,'47','1','6999.00'),
(48,'48','6','1499.00'),
(49,'49','4','4999.00'),
(50,'50','3','79999.00');
# Revenue by day/week.

select order_date,
       sum(total_amount) as daily_revenue
from orders
where status='Delivered'
group by order_date 
order by order_date;

select
year(order_date) as years,
week(order_date,1) as week_number,
sum(total_amount) as weekly_revenue
from orders
where status='Delivered'
group by years,week_number
order by years, week_number;


#- Top 5 products by revenue and quantity.
select p.product_id,
       p.product_name,
       sum(oi.line_total) as Total_revenue
from order_items oi
join orders o
       on oi.order_id=o.order_id
join products p
       on oi.product_id=p.product_id
where o.status='Delivered'
group by p.product_id,p.product_name  
order by total_revenue desc
limit 5;

select p.product_id,
       p.product_name,
       sum(oi.quantity) as total_quantity
from order_items oi
join orders o
       on oi.order_id=o.order_id
join products p
       on oi.product_id=p.product_id
where o.status='Delivered'
group by p.product_id,p.product_name  
order by total_quantity desc
limit 5;

#- Identification of customers with no orders.
select c.first_name
from customers c
left join orders o
     on o.customer_id= c.customer_id
where o.order_id is null;
     
  #- Customer classification (Repeat vs. One-Time).

select customer_id,
	   count(order_id) as total_orders,
       case
           when count(order_id)>1 then 'repeat_customers'
           else 'one_time_customer'
       end as customer_type    
from orders
group by customer_id;         

#- Customer lifetime value and top 5 revenue-generating customers.
select c.customer_id,c.first_name ,sum(o.total_amount) as lifetime_value
from orders o
join customers c on c.customer_id = o.customer_id
where status= 'Delivered'
group by c.customer_id,c.first_name
order by lifetime_value desc;


select c.first_name,
sum(oi.quantity*(oi.unit_price-p.cost)) as profit,
 sum(oi.line_total) as revenue,
round((SUM(oi.quantity * (oi.unit_price - p.cost)) 
     / SUM(oi.line_total)) * 100,
     2 )AS profit_percentage 
from orders o
join  order_items  oi on o.order_id= oi.order_id
join products p on oi.product_id = p.product_id
join customers c on o.customer_id = c.customer_id
where status ='Delivered'
group by c.first_name
order by profit_percentage desc
limit 5;


#- Views for recurring reports.
create view vw_customer_lifetime_value as
select customer_id, sum(total_amount)as lifetime_value
from orders
where status= 'Delivered'
group by customer_id
order by lifetime_value desc;

select*
from vw_customer_lifetime_value
order by lifetime_value desc;


###WEEK2###

create table returns(
return_id int auto_increment primary key,
order_item_id int not null,
foreign key(order_item_id) references order_items(order_item_id)
on update cascade
on delete cascade,
product_id int not null,
foreign key (product_id) references products(product_id) 
on update cascade
on delete cascade,
customer_id int not null,
foreign key(customer_id) references customers(customer_id) 
on update cascade
on delete cascade,
order_id int not null,
foreign key (order_id) references orders(order_id)
on update cascade
on delete cascade,
return_reason  enum('Defective','Wrong Item','Changed Mind','Damaged') default 'Defective' not null,
return_status  enum('Pending','Approved','Rejected','Refunded') default 'Pending' not null,
refund_amount decimal(10,2) default 0,
returned_at timestamp not null,
processed_at timestamp 
);

INSERT INTO returns
(order_item_id, product_id, customer_id, order_id, return_reason, return_status, refund_amount, returned_at, processed_at)
VALUES
(1,1,1,1,'Defective','Pending',2000.00,'2025-01-10 10:15:00','2025-02-15 09:20:00'),
(2,2,2,2,'Defective','Approved',3000.00,'2025-01-11 10:15:00','2025-02-15 09:20:00'),
(3,3,3,3,'Defective','Rejected',4000.00,'2025-01-12 10:15:00','2025-02-15 09:20:00'),
(4,4,4,4,'Defective','Refunded',5000.00,'2025-01-13 10:15:00','2025-02-15 09:20:00'),
(5,5,5,5,'Defective','Pending',2600.00,'2025-01-14 10:15:00','2025-02-15 09:20:00'),
(6,6,6,6,'Defective','Approved',6000.00,'2025-01-15 10:15:00','2025-02-15 09:20:00'),
(7,7,7,7,'Defective','Rejected',7000.00,'2025-01-16 10:15:00','2025-02-15 09:20:00'),
(8,8,8,8,'Defective','Refunded',8000.00,'2025-01-17 10:15:00','2025-02-15 09:20:00'),
(9,9,9,9,'Defective','Pending',2800.00,'2025-01-18 10:15:00','2025-02-15 09:20:00'),
(10,10,10,10,'Defective','Approved',3000.00,'2025-01-19 10:15:00','2025-02-15 09:20:00'),

(11,11,11,11,'Wrong Item','Pending',1000.00,'2025-03-10 10:15:00','2025-04-15 09:20:00'),
(12,12,12,12,'Wrong Item','Approved',2000.00,'2025-03-11 10:15:00','2025-04-15 09:20:00'),
(13,13,13,13,'Wrong Item','Rejected',3000.00,'2025-03-12 10:15:00','2025-04-15 09:20:00'),
(14,14,14,14,'Wrong Item','Refunded',4000.00,'2025-03-13 10:15:00','2025-04-15 09:20:00'),
(15,15,15,15,'Wrong Item','Pending',2500.00,'2025-03-14 10:15:00','2025-04-15 09:20:00'),
(16,16,16,16,'Wrong Item','Approved',6000.00,'2025-03-15 10:15:00','2025-04-15 09:20:00'),
(17,17,17,17,'Wrong Item','Rejected',7000.00,'2025-03-16 10:15:00','2025-04-15 09:20:00'),
(18,18,18,18,'Wrong Item','Refunded',8000.00,'2025-03-17 10:15:00','2025-04-15 09:20:00'),
(19,19,19,19,'Wrong Item','Pending',2800.00,'2025-03-18 10:15:00','2025-04-15 09:20:00'),
(20,20,20,20,'Wrong Item','Approved',9000.00,'2025-03-19 10:15:00','2025-04-15 09:20:00'),

(21,21,21,21,'Changed Mind','Pending',1000.00,'2025-05-10 10:15:00','2025-06-15 09:20:00'),
(22,22,22,22,'Changed Mind','Approved',2000.00,'2025-05-11 10:15:00','2025-06-15 09:20:00'),
(23,23,23,23,'Changed Mind','Rejected',3000.00,'2025-05-12 10:15:00','2025-06-15 09:20:00'),
(24,24,24,24,'Changed Mind','Refunded',4000.00,'2025-05-13 10:15:00','2025-06-15 09:20:00'),
(25,25,25,25,'Changed Mind','Pending',2500.00,'2025-05-14 10:15:00','2025-06-15 09:20:00'),
(26,26,26,26,'Changed Mind','Approved',6000.00,'2025-05-15 10:15:00','2025-06-15 09:20:00'),
(27,27,27,27,'Changed Mind','Rejected',7000.00,'2025-05-16 10:15:00','2025-06-15 09:20:00'),
(28,28,28,28,'Changed Mind','Refunded',8000.00,'2025-05-17 10:15:00','2025-06-15 09:20:00'),
(29,29,29,29,'Changed Mind','Pending',2800.00,'2025-05-18 10:15:00','2025-06-15 09:20:00'),
(30,30,30,30,'Changed Mind','Approved',9000.00,'2025-05-19 10:15:00','2025-06-15 09:20:00'),

(31,31,31,31,'Damaged','Pending',1000.00,'2025-07-10 10:15:00','2025-08-15 09:20:00'),
(32,32,32,32,'Damaged','Approved',2000.00,'2025-07-11 10:15:00','2025-08-15 09:20:00'),
(33,33,33,33,'Damaged','Rejected',3000.00,'2025-07-12 10:15:00','2025-08-15 09:20:00'),
(34,34,34,34,'Damaged','Refunded',4000.00,'2025-07-13 10:15:00','2025-08-15 09:20:00'),
(35,35,35,35,'Damaged','Pending',2500.00,'2025-07-14 10:15:00','2025-08-15 09:20:00'),
(36,36,36,36,'Damaged','Approved',6000.00,'2025-07-15 10:15:00','2025-08-15 09:20:00'),
(37,37,37,37,'Damaged','Rejected',7000.00,'2025-07-16 10:15:00','2025-08-15 09:20:00'),
(38,38,38,38,'Damaged','Refunded',8000.00,'2025-07-17 10:15:00','2025-08-15 09:20:00'),
(39,39,39,39,'Damaged','Pending',2800.00,'2025-07-18 10:15:00','2025-08-15 09:20:00'),
(40,40,40,40,'Damaged','Approved',9000.00,'2025-07-19 10:15:00','2025-08-15 09:20:00'),

(41,41,41,41,'Defective','Pending',1000.00,'2025-09-10 10:15:00','2025-10-15 09:20:00'),
(42,42,42,42,'Defective','Approved',2000.00,'2025-09-11 10:15:00','2025-10-15 09:20:00'),
(43,43,43,43,'Defective','Rejected',3000.00,'2025-09-12 10:15:00','2025-10-15 09:20:00'),
(44,44,44,44,'Defective','Refunded',4000.00,'2025-09-13 10:15:00','2025-10-15 09:20:00'),
(45,45,45,45,'Defective','Pending',2500.00,'2025-09-14 10:15:00','2025-10-15 09:20:00'),
(46,46,46,46,'Defective','Approved',6000.00,'2025-09-15 10:15:00','2025-10-15 09:20:00'),
(47,47,47,47,'Defective','Rejected',7000.00,'2025-09-16 10:15:00','2025-10-15 09:20:00'),
(48,48,48,48,'Defective','Refunded',8000.00,'2025-09-17 10:15:00','2025-10-15 09:20:00'),
(49,49,49,49,'Defective','Pending',2800.00,'2025-09-18 10:15:00','2025-10-15 09:20:00'),
(50,50,50,50,'Defective','Approved',9000.00,'2025-09-19 10:15:00','2025-10-15 09:20:00');


create table promotions(
promo_id int primary key auto_increment,
promo_code varchar(50) unique not null,
promo_name varchar(100) not null,
discount_type enum('PERCENTAGE','FIXED') not null,
discount_value decimal (10,2) not null,
check (discount_value>=0),
min_order_value decimal(10,2) default 0,
usage_limit int ,
time_used int  default 0,
start_date date not null,
end_date date not null,
check (end_date>start_date),
created_at timestamp default current_timestamp);



INSERT INTO promotions
(promo_code, promo_name, discount_type, discount_value, min_order_value, usage_limit, time_used, start_date, end_date, created_at)
VALUES
('NEW10','New User 10% Off','PERCENTAGE',10,500,100,20,'2025-01-01','2025-03-31','2024-12-20 10:15:00'),
('SAVE50','Flat 50 Off','FIXED',50,1000,200,45,'2025-01-05','2025-04-30','2024-12-22 11:30:00'),
('FEST20','Festival 20%','PERCENTAGE',20,1500,150,60,'2025-01-10','2025-05-15','2024-12-25 09:45:00'),
('WELCOME100','Welcome 100 Off','FIXED',100,2000,300,120,'2025-01-15','2025-06-30','2024-12-28 14:20:00'),
('FLASH15','Flash Sale 15%','PERCENTAGE',15,800,120,35,'2025-02-01','2025-04-01','2025-01-10 08:10:00'),
('MEGA200','Mega 200 Off','FIXED',200,3000,100,40,'2025-02-05','2025-06-01','2025-01-12 13:00:00'),
('SUPER25','Super 25%','PERCENTAGE',25,2500,90,30,'2025-02-10','2025-05-30','2025-01-15 15:25:00'),
('OFFER75','Special 75 Off','FIXED',75,1200,180,50,'2025-02-15','2025-06-15','2025-01-18 17:45:00'),
('BONUS5','Bonus 5%','PERCENTAGE',5,400,500,100,'2025-03-01','2025-07-01','2025-02-05 09:00:00'),
('DEAL300','Deal 300 Off','FIXED',300,5000,70,25,'2025-03-05','2025-08-01','2025-02-08 16:30:00'),

('SUMMER10','Summer 10%','PERCENTAGE',10,1000,250,75,'2025-03-10','2025-07-31','2025-02-12 10:40:00'),
('SPRING150','Spring 150 Off','FIXED',150,2000,200,80,'2025-03-15','2025-08-15','2025-02-15 12:15:00'),
('HOT30','Hot 30%','PERCENTAGE',30,3000,100,40,'2025-04-01','2025-09-01','2025-03-01 09:50:00'),
('COOL250','Cool 250 Off','FIXED',250,4000,90,35,'2025-04-05','2025-09-15','2025-03-03 14:10:00'),
('APRIL5','April 5%','PERCENTAGE',5,500,400,120,'2025-04-10','2025-10-01','2025-03-05 11:00:00'),
('MAY100','May 100 Off','FIXED',100,1500,220,95,'2025-04-15','2025-10-15','2025-03-08 18:25:00'),
('MID20','Mid Year 20%','PERCENTAGE',20,2500,180,70,'2025-05-01','2025-11-01','2025-04-01 08:45:00'),
('JUNE50','June 50 Off','FIXED',50,900,300,110,'2025-05-05','2025-11-15','2025-04-03 13:20:00'),
('JULY35','July 35%','PERCENTAGE',35,3500,60,20,'2025-05-10','2025-12-01','2025-04-05 15:55:00'),
('AUG400','August 400 Off','FIXED',400,6000,40,10,'2025-05-15','2025-12-15','2025-04-08 17:10:00'),

('FALL15','Fall 15%','PERCENTAGE',15,2000,150,60,'2025-06-01','2026-01-01','2025-05-01 09:25:00'),
('WINTER100','Winter 100 Off','FIXED',100,1200,200,85,'2025-06-05','2026-01-15','2025-05-03 11:40:00'),
('YEAR30','Year End 30%','PERCENTAGE',30,3000,100,45,'2025-06-10','2026-02-01','2025-05-05 14:15:00'),
('BLACK500','Black Friday 500 Off','FIXED',500,8000,30,12,'2025-06-15','2026-02-15','2025-05-08 16:45:00'),
('CYBER20','Cyber 20%','PERCENTAGE',20,2500,90,35,'2025-07-01','2026-03-01','2025-06-01 08:00:00'),
('LIMIT250','Limited 250 Off','FIXED',250,4500,60,25,'2025-07-05','2026-03-15','2025-06-03 10:20:00'),
('EXTRA10','Extra 10%','PERCENTAGE',10,1000,300,140,'2025-07-10','2026-04-01','2025-06-05 12:30:00'),
('DEAL150','Deal 150 Off','FIXED',150,2000,150,70,'2025-07-15','2026-04-15','2025-06-08 15:00:00'),
('SMART12','Smart 12%','PERCENTAGE',12,800,350,160,'2025-08-01','2026-05-01','2025-07-01 09:10:00'),
('PRO300','Pro 300 Off','FIXED',300,5000,80,30,'2025-08-05','2026-05-15','2025-07-03 11:45:00'),

('FEST25','Festival 25%','PERCENTAGE',25,3000,120,50,'2025-08-10','2026-06-01','2025-07-05 14:30:00'),
('BIG100','Big 100 Off','FIXED',100,1500,250,100,'2025-08-15','2026-06-15','2025-07-08 17:20:00'),
('SAVE18','Save 18%','PERCENTAGE',18,1800,170,60,'2025-09-01','2026-07-01','2025-08-01 08:50:00'),
('OCT200','October 200 Off','FIXED',200,3500,140,55,'2025-09-05','2026-07-15','2025-08-03 10:40:00'),
('DIWALI30','Diwali 30%','PERCENTAGE',30,4000,100,40,'2025-09-10','2026-08-01','2025-08-05 13:15:00'),
('LIGHT400','Light 400 Off','FIXED',400,7000,60,20,'2025-09-15','2026-08-15','2025-08-08 16:00:00'),
('HAPPY10','Happy 10%','PERCENTAGE',10,1000,300,120,'2025-10-01','2026-09-01','2025-09-01 09:30:00'),
('JOY150','Joy 150 Off','FIXED',150,2500,180,70,'2025-10-05','2026-09-15','2025-09-03 11:25:00'),
('NEWYEAR20','New Year 20%','PERCENTAGE',20,3000,200,90,'2025-10-10','2026-10-01','2025-09-05 14:10:00'),
('START500','Starter 500 Off','FIXED',500,9000,50,15,'2025-10-15','2026-10-15','2025-09-08 16:45:00'),

('BONANZA15','Bonanza 15%','PERCENTAGE',15,2000,160,55,'2025-11-01','2026-11-01','2025-10-01 09:00:00'),
('LUCKY250','Lucky 250 Off','FIXED',250,4000,120,40,'2025-11-05','2026-11-15','2025-10-03 12:20:00'),
('MEGA40','Mega 40%','PERCENTAGE',40,6000,70,22,'2025-11-10','2026-12-01','2025-10-05 15:35:00'),
('SAVE350','Save 350 Off','FIXED',350,5500,90,35,'2025-11-15','2026-12-15','2025-10-08 17:15:00'),
('GRAND22','Grand 22%','PERCENTAGE',22,2800,150,65,'2025-12-01','2027-01-01','2025-11-01 08:45:00'),
('VIP600','VIP 600 Off','FIXED',600,10000,30,10,'2025-12-05','2027-01-15','2025-11-03 11:10:00'),
('HOLIDAY12','Holiday 12%','PERCENTAGE',12,1200,300,110,'2025-12-10','2027-02-01','2025-11-05 14:00:00'),
('EXCLUSIVE450','Exclusive 450 Off','FIXED',450,7500,60,18,'2025-12-15','2027-02-15','2025-11-08 16:30:00'),
('ULTIMATE35','Ultimate 35%','PERCENTAGE',35,5000,80,28,'2026-01-01','2027-03-01','2025-12-01 09:20:00'),
('FINAL700','Final 700 Off','FIXED',700,12000,20,5,'2026-01-05','2027-03-15','2025-12-03 12:40:00');


create table order_promotions(
order_promo_id int primary key auto_increment,
order_id int,
promo_id int,
discount_applied decimal(10,2) not null,
applied_at timestamp default current_timestamp,
foreign key(order_id) references orders(order_id)
on update cascade
on delete cascade,
foreign key(promo_id)references promotions(promo_id)
on update cascade
on delete cascade);


INSERT INTO order_promotions
(order_id, promo_id, discount_applied, applied_at)
VALUES
(1,1,100.00,'2025-01-02 10:15:00'),
(2,2,50.00,'2025-01-06 11:20:00'),
(3,3,300.00,'2025-01-12 09:45:00'),
(4,4,100.00,'2025-01-18 14:10:00'),
(5,5,120.00,'2025-02-03 08:30:00'),
(6,6,200.00,'2025-02-10 13:40:00'),
(7,7,500.00,'2025-02-15 15:55:00'),
(8,8,75.00,'2025-02-20 17:25:00'),
(9,9,25.00,'2025-03-05 09:05:00'),
(10,10,300.00,'2025-03-10 16:45:00'),

(11,11,150.00,'2025-03-15 10:20:00'),
(12,12,150.00,'2025-03-20 12:35:00'),
(13,13,900.00,'2025-04-05 09:10:00'),
(14,14,250.00,'2025-04-12 14:25:00'),
(15,15,50.00,'2025-04-18 11:15:00'),
(16,16,100.00,'2025-04-25 18:05:00'),
(17,17,500.00,'2025-05-03 08:45:00'),
(18,18,50.00,'2025-05-10 13:30:00'),
(19,19,450.00,'2025-05-15 15:50:00'),
(20,20,400.00,'2025-05-20 17:10:00'),

(21,21,200.00,'2025-06-05 09:40:00'),
(22,22,100.00,'2025-06-10 11:55:00'),
(23,23,600.00,'2025-06-15 14:30:00'),
(24,24,500.00,'2025-06-20 16:45:00'),
(25,25,250.00,'2025-07-05 08:20:00'),
(26,26,250.00,'2025-07-10 10:35:00'),
(27,27,100.00,'2025-07-15 12:50:00'),
(28,28,150.00,'2025-07-20 15:05:00'),
(29,29,96.00,'2025-08-05 09:15:00'),
(30,30,300.00,'2025-08-10 13:25:00'),

(31,31,750.00,'2025-08-15 16:40:00'),
(32,32,100.00,'2025-08-20 10:05:00'),
(33,33,324.00,'2025-09-05 11:30:00'),
(34,34,200.00,'2025-09-10 14:45:00'),
(35,35,1200.00,'2025-09-15 17:20:00'),
(36,36,400.00,'2025-09-20 09:55:00'),
(37,37,100.00,'2025-10-05 12:10:00'),
(38,38,150.00,'2025-10-10 14:25:00'),
(39,39,600.00,'2025-10-15 16:50:00'),
(40,40,500.00,'2025-10-20 18:00:00'),

(41,41,300.00,'2025-11-05 09:35:00'),
(42,42,250.00,'2025-11-10 11:45:00'),
(43,43,2400.00,'2025-11-15 14:15:00'),
(44,44,350.00,'2025-11-20 16:30:00'),
(45,45,616.00,'2025-12-05 10:25:00'),
(46,46,600.00,'2025-12-10 13:40:00'),
(47,47,144.00,'2025-12-15 15:55:00'),
(48,48,450.00,'2025-12-20 17:10:00'),
(49,49,1750.00,'2026-01-05 09:20:00'),
(50,50,700.00,'2026-01-10 12:45:00');


create table product_inventory(
inventory_id int primary key auto_increment,
product_id int,
stock_quantity int not null default 0,
reserved_quantity int default 0,
restock_threshold int not null,
restock_quantity int not null,
unit_cost decimal(10,2) not null,
last_restocked_at timestamp,
updated_at timestamp default current_timestamp,
foreign key	(product_id) references products(product_id)
on update cascade
on delete cascade);

INSERT INTO product_inventory
(product_id, stock_quantity, reserved_quantity, restock_threshold, restock_quantity, unit_cost, last_restocked_at, updated_at)
VALUES
(1,120,10,30,100,500.00,'2025-01-05 10:00:00','2025-01-05 10:00:00'),
(2,80,5,20,80,750.00,'2025-01-08 11:30:00','2025-01-08 11:30:00'),
(3,40,8,25,75,1200.00,'2025-01-12 09:45:00','2025-01-12 09:45:00'),
(4,200,20,50,150,300.00,'2025-01-15 14:10:00','2025-01-15 14:10:00'),
(5,60,12,30,90,950.00,'2025-01-18 08:20:00','2025-01-18 08:20:00'),

(6,150,15,40,120,1500.00,'2025-02-01 13:40:00','2025-02-01 13:40:00'),
(7,30,5,25,70,2200.00,'2025-02-05 15:55:00','2025-02-05 15:55:00'),
(8,90,7,30,100,450.00,'2025-02-08 17:25:00','2025-02-08 17:25:00'),
(9,20,3,15,60,800.00,'2025-02-10 09:05:00','2025-02-10 09:05:00'),
(10,300,25,70,200,250.00,'2025-02-12 16:45:00','2025-02-12 16:45:00'),

(11,110,10,35,90,600.00,'2025-02-15 10:20:00','2025-02-15 10:20:00'),
(12,75,6,20,80,1300.00,'2025-02-18 12:35:00','2025-02-18 12:35:00'),
(13,45,5,20,70,1800.00,'2025-03-01 09:10:00','2025-03-01 09:10:00'),
(14,250,30,60,180,275.00,'2025-03-03 14:25:00','2025-03-03 14:25:00'),
(15,55,4,25,75,990.00,'2025-03-05 11:15:00','2025-03-05 11:15:00'),

(16,180,20,50,150,1450.00,'2025-03-08 18:05:00','2025-03-08 18:05:00'),
(17,25,2,20,65,2300.00,'2025-03-10 08:45:00','2025-03-10 08:45:00'),
(18,95,9,30,100,500.00,'2025-03-12 13:30:00','2025-03-12 13:30:00'),
(19,35,6,20,60,870.00,'2025-03-15 15:50:00','2025-03-15 15:50:00'),
(20,400,35,100,250,220.00,'2025-03-18 17:10:00','2025-03-18 17:10:00'),

(21,100,12,30,90,650.00,'2025-04-01 09:40:00','2025-04-01 09:40:00'),
(22,70,5,25,75,1200.00,'2025-04-03 11:55:00','2025-04-03 11:55:00'),
(23,50,7,20,65,1750.00,'2025-04-05 14:30:00','2025-04-05 14:30:00'),
(24,220,18,60,170,310.00,'2025-04-08 16:45:00','2025-04-08 16:45:00'),
(25,65,9,30,90,1020.00,'2025-04-10 08:20:00','2025-04-10 08:20:00'),

(26,170,14,45,130,1550.00,'2025-04-12 10:35:00','2025-04-12 10:35:00'),
(27,28,3,20,60,2400.00,'2025-04-15 12:50:00','2025-04-15 12:50:00'),
(28,85,6,30,95,480.00,'2025-04-18 15:05:00','2025-04-18 15:05:00'),
(29,22,2,15,55,820.00,'2025-04-20 09:15:00','2025-04-20 09:15:00'),
(30,310,22,75,200,260.00,'2025-04-22 13:25:00','2025-04-22 13:25:00'),

(31,130,11,35,100,700.00,'2025-05-01 16:40:00','2025-05-01 16:40:00'),
(32,78,5,25,80,1350.00,'2025-05-03 10:05:00','2025-05-03 10:05:00'),
(33,48,6,20,65,1820.00,'2025-05-05 11:30:00','2025-05-05 11:30:00'),
(34,240,20,65,180,290.00,'2025-05-08 14:45:00','2025-05-08 14:45:00'),
(35,58,7,30,85,980.00,'2025-05-10 17:20:00','2025-05-10 17:20:00'),

(36,160,13,40,120,1480.00,'2025-05-12 09:55:00','2025-05-12 09:55:00'),
(37,32,4,20,60,2350.00,'2025-05-15 12:10:00','2025-05-15 12:10:00'),
(38,92,8,30,100,520.00,'2025-05-18 14:25:00','2025-05-18 14:25:00'),
(39,38,5,20,65,880.00,'2025-05-20 16:50:00','2025-05-20 16:50:00'),
(40,420,40,110,300,210.00,'2025-05-22 18:00:00','2025-05-22 18:00:00'),

(41,105,10,30,90,670.00,'2025-06-01 09:35:00','2025-06-01 09:35:00'),
(42,68,4,25,75,1250.00,'2025-06-03 11:45:00','2025-06-03 11:45:00'),
(43,52,6,20,70,1780.00,'2025-06-05 14:15:00','2025-06-05 14:15:00'),
(44,230,19,60,170,305.00,'2025-06-08 16:30:00','2025-06-08 16:30:00'),
(45,62,8,30,85,1015.00,'2025-06-10 10:25:00','2025-06-10 10:25:00'),

(46,175,16,45,130,1520.00,'2025-06-12 13:40:00','2025-06-12 13:40:00'),
(47,27,3,20,60,2380.00,'2025-06-15 15:55:00','2025-06-15 15:55:00'),
(48,88,7,30,95,490.00,'2025-06-18 17:10:00','2025-06-18 17:10:00'),
(49,24,2,15,55,840.00,'2025-06-20 09:20:00','2025-06-20 09:20:00'),
(50,350,30,80,220,270.00,'2025-06-22 12:45:00','2025-06-22 12:45:00');

### 4.1  Customer Analytics  (Reports 01 - 05)

###01	
###Monthly Revenue Trend with MoM % Change	
###Sales Performance	
###CTE, LAG(), ROUND(), date truncation, percentage change formula

with monthly_revenue as (
select date_format(order_date,'%Y-%m')as month,
sum(total_amount) as total_revenue
from orders
where status= 'Delivered'
group By date_format(order_date,'%Y-%m') )

select month,
total_revenue,
lag(total_revenue) over (order by month) as previous_revenue,
round(((total_revenue-lag(total_revenue) over (order by month) )/lag(total_revenue) over (order by month) )*100,2)  as mom_percentage
from monthly_revenue;

###02	
###RFM Customer Scoring	
###Customer Analytics	
###CTE layering, DATEDIFF / date arithmetic, NTILE() or CASE WHEN tiering, composite score###

with customer_base as(
select customer_id,
max(order_date) as last_date,
count(order_id) as total_orders,
sum(total_amount) as total_spent
from orders
where status= 'Delivered'
group by customer_id),

customer_rfm as(
select customer_id,
datediff((select max(order_date)from orders),last_date) as recency_days,
total_orders,
total_spent
from customer_base),

rfm_scores as (select customer_id,
total_spent,
ntile(5) over (order by recency_days desc)as r_score,
ntile(5) over (order by total_orders  ) as f_score,
ntile(5) over (order by total_spent  ) as m_score
from customer_rfm
order by customer_id)

select
customer_id,
r_score,
f_score,
m_score,
(r_score+f_score+m_score) as total_score,
case 
   when (r_score+f_score+m_score) between  13 and 15 then 'Champions'
   when (r_score+f_score+m_score) between  10 and 12 then 'Loyal'
   when (r_score+f_score+m_score) between  7 and 9 then 'Potential'
   else 'At Risk'
end as segment   
   from rfm_scores
order by customer_id;

### 03	
### Customer Cohort Retention Table	
### Customer Analytics	
### DATE_TRUNC to month, first-order cohort via ROW_NUMBER, conditional COUNT, self-join

with customer_orders as (
     select 
         customer_id,
         date_format(order_date,'%Y-%m-01') as order_month,
         row_number() over (partition by customer_id order by order_date) as rn
      from orders
      where status = 'Delivered'),
      
cohort as(
    select customer_id,
    order_month as cohort_month
    from customer_orders
    where rn=1),
    
cohort_analysis as(
    select 
    c.customer_id,
    c.cohort_month,
    o.order_month,
    timestampdiff(MONTH,cohort_month,order_month) as month_number
    from cohort c
    join customer_orders o
       on c.customer_id=o.customer_id) , 
       
 cohort_counts as(
    select cohort_month,
    COUNT(DISTINCT CASE WHEN month_number = 0 THEN customer_id END) AS month_0,
    COUNT(DISTINCT CASE WHEN month_number = 1 THEN customer_id END) AS month_1,
    COUNT(DISTINCT CASE WHEN month_number = 2 THEN customer_id END) AS month_2,
    COUNT(DISTINCT CASE WHEN month_number = 3 THEN customer_id END) AS month_3
FROM cohort_analysis
GROUP BY cohort_month)

select cohort_month,
month_0,
month_1,
month_2,
month_3,
round(month_1/month_0 *100,2) as month0_retention,
round(month_2/month_0 *100,2) as month1_retention,
round(month_3/month_0 *100,2) as month2_retention
from cohort_counts
order by cohort_month;

### 04	
### First Purchase vs. Repeat Purchase Revenue Split	
### Customer Analytics	
###ROW_NUMBER() PARTITION BY customer_id, CTE, conditional SUM(), percentage of total

with customer_base as (
select 
    customer_id,
    order_id,
    total_amount,
    order_date,
    row_number () over (partition by customer_id order by order_date) as rn
    from orders
    where status='Delivered')
    
    select
	    sum(case when rn =1 then total_amount end) as first_purchase_revenue,
       sum(case when rn>1 then total_amount end ) as repeat_purchase_revenue,
       sum(total_amount) as total_revenue,
       round((sum(case when rn =1 then total_amount end)/sum(total_amount))* 100,2) as first_purchase_revenue_percent,
	   round((sum(case when rn >1 then total_amount end)/sum(total_amount))* 100 ,2)as repeat_purchase_revenue_percent
       from customer_base;
       

### 05
### Customer Churn Risk Segmentation	
### Customer A nalytics	
### MAX(order_date), DATEDIFF from today, CASE WHEN thresholds (30/60/90 days), segment labels    

with customer_data as (
select 
    customer_id,
    max(order_date) as last_purchase_date,
    datediff(curdate(),max(order_date)) as days_since_last_purchase
    from orders
    where status= 'Delivered'
    group by customer_id)
 

select customer_id,
days_since_last_purchase,
case
   when days_since_last_purchase between 0 and 30 then 'Active'
   when days_since_last_purchase between 31 and 60 then 'Low Risk'
   when days_since_last_purchase between 61 and 90 then 'Medium Risk'
   else  'High Risk'
end as Churn_risk
from   customer_data


### 4.2  Product & Inventory Intelligence  (Reports 06 - 09)

### 06				
### Product Margin Ranking by Category	
### Product Intelligence	
### RANK() PARTITION BY category ORDER BY margin DESC, (price - cost) / price formula, CTE

with product_data as(
select 
product_id,
product_name,
category,
price,
cost,
((price-cost)/price)as product_margin
from products)

select 
product_id,
product_name,
category,
product_margin,
rank() over  (partition by category order by product_margin desc) as Margin_ranking
from product_data

### 07	
### Low-Stock & Restock Alert Report	
### Inventory	
### JOIN product_inventory, WHERE stock_quantity <= restock_threshold, CASE WHEN urgency flag

with inventory_base as(
select p.product_id,
p.product_name,
pi.stock_quantity,
pi.restock_threshold
from products p
join product_inventory pi
on p.product_id= pi.product_id)

select product_id,
product_name,
stock_quantity,
restock_threshold,
case 
   when stock_quantity = 0 then  'Out of Stock' 
   when stock_quantity <= restock_threshold  * 0.5 then 'Critical'
   when stock_quantity <= restock_threshold then 'Urgent'
   else 'Normal'
end as Urgency_flag
from  inventory_base
ORDER BY stock_quantity ASC;  


### 08	
### Return Rate by Product and Category	
### Product Intelligence	
### JOIN returns + order_items + products, COUNT ratio, ROUND(), GROUP BY ROLLUP   
   

with return_base as (select p.category,
p.product_name,
count( distinct oi.order_item_id) as total_orders,
count(distinct r.return_id) as total_returns
from order_items oi
join products p on p.product_id = oi.product_id
left join returns r on r.order_item_id = oi.order_item_id 
group by p.category,p.product_name)

select
   product_name,
   category,
   total_orders,
   total_returns,
   round(total_returns/nullif (total_orders,0) *100,2) as return_rate
 from return_base  
 

### 09	
### Top and Bottom 5 Products by Net Revenue (after returns)	
### Product Intelligence	
### LEFT JOIN returns, SUM(line_total) - SUM(refund_amount), RANK() for top/bottom split 


with product_base as(select 
p.product_id,
p.product_name,
sum(oi.line_total) as total_revenue,
coalesce(sum(r.refund_amount),0) as total_refund,
(sum(oi.line_total)-coalesce(sum(r.refund_amount),0)) as net_revenue
from order_items oi
join products p on oi.product_id=p.product_id
left join returns r on oi.order_item_id = r.order_item_id
group by p.product_id,p.product_name),

ranks as (select
    product_id,
    product_name,
    total_revenue,
    total_refund,
    net_revenue,
    rank() over ( order by net_revenue desc) as top_rank,
    rank() over ( order by net_revenue asc ) as bottom_rank
    from product_base
    )
 
 select *
 from ranks
 where 
    top_rank<=5 or bottom_rank<=5
 order by net_revenue desc;   



### 4.3  Sales Performance & Promotions  (Reports 10 - 12)

### 10	
### Promotion Effectiveness Report	
### Sales Performance	
### LEFT JOIN order_promotions, conditional aggregation, AVG order value with vs. without promo

select 
    count(case when op.order_id is null then 1 end) 
        as orders_without_promo,
    count(case when op.order_id is not null then 1 end) 
        as orders_with_promo,
    sum(case when op.order_id is null then o.total_amount end) 
        as no_promo_revenue,
    sum(case when op.order_id is not null then o.total_amount end)  
        AS promo_revenue,
    round(
        sum(case when op.order_id is null then o.total_amount end)
        / nullif(count(case when  op.order_id is null then 1 end), 0),
        2
    ) AS avg_revenue_no_promo,
    round(
        sum(CASE WHEN op.order_id IS NOT NULL THEN o.total_amount END)
        / nullif(COUNT(CASE WHEN op.order_id IS NOT NULL THEN 1 END), 0),
        2
    ) AS avg_revenue_promo
from orders o
left join order_promotions op 
    on o.order_id = op.order_id
where o.status = 'Delivered';  
  

### 11	
### Weekly Sales Heatmap (Day of Week x Week Number)	
### Sales Performance	
### EXTRACT(DOW), EXTRACT(WEEK), SUM pivot using CASE WHEN columns, GROUP BY  

with base as(
select 
year(order_date) as year,
extract(week from order_date) as week,

sum(case when weekday(order_date)=0 then total_amount end ) as Monday,
sum(case when weekday(order_date)=1 then total_amount end ) as Tuesday,
sum(case when weekday(order_date)=2 then total_amount end ) as Wednesday,
sum(case when weekday(order_date)=3 then total_amount end ) as Thursday,
sum(case when weekday(order_date)=4 then total_amount end ) as Friday,
sum(case when weekday(order_date)=5 then total_amount end ) as Saturday,
sum(case when weekday(order_date)=6 then total_amount end ) as Sunday

from orders
where status= 'Delivered'
group by year(order_date),
extract(week from order_date)
)
 
 select * from base
 order by year,week;


### 12	
### Category Revenue Breakdown with Subtotals	
### Sales Performance	
### GROUP BY ROLLUP(category, product_name), GROUPING(), COALESCE for label formatting

SELECT VERSION();
select
    case
       when grouping(p.category)=1 then 'Grand Total'
       else p.category
    end as category,
    
    case 
       when grouping(p.product_name)=1 and grouping(p.category)=0 then 'Category Total'
       when grouping(p.category) =1 then Null
       else p.product_name
    end as product_name,  
    
    sum(oi.line_total) as total_revenue

from products p
join order_items oi 
on p.product_id = oi.product_id
join orders o
on oi.order_id= o.order_id
where o.status= 'Delivered' 
GROUP BY p.category, p.product_name WITH ROLLUP
order by p.category, p.product_name;