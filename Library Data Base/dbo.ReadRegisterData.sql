CREATE PROCEDURE [dbo].[ReadRegisterData]
AS
	SELECT * FROM [dbo].[RegisterView];
RETURN 0