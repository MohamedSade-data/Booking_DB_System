USE Hotels_Reservation
SELECT * FROM [Hotel].[Transportation]


CREATE  OR ALTER PROCEDURE INSERT_TRANSPORTAION 
(
@ID INT,
@TYPE VARCHAR(50),
@SCHEDULE FLOAT,
@PRICE FLOAT,
@CONTACT_INFO VARCHAR(50),
@HOTEL_ID INT
)
AS
INSERT INTO [Hotel].[Transportation] VALUES 
(
@ID,
@TYPE,
@SCHEDULE,
@PRICE,
@CONTACT_INFO,
@HOTEL_ID
)  

EXEC INSERT_TRANSPORTAION
1,
'Car',
12.15,
2000,
11558745,
1

EXEC INSERT_TRANSPORTAION
2,
'Plane',
10.10,
5000,
02136459,
1

EXEC INSERT_TRANSPORTAION
3,
'Bus',
11.15,
1750,
15488745,
2

EXEC INSERT_TRANSPORTAION
4,
'Plane',
12.15,
4005,
23069854,
2

EXEC INSERT_TRANSPORTAION
5,
'Bus',
08.15,
1800,
10213645,
3

-------------------------------------------------------------------------------------------------------UPDATE

create  or alter proc update_Transportation (@id int ,@type VARCHAR(50) ,@Schedule float, @price float ,@Contact_Info VARCHAR(50),@Hotel_Id int )
as
update Hotel.Transportation set  [Type]=@type  ,[Schedule]=@Schedule ,[Price]= @price ,[Contact_Info]=@Contact_Info,[Hotel_Id]=@Hotel_Id  where [Transport_Id]=@id

-------------------------------------------------------------------------------------------------------DELETE

create  or alter proc delete_Transportation (@id int)
as
delete Hotel.Transportation   where [Transport_Id]=@id
