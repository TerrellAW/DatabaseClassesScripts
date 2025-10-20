---------------------------------------------------------------
/*	SELECT statement order of compilation:
1. FROM
2. WHERE
3. GROUP BY
4. HAVING BY
5. SELECT (including AS)
6. ORDER BY
*/
---------------------------------------------------------------

-- See data directly
SELECT *
	FROM emp_employee;

-- See physical structure of the table but not the data
DESC emp_employee;

-- See employee number, name, salary and salary multiplied by 1.2
SELECT empno, ename, salary, salary * 1.2
	FROM emp_employee;

-- Column aliases
--	- Two formats:
--		1. Valid column name, could be required in some situations, such as creating a View
--		2. Letter case or spaces in column heading, about visual format of text in output
SELECT empno, ename, salary, salary * 1.2 AS increased_salary
	FROM emp_employee;

-- AS keyword is optional
SELECT empno, ename, salary, salary * 1.2 increased_salary
	FROM emp_employee;

-- Aliasing for making text output 'pretty'
SELECT empno "Employee Number", ename "Employee Name", salary "Salary", salary * 1.2 "Increased Salary"
	FROM emp_employee;

-- Eliminate duplicate data with DISTINCT or UNIQUE in the SELECT clause
SELECT UNIQUE deptno
	FROM emp_employee;

-- Will display duplicate deptno
SELECT deptno
	FROM emp_employee;

-- Will have duplicates for job entries that have the same deptno
SELECT DISTINCT deptno, job
	FROM emp_employee;

---------------------------------------------------------------
/*	ORDER BY
- Columns identified in ORDER BY clause don't have to be part of SELECT clause
- Default order is ascending
- ORDER BY can specify ascending (ASC) or descending (DESC)
- Can have multiple columns, each can specify ascending or descending
*/
---------------------------------------------------------------

-- Display in descending order by salary
SELECT empno, ename, salary, salary * 1.2 "Increased Salary"
	FROM emp_employee
	ORDER BY salary DESC;

-- Order by deptno in ascending order, and then by salary in descending order within each deptno
SELECT deptno, empno, ename, salary, salary * 1.2 "Increased Salary"
	FROM emp_employee
	ORDER BY deptno, salary DESC;

-- Order by aliased column
SELECT deptno, empno, ename, salary, salary * 1.2 increased_salary
	FROM emp_employee
	ORDER BY deptno, increased_salary DESC;

-- With string alias
SELECT deptno, empno, ename, salary, salary * 1.2 "Increased Salary"
	FROM emp_employee
	ORDER BY deptno, "Increased Salary" DESC;

-- Following method not recommended, using column position
SELECT deptno, empno, ename, salary, salary * 1.2 "Increased Salary"
	FROM emp_employee
	ORDER BY 1 ASC, 5 DESC;

---------------------------------------------------------------
/*	WHERE
- Eliminiates/filters rows from being displayed
- Uses boolean logic
- Multiplce conditions, but only one WHERE clause
- Additional conditions added using AND/OR
*/
---------------------------------------------------------------

-- Only returns rows where employee has salary greater than 4000
SELECT ename, salary
	FROM emp_employee
	WHERE salary > 4000;

-- Multi-value IN operator used to compare column value to list of values
SELECT ename, salary
	FROM emp_employee
	WHERE deptno IN (10, 30);

-- Same as
SELECT ename, salary
	FROM emp_employee
	WHERE deptno = 10
	OR	  deptno = 30;

-- Multi-value BETWEEN used to compare to a range of values, returns all salaries from 3000 to 4000
SELECT ename, salary
	FROM emp_employee
	WHERE salary BETWEEN 3000 AND 4000;

-- Same as
SELECT ename, salary
	FROM emp_employee
	WHERE salary >= 3000
	AND   salary <= 4000;

-- Multi-value LIKE operator used to perform string search with wild cards
-- - % = Any character, any number of characters
-- - _ = Any character, exactly one character

SELECT ename, salary
	FROM emp_employee
	WHERE ename LIKE '%re_'; -- Finds name that starts with any characters, and ends with 're' and one last character after

---------------------------------------------------------------
/*	REGEXP_LIKE (Regular Expressions)
*/
---------------------------------------------------------------

-- Phone number REGEX format
SELECT phone_number
	FROM emp_employee
	WHERE REGEXP_LIKE(phone_number, '[0-9]{3}\.[0-9]{3}\.[0-9]{4}') -- Finds value arranged like: ###.###.####

-- Postal code REGEX format
SELECT postal_code
	FROM emp_employee
	WHERE REGEXP_LIKE(postal_code, '[A-Z][0-9][A-Z][0-9][A-Z][0-9]') -- Finds value arranged like: A#A#A#

---------------------------------------------------------------
/*	Order of Precedence
	
	Math:
1. () override the order of precedence
2. * and /
3. + and -

	Note: If NULL is part of the calculation, result will ALWAYS be NULL

	WHERE:
1. () override the order of precedence
2. AND
3. OR
*/
---------------------------------------------------------------

