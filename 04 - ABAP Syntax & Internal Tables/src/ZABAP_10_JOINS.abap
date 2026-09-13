*&---------------------------------------------------------------------*
*& Report ZABAP_JOINS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_joins.

TABLES: mara, marc.

TYPES: BEGIN OF tp_result,
         matnr TYPE mara-matnr,
         mtart TYPE mara-mtart,
         werks TYPE marc-werks,
       END OF tp_result.

DATA: gt_result TYPE STANDARD TABLE OF tp_result,
      gs_result TYPE tp_result.

DATA: gv_matnr TYPE mara-matnr,
      gv_mtart TYPE mara-mtart,
      gv_werks TYPE marc-werks.

SELECT-OPTIONS: s_matnr FOR gv_matnr,
                s_mtart FOR gv_mtart,
                s_werks FOR gv_werks.

START-OF-SELECTION.

  SELECT a~matnr a~mtart
         b~werks
    FROM mara AS a INNER JOIN marc AS b
    ON a~matnr = b~matnr
    INTO TABLE gt_result
    WHERE a~matnr IN s_matnr.

  WRITE: /5 'MATNR', 35 'MTART', 65 'WERKS'.
  ULINE.

  cl_demo_output=>display( gt_result ).

END-OF-SELECTION.