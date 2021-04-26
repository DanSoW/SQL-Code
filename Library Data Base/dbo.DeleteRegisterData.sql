CREATE PROCEDURE [dbo].[DeleteRegisterData](
	@ID int
)
AS
BEGIN
	DELETE [dbo].[RecordRegistration]
	WHERE ID=@ID;
	UPDATE [dbo].[RecordRegistration]
	SET ID=ID-1
	WHERE ID>@ID;
END