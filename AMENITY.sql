CREATE OR ALTER PROCEDURE INSERTION_AMENITY
(
   @AMENITY_ID INT,
   @NAME VARCHAR(50),
   @DESCRIPTION VARCHAR(300),
   @HOTEL_ID INT, 
   @ROOM_ID INT
)
AS 
INSERT INTO [Hotel_Room].[Amenity]
VALUES 
(
   @AMENITY_ID,
   @NAME,
   @DESCRIPTION,
   @HOTEL_ID, 
   @ROOM_ID
)


EXEC INSERTION_AMENITY
@AMENITY_ID = 1,
@NAME = 'Room Serv Amenity',
@DESCRIPTION  = 'Very good',
@HOTEL_ID = 1, 
@ROOM_ID = 11

EXEC INSERTION_AMENITY
@AMENITY_ID = 2,
@NAME = 'Room Serv Amenity',
@DESCRIPTION  = 'mornning and night',
@HOTEL_ID = 1, 
@ROOM_ID = 12

EXEC INSERTION_AMENITY
@AMENITY_ID = 3,
@NAME = 'Room view Amenity',
@DESCRIPTION  = 'on the sea',
@HOTEL_ID = 1, 
@ROOM_ID = 15


EXEC INSERTION_AMENITY
@AMENITY_ID = 4,
@NAME = 'Room view Amenity',
@DESCRIPTION  = 'on the bool',
@HOTEL_ID = 1, 
@ROOM_ID = 14

EXEC INSERTION_AMENITY
@AMENITY_ID = 5,
@NAME = 'Room beds Amenity',
@DESCRIPTION  = 'on the air for more adventure',
@HOTEL_ID = 2, 
@ROOM_ID = 21

---------------------------------------------------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE UPDATE_AMENITY
(@AMENITY_ID INT, @NAME VARCHAR(50), @DESCRIPTION VARCHAR(300), @HOTEL_ID INT,  @ROOM_ID INT)
AS 
UPDATE  [Hotel_Room].[Amenity] SET Name=@NAME,Description=@DESCRIPTION,Hotel_Id=@HOTEL_ID, Room_Id=@ROOM_ID where Amenity_Id=@AMENITY_ID

---------------------------------------------------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE DELETE_AMENITY
(@AMENITY_ID INT)
AS 
DELETE  [Hotel_Room].[Amenity]  where Amenity_Id=@AMENITY_ID





