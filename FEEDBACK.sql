
CREATE OR ALTER PROCEDURE INSERTION_FEEDBACK
(
   @FEEDBACK_ID INT,
   @SUBJECT VARCHAR(50),
   @SUBMISSION VARCHAR(50),
   @COMMENT VARCHAR(50),
   @RATING FLOAT,
   @HOTEL_ID INT,
   @USER_ID INT
)
AS 
INSERT INTO [User].[Feedback]
VALUES 
(
   @FEEDBACK_ID,
   @SUBJECT,
   @SUBMISSION,
   @COMMENT,
   @RATING,
   @HOTEL_ID,
   @USER_ID 
)

EXEC INSERTION_FEEDBACK
@FEEDBACK_ID = 1,
@SUBJECT = 'About Bathroom',
@SUBMISSION = '2024-05-05 00:00:00',
@COMMENT = 'The water was very cold',
@RATING = 4.5,
@HOTEL_ID = 1,
@USER_ID = 1

EXEC INSERTION_FEEDBACK
@FEEDBACK_ID = 2,
@SUBJECT = 'About Service',
@SUBMISSION = '2024-05-04 00:00:00',
@COMMENT = 'The Servise was very bad',
@RATING = 2.5,
@HOTEL_ID = 1,
@USER_ID = 2

EXEC INSERTION_FEEDBACK
@FEEDBACK_ID = 3,
@SUBJECT = 'About Service',
@SUBMISSION = '2024-05-05 12:23:00',
@COMMENT = 'Fantastic',
@RATING = 9.5,
@HOTEL_ID = 2,
@USER_ID = 1

EXEC INSERTION_FEEDBACK
@FEEDBACK_ID = 4,
@SUBJECT = 'About Eating',
@SUBMISSION = '2024-05-05 00:00:00',
@COMMENT = 'Eting Was Very bad',
@RATING = 2.5,
@HOTEL_ID = 1,
@USER_ID = 5

EXEC INSERTION_FEEDBACK
@FEEDBACK_ID = 5,
@SUBJECT = 'About Beach',
@SUBMISSION = '2024-07-08 00:00:00',
@COMMENT = 'The Water is very dirty',
@RATING = 1.5,
@HOTEL_ID = 4,
@USER_ID = 4


-----------------------------------------------------------------------------------------------------UPDATE


CREATE OR ALTER PROCEDURE update_FEEDBACK
(@FEEDBACK_ID INT,@SUBJECT VARCHAR(50),@SUBMISSION VARCHAR(50),@COMMENT VARCHAR(50),@RATING FLOAT,@HOTEL_ID INT,@USER_ID INT)
AS 
update [User].[Feedback]
set [Subject]=@SUBJECT,[Submission]=@SUBMISSION,[Comment]=@COMMENT,[Rating]=@RATING,[Hotel_Id]=@HOTEL_ID,[User_Id]=@USER_ID where [Feedback_Id]=@FEEDBACK_ID

-----------------------------------------------------------------------------------------------------UPDATE
-
CREATE OR ALTER PROCEDURE delete_FEEDBACK(@FEEDBACK_ID INT)
AS 
delete  [User].[Feedback] where [Feedback_Id]=@FEEDBACK_ID

