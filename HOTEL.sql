USE Hotels_Reservation;
GO
create  or alter proc insert_hotel @id int ,@name VARCHAR(50) ,@country VARCHAR(50), @state VARCHAR(50) ,@city VARCHAR(50),@zib_code VARCHAR(50) ,@description VARCHAR(100)
as
insert into Hotel.Hotel([Id] ,[Name] , [Country], [State], [City], [Zib_Code],Rating, [Description] ) values (@id ,@name  ,@country , @state ,@city ,@zib_code ,0 ,@description)  
GO

ALTER TABLE [HOTEL].[HOTEL]
DROP COLUMN STATE

EXEC insert_hotel
@ID = 1,
@NAME = 'Resort Beach',
@COUNTRY = 'Egypt',
@State ='Bahr ahmr',
@CITY = 'Hurghada',
@zib_code = '9615487-8',
@DESCRIPTION = 'Hotel in the center of hurghada and its view on red sea and its very nice servies'

EXEC insert_hotel
@ID = 2,
@NAME = 'Titanic Beach',
@COUNTRY = 'Egypt',
@State ='Bahr ahmr',
@CITY = 'Hurghada',
@zib_code = '9641087-8',
@DESCRIPTION = 'Hotel in the South of hurghada and its view on red sea and its very nice servies and very good amenity'

EXEC insert_hotel
@ID = 3,
@NAME = 'Titanic Royal',
@COUNTRY = 'Egypt',
@State ='Bahr ahmr',
@CITY = 'Hurghada',
@zib_code = '9614586-8',
@DESCRIPTION = 'Hotel in the south of hurghada and its view on red sea and its very nice servies'

EXEC insert_hotel
@ID = 4,
@NAME = 'Makadi Resort',
@COUNTRY = 'Egypt',
@CITY = 'Hurghada',
@State ='Bahr ahmr',
@zib_code = '9652014-8',
@DESCRIPTION = 'Hotel between hurghada and safaga and its view on red sea and its very nice servies and low cost than other'

EXEC insert_hotel
@ID = 5,
@NAME = 'Sun Wing',
@COUNTRY = 'Egypt',
@CITY = 'Hurghada',
@State ='Bahr ahmr',
@zib_code = '9641254-8',
@DESCRIPTION = 'Hotel in the center of hurghada and its view on red sea and its Very kind and quit site in hurghada'

EXEC insert_hotel
@ID = 6,
@NAME = 'Water World',
@COUNTRY = 'Egypt',
@CITY = 'Hurghada',
@State ='Bahr ahmr',
@zib_code = '9641023-8',
@DESCRIPTION = 'Hotel in the front of sea and its water world vellige its look like morgan hotel in hemalya'


------------------------------------------------------------------------------------------ update_hotel 



create proc update_hotel @id int ,@name VARCHAR(50) ,@country VARCHAR(50), @state VARCHAR(50) ,@city VARCHAR(50),@zib_code VARCHAR(50) ,@description VARCHAR(100)
as
update Hotel.Hotel set [Name] =@name , [Country]=@country, [State]=@state, [City]=@city, [Zib_Code]=@zib_code, [Description]=@description where Id=@id

------------------------------------------------------------------------------------------ Sdelate_hotel 1

create proc delate_hotel @id int 
as
delete Hotel.Hotel  where Id=@id



