DECLARE

	-- Cursors
	CURSOR c_new_trans IS
		SELECT *
		FROM new_transactions;

BEGIN

	-- Loop through new transactions in new_transactions table
	FOR r_new_trans IN c_new_trans LOOP

		-- TODO: Account foreign key needs to be in table
		-- TODO: Update account balance with accounting formula

		-- Insert into transaction detail
		INSERT INTO transaction_detail (
			account_no,
			transaction_no,
			transaction_type,
			transaction_amount
		)
		VALUES (
			r_new_trans.account_no,
			r_new_trans.transaction_no,
			r_new_trans.transaction_type,
			r_new_trans.transaction_amount
		);

		-- Insert into transaction_history
		INSERT INTO transaction_history (
			transaction_no,
			transaction_date,
			description
		)
		VALUES (
			r_new_trans.transaction_no,
			r_new_trans.transaction_date,
			r_new_trans.description
		);

		-- TODO: Exception handling

	END LOOP;

END;
/
