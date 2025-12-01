CREATE PROCEDURE [dbo].[DW_MergeDimPublisher]
AS
BEGIN
	UPDATE dc
	SET [pub_name] = sc.[pub_name]
	   ,[city]      = sc.[city]
	   ,[state]     = sc.[state]
	   ,[country]   = sc.[country]
	FROM [dbo].[DimPublishers]        dc
	INNER JOIN [dbo].[staging.publisher] sc ON (dc.[PublisherSK]=sc.[PublisherSK])
END
GO