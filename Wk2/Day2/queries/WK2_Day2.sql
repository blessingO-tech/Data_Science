create table customers303(
	customerid INT primary key,
	firstname CHAR (20),
	lastname CHAR (20),
	country CHAR (50),
	score INT
	)

	create table employees303(
	employeeid INT primary key,
	firstname CHAR (20),
	lastname CHAR (20),
	department CHAR (50),
	birthdate date, 
	gender CHAR (1),
	salary INT,
	managerid INT
	
); 

CREATE TABLE products303 (
    productid   INT PRIMARY KEY,
    product     TEXT,
    category    TEXT,
    price       NUMERIC
); 

CREATE TABLE orders303 (
    orderID        INT PRIMARY KEY,
    productID      INT REFERENCES products303(productID),
    customerID     INT REFERENCES customers303(customerid),
    salesPersonID  INT REFERENCES employees303(employeeid),
    orderDate      DATE,
    shipDate       DATE,
    orderStatus    TEXT,
    shipAddress    TEXT,
    billAddress    TEXT,
    quantity       INT,
    sales          NUMERIC,
    creationTime   TIMESTAMP WITHOUT TIME ZONE
);

--Drops table orders303,employees303,customers303 and products303
Drop table orders303, employees303, customers303, products303

--One SQL query that returns a single row containing the count of rows in each table.
SELECT
  (SELECT COUNT(*) FROM customers) AS customer_count,
  (SELECT COUNT(*) FROM employees) AS employee_count,
  (SELECT COUNT(*) FROM products)  AS product_count,
  (SELECT COUNT(*) FROM orders)   AS order_count;

--showing orders less or equal to twenty oredered within a particular date
Select *
from orders
Where sales <= 20
And orderdate >= '2025-01-01';

--showing orders with that have been shipped and total count greater than three
Select *
From orders
Where quantity >= 3
Or orderstatus = 'shipped';

--showing orders not yet delivered and owned by a particular customer
Select *
From orders
Where NOT orderstatus = 'delivered'
And customerid = 4;

--select products where price is between 15 and 25
Select *
From products
Where price BETWEEN 15 and 25;

--Showing products that are in one or more categories
Select productid, product, category, price
From products
Where category IN ('clothing', 'Accessories'); 


--Showing customers whose name starts with M
Select *
From customers
Where firstname LIKE 'M%'; 

Select 
    o.orderid,
    o.orderdate,
    p.product,
    c.firstname,
	c.lastname,
    o.quantity,
    o.sales
From orders o
INNER JOIN products p ON o.productid = p.productid
INNER JOIN customers c ON o.customerid = c.customerid
ORDER by orderdate, orderid;

--Inserting a new dummy product
Insert into products (productid, product, category, price)
Values 
    (106, 'cake', 'snacks', 50);

select *
from products
    
--updating the shipdate interval
Update orders
Set shipdate = orderdate + INTERVAL '5 days'
Where shipdate IS NULL;

--deleting the dummy product
delete 
From products
WHERE productid = 106

--combining orders with products
select 
    p.productid,
    p.product,
    p.category,
    o.orderid,
    o.quantity,
    o.sales
from products p
left join orders o on p.productid = o.productid
order by quantity DESC; 



