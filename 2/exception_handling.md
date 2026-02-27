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
### Embedded Blocks

Multiple `DECLARE`, `BEGIN`, `EXCEPTION` and `END` structures can be embedded inside of the main `BEGIN`/`END` block.

#### Variable Scope

- Inside block can see variables in outer block
- Outer block can't see variables in inner block

``` SQL
DECLARE
	
	v_char1		CHAR := 'A';
	v_char2		CHAR := 'B';

BEGIN

	-- Will output 'A'
	DBMS_OUTPUT.PUT_LINE(v_char1);

	DECLARE

		v_char1 CHAR := 'Q';
		v_char3 CHAR := 'C';

	BEGIN

		v_char1 := 'P';

		-- Will output 'PB'
		DBMS_OUTPUT.PUT_LINE(v_char1 || v_char2);
		-- Will output 'PC'
		DBMS_OUTPUT.PUT_LINE(v_char1 || v_char3);
	END;

	-- Will output 'AB'
	DBMS_OUTPUT.PUT_LINE(v_char1 || v_char2);

END;
/
```

#### Exception Scope

Errors are raised to the outermost `EXCEPTION` block when `RAISE` or `RAISE_APPLICATION_ERROR` are used.

``` SQL
DECLARE

	v_salary		NUMBER;

BEGIN

	BEGIN

		SELECT salary
		  INTO v_salary
		  FROM emp_employee
		 WHERE empno = 7994;
	
	EXCEPTION

		WHEN no_data_found THEN
			RAISE_APPLICATION_ERROR(
				-20000,
				'7994 is an invalid empno'
			);
	END;

	BEGIN

		SELECT salary
		  INTO v_salary
		  FROM emp_employee
		 WHERE empno = 1;
	
	EXCEPTION

		WHEN no_data_found THEN
			RAISE_APPLICATION_ERROR(
				-20001,
				'1 is an invalid empno'
			);
	
	END;

EXCEPTION

	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
```

#### Errors in Main Cursor Loop

`EXCEPTION` block must be between `BEGIN` and `END`, and `END` must be directly after the `EXCEPTION` block.

``` SQL
DECLARE

	CURSOR c_emp IS
		SELECT *
		  FROM emp_employee;

BEGIN

	FOR r_emp IN c_emp LOOP

		BEGIN

			IF (r_emp.salary < 2000) THEN
				RAISE_APPLICATION_ERROR(-20000, 'ERROR!');
			END IF;

			DBMS_OUTPUT.PUT_LINE('Inside loop');

			-- If we have data changes that need to be saved
			-- COMMIT should be centralised inside the loop
			COMMIT;

		-- Main exception block must be in loop to prevent
		-- loop from ending when exception occurs
		EXCEPTION

			-- If data was modified and it causes an exception
			-- ROLLBACK should be centralised inside the EXCEPTION block
			ROLLBACK;

			WHEN others THEN
				DBMS_OUTPUT.PUT_LINE(SQLERRM);
		END;

	END LOOP;

END;
/
```

#### Error Log Table

Table that holds identifying information about row of a table that caused an error.

``` SQL
DECLARE

	CURSOR c_emp IS
		SELECT *
		  FROM emp_employee;

	-- Declare error message variable
	v_msg	emp_error_log.error_msg%TYPE;

BEGIN

	FOR r_emp IN c_emp LOOP

		BEGIN

			IF (r_emp.salary < 2000) THEN
				RAISE_APPLICATION_ERROR(-20000, 'ERROR!');
			END IF;

			DBMS_OUTPUT.PUT_LINE('Inside loop');

			-- If we have data changes that need to be saved
			-- COMMIT should be centralised inside the loop
			COMMIT;

		-- Main exception block must be in loop to prevent
		-- loop from ending when exception occurs
		-- if loops are nested, should be in outermost loop
		EXCEPTION

			-- If data was modified and it causes an exception
			-- ROLLBACK should be centralised inside the EXCEPTION block
			ROLLBACK;

			-- Necessary for error message within SQL statement
			v_msg := SQLERRM;

			-- If above does not work, do
--			v_msg := SUBSTR(SQLERRM, 1, 100);

			-- Insert error information into error table
			INSERT INTO emp_error_log(
				empno,
				error_msg
			);
			VALUES(
				r_emp.empno,
				v_msg
			);

			COMMIT;

		END;

	END LOOP;

END;
/
```

#### Data Validation

Determine if a data object is valid with two general methods:

1. Using an embedded block:

``` SQL
DECLARE
	
	v_student_id	student.student_id%TYPE;

BEGIN

-- functionality here

	BEGIN

		SELECT student_id
		  INTO v_student_id
		  FROM student
		 WHERE student_id = '1223';

	EXCEPTION

		-- If student does not exist in database
		WHEN no_data_found THEN
			RAISE_APPLICATION_ERROR(
				-20000,
				'Student is not valid'
			);
	END;

EXCEPTION

	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
```

2. Using `COUNT` and `IF` or `CASE`:

``` SQL
DECLARE

	v_count		NUMBER;

BEGIN

	-- functionality here

	SELECT COUNT(*)
	  INTO v_count
	  FROM student
	 WHERE student_id = '1223';

	IF (v_count = 0) THEN
		RAISE_APPLICATION_ERROR(
			-20000,
			'Student is not valid'
		);

EXCEPTION

	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
```
