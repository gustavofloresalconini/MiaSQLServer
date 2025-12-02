CREATE PROCEDURE [dbo].[GetAuthorsChangeByRowVersion]
	-- Add the parameters for the stored procedure here
(@startRow Bigint
,@endRow Bigint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT s.[au_id]
      ,s.[au_lname]
      ,s.[au_fname]
      ,s.[phone]
      ,s.[city]
	  ,s.[state]
	  ,s.[zip]
        FROM [dbo].[authors] as s
		WHERE s.[RowVersion]>CONVERT(rowversion, @startRow) and s.[RowVersion]<=CONVERT(rowversion, @endRow)
END
GO
