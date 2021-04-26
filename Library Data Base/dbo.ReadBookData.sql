CREATE PROCEDURE [dbo].[ReadBookData]
AS
	SELECT * FROM [dbo].[BookView];
RETURN 0