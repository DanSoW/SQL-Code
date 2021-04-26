CREATE PROCEDURE [dbo].[WriteBookData](
	@Register_Number bigint,
	@Count_Pages smallint,
	@Year_Publishing smallint,
	@Section nvarchar(150)
)
AS
BEGIN
	IF(EXISTS(SELECT * FROM [dbo].[Book] WHERE Register_Number=@Register_Number))
	BEGIN
		RETURN (-1);
	END;

	IF(@Year_Publishing > YEAR(GETDATE()))
	BEGIN
		RETURN (-2);
	END;

	INSERT INTO [dbo].[Book] (Register_Number, Count_Pages, Year_Publishing, Section)
	VALUES (@Register_Number, @Count_Pages, @Year_Publishing, @Section);
	
	RETURN 0;
END;