*&---------------------------------------------------------------------*
*& Report ZABAP_INTERNAL_TABLES_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_internal_tables_syntax.

" DEFINING INTERNAL TABLE AND STRUCTURE by taking reference from MARA SAP standard table.

DATA: lt_mara TYPE TABLE OF mara,
      wa_mara TYPE mara.

" Creating our own Standard table.

TYPES: BEGIN OF rt_emp,

         employee_id   TYPE zrk_emp_id,
         title         TYPE zrk_title,
         first_name    TYPE zrk_first_name,
         last_name     TYPE zrk_last_name,
         full_name(50) TYPE c,
         doj           TYPE psg_datjo,
         department    TYPE zrk_depart,
         ctc           TYPE dmbtr,
         tax           TYPE dmbtr,
         inhand_ctc    TYPE p DECIMALS 2,

       END OF rt_emp.

" Defining Internal table and Structure from (rt_emp) our own standard table.

DATA: gt_employee TYPE STANDARD TABLE OF rt_emp,
      gs_employee TYPE rt_emp.


"------------------------------------------------------------------------
" INTERNAL TABLE OPERATIONS
"------------------------------------------------------------------------


"------------------------------------------------------------------------
" APPEND OPERATION
"------------------------------------------------------------------------

" APPEND KEYWORD: IS USED TO ADD/CREATE DATA ONLY AT THE END OF THE INTERNAL TABLES.

" CLEAR IS USED TO REMOVE/ERASE ALL THE EXISTING DATA AVAILABLE AT THAT TIME IN THE TABLE.

CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK101'.
gs_employee-title       = 'Miss. '.
gs_employee-first_name  = 'Ruksana'.
gs_employee-last_name   = 'Sayyed'.
gs_employee-doj         = '20260409'.
gs_employee-department  = 'SAP'.
gs_employee-ctc         = '1000000.00'.

APPEND gs_employee TO gt_employee.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK102'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Dharma'.
gs_employee-last_name   = 'Dev'.
gs_employee-doj         = '20261112'.
gs_employee-department  = 'Finance'.
gs_employee-ctc         = '950000.00'.

APPEND gs_employee TO gt_employee.


"------------------------------------------------------------------------
" INSERT OPERATION
"------------------------------------------------------------------------

" INSERT is a keyword for internal table operations,
" and it is used for inserting data at a specified column or last row.

CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK103'.
gs_employee-title       = 'Ms. '.
gs_employee-first_name  = 'Vishnav'.
gs_employee-last_name   = 'Raj'.
gs_employee-doj         = '20261130'.
gs_employee-department  = 'Finance'.
gs_employee-ctc         = '750000.00'.

INSERT gs_employee INTO TABLE gt_employee.
" Insertion at default last row.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK104'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Nikhil'.
gs_employee-last_name   = 'Rudra'.
gs_employee-doj         = '20261215'.
gs_employee-department  = 'Business'.
gs_employee-ctc         = '390000.00'.

INSERT gs_employee INTO gt_employee INDEX 2.
" Insertion at specified row using INDEX.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK105'.
gs_employee-title       = 'Miss. '.
gs_employee-first_name  = 'Neethara'.
gs_employee-last_name   = 'Neeth'.
gs_employee-doj         = '20240915'.
gs_employee-department  = 'HR'.
gs_employee-ctc         = '120000.00'.

INSERT gs_employee INTO gt_employee INDEX 1.
" Insertion at specified row using INDEX.


CLEAR: gs_employee.
" It is always a good practice to clear table.


"------------------------------------------------------------------------
" Inserting more records for sorting practice.
"------------------------------------------------------------------------

CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK106'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Vero'.
gs_employee-last_name   = 'Sharma'.
gs_employee-doj         = '20261130'.
gs_employee-department  = 'HR'.
gs_employee-ctc         = '350000.00'.

