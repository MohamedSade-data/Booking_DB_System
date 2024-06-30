USE Hotels_Reservation

CREATE OR ALTER PROCEDURE INSERTION_USER 
@ID INT,
@NAME VARCHAR(50), 
@ROLE VARCHAR(50),  -- admin - user - host
@MAIL VARCHAR(50), 
@PASSWORD VARCHAR(50)
AS
INSERT INTO [User].[User]
VALUES (@ID, @NAME, @ROLE, @MAIL, @PASSWORD, GETDATE())
GO

-------------------------------------------------------------------------------------------------------
EXEC INSERTION_USER  
@ID = 1,
@NAME = 'Mohamed Sadeq', 
@ROLE = 'Admin', 
@MAIL = 'mohamed.fatah22@icloud.com', 
@PASSWORD = 'mohamed@5369878'


EXEC INSERTION_USER  
@ID = 2,
@NAME = 'Ahmed Nabil', 
@ROLE = 'Admin', 
@MAIL = 'ahmednabil487@gmail.com', 
@PASSWORD = 'ahmed@#74120'


EXEC INSERTION_USER  
@ID = 3,
@NAME = 'Haythem Mohamed', 
@ROLE = 'Admin', 
@MAIL = 'haythemohamed787@gmail.com', 
@PASSWORD = 'fons2#3401$'


EXEC INSERTION_USER  
@ID = 4,
@NAME = 'Roaa Gaber', 
@ROLE = 'Admin', 
@MAIL = 'roaagaber146@gmail.com', 
@PASSWORD = 'roaa10548#$'


EXEC INSERTION_USER  
@ID = 5,
@NAME = 'Ahmed Sayed', 
@ROLE = 'User', 
@MAIL = 'ahmedsayed415@gmail.com', 
@PASSWORD = '511248960'

EXEC INSERTION_USER  
@ID = 7,
@NAME = 'Ahmed Sayed', 
@ROLE = 'Host', 
@MAIL = 'ahmedsayed415@gmail.com', 
@PASSWORD = '511248960'

--------------------------------------------------------------------------------------------------------------UPDATE

CREATE OR ALTER PROCEDURE update_USER @ID INT, @NAME VARCHAR(50),  @ROLE VARCHAR(50), @MAIL VARCHAR(50),  @PASSWORD VARCHAR(50)
AS
update   [User].[User] set  User_Name=@NAME, User_Role=@ROLE, Emaile=@MAIL, Password=@PASSWORD where User_Id=@ID

--------------------------------------------------------------------------------------------------------------DELETE

CREATE OR ALTER PROCEDURE delete_USER @ID INT
AS
delete   [User].[User]   where User_Id=@ID
