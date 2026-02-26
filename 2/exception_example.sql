DECLARE

	v_salary	NUMBER;

BEGIN

	SELECT salary
	  INTO v_salary
	  FROM emp_employee
	 WHERE deptno = 10;

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

		EXCEPTION

			WHEN others THEN
				DBMS_OUTPUT.PUT_LINE(SQLERRM);
		END;

	END LOOP;

END;
/
