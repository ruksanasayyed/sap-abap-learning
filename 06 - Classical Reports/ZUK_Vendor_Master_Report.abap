*&---------------------------------------------------------------------*
*& Report ZUK_VENDOR_MASTER_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuk_vendor_master_report.

*&---------------------------------------------------------------------*
*&
*& Steps to follow for writing classical report program
*& 1. Create the program with SE12/SE16.
*& 2. Data Declaration.
*& 3. Design selection screen.
*& 4. Select data from the database.
*& 5. Build data in final internal table.
*& 6. Display the output.
*&
*&---------------------------------------------------------------------*

"Type Declaration - Internal table structure.
TYPES: BEGIN OF tp_lfa1,
         lifnr TYPE lifnr,      "VENDOR ID - Primary Key 2
         name1 TYPE lfa1-name1, "NAME 3
         bukrs TYPE lfb1-bukrs, "COMPANY CODE 4
         adrnr TYPE adrnr,      "ADDRESS - 5
       END OF tp_lfa1,

       "FOR ADDRESS
       BEGIN OF tp_adrc,
         addrnumber TYPE ad_addrnum,  "Primary key
         date_from  TYPE ad_date_fr,  "Primary key
         nation     TYPE   ad_nation, "Primary key
         city1      TYPE ad_city1,    "CITY - 6
         post_code1 TYPE  ad_pstcd1,  "POSTAL CODE -7
         street     TYPE ad_street,   "Street
         country    TYPE land1,       "country - 8
         region     TYPE  regio,      "state -9
       END OF tp_adrc,

       "For E-Mail Addresses
       BEGIN OF tp_adr6,
         addrnumber TYPE ad_addrnum, "Primary key
         persnumber TYPE ad_persnum, "Primary key
         date_from  TYPE ad_date_fr, "Primary key
         consnumber TYPE ad_consnum, "Primary key
         smtp_addr  TYPE ad_smtpadr, "Email Address - 10/11
       END OF tp_adr6,

       "For Telephone Numbers
       BEGIN OF tp_adr2,
         addrnumber	TYPE ad_addrnum, "Primary key
         persnumber TYPE ad_persnum, "Primary key
         date_from  TYPE ad_date_fr, "Primary key
         consnumber TYPE ad_consnum, "Primary key
         tel_number TYPE  ad_tlnmbr, "Mobile Number - 12/13
       END OF tp_adr2,

       BEGIN OF tp_master,
         Sr_No       TYPE i,                "Sr.No
         lifnr       TYPE lfa1-lifnr,       "VENDOR ID
         name1       TYPE lfa1-name1,       "NAME
         bukrs       TYPE lfb1-bukrs,       "COMPANY CODE
         Address     TYPE adrc-street,      "ADDRESS
         City        TYPE adrc-city1,       "CITY - 6
         Postal_Code TYPE  adrc-post_code1, "POSTAL CODE -7
         Country     TYPE adrc-country,     "country - 8
         State       TYPE  adrc-region,     "state -9
         Email1      TYPE adr6-smtp_addr,   "Email Address
         Email2      TYPE adr6-smtp_addr,   "Email Address
         Mobile1     TYPE  adr2-tel_number, "Mobile Number
         Mobile2     TYPE  adr2-tel_number, "Mobile Number
       END OF tp_master.

"Data Declaration.
DATA: gt_lfa1   TYPE STANDARD TABLE OF tp_lfa1,
      gs_lfa1   TYPE tp_lfa1,

      gt_adrc   TYPE STANDARD TABLE OF tp_adrc,
      gs_adrc   TYPE tp_adrc,

      gt_adr6   TYPE STANDARD TABLE OF tp_adr6,
      gs_adr6   TYPE tp_adr6,

      gt_adr2   TYPE STANDARD TABLE OF tp_adr2,
      gs_adr2   TYPE tp_adr2,

      gt_master TYPE STANDARD TABLE OF tp_master,
      gs_master TYPE tp_master,

      gt_t005   TYPE STANDARD TABLE OF t005,
      gs_too5   TYPE t005.

DATA: sd_lifnr TYPE lfa1-lifnr, "Here we are declarating selection screen variables with a custom internal table."instead of calling direct tables like "tables: lfa1, adrc.", we cal use this second method
      sd_bukrs TYPE lfb1-bukrs.


"Designing selection screen
SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_lifnr FOR sd_lifnr,
           s_bukrs FOR sd_bukrs.

SELECTION-SCREEN: END OF BLOCK b1.


"Selecting data from the database.
LOOP AT gt_master INTO gs_master.

  AT FIRST.
    WRITE: /5 'Sr No', 15 'Field', 35 'Reference Table Field'.
    ULINE.
  ENDAT.

  SELECT a~lifnr a~name1 a~adrnr
         b~bukrs
    FROM lfa1 AS a INNER JOIN lfb1 AS b
    ON a~lifnr = b~lifnr
    INTO CORRESPONDING FIELDS OF TABLE gt_lfa1
    WHERE a~lifnr IN s_lifnr
    AND b~bukrs IN s_bukrs.

ENDLOOP.