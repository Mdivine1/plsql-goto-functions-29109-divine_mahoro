-- Test individual functions
SELECT fn_annual_salary(5000) AS test_B1 FROM dual;
SELECT fn_years_of_service(TO_DATE('2020-01-15','YYYY-MM-DD')) AS test_B2 FROM dual;
SELECT fn_calculate_tax(5000) AS test_B3 FROM dual;
SELECT fn_dept_name(30) AS test_B4 FROM dual;