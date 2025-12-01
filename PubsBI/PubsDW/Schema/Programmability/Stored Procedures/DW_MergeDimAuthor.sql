CREATE PROCEDURE [dbo].[DW_MergeDimAuthor]
AS
BEGIN
	UPDATE dc
	SET [au_lname] = sc.[au_lname]
	   ,[au_fname]      = sc.[au_fname]
	   ,[phone]     = sc.[phone]
	   ,[city]   = sc.[city]
	   ,[state]   = sc.[state]
	   ,[zip]   = sc.[zip]
	FROM [dbo].[DimAuthors]        dc
	INNER JOIN [dbo].[staging.author] sc ON (dc.[AuthorSK]=sc.[AuthorSK])
END
GO