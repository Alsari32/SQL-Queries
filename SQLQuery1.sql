/*
Mutasem Alsari
Homework 1
september 8
*//*1) One example of a non-primary key is an email address2)Its a good idea because it improves query performance and its a bad idea becasue indexes take up extra storage.3)CHAR and VARCHAR are different because of the way they handelstorage.One advantage of CHAR is it has faster access for valueswith consistent length. One advantage of VARCHAR is it saves storage when values vary.4)4.1) Create,Alter, and drop.4.2) Select, Insert, Update, and delete.4.3)Create, alter, and drop.4.4) Select,Insert,Update, and Delete/4.5) Insert,Update,and Delete.4.6) Create, Alter,and drop*/CREATE TABLE Sultanscars (
    Car_plate INT PRIMARY KEY,
    Car_modal VARCHAR(15),
    Car_make varchar(15),
    Purchase_date date,
    Car_year Date
);

SELECT * FROM Sultanscars;

/*
7)
a) Add foreign key to cources with uniquness
b)Add foreign key to cources with without uniquness
c) Create a new junction talbe.