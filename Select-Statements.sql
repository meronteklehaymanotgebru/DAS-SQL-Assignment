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
values (1,1,1,'2021-01-15',2,2400.00),
(2,2,2,'2021-03-22',1,300.00),
(3,3,3,'2021-05-10',4,2400.00),
(4,4,4,'2021-07-18',3,2400.00),
(5,5,5,'2021-09-25',2,500.00),
(6,6,6,'2021-11-30',1,100.00),
(7,7,1,'2021-05-10',1,200.00),
(8,1,2,'2021-05-10',1,1200.00),
(9,2,3,'2021-05-10',2,600.00),
(10,3,4,'2021-05-10',3,450.00),
(11,4,5,'2021-05-10',1,800.00),
(12,5,6,'2021-05-10',4,1000.00);
update organization.sales 
set total=600.00
where sales_id=3
update organization.sales
set sales_date='2022-12-29'
where sales_id=12

--question1
select * 
from organization.employees;
--question2
select first_name as first_name
from organization.employees;
--question3
select distinct e.department
from organization.employees e ;

--question4
select  count(*) as total_employees
from organization.employees;

--question5
select sum(salary) as total_salary
from organization.employees;

--question6
select avg(salary) as average_salary
from organization.employees;

--question7
select max(salary) as maximum_salary
from organization.employees;

--question8
select min(salary) as minimum_salary
from organization.employees;

--question9
select count(*) 
from organization.employees
where gender ilike 'male%';

--question10
select count(*) 
from organization.employees
where gender ilike 'female%';

--question11
select count(*)
from organization.employees
where hire_date between '2019-12-31' and '2021-1-1';

--question12
select avg(salary) as average_salary_it
from organization.employees
where department='IT';

--question13
select count(employee_id), e.department
from organization.employees e
group by e.department;

--question14
select e.department, sum(salary)
from organization.employees e
group by e.department;

--question15
select e.department as department_name, max(salary)
from organization.employees e
group by e.department;

--question16
select e.department as department_name, min(salary)
from organization.employees e
group by e.department;

--question17
select e.gender as gender, count(employee_id)
from organization.employees e
group by e.gender;

--question18
select e.gender as gender, avg(salary) as average_salary
from organization.employees e
group by e.gender;

--question19
select e.salary as salary
from organization.employees e
order by e.salary desc
limit 5;

--question20
select count(distinct e.first_name)
from organization.employees e;

--question21
select s.employee_id ,e.first_name,e.last_name, e.department, p.product_name as product_sold, s.total as sales_total, s.quantity as quantity_sold, s.sales_date as date_sold
from organization.sales s, organization.employees e, organization.products p
where e.employee_id=s.employee_id and s.product_id=p.product_id;

--question22
select e.employee_id as employee_id, e.hire_date as hired_date
from organization.employees e
order by e.hire_date asc
limit 10;

--question23
select  e.employee_id,e.first_name, e.last_name
from  organization.employees e
where e.employee_id not in (
select s.employee_id
from organization.sales s
);

--question24
select s.employee_id, e.first_name, e.last_name , sum(s.total)
from organization.sales s, organization.employees e
group by s.employee_id, e.first_name, e.last_name 

-- question25
select s.employee_id as high_earner,e.first_name, e.last_name, max(s.total) as highest_sales
from organization.sales s, organization.employees e
group by high_earner, e.first_name,e.last_name;

--question26
select  e.department, avg(s.quantity) as average_quantity
from organization.sales s, organization.employees e
where e.employee_id=s.employee_id 
group by e.department;

--question27
select s.employee_id, s.sales_date
from organization.sales s
where sales_date between '2020-12-31' and '2022-1-1';

--question28

limit 3;









