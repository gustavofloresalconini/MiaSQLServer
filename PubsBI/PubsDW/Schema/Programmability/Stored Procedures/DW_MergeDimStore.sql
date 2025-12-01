CREATE PROCEDURE [dbo].[DW_MergeDimStore]
AS
BEGIN
	UPDATE dc
	SET [stor_name] = sc.[stor_name]
	   ,[city]      = sc.[city]
	   ,[state]     = sc.[state]
	   ,[zip]   = sc.[zip]
	FROM [dbo].[DimStores]        dc
	INNER JOIN [dbo].[staging.store] sc ON (dc.[StoreSK]=sc.[StoreSK])
END
GO