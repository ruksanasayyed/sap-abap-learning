new code update

*&---------------------------------------------------------------------*
*& Report ZABAP_JOINS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_joins.

*TABLES: mara, marc. "no need because we are directly calling fields in types.

TYPES: BEGIN OF tp_result, "defining structure type
         matnr TYPE mara-matnr,
         mtart TYPE mara-mtart,
         mAKTX TYPE maKT-mAKTX,
         werks TYPE marc-werks,
       END OF tp_result.

DATA: gt_result TYPE STANDARD TABLE OF tp_result,
      gs_result TYPE tp_result. "GS_RESULT is declared with the type TP_RESULT

DATA: gv_matnr TYPE mara-matnr,
      gv_mtart TYPE mara-mtart,
      gv_mAKTX TYPE maKT-mAKTX,
      gv_werks TYPE marc-werks.

SELECT-OPTIONS: s_matnr FOR gv_matnr,
                s_mtart FOR gv_mtart,
                s_mAKTX FOR gv_mAKTX,
                s_werks FOR gv_werks.

START-OF-SELECTION.
  "An inner join returns rows only where there is a matching entry in both tables based on the condition.
*  SELECT a~matnr a~mtart
*         b~werks
*    FROM mara AS a Inner JOIN marc AS b
*    ON a~matnr = b~matnr
*    INTO TABLE gt_result
*    WHERE a~matnr IN s_matnr.

  "In a left outer join, all rows from the left table are included in the result—even if there’s no match in the right table.
*  SELECT a~matnr a~mtart
*         b~werks
*    FROM mara AS a LEFT OUTER JOIN marc AS b
*    ON a~matnr = b~matnr
*    INTO TABLE gt_result
*    WHERE a~matnr IN s_matnr.

"Multiple Inner Joins
*  SELECT a~matnr a~mtart
*         b~werks
*         c~maktx
*    FROM mara AS a INNER JOIN marc AS b
*    ON a~matnr = b~matnr
*    INNER JOIN makt AS c
*    ON a~matnr = c~matnr
*    INTO CORRESPONDING FIELDS OF table gt_result
*    where a~matnr in s_matnr.

"Multiple LEft Outer joins
  SELECT a~matnr a~mtart
         b~maktx
         c~werks
    FROM mara AS a LEFT OUTER JOIN makt AS b
    ON a~matnr = b~matnr LEFT OUTER JOIN marc AS c
    ON a~matnr = c~matnr
    INTO CORRESPONDING FIELDS OF TABLE gt_result
    WHERE a~matnr IN s_matnr.


  WRITE: /5 'MATNR', 35 'MTART', 65 'WERKS', 85 'MAKTX'.
  ULINE.

  cl_demo_output=>display( gt_result ). "AUTOMATIC TABLE DISPLAY OUTPUT.

  LOOP AT gt_result INTO gs_result. "MANUAL REPORT FORMATTING.

    WRITE: /5 gs_result-matnr,
            35 gs_result-mtart,
            65 gs_result-werks,
            85 gs_result-maktx.

    CLEAR: gs_result.
  ENDLOOP.

END-OF-SELECTION.