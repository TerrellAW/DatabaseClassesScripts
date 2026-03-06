DECLARE

	-- Hard-coded constants
	k_pres			CONSTANT	CHAR(9)			:= 'PRESIDENT';
	k_half			CONSTANT	NUMBER(3, 2)	:= 0.50;
	k_qart			CONSTANT	NUMBER(3, 2)	:= 0.75;
	k_tnth			CONSTANT	NUMBER(3, 2)	:= 1.10;
	k_min_sal		CONSTANT	NUMBER(3)		:= 100;
	k_max_com		CONSTANT	NUMBER(3, 2)	:= 1.22;

	-- Variables for printing
	v_avg_sal					NUMBER(10, 2);
	v_pres_sal					NUMBER(10, 2);
	v_low_com					NUMBER;

	-- Variables for logic
	v_half_sal					NUMBER(10, 2);
	v_lowr_sal					NUMBER(10, 2);
	v_new_sal					NUMBER(10, 2);
	v_max_com					NUMBER(10, 2);

	-- Cursors
	CURSOR c_emp IS
		SELECT empno, job, salary, commission, deptno
		FROM emp_employee;

BEGIN

	-- Calculate and print average salary
	SELECT AVG(salary)
	  INTO v_avg_sal
	  FROM emp_employee;

	DBMS_OUTPUT.PUT_LINE('----------------------');
	DBMS_OUTPUT.PUT_LINE('AVERAGE Salary: $' || v_avg_sal);
	DBMS_OUTPUT.PUT_LINE('----------------------');

	-- Fetch and print President's salary
	SELECT salary
	  INTO v_pres_sal
	  FROM emp_employee
	 WHERE job = k_pres;

	DBMS_OUTPUT.PUT_LINE(k_pres || ' Salary: $' || v_pres_sal);
	DBMS_OUTPUT.PUT_LINE('----------------------');

	FOR r_emp IN c_emp LOOP

		-- Handle commissions higher than r_emp.salary * k_max_com
		v_max_com := r_emp.salary * k_max_com;
		IF (r_emp.commission > v_max_com) THEN

			DBMS_OUTPUT.PUT_LINE('----------------------');
			DBMS_OUTPUT.PUT_LINE(
				r_emp.job						||
				' '								||
				r_emp.empno						||
				' has commission higher than $'	||
				v_max_com
			);


			DBMS_OUTPUT.PUT_LINE(
				r_emp.job		 ||
				' '				 ||
				r_emp.empno 	 ||
				' commission: $' ||
				r_emp.commission
			);

			SELECT MIN(
				
				CASE 
					WHEN commission > 0
					THEN commission
				END

			) INTO v_low_com
			  FROM emp_employee
			 WHERE deptno = r_emp.deptno;

			DBMS_OUTPUT.PUT_LINE(
				'The lowest commission in department '	||
				r_emp.deptno							||
				' is: $'								||
				v_low_com
			);

			UPDATE emp_employee
			   SET commission = v_low_com
			 WHERE empno = r_emp.empno;

			COMMIT;

			DBMS_OUTPUT.PUT_LINE(
				r_emp.job		 	||
				' '				 	||
				r_emp.empno 	 	||
				' new commission: $'||
				v_low_com
			);
			DBMS_OUTPUT.PUT_LINE('----------------------');

		END IF;
		
		-- Handle salaries lower than k_min_sal
		IF (r_emp.salary < k_min_sal) THEN

			DBMS_OUTPUT.PUT_LINE('----------------------');
			DBMS_OUTPUT.PUT_LINE(
				r_emp.job					||
				' '							||
				r_emp.empno					||
				' has salary lower than '	||
				k_min_sal
			);

			DBMS_OUTPUT.PUT_LINE(
				r_emp.job		||
				' '				||
				r_emp.empno 	||
				' salary: $' 	||
				r_emp.salary
			);

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
				DBMS_OUTPUT.PUT_LINE('----------------------');

			END IF;

		END IF;

		-- Handle salaries higher than president's
		IF (r_emp.job != k_pres AND r_emp.salary > v_pres_sal) THEN

			DBMS_OUTPUT.PUT_LINE('----------------------');
			DBMS_OUTPUT.PUT_LINE(
				r_emp.job 					||
				' '							||
				r_emp.empno 				||
				' has higher salary than ' 	||
				k_pres
			);

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
				DBMS_OUTPUT.PUT_LINE('----------------------');

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
				DBMS_OUTPUT.PUT_LINE('----------------------');

			END IF;

		END IF;

	END LOOP;

END;
/
