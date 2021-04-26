CREATE PROCEDURE [dbo].[DeleteBookData](
	@Register_Number bigint
)
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[RecordRegistration] WHERE Book_Register_Number=@Register_Number))
	BEGIN
		RETURN (-1);
	END;

	DELETE [dbo].[Book]
	WHERE Register_Number=@Register_Number;
END;