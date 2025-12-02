CREATE PROCEDURE [dbo].[GetPublishersChangeByRowVersion]
	-- Add the parameters for the stored procedure here
(@startRow Bigint
,@endRow Bigint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT s.[pub_id]
      ,s.[pub_name]
      ,s.[city]
      ,s.[state]
      ,s.[country]
        FROM [dbo].[publishers] as s
		WHERE s.[RowVersion]>CONVERT(rowversion, @startRow) and s.[RowVersion]<=CONVERT(rowversion, @endRow)
END
GO


