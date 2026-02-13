### Cursors

1. Implicit Cursor
    - Automatically created with SQL command
    - Only one implicit cursor called SQL
    - Can get information about execution from cursor
        - %FOUND
            - Boolean
            - TRUE if atleast one row was changed or retrieved
        - %NOTFOUND
            - Boolean
            - TRUE if no rows were changed or retrieved
        - %ROWCOUNT
            - Number
            - Number of rows changed or retrieved
    - Only utilize implicit cursor after UPDATE or DELETE
    - Do not use it after INSERT or SELECT INTO

### Implicit Cursor after SELECT INTO

``` SQL
DECLARE
    v_salary    NUMBER;

BEGIN
    SELECT salary
      INTO v_salary
      FROM emp_employee
     WHERE empno = 7944;

    IF (SQL%FOUND) THEN -- Will crash if more than one found
        DBMS_OUTPUT.PUT_LINE('Found: ' || SQL%ROWCOUNT);
    ELSE -- Will crash if it gets here
        DBMS_OUTPUT.PUT_LINE('Not Found: ' || SQL%ROWCOUNT);
    END IF;
END;
/
```

### Implicit cursor after INSERT

``` SQL
DECLARE
    v_salary    NUMBER;

BEGIN
    INSERT INTO emp_employee
        (empno, ename)
    VALUES
        (43, 'Bob');

    -- Crashes, has no purpose
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('Found: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Found: ' || SQL%ROWCOUNT);
    END IF;
END;
/
```

### Implicit cursor after UPDATE

``` SQL
DECLARE
    v_salary    NUMBER;

BEGIN
    UPDATE emp_employee
        SET salary = 40
    WHERE empno = 43;

    -- Doesn't crash
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('Found: ' || SQL%ROWCOUNT);
    ELSE -- Can INSERT if doesn't exist
        INSERT INTO emp_employee
            (empno, salary, deptno)
        VALUES
            (43, 41, 10);
        DBMS_OUTPUT.PUT_LINE('Not Found: ' || SQL%ROWCOUNT);
    END IF;
END;
/
```

### Explicit Cursors

1. Row locking
	- Nice though rarely used feature
	- Auto locks rows when performing INSERT, UPDATE or DELETE
	- Others can't make changes until lock is released
	- Others can't see changes until lock released
	- Locks released by COMMIT or ROLLBACK
	- Can manually lock rows if UPDATE or DELETE performed on same table
	- Locked rows can't have COMMIT or ROLLBACK in cursor loop
		- Need COMMIT or ROLLBACK in loop for exception handling
	- Explicit cursor needs simple SELECT with only one table for manual lock

``` SQL
DECLARE
	CURSOR c_emp IS
		SELECT ename, salary, empno
		FROM emp_employee
		FOR UPDATE; -- Locks rows

BEGIN
	FOR r_emp IN c_emp LOOP
		UPDATE emp_employee
			SET salary = 20
		WHERE CURRENT OF c_emp; -- Update row cursor points to
	END LOOP;

	COMMIT; -- Can't be within loop
END;
/
```

2. Nested dependant looping
	- Explicit cursor loop inside explicit cursor loop
		- Inner loop is using information from outer loop
	- Two different explicit cursors, mimics one-to-many relationship
		- Outer loop is one and inner loop is many
		- Outer loop drives everything
		- Inner cursor WHERE clause references info in outer loop

``` SQL
-- Get name of department with name of all employees listed underneath

DECLARE
	v_deptno emp_employee.deptno%TYPE;

	CURSOR c_dept IS
		SELECT *
		FROM emp_department;

	CURSOR c_emp IS
		SELECT *
		FROM emp_employee
		WHERE deptno = v_deptno;

BEGIN
	FOR r_dept IN c_dept LOOP
		DBMS_OUTPUT.PUT_LINE(r_dept.dname);
		v_deptno := r_dept.deptno;

		FOR r_emp IN c_emp LOOP
			DBMS_OUTPUT.PUT_LINE(r_emp.ename || ' deptno: ' || r_emp.deptno);
		END LOOP;
	END LOOP;
END;
/
```
