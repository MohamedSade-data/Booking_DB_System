CREATE OR ALTER PROCEDURE INSERTION_RESERVATION_CANCELATION
(
	@CANCELATION_ID INT,
	@REASON VARCHAR(50),
	@REFUND_AMOUNT FLOAT,
	@BOOKIN_ID INT
)
AS 
INSERT INTO Booking.Reservation_Cancelation
VALUES 
(
	@CANCELATION_ID,
	@REASON,
	GETDATE(),
	@REFUND_AMOUNT,
	@BOOKIN_ID
)

EXEC INSERTION_RESERVATION_CANCELATION
@CANCELATION_ID = 1,
@REASON = 'Serv is bad',
@REFUND_AMOUNT = 5401,
@BOOKIN_ID = 1

EXEC INSERTION_RESERVATION_CANCELATION
@CANCELATION_ID = 2,
@REASON = 'Personal reason',
@REFUND_AMOUNT = 4000,
@BOOKIN_ID = 2

EXEC INSERTION_RESERVATION_CANCELATION
@CANCELATION_ID = 3,
@REASON = 'Change Hotel',
@REFUND_AMOUNT = 2000,
@BOOKIN_ID = 5

-------------------------------------------------------------------------------------------------------------------- UPDATE

CREATE OR ALTER PROCEDURE UPDATE_Reservation_Cancelation
(@Cancelation_Id INT, @Reason VARCHAR(50), @Cancelation_Date DATETIME, @Refund_Amount FLOAT, @Booking_Id INT)
AS 
UPDATE  Booking.Reservation_Cancelation
SET   Reason=@Reason  , Refund_Amount=@Refund_Amount , Booking_Id=@Booking_Id where Cancelation_Id= @Cancelation_Id

-------------------------------------------------------------------------------------------------------------------- DELETE

CREATE OR ALTER PROCEDURE DELETE_Reservation_Cancelation
(@Cancelation_Id INT)
AS 
DELETE  Booking.Reservation_Cancelation where Cancelation_Id= @Cancelation_Id
