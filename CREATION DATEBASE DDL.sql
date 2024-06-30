--create the Hotels_reservation database
CREATE DATABASE Hotels_Reservation
GO
USE Hotels_Reservation

--Creating the schema
CREATE SCHEMA Hotel
GO
CREATE SCHEMA Room
GO
CREATE SCHEMA Hotel_Room
GO
CREATE SCHEMA [User]
GO
CREATE SCHEMA Booking


---Creating Hotel Tables

--Create Table Hotel
CREATE TABLE Hotel.Hotel
(
[Id] INT PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
[Address] VARCHAR(50) NOT NULL,
[Country] VARCHAR(50) NOT NULL,
[State] VARCHAR(50) NOT NULL,
[City] VARCHAR(50) NOT NULL,
[Zib_Code] VARCHAR(50) NOT NULL,
[Rating] FLOAT,
[Description] VARCHAR(100)
)

--Create Table Hotel phone
CREATE TABLE Hotel.Hotel_Phones
(
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL,
[Phone] char(15) NOT NULL,
PRIMARY KEY(Hotel_Id,Phone) 
)

--Create Table Transportation
CREATE TABLE Hotel.Transportation
(
[Transport_Id] INT PRIMARY KEY,
[Type] VARCHAR(50) NOT NULL,
[Schedule] FLOAT NOT NULL,
[Price] FLOAT NOT NULL ,
[Contact_Info] VARCHAR(50) NOT NULL,
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL
)

--Create Table Event
CREATE TABLE Hotel.[Event]
(
[Event_Id] INT PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
[Location] VARCHAR(50) NOT NULL,
[Description] VARCHAR(50) NOT NULL,
[Start_Date] DATETIME,
[END_Date] DATETIME,
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL
)

--Creating Room Tables

--Create Table Room
CREATE TABLE Room.Room
(
[Room_Id] INT PRIMARY KEY,
[Max_Occupancy] INT NOT NULL ,
[Price_per_night] Float NOT NULL,
[Availability] BIT NOT NULL,
[Description] VARCHAR(50) NOT NULL,
[Type] VARCHAR(50) NOT NULL,
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL
)

--Create Hotel_Room tables

--Create table Amenity
CREATE TABLE Hotel_Room.Amenity
(
[Amenity_Id] INT PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
[Description] VARCHAR(50),
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL,
[Room_Id] INT FOREIGN KEY REFERENCES Room.Room(Room_Id) NOT NULL
)


--the following tables Belongs to the user schema
--create table user
CREATE TABLE [User].[User]
(
[User_Id] INT PRIMARY KEY,
[User_Name] VARCHAR(50) NOT NULL,
[User_Role] VARCHAR(50) NOT NULL,
[Emaile] VARCHAR(50) NOT NULL,
[Password] VARCHAR(50) NOT NULL,
[Date_Joined] DATETIME NOT NULL
)


--create table UserPhone
CREATE TABLE [User].[User_Phone]
(
[User_Id] INT FOREIGN KEY REFERENCES [User].[User]([User_Id]) NOT NULL,
[Phone] CHAR(15) NOT NULL,
PRIMARY KEY([User_Id],Phone) 
)


--create table Feedback
CREATE TABLE [User].Feedback
(
[Feedback_Id] INT PRIMARY KEY,
[Subject] VARCHAR(50) NOT NULL,
[Submission] DATETIME NOT NULL,
[Comment] VARCHAR(100) NOT NULL,
[Rating] FlOAT,
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL,
[User_Id] INT FOREIGN KEY REFERENCES [User].[User]([User_Id]) NOT NULL
)

--The following tables belons to the Booking schema

--create table booking payment
CREATE TABLE Booking.Payment
(
[Payment_Id] INT PRIMARY KEY,
[Amount] FLOAT NOT NULL,
[Payment_Date] DATETIME NOT NULL,
[Payment_Method] VARCHAR(50) NOT NULL
)
--create table Booking

CREATE TABLE Booking.Booking
(
[Booking_Id] INT PRIMARY KEY,
[Status] VARCHAR(50),
[Total_Price] Float NOT NULL,
[CheckIn_Date] DATETIME  ,
[CheckOut_Date] DATETIME,
[User_Id] INT FOREIGN KEY REFERENCES [User].[User]([User_Id]) NOT NULL,
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL,
[Room_Id] INT FOREIGN KEY REFERENCES Room.Room(Room_Id) NOT NULL,
[Payment_Id] INT FOREIGN KEY REFERENCES Booking.Payment(Payment_Id) NOT NULL,
CONSTRAINT C1 CHECK([STATUS] IN ('confirmed','canceled'))
)


--create table promotion
CREATE TABLE Booking.Promotion
(
[Promotion_Id] INT PRIMARY KEY,
[Discount_Percentage] FLOAT NOT NULL,
[Title] VARCHAR(50) NOT NULL,
[Start_Date] DATETIME NOT NULL,
[END_Date] DATETIME,
[Date_Joined] DATETIME,
[Description] VARCHAR(50),
[Hotel_Id] INT FOREIGN KEY REFERENCES Hotel.Hotel(Id) NOT NULL
)

--the following table belongs to user Schema
CREATE TABLE [User].Loyality_Program
(
[Program_Id] INT PRIMARY KEY,
[Tier] VARCHAR(50) ,
[Enrollment_Date] DATETIME,
[Points] FLOAT NOT NULL,
[User_Id] INT FOREIGN KEY REFERENCES [User].[User]([User_Id]) NOT NULL,
[Promotion_Id] INT FOREIGN KEY REFERENCES Booking.Promotion(Promotion_Id) NOT NULL
)



--create table booking invoice
CREATE TABLE Booking.Invoice
(
[Invoice_Id] INT PRIMARY KEY,
[Amount] FLOAT NOT NULL,
[Issue_Date] DATETIME NOT NULL,
[Status] VARCHAR(50) NOT NULL,
[Booking_Id] INT FOREIGN KEY REFERENCES Booking.Booking(Booking_Id) NOT NULL,
)


--Create Table Reservation_Cancelation
CREATE TABLE Booking.Reservation_Cancelation
(
[Cancelation_Id] INT PRIMARY KEY,
[Reason] VARCHAR(50),
[Cancelation_Date] DATETIME NOT NULL,
[Refund_Amount] FLOAT,
[Booking_Id] INT FOREIGN KEY REFERENCES Booking.Booking(Booking_Id) NOT NULL
)
----


