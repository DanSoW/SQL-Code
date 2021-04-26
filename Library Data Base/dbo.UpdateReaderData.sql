CREATE PROCEDURE [dbo].[UpdateReaderData](
	@Password_Data bigint,
	@Home_Address nvarchar(80),
	@Full_Name nvarchar(50)
)
AS
BEGIN
	UPDATE Reader
	SET Home_Address=@Home_Address, Full_Name=@Full_Name
	WHERE Password_Data=@Password_Data;

END;