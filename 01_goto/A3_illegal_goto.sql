-- A3 - Illegal GOTO and Fix
-- PART 1: ILLEGAL EXAMPLE (This will cause error PLS-00375)
-- You cannot jump INTO an IF block or LOOP from outside

/*
DECLARE
    v_x NUMBER := 10;
BEGIN
    GOTO inside_if; -- ILLEGAL
    IF v_x > 5 THEN
        <<inside_if>>
        DBMS_OUTPUT.PUT_LINE('Inside IF');
    END IF;
END;
/

Error: PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_IF'
Reason: GOTO cannot jump into the middle of IF, LOOP, or Exception block.
*/

-- PART 2: FIXED VERSION
SET SERVEROUTPUT ON;
DECLARE
    v_x NUMBER := 10;
BEGIN
    IF v_x > 5 THEN
        GOTO inside_if;
    END IF;
    GOTO end_fix;

    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Fixed: Inside IF block legally, v_x=' || v_x);

    <<end_fix>>
    DBMS_OUTPUT.PUT_LINE('A3 Fix demonstrated.');
END;
/