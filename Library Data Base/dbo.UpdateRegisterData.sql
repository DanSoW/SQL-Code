CREATE PROCEDURE [dbo].[UpdateRegisterData](
	@ID int,
	@Book_Register_Number bigint,
	@Reader_Password_Data bigint,
	@Date_Issue date,
	@Date_Return date
)
AS
BEGIN

	IF(NOT EXISTS(SELECT * FROM [dbo].[RecordRegistration] WHERE [dbo].[RecordRegistration].ID=@ID))
	BEGIN
		RETURN (-4);
	END;

	IF(NOT EXISTS(SELECT * FROM [dbo].[Book] WHERE Register_Number=@Book_Register_Number))
	BEGIN
		RETURN (-2);
	END;

	IF(NOT EXISTS(SELECT * FROM [dbo].[Reader] WHERE Password_Data=@Reader_Password_Data))
	BEGIN
		RETURN (-1);
	END;

	IF((@Date_Issue > @Date_Return) OR EXISTS(SELECT * FROM [dbo].[Book] 
	WHERE ([dbo].[Book].Register_Number=@Book_Register_Number)
	AND ((YEAR(@Date_Issue) < [dbo].[Book].Year_Publishing)
	OR (YEAR(@Date_Return) > YEAR(GETDATE())))))
	BEGIN
		RETURN (-3);
	END;

	IF(EXISTS(SELECT * FROM [dbo].[RecordRegistration] WHERE
	Book_Register_Number=@Book_Register_Number AND
	Reader_Password_Data=@Reader_Password_Data AND
	ID != @ID AND
	(((Date_Issue >= @Date_Issue) AND (Date_Return <= @Date_Return)) OR
	((Date_Issue <= @Date_Issue) AND (Date_Return >= @Date_Return)) OR
	((Date_Issue <= @Date_Issue) AND (Date_Return >= @Date_Issue)) OR
	((Date_Issue <= @Date_Return) AND (Date_Return >= @Date_Return)))))
	BEGIN
	    RETURN (-5);
	END;

	UPDATE RecordRegistration
	SET Book_Register_Number=@Book_Register_Number, Reader_Password_Data=@Reader_Password_Data, Date_Issue=@Date_Issue, Date_Return=@Date_Return
	WHERE ID=@ID;

	RETURN 0;
END;