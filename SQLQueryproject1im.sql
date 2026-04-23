/*
Mutasem alsari
project 1 impelmentation
11-30-2025
*/

create database CIS111_resturant

go
use CIS111_resturant;
go

--Creating the customers table--
CREATE TABLE customers (
	CustomerID INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(40) NOT NULL,
	Phone varchar(14),
	City varchar(25),
	State varchar(25),
	postalcode varchar(25));

--creating the suppliers table--
create table Suppliers (
	SupplierID int primary key identity,
	Companyname varchar(25) not null,
	ContactName varchar(25) not null,
	ContactTitle varchar(15),
	Address varchar(25) not null,
	City varchar(25) not null,
	Country varchar(25) not null,
	Phone varchar(15) not null);

--Creating the location table--
create table Location (
	LocationID int primary key identity,
	LocationName Varchar(25) not null,
	Locationtype varchar(25) not null check(locationtype in ('Physical' , 'Online')),
	Address varchar(25) not null,
	City varchar(25) not null,
	Country varchar(25) not null);

--creating table employees--
create table employees (
	EmployeeID int identity primary key,
	Firstname varchar(25) not null,
	Lastname varchar(25) not null,
	Title Varchar(25) not null,
	EmploymentType varchar(25) not null,
	paytype varchar(15) not null,
	pay decimal(10,2) not null,
	LocationID int not null references Location(LocationID));


	--creating the product table--
create table products (
	ProductID int identity primary key,
	Productname varchar(25) not null,
	Category varchar(25) not null,
	unitprice decimal(10,2) not null,
	QuantityInStock int not null,
	SupplierID int not null references Suppliers(SupplierID),
	LocationID int not null references location(LocationID));

--Creating the sales table--
Create Table Sales (
	SalesID INT identity primary key,
	SalesDate Date not null,
	CustomerID int not null References Customers(CustomerID),
	EmployeeID int not null References Employees(EmployeeID),
	LocationID int not null References Location(LocationID),
	TotalAmount Decimal(10,2) not null);



--creating the salesitem table--
create table SalesItems (
	SalesItemID int Identity primary key,
	SalesID int not null references Sales(SalesID),
	ProductID int not null references products(ProductID),
	Quantity int not null);



--rows--
INSERT INTO Customers (FirstName, LastName, Phone, City, State, PostalCode) VALUES
('John', 'Smith', '555-1001', 'Miami', 'FL', '33101'),
('Sarah', 'Lopez', '555-1002', 'Orlando', 'FL', '32801'),
('Kevin', 'Johnson', '555-1003', 'Tampa', 'FL', '33601'),
('Emily', 'Davis', '555-1004', 'Dallas', 'TX', '75201'),
('Michael', 'Lee', '555-1005', 'Houston', 'TX', '77001'),
('Rebecca', 'White', '555-1006', 'Chicago', 'IL', '60601'),
('David', 'Brown', '555-1007', 'Phoenix', 'AZ', '85001'),
('Ashley', 'Green', '555-1008', 'Atlanta', 'GA', '30301'),
('Daniel', 'Moore', '555-1009', 'New York', 'NY', '10001'),
('Tina', 'Adams', '555-1010', 'Boston', 'MA', '02101');

INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Country, Phone) VALUES
('FreshFoods Co', 'Mark Allen', 'Manager', '100 Market St', 'Miami', 'USA', '555-2001'),
('Global Produce', 'Anna Reed', 'Director', '55 River Rd', 'Houston', 'USA', '555-2002'),
('Veggie Bros', 'Tom Carter', 'Supervisor', '80 Pine St', 'Chicago', 'USA', '555-2003'),
('Sunrise Farms', 'Laura Kim', 'Rep', '90 Hill Rd', 'Dallas', 'USA', '555-2004'),
('OceanFresh', 'Henry Miles', 'Agent', '15 Bay Ave', 'Tampa', 'USA', '555-2005'),
('World Supply', 'Olivia Knox', 'Manager', '300 West St', 'New York', 'USA', '555-2006'),
('FarmDirect', 'James Knight', 'Owner', '222 Ranch Rd', 'Austin', 'USA', '555-2007'),
('Daily Harvest', 'Sophia Evans', 'Sales', '14 Harvest Ln', 'Phoenix', 'USA', '555-2008'),
('NatureHub', 'Brian Clark', 'Director', '91 Oak St', 'Boston', 'USA', '555-2009'),
('Premium Goods', 'Ella Moore', 'Manager', '75 Elm St', 'Atlanta', 'USA', '555-2010');

