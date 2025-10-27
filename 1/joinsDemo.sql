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

SELECT surname, account_description
	FROM 	WGB_ACCOUNT ac, WGB_CUSTOMER cu, WGB_ACCOUNT_TYPE at
	WHERE 	ac.customer_number 	= 	cu.customer_number
	AND		ac.account_type		= 	at.account_type; -- Traditional method

