DECLARE

	-- Hard-coded constants
	k_pres			CONSTANT	CHAR(9)			:= 'PRESIDENT';
	k_half			CONSTANT	NUMBER(3, 2)	:= 0.50;
	k_qart			CONSTANT	NUMBER(3, 2)	:= 0.75;
	k_tnth			CONSTANT	NUMBER(3, 2)	:= 1.10;
	k_min_sal		CONSTANT	NUMBER(3)		:= 100;
	k_max_com		CONSTANT	NUMBER(3, 2)	:= 0.22;

	-- Variables for printing
	v_avg_sal					NUMBER(10, 2);
	v_pres_sal					NUMBER(10, 2);
	v_low_com					NUMBER;

	-- Variables for logic
	v_half_sal					NUMBER(10, 2);
	v_lowr_sal					NUMBER(10, 2);
	v_new_sal					NUMBER(10, 2);

	-- Cursors
	CURSOR c_emp IS
		SELECT empno, job, salary, commission, deptno
		FROM emp_employee;

BEGIN

	-- Calculate and print average salary
	SELECT AVG(salary)
	  INTO v_avg_sal
	  FROM emp_employee;

	DBMS_OUTPUT.PUT_LINE('AVERAGE Salary: $' || v_avg_sal);
	DBMS_OUTPUT.PUT_LINE('----------------------');

	-- Fetch and print President's salary
	SELECT salary
	  INTO v_pres_sal
	  FROM emp_employee
	 WHERE job = k_pres;

	DBMS_OUTPUT.PUT_LINE(k_pres || ' Salary: $' || v_pres_sal);
	DBMS_OUTPUT.PUT_LINE('----------------------');
	DBMS_OUTPUT.PUT_LINE('');

	FOR r_emp IN c_emp LOOP
		
		-- Handle salaries lower than k_min_sal
		IF (r_emp.salary < k_min_sal) THEN

			DBMS_OUTPUT.PUT_LINE(
				r_emp.job					||
				' '							||
				r_emp.empno					||
				' has salary lower than '	||
				k_min_sal
			);

			DBMS_OUTPUT.PUT_LINE('');

			DBMS_OUTPUT.PUT_LINE(
				r_emp.job		||
				' '				||
				r_emp.empno 	||
				' salary: $' 	||
				r_emp.salary
			);

			DBMS_OUTPUT.PUT_LINE('');

			v_new_sal := r_emp.salary * k_tnth;

			IF (v_new_sal < v_avg_sal) THEN

				UPDATE emp_employee
				   SET salary = v_new_sal
				 WHERE empno = r_emp.empno;

				COMMIT;

				DBMS_OUTPUT.PUT_LINE(
					r_emp.job		 ||
					' '				 ||
					r_emp.empno 	 ||
					' new salary: $' ||
					v_new_sal
				);

			END IF;

		END IF;

		-- Handle salaries higher than president's
		IF (r_emp.job != k_pres AND r_emp.salary > v_pres_sal) THEN

			DBMS_OUTPUT.PUT_LINE(
				r_emp.job 					||
				' '							||
				r_emp.empno 				||
				' has higher salary than ' 	||
				k_pres
			);

			DBMS_OUTPUT.PUT_LINE('');

			DBMS_OUTPUT.PUT_LINE(
				r_emp.job		||
				' '				||
				r_emp.empno 	||
				' salary: $' 	||
				r_emp.salary
			);

			DBMS_OUTPUT.PUT_LINE('');

			v_half_sal := r_emp.salary * k_half;
			v_lowr_sal := v_pres_sal * k_qart;

			IF (v_half_sal > v_lowr_sal) THEN

				UPDATE emp_employee
				   SET salary = v_lowr_sal
				 WHERE empno = r_emp.empno;

				COMMIT;

				DBMS_OUTPUT.PUT_LINE(
					r_emp.job		 ||
					' '				 ||
					r_emp.empno 	 ||
					' new salary: $' ||
					v_lowr_sal
				);

			ELSE

				UPDATE emp_employee
				   SET salary = v_half_sal
				 WHERE empno = r_emp.empno;

				COMMIT;

				DBMS_OUTPUT.PUT_LINE(
					r_emp.job		 ||
					' '				 ||
					r_emp.empno 	 ||
					' new salary: $' ||
					v_half_sal
				);

			END IF;

		END IF;

	END LOOP;

END;
/
