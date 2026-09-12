*&---------------------------------------------------------------------*
*& Report ZABAP_DATABASE_OPERATIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_database_operations.

TABLES: kna1.

DATA: gt_kna1 TYPE TABLE OF kna1,
      gs_kna1 TYPE kna1.

DATA: gt_city TYPE TABLE OF kna1,
      gs_city TYPE kna1.

TYPES: BEGIN OF tp_kna1,
         kunnr TYPE kna1-kunnr,
         name1 TYPE kna1-kunnr,
         regio TYPE kna1-kunnr,
         land1 TYPE kna1-kunnr,
         ort01 TYPE kna1-kunnr,
         pstlz TYPE kna1-kunnr,
       END OF tp_kna1.

TYPES: BEGIN OF tp_city,
         ort01 TYPE kna1-ort01,
       END OF tp_city.

"SELECT-OPTIONS creates a selection option (a selection table) called S_KUNNR.
"It creates a field on the selection screen where the user can enter one or multiple customer numbers, ranges, exclusions, etc.
SELECT-OPTIONS: s_kunnr FOR kna1-kunnr.


START-OF-SELECTION.
  " 7. SELECT DISTINCT - UNIQUE RECORDS - IT DISPLAYS ONLY SELECTED COLUMNS WITH ONLY DISTINCT RECORDS.

  SELECT DISTINCT ort01 FROM kna1 INTO CORRESPONDING FIELDS OF TABLE gt_kna1.

  LOOP AT gt_kna1 INTO gs_kna1.

    WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 65 gs_kna1-land1, 75 gs_kna1-ort01.

  ENDLOOP.

  "-----------------------------------------------------------------------------------------------------------------------


  " 6. SELECT UPTO

*  SELECT kunnr name1 land1 ort01 regio pstlz FROM KNA1 INTO CORRESPONDING FIELDS OF table gt_kna1 UP TO 10 ROWS.
*
*  WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 65 gs_kna1-land1, 75 gs_kna1-ort01.
*
*    LOOP AT gt_kna1 INTO gs_kna1.
*
*      WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 65 gs_kna1-land1, 75 gs_kna1-ort01.
*
*    ENDLOOP.

  "-----------------------------------------------------------------------------------------------------------------------

  " 5. SELECT SINGLE
  " COMMENTED IF..ENDIF LOOP AND TYPES FOR THIS OPERATION.

*  SELECT SINGLE kunnr name1 land1 ort01 regio pstlz FROM kna1 INTO CORRESPONDING FIELDS OF gs_kna1 WHERE KUNNR IN S_KUNNR.
*
*  WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 65 gs_kna1-land1, 75 gs_kna1-ort01.

  "-----------------------------------------------------------------------------------------------------------------------

  " 4. SELECT...END SELECT
  " COMMENTED IF..ENDIF LOOP AND TYPES FOR THIS OPERATION.

*  SELECT kunnr name1 ort01 land1 regio pstlz FROM kna1 INTO CORRESPONDING FIELDS OF GS_kna1 WHERE kunnr IN s_kunnr.
*
*    WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 65 gs_kna1-land1, 75 gs_kna1-ort01.
*    CLEAR gs_kna1.
*
*  ENDSELECT.

  "-----------------------------------------------------------------------------------------------------------------------

  " 3. SELECT INTO vs INTO CORRESPONDING FIELDS

*  SELECT kunnr name1 ort01 land1 regio pstlz FROM kna1 INTO CORRESPONDING FIELDS OF TABLE gt_kna1 WHERE kunnr IN s_kunnr.
*
*  IF sy-subrc = 0.
*
*    SORT gt_kna1 BY kunnr.
*
*    LOOP AT gt_kna1 INTO gs_kna1.
*
*      WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 55 gs_kna1-land1, 65 gs_kna1-ort01.
*
*    ENDLOOP.
*
*    CLEAR gs_kna1.
*
*  ENDIF.

  "-----------------------------------------------------------------------------------------------------------------------

  " 2. SELECT SPECIFIED COLUMNS ONLY
  "SELECT <COLUMNS1 COLUMN2...> INTO TABLE <TARGET> WHERE <CONDITION: source field =/IN target field>.

*  SELECT kunnr name1 land1 ort01 regio pstlz FROM kna1 INTO TABLE gt_kna1 WHERE kunnr IN s_kunnr.
*
*  IF sy-subrc = 0.
*
*    SORT gt_kna1 BY kunnr.
*
*    LOOP AT gt_kna1 INTO gs_kna1.
*
*      WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 55 gs_kna1-land1, 65 gs_kna1-ort01.
*
*    ENDLOOP.
*
*    CLEAR gs_kna1.
*
*  ENDIF.

  "-----------------------------------------------------------------------------------------------------------------------

  " 1. SELECT ALL COLUMNS
  "select * from <SOURCE> INTO TABLE <TARGET> WHERE <CONDITION: source field =/IN target field>.

*  SELECT * FROM kna1 INTO TABLE gt_kna1 WHERE kunnr IN s_kunnr.
*
*  IF sy-subrc = 0.
*
*    SORT gt_kna1 BY kunnr.
*
*    LOOP AT gt_kna1 INTO gs_kna1.
*
*      WRITE: /5 gs_kna1-kunnr, 25 gs_kna1-name1, 55 gs_kna1-land1, 65 gs_kna1-ort01.
*
*    ENDLOOP.
*
*    CLEAR gs_kna1.
*
*  ENDIF.

  "-----------------------------------------------------------------------------------------------------------------------

END-OF-SELECTION.