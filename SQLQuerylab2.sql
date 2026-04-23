/*
Mutasem Alsari
LAB 2
october 25,2025
*/
use CIS111_NorthWind

--Quesiton 1-Start

select COUNT(orderid) as [Number of Orders]
from Orders;

/* results:
Number of Orders
830
*/
--Quesiton 1-end
--Quesiton 2-Start

select SUM(unitprice * unitsinstock) as Prices
from Products;

/*Results:
Prices
74050.85
*/
--Question 2-end
--question 3-start

select max(unitprice * quantity *(1-discount)) as [The most expensive item]
from [Order Details];

/*Results:
The most expensive item
15810
*/
--Question 3-end
--Question 4-start

select LastName
from Employees
where BirthDate = (select min(birthdate)
from Employees);

/* Results
LastName
Peacock
*/

--Question 4-end
--Question 5-start
SELECT DISTINCT CompanyName  
FROM Customers 
where CustomerID In (select CustomerID from Orders)
ORDER by CompanyName;

/* Results: 
CompanyName
Berglunds snabbköp
CompanyName
Alfreds Futterkiste
Ana Trujillo Emparedados y helados
Antonio Moreno Taquería
Around the Horn
Berglunds snabbköp
*/
--Question 5 -End
--Question 6 -Start

SELECT ContactName
FROM Customers 
where CustomerID not In (select CustomerID from Orders)
ORDER by CompanyName;

/* Results:
ContactName
Diego Roel
Marie Bertrand
*/

select * into CustomersCopy
from Customers
where ContactTitle = 'sales Representative'

--Question 7 -End
--Question 8 -start

merge into customerscopy as Cc
using(select CustomerID, CompanyName, ContactName, ContactTitle, Address, 
City, Region, PostalCode, Country  from customerscopy where country = 'germany') as c
on cc.customerid = c.customerid
when not matched by target then
INSERT (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country)
    VALUES (c.CustomerID, c.CompanyName, c.ContactName,
    c.ContactTitle, c.Address, c.City, c.Region, c.PostalCode, c.Country);


--Question 8 -End
--Question 9 -start
select ContactName,ContactTitle,Country,Phone,Fax
from CustomersCopy
order by ContactName;

/*results:
ContactName
Guillermo Fernández
ContactName	ContactTitle	Country	Phone	Fax
Anabela Domingues	Sales Representative	Brazil	(11) 555-2167	(11) 555-2168
Carlos Hernández	Sales Representative	Venezuela	(5) 555-1340	(5) 555-1948
Daniel Tonini	Sales Representative	France	30.59.84.10	30.59.85.11
Elizabeth Brown	Sales Representative	UK	(171) 555-2282	(171) 555-9199
Guillermo Fernández	Sales Representative	Mexico	(5) 552-3745	(5) 545-3745
*/
--queestion 9-end