INSERT gs_employee INTO TABLE gt_employee.
" Insertion at default last row.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK107'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Zakir'.
gs_employee-last_name   = 'Khunafat'.
gs_employee-doj         = '20261211'.
gs_employee-department  = 'SAP'.
gs_employee-ctc         = '380000.00'.

INSERT gs_employee INTO TABLE gt_employee.
" Insertion at default last row.


WRITE: /5   'EMPLOYEE_ID' COLOR 3 INVERSE ON,
        20  sy-vline,
        25  'TITLE' COLOR 2 INVERSE ON,
        40  sy-vline,
        45  'NAME' COLOR 5 INVERSE ON,
        95  sy-vline,
        100 'DEPARTMENT' COLOR 7 INVERSE ON,
        125 sy-vline,
        130 'InHAND CTC' COLOR 6 INVERSE ON,
        150 sy-vline.

ULINE.


"------------------------------------------------------------------------
" LOOP AND MODIFY OPERATIONS
"------------------------------------------------------------------------

LOOP AT gt_employee INTO gs_employee.

  " Loop is used to iterate entry through each add.
  " (WHERE Department = 'IT-SAP' - to fetch specific field)

  CONCATENATE gs_employee-title
              gs_employee-first_name
              gs_employee-last_name
              INTO gs_employee-full_name
              SEPARATED BY SPACE.

  " Concatenating first name + last name + title using LOOP.

  MODIFY gt_employee FROM gs_employee TRANSPORTING full_name.
  " After we have concatenated fields. We have to write MODIFY statement
  " to modify the internal table.

  gs_employee-inhand_ctc = gs_employee-ctc - gs_employee-tax.
  " Calculating inhand CTC.

  MODIFY gt_employee FROM gs_employee TRANSPORTING inhand_ctc.
  " ALWAYS IMP TO WRITE MODIFY: Save the changed work area back into the table.

  WRITE: /5   gs_employee-employee_id,
          20  sy-vline,
          25  gs_employee-title,
          40  sy-vline,
          45  gs_employee-full_name,
          95  sy-vline,
          100 gs_employee-department,
          125 sy-vline,
          130 gs_employee-inhand_ctc LEFT-JUSTIFIED,
          150 sy-vline,
          155 gs_employee-doj LEFT-JUSTIFIED,
          175 sy-vline.

  CLEAR: gs_employee.

ENDLOOP.

ULINE.


"------------------------------------------------------------------------
" DESCRIBE OPERATIONS
" To find the total number of rows existing.
"------------------------------------------------------------------------

DATA: gt_lines TYPE i.

DESCRIBE TABLE gt_employee LINES gt_lines.

WRITE: / 'Total number of rows before deletion -> ', gt_lines.

ULINE.


"------------------------------------------------------------------------
" DELETE OPERATION
" To delete a record using WHERE, INDEX, adjacent deletion.
"
" Kept commented intentionally because DELETE changes the internal table.
"------------------------------------------------------------------------

*DELETE gt_employee WHERE department = 'HR'.
*" Option 1: Delete using WHERE clause.

*DELETE gt_employee INDEX 1.
*" Option 2: Delete using INDEX.


"SORT gt_employee BY employee_id.

*LOOP AT gt_employee INTO gs_employee.
*
*  WRITE: /5   gs_employee-employee_id,
*          20  sy-vline,
*          25  gs_employee-title,
*          40  sy-vline,
*          45  gs_employee-full_name,
*          95  sy-vline,
*          45  gs_employee-first_name,
*          65  sy-vline,
*          70  gs_employee-last_name,
*          95  sy-vline,
*          100 gs_employee-department,
*          125 sy-vline,
*          130 gs_employee-inhand_ctc LEFT-JUSTIFIED,
*          150 sy-vline.
*
*  CLEAR: gs_employee.
*
*ENDLOOP.

*ULINE.


*DELETE ADJACENT DUPLICATES FROM gt_employee COMPARING department.
*" Option 3: Adjacent DELETE

