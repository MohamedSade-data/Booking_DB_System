USE Hotels_Reservation
GO

CREATE OR ALTER PROCEDURE INSERTION_USER_PHONE
(
   @USER_ID INT,
   @USER_PHONE CHAR(15)
)
AS
INSERT INTO [User].[User_Phone]
VALUES 
(
  @USER_ID,
  @USER_PHONE
)
GO

EXEC INSERTION_USER_PHONE
@USER_ID = 1,
@USER_PHONE = 01150448715

EXEC INSERTION_USER_PHONE
@USER_ID = 2,
@USER_PHONE = 01120365487

EXEC INSERTION_USER_PHONE
@USER_ID = 3,
@USER_PHONE = 01115879965

EXEC INSERTION_USER_PHONE
@USER_ID = 4,
@USER_PHONE = 01120336589

EXEC INSERTION_USER_PHONE
@USER_ID = 5,
@USER_PHONE = 01123045874

------------------------------------------------------------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE update_USER_PHONE (@USER_ID INT,@USER_PHONE CHAR(15))
AS
update  [User].[User_Phone] set phone=@USER_PHONE where User_Id=@USER_ID

------------------------------------------------------------------------------------------------------------------------- DELETE

CREATE OR ALTER PROCEDURE delete_USER_PHONE (@USER_ID INT)
AS
delete  [User].[User_Phone] where  User_Id=@USER_ID
