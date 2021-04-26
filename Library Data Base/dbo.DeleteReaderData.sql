CREATE PROCEDURE [dbo].[DeleteReaderData](
	@Password_Data bigint
)
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[RecordRegistration] WHERE Reader_Password_Data=@Password_Data))
	BEGIN
		RETURN (-1);
	END;

	DELETE [dbo].[Reader]
	WHERE Password_Data=@Password_Data;
END;