CREATE PROCEDURE [dbo].[UpdateBookData](
	@Register_Number bigint,
	@Count_Pages smallint,
	@Year_Publishing smallint,
	@Section nvarchar(150)
)
AS
BEGIN
	IF(@Year_Publishing > YEAR(GETDATE()))
	BEGIN
		RETURN (-1);
	END;

	IF(@Year_Publishing <= 0 OR @Count_Pages <= 0)
	BEGIN
	   RETURN (-3);
	END;

	IF(EXISTS(SELECT [dbo].[RecordRegistration].Date_Issue, [dbo].[RecordRegistration].Book_Register_Number FROM [dbo].[RecordRegistration]
	WHERE ([dbo].[RecordRegistration].Book_Register_Number=@Register_Number) AND YEAR([dbo].[RecordRegistration].Date_Issue) < @Year_Publishing))
	BEGIN
		RETURN (-2);
	END;

	UPDATE Book
	SET Count_Pages=@Count_Pages, Year_Publishing=@Year_Publishing, Section=@Section
	WHERE Register_Number=@Register_Number;
	
	RETURN 0;

END;