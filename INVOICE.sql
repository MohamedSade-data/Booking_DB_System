CREATE OR ALTER PROCEDURE INSERTION_INVOICE
(
	@INVOICE_ID INT,
	@AMOUNT FLOAT,
	@ISSUE_DATE DATETIME,
	@STATUS VARCHAR(50),
	@BOOKIN_ID INT
)
AS 
INSERT INTO Booking.Invoice
VALUES 
(
	@INVOICE_ID,
	@AMOUNT,
	@ISSUE_DATE,
	@STATUS,
	@BOOKIN_ID
)

EXEC INSERTION_INVOICE
@INVOICE_ID = 1,
@AMOUNT = 2000,
@ISSUE_DATE = '2024-05-04 00:00:00',
@STATUS = 'Confirmed',
@BOOKIN_ID = 1


EXEC INSERTION_INVOICE
@INVOICE_ID = 2,
@AMOUNT = 1405,
@ISSUE_DATE = '2024-05-04 00:00:00',
@STATUS = 'Confirmed',
@BOOKIN_ID = 2


EXEC INSERTION_INVOICE
@INVOICE_ID = 3,
@AMOUNT = 1000,
@ISSUE_DATE = '2024-05-04 00:00:00',
@STATUS = 'Confirmed',
@BOOKIN_ID = 3



EXEC INSERTION_INVOICE
@INVOICE_ID = 4,
@AMOUNT = 2350.47,
@ISSUE_DATE = '2024-06-04 00:00:00',
@STATUS = 'Totaly',
@BOOKIN_ID = 1



EXEC INSERTION_INVOICE
@INVOICE_ID = 5,
@AMOUNT = 4580,
@ISSUE_DATE = '2024-05-09 00:00:00',
@STATUS = 'Confirmed',
@BOOKIN_ID = 5

----------------------------------------------------------------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE UPDATE_INVOICE
(@INVOICE_ID INT,@AMOUNT FLOAT,@ISSUE_DATE DATETIME,@STATUS VARCHAR(50),@BOOKIN_ID INT)
AS 
UPDATE  Booking.Invoice SET Amount=@AMOUNT,Issue_Date=@ISSUE_DATE,Status=@STATUS,Booking_Id=@BOOKIN_ID WHERE  Invoice_Id=@INVOICE_ID

----------------------------------------------------------------------------------------------------------------------------- DELETE

CREATE OR ALTER PROCEDURE UPDATE_INVOICE(@INVOICE_ID INT)
AS 
DELETE  Booking.Invoice  WHERE  Invoice_Id=@INVOICE_ID
