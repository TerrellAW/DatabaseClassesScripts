## Exception Handling

### Exception Types

There are two types of errors:

1. Oracle Errors:
	- Automatically thrown when a database rule is broken
	- Predefined Oracle Errors:
		- Exception handler already exists
		1. `NO_DATA_FOUND`:
			- Only occurs with `SELECT INTO`
			- When `SELECT INTO` returns 0 rows
		2. `TOO_MANY_ROWS`:
			- Only occurs with `SELECT INTO`
			- When `SELECT INTO` returns more than one row
		3. `CASE_NOT_FOUND`:
			- Only occurs with a `CASE` statement
			- Occurs when no matching condition and no `ELSE`
		4. `ZERO_DIVIDE`:
			- Occurs when dividing a number by 0
		5. `DU_VAL_ON_INDEX`:
			- Unique constraint violation
	- Non-Predefined Oracle Errors:
		- Most possible errors are not predefined
		- Must make our own exception handler
2. User Defined Errors:
	- `RAISE` command:
		- Does not generate system level error
		- Works well with anonymous blocks
		- Not great in stored programs where errors need to propagate out
		- Need to create exception handler for each `RAISE`
		- Allows multiple custom error handlers in `EXCEPTION` area
	- `RAISE_APPLICATION_ERROR` command:
	  	- Generates system level error
		- Works well with anonymous blocks
		- Allows propagation of errors from stored programs
		- Always falls to `OTHER` exception handler
		- Has two parameters:
			1. Error code
				- 1000 numbers available for user defined errors
				- -20000 to -20999
			2. Error message

### Basic Exception Structure

#### Predefined Oracle Error

``` SQL
DECLARE

	v_salary	NUMBER;

BEGIN

	SELECT salary
	  INTO v_salary
	  FROM emp_employee
	 WHERE empno = 1;

-- Multiple WHEN statements
-- Not based on TRUE/FALSE condition
-- Based on exception handler
EXCEPTION

	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Bad employee');
	WHEN others THEN
		-- Catch all with generic error message
		DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
```

#### Non-Predefined Oracle Error

``` SQL
DECLARE

	-- Declare custom exception handler
	e_deptno_referenced EXCEPTION;

	-- Tell compiler to initialize exception for error code
	PRAGMA EXCEPTION_INIT(
		e_deptno_referenced,
		-02292
	);

BEGIN
	
	DELETE emp_department
	 WHERE deptno = 10;

EXCEPTION

	WHEN e_deptno_referenced THEN
		DBMS_OUTPUT.PUT_LINE('Cannot remove dept');

END;
/
```
#### User Defined Error

``` SQL
-- Create exception handler
-- Issue RAISE
-- Handle exception with WHEN statement

DECLARE

	-- Counter variable
	v_count			NUMBER;

	-- Exception variable
	e_bad_emp_count	EXCEPTION;

BEGIN
	
	-- Won't throw NO_DATA_FOUND or TOO_MANY_ROWS
	SELECT COUNT(*)
	  INTO v_count
	  FROM emp_employee
	 WHERE deptno = 10;

	IF (v_count < 10) THEN
		RAISE e_bad_emp_count;
	END IF;

EXCEPTION

	WHEN e_bad_emp_count THEN
		DBMS_OUTPUT.PUT_LINE('Hire more employees!');

END;
/
```

``` SQL
-- Issue RAISE_APPLICATION_ERROR
-- Create OTHERS exception handler in EXCEPTION block

DECLARE

	v_count		NUMBER;

BEGIN

	SELECT COUNT(*)
	  INTO v_count
	  FROM emp_employee
	 WHERE deptno = 10;

	IF (v_count < 10) THEN
		RAISE_APPLICATION_ERROR(-20000, 'Hire more employees!');
	END IF;

EXCEPTION

	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
```
