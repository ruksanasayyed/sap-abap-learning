*&---------------------------------------------------------------------*
*& Report ZABAP_HASHED_TABLE_SYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_HASHED_TABLE_SYNTAX.


"Defining Table Type
TYPES: BEGIN OF rt_emp,

         employee_id   TYPE zrk_emp_id,
         company_code  TYPE bukrs,
         title         TYPE zrk_title,
         first_name    TYPE zrk_first_name,
         last_name     TYPE zrk_last_name,
         full_name(50) TYPE c,
         doj           TYPE psg_datjo,
         department    TYPE zrk_depart,
         ctc           TYPE dmbtr,
         tax           TYPE dmbtr,

       END OF rt_emp.

TYPES: BEGIN OF tp_emp,
         department TYPE String,
         ctc        TYPE dmbtr,
         code       TYPE bukrs,
       END OF tp_emp.

" Defining Internal table and Structure from (rt_emp) our own standard table.

DATA: gt_employee TYPE HASHED TABLE OF rt_emp WITH UNIQUE KEY employee_id company_code,
      gs_employee TYPE rt_emp.

"Table Records

CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK103'.
gs_employee-title       = 'Ms. '.
gs_employee-first_name  = 'Vishnav'.
gs_employee-last_name   = 'Raj'.
gs_employee-doj         = '20261130'.
gs_employee-department  = 'Finance'.
gs_employee-ctc         = '750000.00'.
gs_employee-company_code  = '1234'.

INSERT gs_employee INTO TABLE gt_employee.

CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK104'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Nikhil'.
gs_employee-last_name   = 'Rudra'.
gs_employee-doj         = '20261215'.
gs_employee-department  = 'SAP'.
gs_employee-ctc         = '390000.00'.
gs_employee-company_code  = '4321'.

INSERT gs_employee INTO TABLE gt_employee.

CLEAR: gs_employee.
gs_employee-employee_id   = 'ZRK101'.
gs_employee-title         = 'Miss. '.
gs_employee-first_name    = 'Ruksana'.
gs_employee-last_name     = 'Sayyed'.
gs_employee-doj           = '20260409'.
gs_employee-department    = 'SAP'.
gs_employee-ctc           = '5300000.00'.
gs_employee-company_code  = '1234'.

INSERT gs_employee INTO TABLE gt_employee.

CLEAR: gs_employee.
gs_employee-employee_id = 'ZRK102'.
gs_employee-title       = 'Mr. '.
gs_employee-first_name  = 'Dharma'.
gs_employee-last_name   = 'Dev'.
gs_employee-doj         = '20261112'.
gs_employee-department  = 'Finance'.
gs_employee-ctc         = '950000.00'.
gs_employee-company_code  = '1234'.

INSERT gs_employee INTO TABLE gt_employee.

BREAK-POINT.

WRITE: /5   'EMPLOYEE_ID' COLOR 3 INVERSE ON,
        25  'TITLE' COLOR 2 INVERSE ON,
        45  'NAME' COLOR 5 INVERSE ON,
        75  'Lastname' COLOR 5 INVERSE On,
        100 'DEPARTMENT' COLOR 7 INVERSE ON,
        130 'CTC' COLOR 6 INVERSE ON,
        155 'COMPANY CODE' COLOR 1 INVERSE ON.

ULINE.

LOOP AT gt_employee INTO gs_employee.

  WRITE: /5 gs_employee-employee_id, 25 gs_employee-title, 45 gs_employee-first_name, 75 gs_employee-doj, 100 gs_employee-department, 130 gs_employee-ctc LEFT-JUSTIFIED, 155 gs_employee-company_code LEFT-JUSTIFIED.

ENDLOOP.

ULINE.

SKIP 2.

READ Table gt_employee into gs_employee with key employee_id = 'ZRK103'.

WRITE: /5 gs_employee-employee_id, 25 gs_employee-title, 45 gs_employee-first_name, 75 gs_employee-doj, 100 gs_employee-department, 130 gs_employee-ctc LEFT-JUSTIFIED, 155 gs_employee-company_code LEFT-JUSTIFIED.

