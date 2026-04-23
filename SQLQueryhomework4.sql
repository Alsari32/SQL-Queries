/*
Mutasem Alsari
Homework 4
September 22, 2025
*/
use CIS111_NorthWind

Select c.CompanyName,
		p.ProductName,
	o.OrderDate,
		od.UnitPrice,
	od.Quantity,
		(od.unitprice * od.quantity) as TotalCost,
		e.Lastname + ',' + e.Firstname as SalesPerson,
		sh.Companyname as ShippingCompany,
		su.CompanyName as SupplyingCompany

from Orders o inner join Customers c
on o.CustomerID=c.CustomerID
inner join Employees e 
on e.employeeid = o.EmployeeID
inner join shippers sh
on sh.shipperid = o.ShipVia
inner join [Order Details] od
on od.OrderID = o.OrderID
inner join products p 
on p.ProductID = od.ProductID
inner join Suppliers su
on su.SupplierID = p.SupplierID
where e.FirstName = 'Robert' and e.LastName = 'King'
and p.ProductName in ('Côte de Blaye' , 'Thüringer Rostbratwurst')
and od.Quantity >= 20
and (od.unitprice * od.quantity) > 175
order by
TotalCost desc,
od.UnitPrice asc;
/*results:
CompanyName	ProductName	OrderDate	UnitPrice	Quantity	TotalCost	SalesPerson	ShippingCompany	SupplyingCompany
Piccolo und mehr	Côte de Blaye	2020-11-13 00:00:00.000	210.80	50	10540.00	King,Robert	Federal Shipping	Aux joyeux ecclésiastiques
Mère Paillarde	Côte de Blaye	2021-01-23 00:00:00.000	210.80	49	10329.20	King,Robert	United Package	Aux joyeux ecclésiastiques
Save-a-lot Markets	Thüringer Rostbratwurst	2022-04-17 00:00:00.000	123.79	60	7427.40	King,Robert	United Package	Plutzer Lebensmittelgroßmärkte AG
Folk och fä HB	Thüringer Rostbratwurst	2022-04-01 00:00:00.000	123.79	50	6189.50	King,Robert	Federal Shipping	Plutzer Lebensmittelgroßmärkte AG
Richter Supermarkt	Thüringer Rostbratwurst	2021-09-12 00:00:00.000	123.79	36	4456.44	King,Robert	United Package	Plutzer Lebensmittelgroßmärkte AG
*/



