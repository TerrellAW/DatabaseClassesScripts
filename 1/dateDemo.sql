SELECT ename, hiredate,
	TO_CHAR (hiredate, 'Dy, Month dd, yyyy hh:mi:ss')
	formatted_date
	FROM emp_employee;

SELECT ename, hiredate,
	TO_CHAR(hiredate, 'fmDy, Month dd, yyyy hh:mi:ss')
	formatted_date
	FROM emp_employee;

-- TO_DATE (string value, 'format mask')
-- Format mask is describing structure of the string to the database

-- Gives an error for not following the default mask
INSERT INTO emp_employee (empno, deptno, hiredate)
	VALUES (209, 10, 'October 31, 2025');

-- Works due to specifying a format with TO_DATE, the format mask in this case
INSERT INTO emp_employee (empno, deptno, hiredate)
	VALUES (209, 10, TO_DATE('October 31, 2025', 'Month dd, rrrr'));

SELECT ename, SYSDATE - hiredate days_between -- Subtract current date by hiredate to get amount of time since hired
	FROM emp_employee;

SELECT ename, SYSDATE + 30 invoice_date -- Date 30 days from current date
	FROM emp_employee;

---------------------------------------------------------------------------------------------------------------------
/*	UPDATE
	
	- Allows changing existing rows of data

	Syntax:
		UPDATE table_name
			SET column_name = new_value
		[WHERE condition];
		
		SET clause 		- identifies what the new column values will be
		WHERE clause 	- identifies which rows will have the data changes
*/
---------------------------------------------------------------------------------------------------------------------

UPDATE emp_employee
	SET ename = 'Ralph'
	WHERE ename IS NULL;

UPDATE emp_employee
	SET salary = salary * 1.2,
		commission = NULL
	WHERE salary < 2000;

---------------------------------------------------------------------------------------------------------------------
/*	DELETE
	
	- Allows removing existing rows of data

	Syntax:
		DELETE [FROM] table_name
		[WHERE condition];

	These are the same:
		DELETE table_name;
		DELETE FROM table_name; -- More ANSI compliant
*/
---------------------------------------------------------------------------------------------------------------------

DELETE emp_employee
	WHERE ename LIKE 'Ted%';

COMMIT;
---------------------------------------------------------------------------------------------------------------------
/*	Transactional Control Commands (TC)
	
	- Only relevant to DML commands
	
	1. COMMIT;
		- Saves data changes
	2. ROLLBACK;
		- Undoes data changes

	COMMIT		- will save all data changes since last COMMIT or ROLLBACK
	ROLLBACK	- will undo all data changes since last COMMIT or ROLLBACK

	After DML command is executed, data changes are not immediately saved, except for in the Oracle Academy version of APEX, which has auto-commit
	DDL commands, like ALTER, perform implicit commits


	Transaction can be multiple DML operations
	- Relational database ensures transactional consistency
		- No other user/session can see data changes until they have been saved (COMMIT)
		- Data is protected by locking the rows that are being modified until modifications are done (COMMIT, ROLLBACK)
*/
---------------------------------------------------------------------------------------------------------------------

UPDATE emp_employee
	SET ename = 'Ralph'

ROLLBACK;
