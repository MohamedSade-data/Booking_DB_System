USE Hotels_Reservation
GO

CREATE OR ALTER PROCEDURE INSERTION_HOTEL_PHONE
(
   @HOTEL_ID INT,
   @HOTEL_PHONE CHAR(15)
)
AS
INSERT INTO [Hotel].[Hotel_Phones]
VALUES 
(
  @HOTEL_ID,
  @HOTEL_PHONE
)
GO

EXEC INSERTION_HOTEL_PHONE
@HOTEL_ID = 1,
@HOTEL_PHONE = 096545841

EXEC INSERTION_HOTEL_PHONE
@HOTEL_ID = 2,
@HOTEL_PHONE = 096145872

EXEC INSERTION_HOTEL_PHONE
@HOTEL_ID = 3,
@HOTEL_PHONE = 096100123

EXEC INSERTION_HOTEL_PHONE
@HOTEL_ID = 4,
@HOTEL_PHONE = 096410023

EXEC INSERTION_HOTEL_PHONE
@HOTEL_ID = 5,
@HOTEL_PHONE = 096023369

EXEC INSERTION_HOTEL_PHONE
@HOTEL_ID = 6,
@HOTEL_PHONE = 07455302

SELECT * FROM Hotel.Hotel_Phones

select * FROM [User].[User_Phone]

------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE Update_HOTEL_PHONE (@HOTEL_ID INT,@HOTEL_PHONE varCHAR(15))
AS
update [Hotel].[Hotel_Phones]
set [Phone] =@HOTEL_PHONE where HOTEL_ID = @HOTEL_ID

------------------------------------------------------------------- DELETE

CREATE OR ALTER PROCEDURE delete_HOTEL_PHONE (@HOTEL_ID INT,@HOTEL_PHONE varCHAR(15))
AS
delete  [Hotel].[Hotel_Phones] from [Hotel].[Hotel_Phones]
where HOTEL_ID = @HOTEL_ID and [Phone] =@HOTEL_PHONE

