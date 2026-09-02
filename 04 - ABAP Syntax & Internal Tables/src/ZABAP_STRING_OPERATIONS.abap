*&---------------------------------------------------------------------*
*& Report ZABAP_STRING_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_STRING_OPERATIONS.

*"First lets declare data.
Data: NUM1 TYPE CHAR50 VALUE '4175',
      NUM2 TYPE CHAR50 VALUE '9348',
      NUM3 TYPE CHAR50 VALUE '0107',
      CCN TYPE STRING,
"Practicing Split for table.
      gt_list TYPE TABLE of String, "------------------------------------gt is a internal table
      gs_list like LINE OF gt_list, "------------------------------------gs is structure for internal table.
      gv_list TYPE String VALUE '001,Mrs.,Ruksana,Sayyed,SAP,09102003', "gv is for variable, means table fields
      gv_del TYPE Char1 Value ',', "-------------------------------------del is delimeter to seperate variables
"Practicing Sub string. To get only specific chars for a string.
      gv_sub_string TYPE String Value 'SAP ABAP PROGRAMMING USING S/4 HANA',
      gv_sub1 TYPE String,
      gv_sub2 TYPE String,
"For knowing length.
      gv_len TYPE i.

WRITE: / GV_SUB_STRING.

gv_len = strlen( gv_sub_string ).

"gv_len = strlen(gv_sub_string). "gives error

WRITE: / 'String length= ', gv_len.
*
*gv_sub1 = gv_sub_string+0(7).
*
*WRITE: / 'GV_SUB1: ', GV_SUB1.
*
*gv_sub2 = gv_sub_string+5(10).


"----------------------------------------------

"Split for Internal Table.
"It breaks one string into smaller pieces and stores each piece as a separate row in an internal table.

*Split gv_list AT gv_del INTO TABLE gt_list.
*
*Loop at gt_list into gs_list.
*
*  WRITE: / gs_list.
*
*  clear gs_list.
*  Endloop.
*
*  BREAK-POINT.

*Split gv_list AT gv_del INTO TABLE gt_list.
*
*Loop at gt_list into gs_list.
*
*  WRITE: / gs_list.
*
*  clear gs_list.
*  Endloop.
*
*  BREAK-POINT.
"------------------------------------------------

"CONCATENATION OPERATION IS USED TO COMBINE 2 0R MORE STRING VALUE, NO NUMERIC VALUES ALLOWED.
*CONCATENATE NUM1 NUM2 NUM3 INTO CCN SEPARATED BY '-'.
*
*WRITE: 'The user credit care number is: ', CCN.
*
*ULINE.
*
*WRITE: / 'STRING VALUES BEFORE CLEAR: ', NUM1, NUM2, NUM3.
*
*CLEAR: NUM1, NUM2, NUM3.
*
*WRITE: / 'STRING VALUES AFTER CLEAR: ', NUM1, NUM2, NUM3.

"--------------------------------------------------

"SPLIT WORKS VISE-VERSA OF CONCATENATION. IT HELPS SPLIT A FULL WORD INTO DEFINED SPILTS.
*SPLIT CCN INTO NUM1 NUM2 NUM3 SEPERATED BY '-'.
*
"--------------------------------------------------

*Pracitcing string operations twice.
*DATA: ccn1 type char50 VALUE '1234',
*      ccn2 type char50 VALUE '5678',
*      ccn3 type char50 VALUE '0921',
*      ccn type char100.
*
*CONCATENATE ccn1 ccn2 ccn3 INTO ccn   SEPARATED BY '-'.
*
*WRITE: 'The user Credit Card Number is: ', ccn.
*
*CLEAR: CCN1, CCN2, CCN3.
*
*WRITE : / 'The user Credit Card Number is: ', CCN1, CCN2, CCN3, ccn.