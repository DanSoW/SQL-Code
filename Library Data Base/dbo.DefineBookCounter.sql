CREATE PROCEDURE [dbo].[DefineBookCounter](
	@Reader_Password_Data bigint
)
AS
BEGIN
	/*Определение, какое количество книг было зарегистрировано под определённым читателем*/
	RETURN (SELECT COUNT(*) FROM [dbo].[RecordRegistration] WHERE [dbo].[RecordRegistration].Reader_Password_Data=@Reader_Password_Data);
END;