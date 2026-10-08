-- A4 - Rewrite A1 Without GOTO (Best Practice)
SET SERVEROUTPUT ON;
DECLARE
    v_num NUMBER := -5;
BEGIN
    -- Same logic as A1 but using structured IF-ELSIF, NO GOTO
    IF v_num > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
    ELSIF v_num < 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is ZERO');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Classification Done. (Without GOTO - Cleaner and Maintainable)');
END;
/