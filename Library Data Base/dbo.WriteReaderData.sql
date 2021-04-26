CREATE PROCEDURE [dbo].[WriteReaderData](
	@Password_Data bigint,
	@Home_Address nvarchar(80),
	@Full_Name nvarchar(50)
)
AS
BEGIN
	/*Логика проверки входного параметра на существование в уже созданной таблице Reader*/
	IF(EXISTS(SELECT * FROM [dbo].[Reader] WHERE Password_Data=@Password_Data))
	BEGIN
		RETURN (-1);
	END;

	/*Добавление записи*/
	INSERT INTO [dbo].[Reader] (Password_Data, Home_Address, Full_Name)
	VALUES (@Password_Data, @Home_Address, @Full_Name);

	RETURN 0;
END;