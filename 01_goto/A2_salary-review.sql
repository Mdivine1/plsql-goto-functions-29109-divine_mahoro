-- A2 - Salary Review using GOTO loop
SET SERVEROUTPUT ON;
DECLARE
    v_emp_id employees.emp_id%TYPE := 1;
    v_salary employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE emp_id = v_emp_id;

    <<check_salary>>
    IF v_salary < 1500 THEN
        DBMS_OUTPUT.PUT_LINE('Salary ' || v_salary || ' - Needs Review: LOW');
        GOTO end_review;
    END IF;
    
    IF v_salary > 7000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary ' || v_salary || ' - Needs Review: HIGH - Manager Approval');
        GOTO end_review;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary ' || v_salary || ' - OK');

    <<end_review>>
    DBMS_OUTPUT.PUT_LINE('Review completed for Emp ID: ' || v_emp_id);
END;
/