INSERT INTO Location (LocationName, LocationType, Address, City, Country) VALUES
('Miami Central', 'Physical', '101 Main St', 'Miami', 'USA'),
('Miami Online', 'Online', 'N/A', 'Miami', 'USA'),
('Orlando Branch', 'Physical', '200 Orange Ave', 'Orlando', 'USA'),
('Houston Branch', 'Physical', '55 Forest Rd', 'Houston', 'USA'),
('Dallas Online', 'Online', 'N/A', 'Dallas', 'USA'),
('Chicago Cafe', 'Physical', '19 River St', 'Chicago', 'USA'),
('Phoenix Online', 'Online', 'N/A', 'Phoenix', 'USA'),
('NYC Express', 'Physical', '88 Madison Ave', 'New York', 'USA'),
('Boston Bistro', 'Physical', '44 Beacon St', 'Boston', 'USA'),
('Atlanta Outlet', 'Physical', '301 Peach St', 'Atlanta', 'USA');

INSERT INTO Employees (FirstName, LastName, Title, EmploymentType, PayType, Pay, LocationID) VALUES
('Anna','Reed','Cashier','Full-Time','Hourly',18.50,1),
('Lucas','Green','Cook','Part-Time','Hourly',15.00,1),
('Sofia','Knight','Manager','Full-Time','Salary',52000,1),
('David','Lopez','Server','Full-Time','Hourly',17.00,3),
('Mark','Smith','Chef','Full-Time','Salary',48000,4),
('Emily','Cruz','Cashier','Part-Time','Hourly',14.50,6),
('Noah','Gray','Server','Part-Time','Hourly',13.75,9),
('Olivia','Young','Cook','Full-Time','Hourly',16.50,10),
('James','Hill','Host','Full-Time','Hourly',15.25,8),
('Rachel','Morris','Manager','Full-Time','Salary',54000,6);

INSERT INTO Products (ProductName, Category, UnitPrice, QuantityInStock, SupplierID, LocationID) VALUES
('Cheeseburger','Food',8.99,50,1,1),
('Veggie Wrap','Food',7.49,30,2,1),
('Chicken Sandwich','Food',9.25,40,3,3),
('Fries','Sides',3.50,100,4,3),
('Soda','Drink',1.99,200,5,4),
('Coffee','Drink',2.49,150,6,6),
('Salad','Food',6.99,35,7,6),
('Ice Cream','Dessert',4.25,25,8,9),
('Chicken Bowl','Food',10.49,45,9,10),
('Smoothie','Drink',5.50,20,10,8);

INSERT INTO Sales (SalesDate, CustomerID, EmployeeID, LocationID, TotalAmount) VALUES
('2025-01-05',1,1,1,15.98),
('2025-01-06',2,2,1,8.99),
('2025-01-06',3,4,3,12.49),
('2025-01-07',4,5,4,9.25),
('2025-01-07',5,7,9,6.50),
('2025-01-08',6,3,1,14.49),
('2025-01-09',7,9,8,11.25),
('2025-01-10',8,6,6,7.99),
('2025-01-11',9,1,1,16.48),
('2025-01-11',10,8,10,10.49);

INSERT INTO SalesItems (SalesID, ProductID, Quantity) VALUES
(1, 1, 2),   -- Cheeseburger x2
(2, 1, 1),
(3, 4, 1),
(4, 3, 1),
(5, 6, 1),
(6, 2, 2),
(7, 10, 1),
(8, 7, 1),
(9, 1, 1),
(10, 9, 1);


--View customer purchase summary--
go
create view purchasesummary as
select
	c.customerID,
	c.Firstname,
	c.Lastname,
	sum(s.totalamount) as totalvaluepurcheased,
	sum(si.quantity) as totalitemspurchased,
	max(s.salesDate) as mostrecentpurchase
from customers c
join Sales s on s.CustomerID = c.CustomerID
join SalesItems si on si.SalesID = s.SalesID
group by c.CustomerID, c.FirstName,c.LastName;

go
go
create procedure reordersupplies
as
begin
	select
		ProductID,
		productname,
		quantityinstock,
		'Reorder needed' as status
	from products
	where quantityinstock = 0;
end;
go

create trigger trg_updateinventory
on Salesitems
after insert
as 
begin 
	update p
	set p.Quantityinstock = p.quantityinstock - i.quantity
	from products p
	join inserted i on p.ProductID = i.ProductID;
end;
go







