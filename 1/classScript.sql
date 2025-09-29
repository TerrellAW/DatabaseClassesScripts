DROP TABLE ghc_expertise;
DROP TABLE ghc_faculty;
DROP TABLE ghc_department;
DROP TABLE ghc_course;

CREATE TABLE ghc_course (
    course_code     CHAR(7) PRIMARY KEY,
    course_title    VARCHAR2(60),
    credits         NUMBER(2)
);

CREATE TABLE ghc_department (
    dept_no        NUMBER PRIMARY KEY,
    dept_name      VARCHAR2(20)
);

CREATE TABLE ghc_faculty (
    faculty_id     NUMBER PRIMARY KEY,
    firstname      VARCHAR2(50),
    lastname       VARCHAR2(50),
    date_hired     DATE,
    date_fired     DATE,
    is_active      NUMBER(1),
    dept_no        NUMBER
);

CREATE TABLE ghc_expertise (
    faculty_id     NUMBER PRIMARY KEY,
    course_code    CHAR(7)
);
