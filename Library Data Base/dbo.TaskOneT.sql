CREATE PROCEDURE [dbo].[TaskOneT]
	@monthValue int
AS
BEGIN

	SELECT [dbo].[Reader].Full_Name, [dbo].[Reader].Password_Data, [dbo].[RecordRegistration].Book_Register_Number, [dbo].[RecordRegistration].Date_Issue, [dbo].[RecordRegistration].Date_Return
	FROM [dbo].[RecordRegistration]
	JOIN [dbo].[Reader]
	ON [dbo].[RecordRegistration].Reader_Password_Data=[dbo].[Reader].Password_Data
	JOIN [dbo].[Book]
	ON [dbo].[Book].Register_Number=[dbo].[RecordRegistration].Book_Register_Number
	WHERE ((MONTH([dbo].[RecordRegistration].Date_Return) - MONTH([dbo].[RecordRegistration].Date_Issue)) > @monthValue)
	OR ((MONTH([dbo].[RecordRegistration].Date_Return) - MONTH([dbo].[RecordRegistration].Date_Issue)) + 12*(YEAR([dbo].[RecordRegistration].Date_Return) - YEAR([dbo].[RecordRegistration].Date_Issue)) > @monthValue);

END;