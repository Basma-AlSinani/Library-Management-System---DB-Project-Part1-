create database  Library_Management_System ;
use Library_Management_System

create table Library(
Library_ID int primary key identity(1,1 ),
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
Staff_ID int primary key identity(1,1 ),
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
Book_ID int primary key identity(1,1 ),
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
Member_Id int primary key identity(1,1 ),
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
Loan_ID int primary key identity(1,1 ),
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
Fine_Payment_Id  int primary key identity(1,1 ),
PaymentDate DATE,
Method VARCHAR(30),
Amount DECIMAL(10, 2),
Loan_ID int ,
foreign key (Loan_ID) references Loan(Loan_ID),
)

create table Review(
Review_Id  int primary key identity(1,1 ),
Comments VARCHAR(100),
Rating int,
ReviewDate DATE,
Book_ID int,
Member_Id int,
foreign key (Book_ID) references book(Book_ID),
foreign key (Member_Id) references Member(Member_Id),)

alter table Book
add Member_Id int foreign key references Member (Member_Id);

--insert data
--library table 
insert into Library(Name,Location,EstablishedYear)
VALUES ('Central Library', 'New York', 1995);

insert into Library(Name,Location,EstablishedYear)
VALUES ('City Library', 'Los Angeles', 2000);

insert into Library(Name,Location,EstablishedYear)
VALUES ('Muscat Library', 'Muscat', 2003);
--library ContactNumber  table 
INSERT INTO Library_ContactNumber(Library_ID, ContactNumber)
VALUES 
(2, '1234567890'),
(2, '0987654321'),
(4, '5556667777');
 
INSERT INTO Staff (Position, F_Name, L_Name, Library_ID)
VALUES 
('Manager', 'John', 'Doe', 2),
('Librarian', 'Anna', 'Smith', 3),
('Assistant', 'Mike', 'Brown', 4);

INSERT INTO Staff_ContactNumber (Staff_ID, ContactNumber)
VALUES 
(1, '1112223333'),
(2, '2223334444'),
(3, '3334445555');

INSERT INTO Member (Email, F_Name, L_Name, StartDate)
VALUES 
('alice@example.com', 'Alice', 'Walker', '2023-01-15'),
('bob@example.com', 'Bob', 'Marley', '2023-02-10');

INSERT INTO Member_ContactNumber (Member_Id, ContactNumber)
VALUES 
(1, '4445556666'),
(2, '5556667777');

INSERT INTO Member_ContactNumber (Member_Id, ContactNumber)
VALUES (1, '4445556666');

INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus)
VALUES 
('9781234567890', 'SQL Basics', 50.00, 'A1', 'Education', 1),
('9780987654321', 'C# Programming', 75.50, 'B2', 'Programming', 0);

INSERT INTO Loan (Status, ReturnDate, DueDate, LoanDate, Book_ID, Member_Id)
VALUES 
('Returned', '2023-04-01', '2023-03-30', '2023-03-15', 2, 2),
('Pending', NULL, '2023-05-25', '2023-05-10', 5, 1);

INSERT INTO Fine_Payment (PaymentDate, Method, Amount, Loan_ID)
VALUES 
('2023-04-02', 'Credit Card', 10.00, 3);

INSERT INTO Review (Comments, Rating, ReviewDate, Book_ID, Member_Id)
VALUES 
('Great book on SQL!', 5, '2023-04-05', 5, 1),
('Very useful for beginners.', 4, '2023-04-07', 2, 2);


--select 
select *
from Library

select *
from Review

select *
from Fine_Payment
select *
from Loan


select *
from Library_ContactNumber

select *
from Staff

select *
from  Staff_ContactNumber

select *
from Member

select *
from Member_ContactNumber

select *
from Book
alter table Library
drop column Name;

alter table book
drop column Member_Id;

ALTER TABLE Library
ADD Name VARCHAR(50);

DELETE FROM Member_ContactNumber
WHERE Member_Id = 1 AND ContactNumber = '4445556666';

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Book';

ALTER TABLE Book
ADD CONSTRAINT FK_Book_Member
FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id);

INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus, Library_ID, Member_Id)
VALUES 
('9781234567890', 'SQL Basics', 50.00, 'A1', 'Education', 1, 2, 1),
('9780987654321', 'C# Programming', 75.50, 'B2', 'Programming', 0, 4, NULL);



