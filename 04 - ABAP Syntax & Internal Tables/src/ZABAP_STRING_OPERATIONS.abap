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
      CCN TYPE STRING.

"CONCATENATION OPERATION IS USED TO COMBINE 2 0R MORE STRING VALUE, NO NUMERIC VALUES ALLOWED.
CONCATENATE NUM1 NUM2 NUM3 INTO CCN SEPARATED BY '-'.

WRITE: 'The user credit care number is: ', CCN.

ULINE.

WRITE: / 'STRING VALUES BEFORE CLEAR: ', NUM1, NUM2, NUM3.

CLEAR: NUM1, NUM2, NUM3.

WRITE: / 'STRING VALUES AFTER CLEAR: ', NUM1, NUM2, NUM3.

"SPLIT WORKS VISE-VERSA OF CONCATENATION. IT HELPS SPLIT A FULL WORD INTO DEFINED SPILTS.
*SPLIT CCN INTO NUM1 NUM2 NUM3 SEPERATED BY '-'.
*
*Pracitcing string oper twice.
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