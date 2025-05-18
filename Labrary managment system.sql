create database Library;
use Library

create table Library(
Library_ID int primary key,
Name varchar(10),
Location VARCHAR(50),
EstablishedYear int
)

create table Library_ContactNumber(
Library_ID int,
ContactNumber VARCHAR(15),
primary key(Library_ID,ContactNumber),
foreign key (Library_ID) references Library(Library_ID),
)
create table Staff(
Staff_ID int primary key,
Position VARCHAR(30),
F_Name varchar(10),
L_Name varchar(10),
Library_ID int,
foreign key (Library_ID) references Library(Library_ID),
)

create table Staff_ContactNumber(
Staff_ID int,
ContactNumber VARCHAR(15),
primary key(Staff_ID,ContactNumber),
foreign key (Staff_ID) references Staff(Staff_ID),
)

create table Book(
Book_ID int primary key,
ISBN VARCHAR(20),
Title VARCHAR(30),
Price DECIMAL(10, 2),
ShelfLocation VARCHAR(20),
Genre VARCHAR(50),
AvailableStatus bit,
Library_ID int,
foreign key (Library_ID) references Library(Library_ID),
)

create table Member (
Member_Id int primary key,
Email VARCHAR(255) NOT NULL UNIQUE,
F_Name varchar(10),
L_Name varchar(10),
StartDate DATE,
)

create table Member_ContactNumber(
Member_Id int,
ContactNumber VARCHAR(15),
primary key(Member_Id,ContactNumber),
foreign key (Member_Id) references Member(Member_Id),
)

create table Loan(
Loan_ID int primary key,
Status VARCHAR(20),
ReturnDate DATE,
DueDate DATE,
LoanDate DATE,
Book_ID int,
Member_Id int,
foreign key (Book_ID) references book(Book_ID),
foreign key (Member_Id) references Member(Member_Id),
)

create table Fine_Payment(
Fine_Payment_Id int primary key,
PaymentDate DATE,
Method VARCHAR(30),
Amount DECIMAL(10, 2),
Loan_ID int ,
foreign key (Loan_ID) references Loan(Loan_ID),
)

create table Review(
Review_Id int primary key,
Comments VARCHAR(100),
Rating int,
ReviewDate DATE,
Book_ID int,
Member_Id int,
foreign key (Book_ID) references book(Book_ID),
foreign key (Member_Id) references Member(Member_Id),)

alter table Book
add Member_Id int foreign key references Member (Member_Id);