---------------------------------------------------------------------
/*	JOIN
	Allow connecting tables together to see only relevant information
	
	Types of JOINs:
		- Equality JOINs (equi-joins)
			> Table connections are based on equality ('=')
			> Connected with PK/FK relationships
			
			- INNER JOINs
				> Most common type
			- OUTER JOINs
				> Equality JOIN+ 
			- Self-JOINs
				> Uses self-referencing FKs
		
		- Inequality JOINs
			> Connecting tables based on something other than equality ('=')

	Four methods to perform joins:
		1. Traditional method
			- In the WHERE clause
			- Not an ANSI/ISO standard
		2. JOIN ... ON
			- ISO standard
			- No limitations
			- Syntax closely follows traditional method
		3. JOIN ... USING
			- ISO standard
			- Some limitations
		4. NATURAL JOIN
			- ISO standard
			- More limitations
*/
---------------------------------------------------------------------

/*	Equality INNER JOIN
	
	TABLE: EMP
	-----------------------------------------------
	empno	|	ename	|	salary	|	deptno (FK)
	-----------------------------------------------
	100		|	Fred	|	400		|	10
	200		|	Sue		|	400		|	20
	300		|	Arsal	|	500		|	10

	TABLE: DEPT
	-----------------
	deptno	|	dname
	-----------------
	10		|	IT
	20		|	HR
	30		|	ACCT
*/

SELECT * FROM emp, dept;

/*	RESULT

	Step 1
	Cartesian Product:
	---------------------------------------------------------------------------------
	empno	|	ename	|	salary	|	deptno (EMP)	|	deptno(DEPT)	|	dname
	---------------------------------------------------------------------------------
	100		|	Fred	|	400		|	10				|	10				|	IT		- relevant
	100		|	Fred	|	400		|	10				|	20				|	HR		- irrelevant
	100		|	Fred	|	400		|	10				|	30				|	ACCT	- irrelevant
	200		|	Sue		|	400		|	20				|	10				|	IT		- irrelevant
	200		|	Sue		|	400		|	20				|	20				|	HR		- relevant
	200		|	Sue		|	400		|	20				|	30				|	ACCT	- irrelevant
	300		|	Arsal	|	500		|	10				|	10				|	IT		- relevant
	300		|	Arsal	|	500		|	10				|	20				|	HR		- irrelevant
	300		|	Arsal	|	500		|	10				|	30				|	ACCT	- irrelevant

	Contains irrelevant data, such as rows with mismatched departments
*/

SELECT *
	 FROM 	emp, dept
	WHERE 	emp.deptno = dept.deptno; -- # join conditions = # columns - 1

-- With table aliases
SELECT *
	 FROM 	emp e, dept d -- 'e' and 'd' are table aliases
	WHERE 	e.deptno = d.deptno; -- Table aliases can be used right away

/*	RESULT

	Step 2
	Selection:
	---------------------------------------------------------------------------------
	empno	|	ename	|	salary	|	deptno (EMP)	|	deptno(DEPT)	|	dname
	---------------------------------------------------------------------------------
	100		|	Fred	|	400		|	10				|	10				|	IT		- relevant
	200		|	Sue		|	400		|	20				|	20				|	HR		- relevant
	300		|	Arsal	|	500		|	10				|	10				|	IT		- relevant
	
	Eliminates irrelevant data by connecting PK and FK
*/

---------------------------------------------------------------------

/*	PROBLEM
	Display the surname of all customers along with the account description for each of their accounts.

	Show: customer surname, account description
	
	Hard coded values: None
	Conditions: None

	Ordering/Formatting: None

	Tables: WGB_CUSTOMER, WGB_ACCOUNT_TYPE, WGB_ACCOUNT
	
	Tables from WGB_ERD PDF on D2L
*/

SELECT 		surname, account_description
	 FROM 	WGB_ACCOUNT ac, WGB_CUSTOMER cu, WGB_ACCOUNT_TYPE at
	WHERE 	ac.customer_number 	= 	cu.customer_number
	  AND	ac.account_type		= 	at.account_type; -- Traditional method

---------------------------------------------------------------------

/*	JOIN ... ON

	- No restrictions
	- Can use for any type of JOIN
	- Closely resembles syntax of traditional method
	- JOIN conditions in the FROM clause
	- Need to prefix columns that are common between tables
*/

SELECT 		ename, e.deptno, dname
	 FROM 	emp e 	JOIN 	dept d
	   				  ON	e.deptno = d.deptno;

SELECT		surname, account_description
	 FROM	WGB_ACCOUNT ac 	JOIN 	WGB_CUSTOMER cu
							  ON	ac.customer_number 	=	cu.customer_numer
							JOIN	WGB_ACCOUNT_TYPE at
							  ON	ac.account_type		=	at.account_type;

SELECT		transaction_number, transaction_date, account_description
	 FROM	WGB_TRANSACTION tr	JOIN	WGB_ACCOUNT_TYPE at
								  ON	at.account_type		=	ac.account_type
								JOIN	WGB_ACCOUNT ac
								  ON	tr.customer_number	=	ac.customer_number
								 AND	tr.account_type		=	ac.account_type;

---------------------------------------------------------------------
/*	JOIN ... USING

	- Some limitations:
		> Can only connect tables whose PK and FK column names are the same
		> Can't prefix the columns that are being JOINed
*/

SELECT 		ename, e.deptno, dname
	 FROM	emp		 JOIN	dept
					USING	(deptno);

SELECT		surname, account_description
	 FROM	WGB_ACCOUNT		 JOIN	WGB_CUSTOMER
							USING	(customer_number)
							 JOIN	WGB_ACCOUNT_TYPE
							USING	(account_type);

SELECT		transaction_number, transaction_date, account_description
	 FROM	WGB_TRANSACTION		 JOIN	WGB_ACCOUNT_TYPE
								USING	(account_type)
								 JOIN	WGB_ACCOUNT
								USING	(customer_number, account_type);

---------------------------------------------------------------------
/*	NATURAL JOIN
	
	- Limitations:
		> Can only connect tables whose PK and FK column names are the same
		> Can't prefix any columns (no table aliases)
		> Will automatically connect all column names that are the same between tables
*/

SELECT		ename, deptno, dname
	FROM	emp NATURAL JOIN dept;

SELECT		surname, account_description
	FROM	WGB_ACCOUNT NATURAL JOIN WGB_CUSTOMER NATURAL JOIN WGB_ACCOUNT_TYPE;

SELECT		transaction_number, transaction_date, account_description
	FROM	WGB_TRANSACTION NATURAL JOIN WGB_ACCOUNT_TYPE NATURAL JOIN WGB_ACCOUNT;

