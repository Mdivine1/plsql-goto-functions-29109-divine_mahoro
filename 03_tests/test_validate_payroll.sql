-- Test C1 Validator
SELECT fn_validate_payroll(1) AS result_emp1 FROM dual;
SELECT fn_validate_payroll(4) AS result_emp4_zero_salary FROM dual;
SELECT fn_validate_payroll(99) AS result_not_found FROM dual;