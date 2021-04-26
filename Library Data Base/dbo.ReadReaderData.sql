CREATE PROCEDURE [dbo].[ReadReaderData]
AS
	SELECT * FROM [dbo].[ReaderView];
RETURN 0