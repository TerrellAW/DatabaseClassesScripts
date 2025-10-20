/*
---------------------------------------------------------------
SELECT statement order of compilation:
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

-- ORDER BY clause
