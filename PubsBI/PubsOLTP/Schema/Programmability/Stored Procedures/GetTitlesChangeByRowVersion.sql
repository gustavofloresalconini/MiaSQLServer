CREATE PROCEDURE [dbo].[GetTitlesChangeByRowVersion]
	-- Add the parameters for the stored procedure here
(@startRow Bigint
,@endRow Bigint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT t.[title_id]
      ,t.[title]
      ,t.[type]
      ,t.[price]
      ,t.[advance]
      ,t.[pubdate]
  FROM [dbo].[titles] as t
  WHERE t.RowVersion> convert(rowversion,@startRow) and t.RowVersion<= convert(rowversion,@endRow)
END
GO