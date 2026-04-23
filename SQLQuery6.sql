/*
Mutasem Alsari
Homework 6
October 13
*/use CIS111_NorthWind--Question 1 - START


with Customer_CTE as (select CustomerID,CompanyName,ContactName,Address
from Customers
),

Orders_CTE as (select CustomerID,EmployeeID,OrderDate,
RequiredDate,ShipAddress,ShipVia
from Orders
),

Employees_CTE as (select EmployeeID,FirstName,LastName
from Employees
),

Shippers_CTE as (select ShipperID,CompanyName
from Shippers
)

select
C.CompanyName as [Company Name],C.ContactName as [Contact Name],
O.RequiredDate as [Required Date],O.ShipAddress as [Shipping Address],
C.Address

from Customer_CTE C inner join Orders_CTE O
on C.CustomerID = O.CustomerID
inner join Shippers S
on O.ShipVia = S.ShipperID

where O.requiredDate > O.OrderDate 
and O.ShipAddress <> C.Address
and S.CompanyName = 'speedy Express'
order by
C.CompanyName;

/* results:
Company Name	Contact Name	Required Date	Shipping Address	Address
Around the Horn	Thomas Hardy	2020-12-13 00:00:00.000	Brook Farm Stratford St. Mary	120 Hanover Sq.
Chop-suey Chinese	Yang Wang	2021-12-04 00:00:00.000	Hauptstr. 31	Hauptstr. 29
Chop-suey Chinese	Yang Wang	2022-04-17 00:00:00.000	Hauptstr. 31	Hauptstr. 29
Chop-suey Chinese	Yang Wang	2022-05-14 00:00:00.000	Hauptstr. 31	Hauptstr. 29
Richter Supermarkt	Michael Holz	2021-05-28 00:00:00.000	Starenweg 5	Grenzacherweg 237
*/
