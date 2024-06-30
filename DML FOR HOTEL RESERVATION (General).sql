USE Hotels_Reservation
GO

------------------------------------------------------------------ VIEW TO SHOW ALL DATA ABOUT ORDINARY USER 

CREATE OR ALTER VIEW USER_VIEW
AS
SELECT *
FROM [User].[User]
WHERE User_Role = 'User'

SELECT * FROM USER_VIEW

------------------------------------------------------------------ VIEW TO SHOW ALL DATA ABOUT HOTEL ANAD HOTEL BELONG PHONE 

CREATE OR ALTER VIEW HOTEL_VIEW
AS
SELECT * 
FROM [Hotel].[Hotel], [Hotel].[Hotel_Phones]
WHERE [Hotel].[Hotel_Phones].Hotel_Id = [Hotel].[Hotel].Id

SELECT * FROM HOTEL_VIEW

------------------------------------------------------------------ VIEW TO SHOW ALL DATA ABOUT USER AS HOST ROLE

CREATE OR ALTER VIEW HOST_VIEW
AS
SELECT *
FROM [User].[User]
WHERE User_Role = 'Host'

SELECT * FROM HOST_VIEW

------------------------------------------------------------------ VIEW TO SHOW ALL DATA ABOUT ADMIN

CREATE OR ALTER VIEW ADMIN_VIEW
AS
SELECT *
FROM [User].[User]
WHERE User_Role = 'Admin'

SELECT * FROM ADMIN_VIEW

------------------------------------------------------------------ VIEW TO SHOW ALL EVENT IN ALL HOTELS

CREATE OR ALTER VIEW ALL_EVENT_VIEW
AS
SELECT HOTEL.Event.*, HOTEL.Hotel.Name AS [HOTEL NAME]
FROM Hotel.Event, Hotel.Hotel
WHERE Hotel.Hotel.Id = Hotel.EVENT.Hotel_Id 

SELECT * FROM ALL_EVENT_VIEW 

----------------------------------------------- VIEW TO SHOW ALL DATA OF ROOM, HOTEL WHERE ROOM NOT BOOKING

CREATE OR ALTER VIEW NOT_BOOKING_ROOM
AS
SELECT Hotel.Name, Hotel.Id, COUNT(Room_Id) AS [COUNT OF EMPTY ROOMS IN HOTELS]
FROM Room.Room, Hotel.Hotel
WHERE Room.Hotel_Id = Hotel.Id AND Room_Id NOT IN 
(
SELECT Room.Room_Id
FROM Room.Room, Booking.Booking
WHERE Room.Room_Id = Booking.Room_Id
)
GROUP BY (Id), Hotel.Name

SELECT * FROM Hotel.Hotel

-------------------------------------------------------------------- VIEW RETURN ALL ROOM DATA WITH ITS HOTEL ID

CREATE OR ALTER VIEW ROOM_VIEW
AS
SELECT Room.*, Hotel.Id, Hotel.Name FROM Room.Room, Hotel.Hotel
WHERE Room.Hotel_Id = Hotel.Id

SELECT * FROM ROOM_VIEW

------------------------------------------------------------------ FUNCTION TO RETURN EVENTS IN SPECEFIC TABLE BASED ON HOTEL_ID 

CREATE OR ALTER FUNCTION EVENT_FUNC(@HOTEL_ID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT HOTEL.Event.*, HOTEL.Hotel.Name AS [HOTEL NAME]
	FROM Hotel.Event, Hotel.Hotel
	WHERE Hotel.Hotel.Id = @HOTEL_ID AND Hotel.EVENT.Hotel_Id = @HOTEL_ID  
)

SELECT * FROM EVENT_FUNC(1)

------------------------------------------------------------------- FUNCTION RETURN EMPTY ROOM IN HOTEL WITH HOTEL ID

CREATE OR ALTER FUNCTION EMPTY_ROOM(@HOTEL_ID INT)
RETURNS TABLE
AS
RETURN(
SELECT *
FROM Room.Room
WHERE Hotel_Id = @HOTEL_ID AND Room.Room_Id NOT IN 
(
	SELECT Room_Id
	FROM [Booking].[Booking]
) 
)

SELECT * FROM EMPTY_ROOM(2)

---------------------------------------------------------------------------------- FUNCTION RETURN COUNT OF EMPTY ROOM IN ALL HOTELS WITH HOTELS DATA

