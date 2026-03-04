-- Display number of days until New Year's day 2027 from today's date
DECLARE

	k_new_years CONSTANT DATE := TO_DATE('Jan 1, 2027', 'Mon dd, yyyy');

BEGIN

	-- Get current date from system and round up to 0 decimals
	DBMS_OUTPUT.PUT_LINE(ROUND(k_new_years - SYSDATE, 0));

END;
/

-- Using EMP_EMPLOYEE table, if number of employees in Paula Phillips' 
-- department is less than 4 print "Need to hire employees."
DECLARE

	k_min_emp  CONSTANT NUMBER 	     := 4;
	k_emp_name CONSTANT VARCHAR2(25) := 'Paula Phillips';
	k_message  CONSTANT CHAR(25)	 := 'Need to hire employees.';
	v_deptno			NUMBER;
	v_num_emp		    NUMBER;

BEGIN

	SELECT deptno
		INTO v_deptno
	    FROM emp_employee
		WHERE INITCAP(ename) = k_emp_name;

	SELECT COUNT(*)
		INTO	v_num_emp
		FROM	emp_employee
		WHERE deptno = v_deptno;

	IF (v_num_emp < k_min_emp) THEN

		DBMS_OUTPUT.PUT_LINE(k_message);

	END IF;

	/* Using CASE statement
	CASE
		
		WHEN (v_num_emp < k_min_emp) THEN
			
			DBMS_OUTPUT.PUT_LINE(k_message);

		ELSE
		
			DBMS_OUTPUT.PUT_LINE('No hire');

	END CASE:
	*/

END;
/

/*
Display numbers from 1 to 100:

- For multiples of 3 print 'Fizz' instead of the number

- For multiples of 5 print 'Buzz' instead of the number

- For multiples of both 3 and 5 print 'FizzBuzz' instead of the number
*/
DECLARE

	k_first_num CONSTANT NUMBER  := 3;
	k_sec_num   CONSTANT NUMBER  := 5;
	k_fizz		CONSTANT CHAR(4) := 'Fizz';
	k_buzz		CONSTANT CHAR(4) := 'Buzz';
	v_is_fizz		     NUMBER;
	v_is_buzz			 NUMBER;
	v_num				 NUMBER;

BEGIN

	FOR v_num IN 1..100 LOOP

		v_is_fizz := MOD(v_num, k_first_num);
		v_is_buzz := MOD(v_num, k_sec_num);

		IF (v_is_fizz != 0 AND v_is_buzz != 0) THEN
			DBMS_OUTPUT.PUT_LINE(v_num);
		ELSIF (v_is_fizz = 0 AND v_is_buzz = 0) THEN
			DBMS_OUTPUT.PUT_LINE(k_fizz || k_buzz);
		ELSIF (v_is_fizz = 0) THEN
			DBMS_OUTPUT.PUT_LINE(k_fizz);
		ELSE
			DBMS_OUTPUT.PUT_LINE(k_buzz);
		END IF;

	END LOOP;

END;
/

-- Same problem but use WHILE loop and SEARCH CASE
DECLARE

	k_first_num CONSTANT NUMBER  := 3;
	k_sec_num   CONSTANT NUMBER  := 5;
	k_fizz		CONSTANT CHAR(4) := 'Fizz';
	k_buzz		CONSTANT CHAR(4) := 'Buzz';
	v_is_fizz		     NUMBER;
	v_is_buzz			 NUMBER;
	v_num				 NUMBER  := 1;

BEGIN
	
	WHILE (v_num <= 100) LOOP

		v_is_fizz := MOD(v_num, k_first_num);
		v_is_buzz := MOD(v_num, k_sec_num);

		CASE
			WHEN (v_is_fizz != 0 AND v_is_buzz != 0) THEN
				DBMS_OUTPUT.PUT_LINE(v_num);
			WHEN (v_is_fizz = 0 AND v_is_buzz = 0) THEN
				DBMS_OUTPUT.PUT_LINE(k_fizz || k_buzz);
			WHEN (v_is_fizz = 0) THEN
				DBMS_OUTPUT.PUT_LINE(k_fizz);
			WHEN (v_is_buzz = 0) THEN
				DBMS_OUTPUT.PUT_LINE(k_buzz);
		END CASE;

		v_num := v_num + 1;

	END LOOP;

END;
/

-- Same problem but use basic LOOP and CASE expression
DECLARE

	k_first_num CONSTANT NUMBER    := 3;
	k_sec_num   CONSTANT NUMBER    := 5;
	k_fizz		CONSTANT   CHAR(4) := 'Fizz';
	k_buzz		CONSTANT   CHAR(4) := 'Buzz';
	v_is_fizz		     NUMBER;
	v_is_buzz			 NUMBER;
	v_num				 NUMBER    := 1;
	v_print			   VARCHAR2(10);

BEGIN
	
	LOOP

		v_is_fizz := MOD(v_num, k_first_num);
		v_is_buzz := MOD(v_num, k_sec_num);

		v_print := 	CASE
						WHEN (v_is_fizz != 0 AND v_is_buzz != 0) 
							THEN TO_CHAR(v_num)
						WHEN (v_is_fizz = 0 AND v_is_buzz = 0) 
							THEN k_fizz || k_buzz
						WHEN (v_is_fizz = 0)
							THEN k_fizz
						WHEN (v_is_buzz = 0)
							THEN k_buzz
					END;

		DBMS_OUTPUT.PUT_LINE(v_print);

		v_num := v_num + 1;

		EXIT WHEN (v_num > 100);

	END LOOP;

END;
/
