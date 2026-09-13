*&---------------------------------------------------------------------*
*& Report ZABAP_COLLECT_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_collect_syntax.

" Defining Table Type
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


" Collect Type
TYPES: BEGIN OF tp_emp,

         department TYPE string,
         ctc        TYPE dmbtr,

       END OF tp_emp.


" Defining Internal Table and Structure from (rt_emp)
" our own standard table.

DATA: gt_employee TYPE STANDARD TABLE OF rt_emp,
      gs_employee TYPE rt_emp.


" Creating Internal Table for COLLECT operation

DATA: gt_emp TYPE STANDARD TABLE OF tp_emp,
      gs_emp TYPE tp_emp.


"------------------------------------------------------------------------
" TABLE RECORDS
"------------------------------------------------------------------------

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


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK103'.
gs_employee-title       = 'Ms. '.
gs_employee-first_name  = 'Vishnav'.
gs_employee-last_name   = 'Raj'.
gs_employee-doj         = '20261130'.
gs_employee-department  = 'Finance'.
gs_employee-ctc         = '750000.00'.

APPEND gs_employee TO gt_employee.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK104'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Nikhil'.
gs_employee-last_name   = 'Rudra'.
gs_employee-doj         = '20261215'.
gs_employee-department  = 'Business'.
gs_employee-ctc         = '390000.00'.

APPEND gs_employee TO gt_employee.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK105'.
gs_employee-title       = 'Miss. '.
gs_employee-first_name  = 'Neethara'.
gs_employee-last_name   = 'Neeth'.
gs_employee-doj         = '20240915'.
gs_employee-department  = 'HR'.
gs_employee-ctc         = '120000.00'.

APPEND gs_employee TO gt_employee.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK106'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Vero'.
gs_employee-last_name   = 'Sharma'.
gs_employee-doj         = '20261130'.
gs_employee-department  = 'HR'.
gs_employee-ctc         = '350000.00'.

APPEND gs_employee TO gt_employee.


CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK107'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Zakir'.
gs_employee-last_name   = 'Khunafat'.
gs_employee-doj         = '20261211'.
gs_employee-department  = 'SAP'.
gs_employee-ctc         = '380000.00'.

APPEND gs_employee TO gt_employee.


"------------------------------------------------------------------------
" DISPLAY EMPLOYEE DATA
"------------------------------------------------------------------------

WRITE: /5   'EMPLOYEE_ID' COLOR 3 INVERSE ON,
        20  sy-vline,
        25  'TITLE' COLOR 2 INVERSE ON,
        40  sy-vline,
        45  'NAME' COLOR 5 INVERSE ON,
        95  sy-vline,
        100 'DEPARTMENT' COLOR 7 INVERSE ON,
        125 sy-vline,
        130 'CTC' COLOR 6 INVERSE ON,
        150 sy-vline,
        155 'DOJ' COLOR 1 INVERSE ON,
        175 sy-vline.

ULINE.


LOOP AT gt_employee INTO gs_employee.

  CONCATENATE gs_employee-title
              gs_employee-first_name
              gs_employee-last_name
              INTO gs_employee-full_name
              SEPARATED BY SPACE.

  MODIFY gt_employee FROM gs_employee TRANSPORTING full_name.

  WRITE: /5   gs_employee-employee_id,
          20  sy-vline,
          25  gs_employee-title,
          40  sy-vline,
          45  gs_employee-full_name,
          95  sy-vline,
          100 gs_employee-department,
          125 sy-vline,
          130 gs_employee-ctc LEFT-JUSTIFIED,
          150 sy-vline,
          155 gs_employee-doj LEFT-JUSTIFIED,
          175 sy-vline.


  "------------------------------------------------------------------------
  " COLLECT STATEMENT
  "------------------------------------------------------------------------

  CLEAR: gs_emp.

  gs_emp-department = gs_employee-department.
  gs_emp-ctc        = gs_employee-ctc.

  COLLECT gs_emp INTO gt_emp.

  CLEAR: gs_emp.
  CLEAR: gs_employee.

ENDLOOP.


ULINE.

SKIP 2.

WRITE: / 'Collect Operation - Department wise Salary'.

ULINE.

WRITE: /5 'Department',
        35 'CTC'.

ULINE.


LOOP AT gt_emp INTO gs_emp.

  WRITE: /5 gs_emp-department,
          35 gs_emp-ctc LEFT-JUSTIFIED.

  CLEAR: gs_emp.

ENDLOOP.