CREATE FUNCTION ALL_EMPTY_ROOM()
RETURNS TABLE
AS
RETURN
(
	SELECT Hotel.Name, Hotel.Id, COUNT(Room_Id) AS [COUNT OF EMPTY ROOMS IN HOTELS]
	FROM Room.Room, Hotel.Hotel
		WHERE Room.Hotel_Id = Hotel.Id AND Room_Id NOT IN 
		(
		SELECT Room.Room_Id
		FROM Room.Room, Booking.Booking
		WHERE Room.Room_Id = Booking.Room_Id
		)
	GROUP BY (Id), Hotel.Name
)


------------------------------------------------------------------------ TRIGGER FOR INSERTION CONFIRMATION

CREATE TRIGGER INSERTION_TRIGGER
ON [Booking].[Booking]
WITH ENCRYPTION
AFTER INSERT
AS
PRINT ('INSERTION SUCCSESFULLY')

DROP TRIGGER INSERTION_TRIGGER

SELECT * FROM [Booking].[Booking]

------------------------------------------------------------------------- TRIGGER CALC RATING FOR ON HOTEL

create trigger t1
on [User].[Feedback]
after insert 
as
declare @id int ,@rate float
select @id= Hotel_Id from inserted 
select @rate=avg(Rating) from [User].[Feedback] where Hotel_Id =@id
UPDATE  Hotel.Hotel Set Hotel.Hotel.Rating = @rate where  Hotel.Hotel.Id=@id

SELECT * FROM Hotel.Hotel
SELECT * FROM [User].Feedback

------------------------------------------------------------------ INDEX ON HOTLE NAME AND ROOM PRICE TO MAKE SEARCH OPERATION FASTER  

CREATE INDEX HOTEL_NAME_INDEX
ON [Hotel].[Hotel] (Name)

CREATE INDEX ROOM_PRICE_INDEX
ON [Room].[Room] (Price_per_night)

---------------------------------------------------------------------------- CURSOR TO VIEW ALL BOOKING IN ALL HOTEL

declare c1 cursor 
for
   select   Hotel_Id, Name, COUNT(Booking_Id)
   from [Booking].[Booking], Hotel.Hotel
   where [Booking].[Booking].Hotel_Id = Hotel.Hotel.Id
   group by Booking_Id, Hotel_Id, Name
   for read only 
declare @id int, @name varchar(10), @count int
open c1
fetch c1 into @id , @name ,@count
while @@FETCH_STATUS=0
begin
select @id AS [HOTEL ID],@name AS [HOTEL NAME],@count AS [COUNT OF BOOKING]
fetch c1 into @id , @name,@count
end 
close c1
deallocate c1


-------------------------------------------------------------------- FUNCTION RETURN Hotel Transportation WITH HOTEL ID

CREATE OR ALTER FUNCTION Hotel_Transportation(@HOTEL_ID INT)
RETURNS TABLE
AS
RETURN(
SELECT *
FROM [Hotel].[Transportation]
WHERE Hotel_Id = @HOTEL_ID

)

SELECT * FROM Hotel_Transportation(1)
------------------------------------------------------------------- FUNCTION RETURN EMPTY ROOM with Amenity IN HOTEL WITH HOTEL ID

CREATE OR ALTER FUNCTION EMPTY_ROOM_WITH_AMEN(@HOTEL_ID INT)
RETURNS TABLE
AS
RETURN(
SELECT *
FROM [Hotel_Room].[Amenity] 
WHERE [Hotel_Room].[Amenity].Hotel_Id=@HOTEL_ID and Room_Id not in(
SELECT Room.Room_Id
  FROM Room.Room, Booking.Booking
  WHERE Room.Room_Id = Booking.Room_Id

))
select * from EMPTY_ROOM_WITH_AMEN(1)

------------------------------------------------------------------------- UPDATE ROOM Availability

create trigger t2
on [Booking].[Booking]
after insert 
as
declare @roomid int ,@hotelid int
select @roomid= Room_Id,@hotelid=Hotel_Id from inserted 
UPDATE  [Room].[Room] Set Availability=0 where  Room_Id=@roomid and Hotel_Id=@hotelid

------------------------------------------------------------------------- UPDATE ROOM Availability after Cancelation
create trigger t3
on [Booking].[Reservation_Cancelation]
after insert 
as
declare @idbooking int,@idroom int ,@idhotel int
select @idbooking= Booking_Id from inserted 
select @idhotel=Hotel_Id ,@idroom= Room_Id from [Booking].[Booking] where Booking_Id=@idbooking
UPDATE  [Room].[Room] Set Availability=1 where  Room_Id=@idroom and Hotel_Id=@idhotel
