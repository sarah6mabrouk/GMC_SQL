create database Checkpoint_customers
use Checkpoint_customers;

create table Products (
ProductID int primary key,
ProductName varchar (50),
ProductType varchar (100),
Price decimal (4,2)
);

create table Customers (
CustomerID int primary key,
CustomerName varchar (100),
Email varchar (100),
Phone varchar (15)
);

create table Orders(
OrderID int primary key,
CustomerID int,
foreign key (CustomerID) references Customers(CustomerID),
OrderDate varchar (15)
);

create table OrderDetails (
OrderDetailID int primary key,
OrderID int,
foreign key (OrderID) references Orders(OrderID),
ProductID int,
foreign key (ProductID) references Products(ProductID),
Quantity int
);

create table ProductTypes(
ProductTypeID int primary key,
ProductTypeName varchar (50)
);

-- Insert Data
--Products 
insert into Products values
 (1, 'Widget A', 'Widget', 10.00),
( 2,  'Widget B', 'Widget', 15.00),
( 3,  'Gadget X',  'Gadget', 20.00),
( 4,  'Gadget Y', 'Gadget', 25.00),
( 5,  'Doohickey Z', 'Doohickey', 30.00);

--Customers Table:
insert into Customers values
(1,  'John Smith',  'john@example.com',  '123-456-7890'),
(2, 'Jane Doe',  'jane.doe@example.com',  '987-654-3210'),
(3, 'Alice Brown',  'alice.brown@example.com',  '456-789-0123');

--Orders Table:
insert into Orders values
( 101,  1,  '2024-05-01'),
( 102,  2,  '2024-05-02'),
( 103,  3,  '2024-05-01');

--OrderDetails Table:
insert into OrderDetails values
( 1,  101,  1,  2),
( 2,  101,  3,  1),
( 3,  102,  2,  3),
( 4,  102,  4,  2),
( 5,  103,  5,  1);

--ProductTypes Table:
insert into ProductTypes values
( 1,  'Widget'),
( 2,  'Gadget'),
( 3,  'Doohickey');

-- 1. Retrieve all products.
select*from Products

--2. Retrieve all customers
select*from Customers

--3. Retrieve all orders
select*from Orders

--4.Retrieve all order details.
select*from OrderDetails

--5. Retrieve all product types.
select*from ProductTypes


--6. Retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.
select Products.ProductID, ProductName, Quantity from Products
inner join OrderDetails
on Products.ProductID= OrderDetails.ProductID
where OrderDetailID is not null ;

--7. Retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.
select CustomerID from Orders 
group by CustomerID
having count(OrderDate) = 7;


--8. Retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.
select CustomerName, Count(OrderDetails.OrderID) 'Total num of Orders' from Customers
inner join Orders
on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails
on OrderDetails.OrderID = Orders.OrderID
group by CustomerName
order by count(OrderDetails.OrderID) desc ;


--9. Retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.
select top(1) ProductName, Quantity from Products
inner join OrderDetails
on OrderDetails.ProductID = Products.ProductID
order by Quantity desc


--10. Retrieve the names of customers who have placed an order for at least one widget.

select Customers.CustomerID, CustomerName from Customers
inner join Orders
on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails
on OrderDetails.OrderID = Orders.OrderID
where ProductID = 1 or ProductID = 2;


--11. Retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer.
select Customers.CustomerID, CustomerName, ProductType, Price*Quantity as 'Total cost' from Customers 
inner join Orders
on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails
on OrderDetails.OrderID = Orders.OrderID
inner join Products
on Products.ProductID = OrderDetails.ProductID
where ProductType = 'Widget' or ProductType='Gadget' group by Customers.CustomerID, Customers.CustomerNAme, ProductType, Price*Quantity;


--12. Retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.
select Customers.CustomerID, CustomerName from Customers
inner join Orders
on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails
on OrderDetails.OrderID = Orders.OrderID
where ProductID = 3 or ProductID = 4;

--13.Retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.

--------------------- first try with subqueries, didn't work, but love the idea.
select ProductID from Products where ProductType = 'Doohickey'; -- Product ID of producttype 'Doohickey' = 5;
select ProductID, OrderID from OrderDetails where ProductID = (select ProductID from Products where ProductType = 'Doohickey'); --for ProductID = 5, we have OrderID = 103;
select OrderID, CustomerID from Orders where OrderID =(select OrderID from OrderDetails where ProductID = (select ProductID from Products where ProductType = 'Doohickey')); -- OrderID = 103, for the cutomerID = 3, who has the ProductID = 5, which commanded the ProductType 'doohickey'
select CustomerID, CustomerName from Customers where CustomerID = (select CustomerID from Orders where OrderID =(select OrderID from OrderDetails where ProductID = (select ProductID from Products where ProductType = 'Doohickey')))

--------------------------Second try with Joins, it works!
select 
	Orders.OrderID, 
	CustomerName, 
	Products.ProductID,  
	ProductType, 
	Price, 
	Quantity, 
	Price*Quantity as 'total cost of Doohickeys' 
from 
	Products
inner join 
	OrderDetails on OrderDetails.ProductID = Products.ProductID
inner join 
	Orders on Orders.OrderID = OrderDetails.OrderID
inner join 
	Customers on Customers.CustomerID = Orders.CustomerID
where
	ProductType = 'Doohickey';



--14. Retrieve the names of the customers who have placed an order every day of the week, along with the total number of orders placed by each customer.
select CustomerID from Orders 
group by CustomerID
having count(OrderDate) = 7;

--15. Retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.

select 
	Customers.CustomerID, 
	CustomerName, 
	Orders.OrderID, 
	ProductType, 
	Quantity, 
	Price, 
	Quantity*Price as 'Cost' 
from 
	Customers
inner join 
	Orders on Orders.CustomerID = Customers.CustomerID
inner join 
	OrderDetails on OrderDetails.OrderID = Orders.OrderID
inner join 
	Products on Products.ProductID = OrderDetails.ProductID

where ProductType = 'Widget' or ProductType = 'Gadget'


-- total cost of orders:
SELECT 
    Orders.OrderID, 
	CustomerName,
    SUM(Quantity * Price) AS 'Total Cost'
FROM 
    Customers
INNER JOIN 
    Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN 
    OrderDetails ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN 
    Products ON Products.ProductID = OrderDetails.ProductID
WHERE 
    ProductType = 'Widget' OR ProductType = 'Gadget'
GROUP BY 
    Orders.OrderID, CustomerName;
