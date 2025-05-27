create schema organization;
create table organization.employees(
employee_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(20) not null,
department varchar(100) not null,
hire_date date,
salary decimal
);
--CREATE TABLE organization.sales (
--    sale_id varchar(15) primary key,
--    employee_id varchar(15) references organization.employees(employee_id),
--    sale_date date,
--    product_category varchar(50),
--    quantity int,
--    revenue decimal
--);

insert INTO organization.employees(employee_id,first_name,last_name,gender,department,hire_date,salary)
VALUES(1,'John','Doe','Male','IT','2028-05-01',60000.00),
      (2,'Jane','Smith','Female','HR','2019-06-15',50000.00),
      (3,'Michael','Johnson','Male','Finance','2017-03-10',75000.00),
      (4,'Emily','Davis','Female','IT','2020-11-20',70000.00),
      (5,'Sarah','Brown','Female','Marketing','2016-07-30',45000.00),
      (6,'David','Wilson','Male','Sales','2019-01-05',55000.00),
      (7,'Chris','Taylor','Male','IT','2022-02-25',65000.00);
create table organization.products(
product_id int primary key,
product_name varchar(15),
category varchar(50),
price decimal(6,2),
stock int
);
insert into organization.products (product_id,product_name,category,price,stock)
values(1,'Laptop','Electronics',1200.00,30),
(2,'Desk','Furniture',300.00,50),
(3,'Chair','Furniture',150.00,200),
(4,'Smartphone','Electronics',800.00,75),
(5,'Monitor','Electronics',250.00,40),
(6,'Bookshelf','Furniture',100.00,60),
(7,'Printer','Electronics',200.00,25);
create table organization.sales (
sales_id INT primary key,
product_id INT references organization.products(product_id),
employee_id int references organization.employees(employee_id),
sales_date DATE not null,
quantity INT not null,
total decimal(8,2)
);
insert into organization.sales(sales_id, product_id,employee_id, sales_date, quantity, total)
values
(1,1,1,'2021-01-15',2,2400.00),
(2,2,2'2021-03-22',1,300.00),
(3,3,3,'2021-05-10',4,2400.00),
(4,4,4,'2021-07-18',3,2400.00),
(5,5,5,'2021-09-25',2,500.00),
(6,6,6,'2021-11-30',1,100.00),
(7,7,1,'2021-05-10',1,200.00),
(8,1,2,'2021-05-10',1,1200.00),
(9,2,3'2021-05-10',2,600.00),
(10,3,4,'2021-05-10',3,450.00),
(11,4,5,'2021-05-10',1,800.00),
(12,5,6,'2021-05-10',4,1000.00);
select * from shop.sales_table

--question1
select * 
from organization.employees;
--question2
select first_name as first_name
from organization.employees;
--question3
select department,count(department) as total
from organization.employees
group by department
having total=1

--question4
select  count(*)
from organization.employees;


--question5

--question6
--question7


