/*
Mutasem Alsari
Homework 8-9
novermber 10,2025
*/
--Question 1 - START

use CIS111_GuitarShop

select '$' + CAST(itemprice as varchar(15)) as itemwithcast,
			CONVERT(decimal(10,4), itemprice) as itemconvert,
			'$' + FORMAT(itemprice, 'N2') as itemformat,
			NCHAR(cast(itemprice as int)) as itemnchar

from OrderItems

/*Results

itemwithcast
$1199.00
itemwithcast	itemconvert	itemformat	itemnchar
$1199.00	1199.0000	$1,199.00	ү
$489.99	489.9900	$489.99	Ǫ
$2517.00	2517.0000	$2,517.00	৕
$415.00	415.0000	$415.00	Ɵ
$1199.00	1199.0000	$1,199.00	ү
*/


--Question 1 - end
--Question 2 - START

select 
	c.FirstName + ' ' + left(c.lastname, 1) + '.' as Contact,
	'(' + substring(a.phone,1,3) + ')-' + 
	SUBSTRING(a.phone,5,3) + '-'+ SUBSTRING(a.phone,9,4) as Phone

from Customers c
join Addresses a on c.CustomerID = a.CustomerID
where c.FirstName in ('Art' ,'Allan')
AND SUBSTRING(a.Phone, 5, 1) = '6'
order by left(c.lastname, 1) desc;

/*Results

Art V.	(325)-667-7868
Allan S.	(201)-653-4472
Allan S.	(201)-653-4472

*/
--Question 2 - end
--Question 3 - START

use CIS111_NorthWind

select CustomerID,
		case shipcountry
			when 'Mexico' then 'MX'
			when 'Brazil' then 'BR'
		end as countrycode,
		count(orderId) as [Order shipped],
		RANK() OVER (ORDER BY COUNT(OrderID) DESC) AS Rank

from Orders
where ShipCountry IN ('Mexico', 'Brazil')
group by CustomerID, ShipCountry
order by [Order shipped] DESC;

/*Results
CustomerID
HANAR
CustomerID	countrycode	Order shipped	Rank
HANAR	BR	14	1
QUEEN	BR	13	2
RICAR	BR	11	3
TORTU	MX	10	4
GOURL	BR	9	5
*/

--Question 3 - end
--Question 4 - START

select FirstName + ' ' + LEFT(lastname,1) + '.' as contact,
	HomePhone
		
		
from Employees
order by lastname;

/*Results

contact
Steve B.
contact	HomePhone
Steve B.	(71) 555-4848
Laura C.	(206) 555-1189
Nancy D.	(206) 555-9857
Anne D.	(71) 555-4444
Andrew F.	(206) 555-9482

*/
--Question 4 - end









