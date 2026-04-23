/*
Mutasem Alsari
homework 13
11-29-2025
*/
use CIS111_NorthWind
--question 1-start--

go

create view USAorders as 
select o.*
from Orders o join
Employees e
on o.EmployeeID = e.EmployeeID
where e.Country = 'USA';

go

select top 5 *
from USAorders;

/*Results
OrderID	CustomerID	EmployeeID	OrderDate	RequiredDate	ShippedDate	ShipVia	Freight	ShipName	ShipAddress	ShipCity	ShipRegion	ShipPostalCode	ShipCountry
10250	HANAR	4	2020-07-08 00:00:00.000	2020-08-05 00:00:00.000	2020-07-12 00:00:00.000	2	65.83	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10251	VICTE	3	2020-07-08 00:00:00.000	2020-08-05 00:00:00.000	2020-07-15 00:00:00.000	1	41.34	Victuailles en stock	2, rue du Commerce	Lyon	NULL	69004	France
10252	SUPRD	4	2020-07-09 00:00:00.000	2020-08-06 00:00:00.000	2020-07-11 00:00:00.000	2	51.30	Suprêmes délices	Boulevard Tirou, 255	Charleroi	NULL	B-6000	Belgium
10253	HANAR	3	2020-07-10 00:00:00.000	2020-07-24 00:00:00.000	2020-07-16 00:00:00.000	2	58.17	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brazil
10256	WELLI	3	2020-07-15 00:00:00.000	2020-08-12 00:00:00.000	2020-07-17 00:00:00.000	2	13.97	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brazil
*/

--question 1 -end--
--question 2 -start--

go

create view USAorderdetails as 
select OD. *
from [Order Details] OD
join orders o 
on OD.OrderID = o.OrderID
join Employees e
on o.EmployeeID = e.EmployeeID
where e.Country = 'USA';

go

select top 5 *
from USAorderdetails;

/*Results
10258	2	15.20	50	0.2
10258	5	17.00	65	0.2
10258	32	25.60	6	0.2
10270	36	15.20	30	0
10270	43	36.80	25	0
*/

--question 2-end--