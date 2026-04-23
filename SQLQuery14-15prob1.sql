/*
Mutasem Alsari
homework 14-15
11-24-2025
problem 1
*/
use Cis111Chapter1415p1

declare @inventoryMA table (
	VendorID varchar(20),
	VendorName varchar(25)
	,ProductName varchar(25)
);

insert into @inventoryMA (VendorID, VendorName, ProductName)
select v.vendorID, v.vendorname,p.productname
from vendors v join
Products p on v.VendorID = p.VendorID
where p.ProductName like '%coffee%';

declare @Find table (
	Results varchar(255)
	);

declare cur cursor for
select Vendorid,vendorname,productname
from @inventoryMA

 
declare @vendorId varchar(20);
declare @VendorName varchar(25);
declare @ProductName varchar(25);

open cur;

fetch next from cur into @vendorId, @vendorname,@productname;

while @@FETCH_STATUS = 0
begin
	if @vendorId = 'Bob'
	begin
		insert into @Find(Results)
		values ('The ' + @ProductName + ' is from ' +@VendorName);
	end;

	fetch next from cur into @vendorId,@VendorName,@ProductName;
end;
close cur;
deallocate cur;

select *
from @Find;

/*Results

Results
The Coffee maker is from Bobs Hardware
The Giant Coffee grinder is from Bobs Hardware

*/

