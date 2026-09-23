*&---------------------------------------------------------------------*
*& Report ZABAP_SELECTION_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_selection_screen.

TABLES: bsad.

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_kunnr FOR bsad-kunnr,"Customer Number
                  s_bukrs FOR bsad-bukrs NO INTERVALS NO-EXTENSION, "Company Code
                  s_cpudt FOR bsad-cpudt. "Day On Which Accounting Document Was Entered

  SELECTION-SCREEN: SKIP.

  PARAMETERS: p_bukrs TYPE bsid-bukrs DEFAULT 1232, "Company Code
              p_cpudt TYPE bsid-cpudt DEFAULT sy-datum.

SELECTION-SCREEN: END OF BLOCK b1.

INITIALIZATION.

  s_cpudt-sign = 'I'.
  s_cpudt-option = 'BT'.
  s_cpudt-low = sy-datum - 30.
   s_cpudt-high = sy-datum.
  APPEND s_cpudt.

START-OF-SELECTION.

  "Select-options
  SELECT * FROM bsad INTO TABLE @DATA(gt_bsad) WHERE kunnr IN @s_kunnr AND
                                                     bukrs IN @s_bukrs AND
                                                     cpudt IN @s_cpudt.

  "Parameter
  SELECT * FROM bsad INTO TABLE @DATA(gt_bsid) WHERE bukrs = @p_bukrs AND
                                                     cpudt = @p_cpudt.

END-OF-SELECTION.