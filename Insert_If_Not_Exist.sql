INSERT INTO PAIDTRansactions (transactionID, AccountID, TranDate, Amount, Status) -- Insert into the table PaidTransactions
SELECT transactionID, AccountID, TranDate, Amount, [Tran Status]  FROM V_Transaction vt -- SELECT FROM V_Transaction where is the calculations
 where [Tran Status] = 'Paid' -- and transaction status is equal to Paid
 AND NOT EXISTS (select 1 -- We need to insert them if they do not already exist in the table PaidTransactions. 
				  from PaidTransactions pt 
				  WHERE pt.TransactionID = vt.TransactionID) -- Simple SubQuery
