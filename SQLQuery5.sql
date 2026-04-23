/*
Mutasem Alsari		
Homework 5
September 29, 2025
*/
use CIS111_NorthWind
--Question 1 - START
--[We are going to take the companyname and group it then we are going to count the number of our orders and then we are going to find our total value]
select c.CompanyName,count(o.OrderID) as [Number of Orders]
,sum(UnitPrice*Quantity) as [Total Value]
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID
inner join [Order Details] od
on o.OrderID = od.OrderID
group by c.CompanyName
order by [Total Value],[Number of Orders]desc;
/*results
CompanyName	Number of Orders	Total Value
Centro comercial Moctezuma	2	100.80
Lazy K Kountry Store	2	357.00
Laughing Bacchus Wine Cellars	8	522.50
North/South	6	649.00
Galería del gastrónomo	8	836.70
Ana Trujillo Emparedados y helados	10	1402.95
Romero y tomillo	14	1467.29
Vins et alcools Chevalier	10	1480.00
GROSELLA-Restaurante	4	1488.70
Franchi S.p.A.	10	1545.70
Trail's Head Gourmet Provisioners	9	1571.20
Du monde entier	9	1615.90
Consolidated Holdings	7	1719.10
Cactus Comidas para llevar	11	1814.80
The Cracker Box	8	1947.24
La corne d'abondance	11	1992.05
Spécialités du monde	6	2423.35
Rancho grande	12	2844.10
Hungry Coyote Import Store	9	3063.20
Wilman Kala	17	3161.35
France restauration	6	3172.16
Blauer See Delikatessen	14	3239.80
The Big Cheese	7	3361.00
Océano Atlántico Ltda.	11	3460.20
Let's Stop N Shop	10	3490.02
Wolski  Zajazd	16	3531.95
Drachenblut Delikatessen	10	3763.21
Comércio Mineiro	10	3810.75
Pericles Comidas clásicas	14	4242.20
Lonesome Pine Restaurant	14	4258.60
Familia Arquibaldo	19	4438.90
Alfreds Futterkiste	12	4596.20
Toms Spezialitäten	14	4954.00
Morgenstern Gesundkost	11	5042.20
Bólido Comidas preparadas	6	5297.80
Princesa Isabel Vinhos	10	5317.10
Santé Gourmet	16	5735.15
B's Beverages	22	6089.90
Island Trading	23	6146.30
Wellington Importadora	19	6480.70
Que Delícia	24	6973.63
Furia Bacalhau e Frutos do Mar	20	7151.55
Tradição Hipermercados	13	7310.62
Antonio Moreno Taquería	17	7515.35
Reggiani Caseifici	22	7555.60
Magazzini Alimentari Riuniti	21	7603.85
Gourmet Lanchonetes	19	8702.23
Victuailles en stock	25	9937.10
La maison d'Asie	31	10272.35
Maison Dewey	17	10430.58
Die Wandernde Kuh	26	10653.85
Tortuga Restaurante	29	10812.15
Folies gourmandes	16	11666.90
Godos Cocina Típica	26	11830.10
Split Rail Beer & Ale	20	12489.70
Chop-suey Chinese	22	12886.30
Ricardo Adocicados	27	12924.40
Ottilies Käseladen	29	13157.50
Around the Horn	30	13806.50
Eastern Connection	21	15033.66
Old World Delicatessen	24	16325.15
Wartian Herkku	37	16617.10
Vaffeljernet	31	16643.80
Seven Seas Imports	26	17172.05
LILA-Supermercado	34	17825.06
LINO-Delicateses	35	17889.55
Simons bistro	15	18138.45
Blondesddsl père et fils	26	19088.00
Great Lakes Food Market	22	19711.13
Richter Supermarkt	30	20033.20
Lehmanns Marktstand	39	21282.02
Bottom-Dollar Markets	35	22607.70
HILARION-Abastos	45	23611.58
Bon app'	44	23850.95
Suprêmes délices	39	24704.40
Piccolo und mehr	23	26259.95
Berglunds snabbköp	52	26968.15
Frankenversand	48	28722.71
White Clover Markets	40	29073.45
Queen Cozinha	40	30226.10
Königlich Essen	39	31745.75
Mère Paillarde	32	32203.90
Folk och fä HB	45	32555.55
Hanari Carnes	32	34101.15
Rattlesnake Canyon Grocery	71	52245.90
Hungry Owl All-Night Grocers	55	57317.39
Ernst Handel	102	113236.68
Save-a-lot Markets	116	115673.39
QUICK-Stop	86	117483.39
*/
--Question 1 - END
--Question 2 - START
--[Find the count of the products and the value of items and stock and in order]
select s.ContactName as [ Company Contact name]
,COUNT(p.ProductID)as [Count of Products ] ,
sum(p.unitsinstock * p.unitprice) as [Value in Stock],
sum(p.unitsonorder*p.UnitsOnOrder) as [Value on Order]
from
products p inner join Suppliers s
on p.SupplierID = s.SupplierID
where s.ContactName is not null
group by s.ContactName
order by [Count of Products ];
/*results
 Company Contact name	Count of Products 	Value in Stock	Value on Order
Carlos Diaz	1	90.00	0
Marie Delamare	1	821.50	0
Sven Petersen	1	258.90	0
Robb Merchant	2	3083.45	0
Niels Petersen	2	1187.50	4900
Giovanni Giudici	2	1500.00	100
Guylène Nodier	2	5721.50	0
Jean-Guy Lauzon	2	2916.45	0
Lars Peterson	2	2733.00	0
Antonio del Valle Saavedra	2	3730.00	900
Chantal Goulet	2	4058.60	0
Dirk Luchte	2	533.25	4900
Eliane Noz	2	4991.00	0
Elio Rossi	3	775.20	6500
Charlotte Cooper	3	1155.00	6500
Cheryl Saylor	3	2642.00	0
Beate Vileid	3	1775.00	0
Chandra Leka	3	1671.15	100
Mayumi Ohno	3	1562.25	0
Michael Björn	3	3929.00	2500
Petra Winkler	3	3683.55	0
Regina Murphy	3	3690.00	0
Wendy Mackenzie	3	1326.00	0
Yoshi Nagase	3	3814.00	400
Anne Heikkonen	3	2282.25	3600
Shelley Burke	4	2833.80	10000
Peter Wilson	4	3575.00	1700
Martin Bein	5	3301.85	6400
Ian Devling	5	4409.65	100
*/
--Question 2 - END
--Question 3 - START
--[Finding the distinct contact name and lastname and counting the number of orders with a particular employee]
select distinct c.ContactName as [customer Contact name],
e.lastname as [employee last name],
COUNT(o.orderid) as [Count of Orders]
from customers c inner join Orders o
on c.CustomerID = o.CustomerID
inner join Employees e
on o.EmployeeID = e.EmployeeID
group by c.ContactName,e.LastName
having COUNT(o.orderid)>4
order by [Count of Orders]
/* results
customer Contact name	employee last name	Count of Orders
Paula Wilson	Davolio	5
Peter Franken	Davolio	5
Roland Mendel	Davolio	5
Horst Kloss	Leverling	5
Patricia McKenna	Leverling	5
Carlos Hernández	Peacock	5
Horst Kloss	Peacock	5
Roland Mendel	Peacock	5
Horst Kloss	Fuller	6
Christina Berglund	Leverling	6
Maria Larsson	Callaha	6
Jose Pavarotti	Davolio	6
--Question 3 - End