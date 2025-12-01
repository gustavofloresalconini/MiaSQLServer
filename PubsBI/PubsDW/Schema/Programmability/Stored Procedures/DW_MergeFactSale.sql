CREATE PROCEDURE [dbo].[DW_MergeFactSale]
AS
BEGIN
	UPDATE dc
	SET [DateKey] = sc.[DateKey]
	   ,[TitleSK]      = sc.[TitleSK]
	   ,[AuthorSK]     = sc.[AuthorSK]
	   ,[PublisherSK]   = sc.[PublisherSK]
	   ,[StoreSK]   = sc.[StoreSK]
	   ,[Quantity]   = sc.[Quantity]
	   ,[UnitPrice]   = sc.[UnitPrice]
	   ,[TotalAmount]   = sc.[TotalAmount]
	FROM [dbo].[FactSales]        dc
	INNER JOIN [dbo].[staging.sale] sc ON (dc.[SaleSK]=sc.[SaleID])
END
GO