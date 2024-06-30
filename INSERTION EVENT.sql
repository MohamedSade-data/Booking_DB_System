CREATE PROCEDURE INSERTION_EVENT
(
   @EVENT_ID INT,
   @NAME VARCHAR(50),
   @LOCATION VARCHAR(50),
   @DESCRIPTION VARCHAR(50),
   @START_DATE DATETIME,
   @END_DATE DATETIME,
   @HOTEL_ID INT
)
AS 
INSERT INTO [Hotel].[Event]
VALUES 
(
   @EVENT_ID,
   @NAME,
   @LOCATION,
   @DESCRIPTION,
   @START_DATE,
   @END_DATE,
   @HOTEL_ID
)

EXEC INSERTION_EVENT
@EVENT_ID = 1205,
@NAME = 'Celeperation',
@LOCATION = 'Huurghada',
@DESCRIPTION = 'Is very nice and big celepration',
@START_DATE = '2024-06-08 00:00:00',
@END_DATE = '2024-06-15 00:00:00',
@HOTEL_ID = 1


EXEC INSERTION_EVENT
@EVENT_ID = 1015,
@NAME = 'Vacanci',
@LOCATION = 'Hurghada',
@DESCRIPTION = 'night celepration',
@START_DATE = '2024-06-15 00:00:00',
@END_DATE = '2024-06-22 00:00:00',
@HOTEL_ID = 1

EXEC INSERTION_EVENT
@EVENT_ID = 4515,
@NAME = 'Global',
@LOCATION = 'Hurghada',
@DESCRIPTION = 'night celepration very nice',
@START_DATE = '2024-06-22 00:00:00',
@END_DATE = '2024-06-29 00:00:00',
@HOTEL_ID = 2

EXEC INSERTION_EVENT
@EVENT_ID = 1007,
@NAME = 'Global',
@LOCATION = 'Makkadi',
@DESCRIPTION = 'very young boys wil song in club',
@START_DATE = '2024-06-29 00:00:00',
@END_DATE = '2024-07-05 00:00:00',
@HOTEL_ID = 2

---------------------------------------------------------------------------------------------------------------- UPDATE

CREATE PROCEDURE update_EVENT(@EVENT_ID INT,@NAME VARCHAR(50),@LOCATION VARCHAR(50),@DESCRIPTION VARCHAR(50),@START_DATE DATETIME,@END_DATE DATETIME,@HOTEL_ID INT)
AS 
update  [Hotel].[Event] set [Name]=@NAME, [Location]=@LOCATION, [Description]=@DESCRIPTION, [Start_Date]=@START_DATE,[END_Date]= @END_DATE, [Hotel_Id] =@HOTEL_ID where [Event_Id]= @EVENT_ID

---------------------------------------------------------------------------------------------------------------- DELETE

CREATE PROCEDURE delete_EVENT(@EVENT_ID INT)
AS 
delete  [Hotel].[Event]   where [Event_Id]= @EVENT_ID
