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
