/* Chapter 15 Lab database */
/****** Create the database if not exist *****/
IF DB_ID('Cis111Chapter1415p2') IS NULL
 CREATE DATABASE Cis111Chapter1415p2
GO
/****** Change databases *****/
IF DB_ID('Cis111Chapter1415p2') IS NOT NULL
 USE Cis111Chapter1415p2
GO
/****** Drop the tables in the RRJ database if exist *****/
IF OBJECT_ID('Products') IS NOT NULL
 DROP TABLE Products
IF OBJECT_ID('Vendors') IS NOT NULL
 DROP TABLE Vendors
IF OBJECT_ID('Report') IS NOT NULL
 DROP VIEW Report
GO
/* ******** Create the Necessary tables in the RRJ database ******** */
USE Cis111Chapter1415p2
/* Create the Vendors table */
CREATE TABLE Vendors
(VendorID CHAR(3) NOT NULL PRIMARY KEY,
VendorName VARCHAR(25) NOT NULL,
VendorAddress VARCHAR(30) NOT NULL,
/* Table level constraint */
CHECK ((VendorID like '[a-z,A-Z][a-z,A-Z][a-z,A-Z]') AND
 (LEFT(VendorID, 3) = LEFT(VendorName, 3))))
GO
/* Create the Products table */
USE Cis111Chapter1415p2
CREATE TABLE Products
(ProductID INT NOT NULL IDENTITY PRIMARY KEY,
ProductName VARCHAR(20) NOT NULL,
ProductQty INT NOT NULL DEFAULT 0
CHECK (ProductQty >= 0 and ProductQty <= 10),
VendorID CHAR(3) NOT NULL REFERENCES Vendors (VendorID))
GO
/* Alter the table to add one field */
USE Cis111Chapter1415p2
ALTER Table Products
ADD ProductCost MONEY NOT NULL
GO

/* TRIGGER CREATION */

use Cis111Chapter1415p2
GO
IF OBJECT_ID('Products_INSERT_UPDATE') IS NOT NULL
DROP TRIGGER Products_INSERT_UPDATE
GO
CREATE TRIGGER Products_INSERT_UPDATE
ON Products
AFTER INSERT, UPDATE
AS
DECLARE @Cost MONEY
SET @Cost = (SELECT ProductCost FROM Inserted)
IF @Cost > 800
BEGIN
RAISERROR ('Cost too high', 1, 1)
RollBack Tran
End
GO

/* ******* Add records to each table ********
Add a record to the Vendors table */
Insert INTO Vendors
Values
('Bob', 'Bobs Hardware', '1505 Evergreen Dearborn MI'),
('Amy', 'Amys Sweet shop', '5111 Northpole, Christmas MI'),
('Dan', 'Dans Supply', '500 front st. Nome AK')
GO
/* Add records to the Products table */

Insert Products
Values
('Coffee maker',9, 'Bob', 500)
GO
Insert Products
Values
('Easy Bake Oven',3, 'Amy', 750)
GO
Insert Products
Values
('Cold Winter Heater',8,'Dan', 700)
GO

/*
a. The trigger fires becuase of line 50-53 because when 
an insert or update is performed on the product table.

b.The reason the script is having errors is because of line 79,80 
because the productcost = 1200 which is greater than 800 so the trigger stops
the insert by raising an error.


