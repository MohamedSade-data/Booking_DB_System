USE Hotels_Reservation
GO 
CREATE PROCEDURE INSERTION_ROOM
(
   @ID INT, 
   @MAX_OCCUPANCY INT,
   @PRICE_PER_NIGHT INT,
   @AVAILABILITY BIT,
   @DESCRIPTION VARCHAR(50),
   @TYPE VARCHAR(50),
   @HOTEL_ID INT
)
AS 
INSERT INTO [Room].[Room]
VALUES 
(
   @ID,
   @MAX_OCCUPANCY,
   @PRICE_PER_NIGHT,
   @AVAILABILITY,
   @DESCRIPTION,
   @TYPE,
   @HOTEL_ID 
)

GO

EXEC INSERTION_ROOM
   @ID = 11,        -- HOTEL ID FOLLOW WITH ROOM ID
   @MAX_OCCUPANCY = 4,
   @PRICE_PER_NIGHT = 124,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Family Room',
   @TYPE = 'Family',
   @HOTEL_ID = 1


EXEC INSERTION_ROOM
   @ID = 12,
   @MAX_OCCUPANCY = 2,
   @PRICE_PER_NIGHT = 90,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Double Room',
   @TYPE = 'Wifes Or Friends',
   @HOTEL_ID = 1


EXEC INSERTION_ROOM
   @ID = 13,
   @MAX_OCCUPANCY = 1,
   @PRICE_PER_NIGHT = 60,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Singel Room',
   @TYPE = 'Single',
   @HOTEL_ID = 1

   
EXEC INSERTION_ROOM
   @ID = 14,
   @MAX_OCCUPANCY = 1,
   @PRICE_PER_NIGHT = 80,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Singel Room on The Beach',
   @TYPE = 'Single',
   @HOTEL_ID = 1

   
EXEC INSERTION_ROOM
   @ID = 15,
   @MAX_OCCUPANCY = 2,
   @PRICE_PER_NIGHT = 130,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Double Room One side on the sea and one side on the Bool',
   @TYPE = 'Double',
   @HOTEL_ID = 1

   
EXEC INSERTION_ROOM
   @ID = 16,
   @MAX_OCCUPANCY = 2,
   @PRICE_PER_NIGHT = 100,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Double Room On The sea',
   @TYPE = 'Double',
   @HOTEL_ID = 1

   
EXEC INSERTION_ROOM
   @ID = 21,
   @MAX_OCCUPANCY = 4,
   @PRICE_PER_NIGHT = 124,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Family Room',
   @TYPE = 'Family',
   @HOTEL_ID = 2


EXEC INSERTION_ROOM
   @ID = 22,
   @MAX_OCCUPANCY = 4,
   @PRICE_PER_NIGHT = 124,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Family Room',
   @TYPE = 'Family',
   @HOTEL_ID = 2


EXEC INSERTION_ROOM
   @ID = 23,
   @MAX_OCCUPANCY = 4,
   @PRICE_PER_NIGHT = 124,
   @AVAILABILITY = 1,
   @DESCRIPTION = 'Family Room',
   @TYPE = 'Family',
   @HOTEL_ID = 2



-------------------------------------------------------------------------------------------------------UPDATE

CREATE PROCEDURE update_ROOM(@ID INT, @MAX_OCCUPANCY INT, @PRICE_PER_NIGHT INT,@AVAILABILITY BIT, @DESCRIPTION VARCHAR(50), @TYPE VARCHAR(50),@HOTEL_ID INT )
AS
update [Room].[Room]
set Max_Occupancy=@MAX_OCCUPANCY,Price_per_night=@PRICE_PER_NIGHT,Availability= @AVAILABILITY,Description= @DESCRIPTION,Type= @TYPE,Hotel_Id = @HOTEL_ID where Room_Id=@ID

-------------------------------------------------------------------------------------------------------DELETE

CREATE PROCEDURE delete_ROOM(@ID INT )
AS
delete [Room].[Room] where Room_Id=@ID