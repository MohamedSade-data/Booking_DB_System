
CREATE OR ALTER PROCEDURE INSERTION_PROMOTION
(
   @PROMOTION_ID INT,
   @DISCOUNT_PERSENTAGE FLOAT,
   @TITLE VARCHAR(50),
   @START_DATE DATETIME,
   @END_DATE DATETIME,
   @DATE_JOINED DATETIME,
   @DESCRIPTION VARCHAR(300),
   @HOTEL_ID INT
)
AS 
INSERT INTO [Booking].[Promotion]
VALUES 
(
   @PROMOTION_ID,
   @DISCOUNT_PERSENTAGE,
   @TITLE,
   @START_DATE,
   @END_DATE,
   @DATE_JOINED,
   @DESCRIPTION,
   @HOTEL_ID
)

EXEC INSERTION_PROMOTION
@PROMOTION_ID = 1,
@DISCOUNT_PERSENTAGE = 12.5,
@TITLE = 'Eid Mobarak',
@START_DATE = '2024-02-01 00:00:00',
@END_DATE = '2024-02-010 00:00:00',
@DATE_JOINED = '2024-02-02 00:00:00',
@DESCRIPTION = 'Happy eid to you and welcome in our village',
@HOTEL_ID = 1

EXEC INSERTION_PROMOTION
@PROMOTION_ID = 2,
@DISCOUNT_PERSENTAGE = 15,
@TITLE = 'Repeated',
@START_DATE = '2024-02-012 00:00:00',
@END_DATE = '2024-02-22 00:00:00',
@DATE_JOINED = '2024-03-02 00:00:00',
@DESCRIPTION = 'Welcome with repated in our village',
@HOTEL_ID = 2


EXEC INSERTION_PROMOTION
@PROMOTION_ID = 3,
@DISCOUNT_PERSENTAGE = 10,
@TITLE = 'Repeated',
@START_DATE = '2024-05-01 00:00:00',
@END_DATE = '2024-06-4 00:00:00',
@DATE_JOINED = '2024-05-13 00:00:00',
@DESCRIPTION = 'Welcome in our village',
@HOTEL_ID = 2


EXEC INSERTION_PROMOTION
@PROMOTION_ID = 4,
@DISCOUNT_PERSENTAGE = 22,
@TITLE = 'Group of family',
@START_DATE = '2024-06-06 00:00:00',
@END_DATE = '2024-08-30 00:00:00',
@DATE_JOINED = '2024-07-02 00:00:00',
@DESCRIPTION = 'Welcome with repated with family',
@HOTEL_ID = 3


EXEC INSERTION_PROMOTION
@PROMOTION_ID = 5,
@DISCOUNT_PERSENTAGE = 20,
@TITLE = 'Footballer',
@START_DATE = '2024-01-01 00:00:00',
@END_DATE = '2024-01-30 00:00:00',
@DATE_JOINED = '2024-01-15 00:00:00',
@DESCRIPTION = 'Welcome with footballer in out village',
@HOTEL_ID = 6


--------------------------------------------------------------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE Update_PROMOTION (@PROMOTION_ID INT,@DISCOUNT_PERSENTAGE FLOAT,@TITLE VARCHAR(50),@START_DATE DATETIME,@END_DATE DATETIME,@DATE_JOINED DATETIME,@DESCRIPTION VARCHAR(300),@HOTEL_ID INT)
AS 
update  [Booking].[Promotion]
set Discount_Percentage=@DISCOUNT_PERSENTAGE,Title=@TITLE,Start_Date=@START_DATE,END_Date=@END_DATE,Date_Joined=@DATE_JOINED,Description=@DESCRIPTION,Hotel_Id=@HOTEL_ID where [Promotion_Id]=@PROMOTION_ID

--------------------------------------------------------------------------------------------------------------------------- DELETE

CREATE OR ALTER PROCEDURE delete_PROMOTION (@PROMOTION_ID INT)
AS 
delete  [Booking].[Promotion] where [Promotion_Id]=@PROMOTION_ID
