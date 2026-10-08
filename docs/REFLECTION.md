# Reflection - C2

## What I Learned About GOTO
GOTO can be used to jump between labels, but it makes code hard to read and maintain. Oracle restricts illegal GOTO that jumps INTO IF, LOOP, or EXCEPTION blocks (PLS-00375). Modern best practice is to avoid GOTO and use structured IF, CASE, LOOP.

## When GOTO is Acceptable
GOTO is acceptable for error handling and exiting deeply nested loops quickly, similar to C1 payroll validator example. Even then, it should be used sparingly.

## Function Reusability
Functions B1-B4 are reusable in both PL/SQL and SQL SELECT (B5). This promotes code reuse and centralizes business logic like annual salary and tax calculation. Combining them in C1 shows real-world payroll validation.

## Challenge Faced
Understanding illegal GOTO error and fixing it. Initially tried to jump into IF block which caused PLS-00375. Fixed by placing label inside IF properly.