CREATE PROCEDURE [dbo].[DW_MergeDimTitle]
AS
BEGIN
	UPDATE dc
	SET [title] = sc.[title]
	   ,[type]      = sc.[type]
	   ,[price]     = sc.[price]
	   ,[pubdate]   = sc.[pubdate]
	FROM [dbo].[DimTitles]        dc
	INNER JOIN [dbo].[staging.title] sc ON (dc.[TitleSK]=sc.[TitleSK])
END
GO