*DESCRIBE TABLE gt_employee LINES gt_lines.

*WRITE: / 'Total number of rows after deletion -> ', gt_lines.

*ULINE.


" To print after deleting table records.

*LOOP AT gt_employee INTO gs_employee.
*
*  WRITE: /5   gs_employee-employee_id,
*          20  sy-vline,
*          25  gs_employee-title,
*          40  sy-vline,
*          45  gs_employee-full_name,
*          95  sy-vline,
*          45  gs_employee-first_name,
*          65  sy-vline,
*          70  gs_employee-last_name,
*          95  sy-vline,
*          100 gs_employee-department,
*          125 sy-vline,
*          130 gs_employee-inhand_ctc LEFT-JUSTIFIED,
*          150 sy-vline.
*
*  CLEAR: gs_employee.
*
*ENDLOOP.

*ULINE.


"------------------------------------------------------------------------
" SORT OPERATION
"------------------------------------------------------------------------

SORT gt_employee BY department.
" It orders department in ascending order.

SORT gt_employee BY doj DESCENDING.
" It orders department in descending order.


"------------------------------------------------------------------------
" READ
"------------------------------------------------------------------------

CLEAR gs_employee.

READ TABLE gt_employee INTO gs_employee
     WITH KEY employee_id = 'ZRK101'.

IF sy-subrc = 0.

  WRITE: / 'Employee found using TABLE KEY:',
         / gs_employee-employee_id,
         / gs_employee-full_name.

ELSE.

  WRITE: / 'No records found'.

ENDIF.

ULINE.


"------------------------------------------------------------------------
" READ OPERATIONS
"------------------------------------------------------------------------

CLEAR gs_employee.
" We need structure to read data.

READ TABLE gt_employee INTO gs_employee
     WITH KEY department = 'HR'.
" Linear Search

IF sy-subrc = 0.

  WRITE: /5   gs_employee-employee_id,
          20  sy-vline,
          25  gs_employee-title,
          40  sy-vline,
          45  gs_employee-first_name,
          65  sy-vline,
          70  gs_employee-last_name,
          95  sy-vline,
          100 gs_employee-department,
          125 sy-vline,
          130 gs_employee-ctc LEFT-JUSTIFIED,
          150 sy-vline,
          155 gs_employee-doj LEFT-JUSTIFIED,
          175 sy-vline.

ELSE.

  WRITE: / 'No records found'.

ENDIF.


SORT gt_employee BY department.

CLEAR: gs_employee.

READ TABLE gt_employee INTO gs_employee
     WITH KEY department = 'HR'
     BINARY SEARCH.
" Binary search

IF sy-subrc = 0.

  WRITE: /5   gs_employee-employee_id,
          20  sy-vline,
          25  gs_employee-title,
          40  sy-vline,
          45  gs_employee-first_name,
          65  sy-vline,
          70  gs_employee-last_name,
          95  sy-vline,
          100 gs_employee-department,
          125 sy-vline,
          130 gs_employee-ctc LEFT-JUSTIFIED,
          150 sy-vline,
          155 gs_employee-doj LEFT-JUSTIFIED,
          175 sy-vline.

ELSE.

  WRITE: / 'No records found'.

ENDIF.


READ TABLE gt_employee INTO gs_employee INDEX 2.
" Using Index

IF sy-subrc = 0.

  WRITE: /5   gs_employee-employee_id,
          20  sy-vline,
          25  gs_employee-title,
          40  sy-vline,
          45  gs_employee-first_name,
          65  sy-vline,
          70  gs_employee-last_name,
          95  sy-vline,
          100 gs_employee-department,
          125 sy-vline,
          130 gs_employee-ctc LEFT-JUSTIFIED,
          150 sy-vline,
          155 gs_employee-doj LEFT-JUSTIFIED,
          175 sy-vline.

ELSE.

  WRITE: / 'No records found'.

ENDIF.