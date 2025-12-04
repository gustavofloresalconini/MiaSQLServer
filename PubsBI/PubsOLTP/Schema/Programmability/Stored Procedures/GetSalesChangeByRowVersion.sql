CREATE PROCEDURE [dbo].[GetSalesChangeByRowVersion]
(@startRow Bigint
,@endRow Bigint)
AS
BEGIN
	SELECT SaleID = sal.[stor_id] + sal.[ord_num] + sal.[title_id]
		,DateKey = CONVERT(INT,
						(CONVERT(CHAR(4),DATEPART(YEAR,sal.[ord_date]))
						+ CASE 
							WHEN DATEPART(MONTH,sal.[ord_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,sal.[ord_date]))
							ELSE + CONVERT(CHAR(2),DATEPART(MONTH,sal.[ord_date]))
						END
						+ CASE 
							WHEN DATEPART(DAY,sal.[ord_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,sal.[ord_date]))
							ELSE + CONVERT(CHAR(2),DATEPART(DAY,sal.[ord_date]))
						END))
		 , sal.stor_id
		 , titauth.au_id
		 , tit.pub_id
		 , sal.title_id
		 , quantity = sal.qty
		 , unit_price = tit.price
		 , total_amount = sal.qty * tit.price
	FROM [dbo].[sales] sal
	INNER JOIN [dbo].[titles] tit ON (tit.title_id = sal.title_id)
	INNER JOIN [dbo].[titleauthor] titauth ON (titauth.title_id = tit.title_id AND titauth.au_ord = 1)
	--
	WHERE (sal.[rowversion] > CONVERT(ROWVERSION,@startRow) AND sal.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	   OR (tit.[rowversion] > CONVERT(ROWVERSION,@startRow) AND tit.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	   OR (titauth.[rowversion] > CONVERT(ROWVERSION,@startRow) AND titauth.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO