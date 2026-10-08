-- C1 - Combined: Payroll Validator using GOTO for error handling
CREATE OR REPLACE FUNCTION fn_validate_payroll(
    p_emp_id IN NUMBER
) RETURN VARCHAR2
IS
    v_salary employees.salary%TYPE;
    v_hire_date employees.hire_date%TYPE;
    v_years NUMBER;
BEGIN
    SELECT salary, hire_date INTO v_salary, v_hire_date 
    FROM employees WHERE emp_id = p_emp_id;

    IF v_salary IS NULL OR v_salary <= 0 THEN
        GOTO invalid_salary;
    END IF;

    v_years := fn_years_of_service(v_hire_date);
    
    IF v_years < 0 THEN
        GOTO invalid_date;
    END IF;

    -- All valid
    RETURN 'VALID: Emp ' || p_emp_id || ' Annual=' || fn_annual_salary(v_salary) 
           || ' Tax=' || fn_calculate_tax(v_salary);

    <<invalid_salary>>
    RETURN 'INVALID: Salary must be > 0 for Emp ' || p_emp_id;

    <<invalid_date>>
    RETURN 'INVALID: Hire date invalid for Emp ' || p_emp_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee ' || p_emp_id || ' not found';
END;
/