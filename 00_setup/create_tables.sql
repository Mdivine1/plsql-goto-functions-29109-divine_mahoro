-- Setup for Payroll Validator
DROP TABLE employees PURGE;
DROP TABLE departments PURGE;

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER(10,2) CHECK (salary >= 0),
    hire_date DATE,
    dept_id NUMBER REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (10, 'HR');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'IT');

INSERT INTO employees VALUES (1, 'Divine', 'Mahoro', 5000, TO_DATE('2020-01-15','YYYY-MM-DD'), 30);
INSERT INTO employees VALUES (2, 'John', 'Doe', 1200, TO_DATE('2023-06-01','YYYY-MM-DD'), 10);
INSERT INTO employees VALUES (3, 'Jane', 'Smith', 8000, TO_DATE('2018-03-20','YYYY-MM-DD'), 20);
INSERT INTO employees VALUES (4, 'Alice', 'Brown', 0, TO_DATE('2024-01-01','YYYY-MM-DD'), 30);

COMMIT;