DECLARE

	-- Hard-coded constants
	k_pres			CONSTANT	CHAR(9)			:= 'PRESIDENT';
	k_half			CONSTANT	NUMBER(3, 2)	:= 0.50;
	k_qart			CONSTANT	NUMBER(3, 2)	:= 0.25;
	k_tnth			CONSTANT	NUMBER(3, 2)	:= 0.10;
	k_minsal		CONSTANT	NUMBER(3)		:= 100;
	k_maxcom		CONSTANT	NUMBER(3, 2)	:= 0.22;

	-- Variables for printing
	v_avg_sal					NUMBER(10, 2);
	v_pres_sal					NUMBER(10, 2);
	v_lowcom					NUMBER;

	-- Cursors
	CURSOR c_emp IS
		SELECT empno, job, salary, commission, deptno
		FROM emp_employee;

BEGIN

	-- Calculate and print average salary
	SELECT AVG(salary)
	  INTO v_avg_sal
	  FROM emp_employee;

	DBMS_OUTPUT.PUT_LINE('Average Salary: $' || v_avg_sal);
	DBMS_OUTPUT.PUT_LINE('----------------------');

	-- Fetch and print President's salary
	SELECT salary
	  INTO v_pres_sal
	  FROM emp_employee
	 WHERE job = k_pres;

	DBMS_OUTPUT.PUT_LINE('President Salary: $' || v_pres_sal);
	DBMS_OUTPUT.PUT_LINE('----------------------');
	DBMS_OUTPUT.PUT_LINE('');

	--FOR r_emp IN c_emp LOOP

		-- TODO: Lowest commission in a department

	--END LOOP;

END;
/
