create database CIS111_Ch11_MA;
use CIS111_Ch11_MA


CREATE TABLE Advisors (
    AdvisorID INT PRIMARY KEY IDENTITY,
    AdvisorFirstName VARCHAR(30) NOT NULL,
    AdvisorLastName VARCHAR(40) NOT NULL
);




CREATE TABLE Students (
	StudentID INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(40) NOT NULL,
	Gender char(1) not null check (Gender in ('M','F','O')),
	DateofBirth Date not null,
	PhoneNumber varchar(14),
	Major VARCHAR(50),
	AdvisorID INT REFERENCES Advisors(AdvisorID)
	
);


ALTER TABLE Students
ADD Email VARCHAR(100);

ALTER TABLE Students
DROP COLUMN Major;


insert into Advisors (AdvisorFirstName,AdvisorLastName)
values ('Mutasem' , 'Alsari');

insert into Students (FirstName,LastName,Gender,DateofBirth,PhoneNumber,Email,AdvisorID)
values ('Mutasem' , 'Alsari' , 'M', '1999-04-25' , '313-555_4322','jakeiss@gamil.com',1 )


select *
from Students

/*Results for student

StudentID	FirstName	LastName	Gender	DateofBirth	PhoneNumber	AdvisorID	Email
2	Mutasem	Alsari	M	1999-04-25	313-555_4322	1	jakeiss@gamil.com

*/



select *
from Advisors

/*results for advisor

AdvisorID	AdvisorFirstName	AdvisorLastName
1	Mutasem	Alsari
*/


