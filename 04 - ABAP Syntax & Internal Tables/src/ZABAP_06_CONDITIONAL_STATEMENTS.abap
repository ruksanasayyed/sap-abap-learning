*&---------------------------------------------------------------------*
*& Report ZABAP_CONDITIONAL_STATEMENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_CONDITIONAL_STATEMENTS.

*"------------------------------------------------------- Looping Statements : Do...Endo , While...EndWhile. ------------------------------------------------------

Parameters: p_date Type sy-datum OBLIGATORY DEFAULT sy-datum.


START-OF-SELECTION. "Events

PERFORM DO-ENDO. "CREATING SUB ROUTINE defined by FORM and ENDFORM and we use perform statement to call the Subroutine..

END-OF-SELECTION.

*&---------------------------------------------------------------------*
*& Form DO-ENDO
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

FORM do-endo .

*  Do 5 Times. "Do is a condiotional statement, used to run on numeric condition, and loop start after the 1st execution.
*
*    Write: / 'Date: ', p_date, ' ', sy-vline ,sy-datum ,' ', sy-vline, sy-tabix.
*
**    "if p_date > sy-datum. "Exit condition example
**    "EXIT.
*
**    "If sy-tabix = 7. "Continue condition example
**    "Continue.
*
**     "endif.
*
*    p_date = p_date + 1.
*
*  ENDDO.

WHILE p_date < sy-datum. "While loop, the loop starts before the execution. Meaning the while loop will check the condition before printing data, if fails data won't print.

  WRITE: / 'DATE: ', p_date , sy-datum.

  p_date = p_date + 1.

  ENDWHILE.

ENDFORM.











*"------------------------------------------Conditional Statements : if, if-else, if-else-if, nested if, case statements------------------------------------------------------
*
*"First we will create two parameters and one selection screen.
*
*PARAMETERS: p_salary TYPE i,
*            p_exp TYPE p DECIMALS 1.
*
*
*"if condition
*if p_salary > 500000.
*  write: / 'Bonus: 2%'.
*endif.
*
*"------------------------------------------
*
*"if else
*if p_exp >= 7.
*  Write: / 'Tech Lead', 'Bonus : 10%'.
*else.
*  Write: / 'Not a Tech Lead,', /'Bonus : 1%'.
*endif.
*
*------------------------------------------
*
*"if else if
*if p_exp > 10.
*
*  Write: / 'The employee is a Senior Artitect,', 'Bonus : 10%'.
*
*elseif p_exp >= '7.5'.
*  Write: / 'This employee is Tech Lead,', 'Bonus : 5%'.
*
*elseif p_exp > 3.
*  Write: / 'This employee is not Tech Lead,', 'Bonus : 2%'.
*
*else.
*  Write: / 'Does not have enough qualification get this year BONUS'.
*
*endif.
*
*------------------------------------------
*
*Multipe Conditions. And / OR
*if p_salary > 900000 and p_exp > 10.
*  Write: / 'Eligible for Bonus : 10%'.
*
*elseif p_exp >= 5 or p_salary < 500000.
*  Write: / 'Eligible for Bonus : 5%'.
*
*elseif p_exp > 1.
*  Write: / 'Bonus : 0.5%'.
*
*else.
*  Write: / 'Not eligible for Bonus'.
*endif.
*
*------------------------------------------
*
*Nested Condional Statements
*
*if p_exp > 10.
*
*  if p_salary = 650500.
*
*    Write: 'Bonus: 3%'.
*
*  Endif.
*
*  Write: / 'The employee is a Senior Artitect,', 'Bonus : 10%'.
*
*elseif p_exp <= '7.5'.
*  Write: / 'This employee is Tech Lead,', 'Bonus : 5%'.
*
*else.
*  Write: / 'Does not have enough qualification get this year BONUS'.
*
*endif.
*
*"------------------------------------------
*
*CASE p_exp.
*  When 0.
*    Write: 'Fresher'.
*  When 1 or 2 or 3.
*    Write: 'Junior'.
*  When 4 .
*    Write: 'Senior'.
*  When Others.
*  Write: 'Tech Lead'.
*ENDCASE.
*
*ULINE.
*
*WRITE: / 'END OF PROGRAM'.