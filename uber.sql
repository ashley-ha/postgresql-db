-- write a query to obtain the third transaction of every user
-- output: user_id, spend, transaction_date

select user_id, spend, transaction_date
FROM (

select user_id, spend, transaction_date,

	RANK() OVER ( 
		PARTITION BY user_id
		ORDER BY transaction_date ASC) 
	AS row_num
		
	from transactions
	) AS trans_num
	
	WHERE row_num = 3;
