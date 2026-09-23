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

"-----------------------------------Radio buttons

SELECTION-SCREEN: BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECTION-SCREEN: BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

    PARAMETERS: p_open  RADIOBUTTON GROUP grp1,

                p_clear RADIOBUTTON GROUP grp1,

                p_all    RADIOBUTTON GROUP grp1 DEFAULT 'X'.

  SELECTION-SCREEN: END OF BLOCK b3.

SELECTION-SCREEN: END OF BLOCK b2.

SELECTION-SCREEN SKIP.

"---------------------------------------Check boxes

SELECTION-SCREEN: BEGIN OF BLOCK b4 WITH FRAME TITLE TEXT-004.

  PARAMETERS: c_c1 AS CHECKBOX default 'x',
              c_c2 AS CHECKBOX,
              c_c3 AS CHECKBOX.

SELECTION-SCREEN: END OF BLOCK b4.

START-OF-SELECTION.

if c_c1 = 'X'.

  MESSAGE 'Normal items- Checkbox has been selected' type 'i'.

  elseif c_c2 is not INITIAL.

  MESSAGE 'Special G/L Transactions- Checkbox has been selected' type 'I'.

    elseif c_c3 is not INITIAL.

  MESSAGE 'Noted Items- Checkbox has been selected' type 'i'.

  endif.

  BREAK-POINT.

END-OF-SELECTION.

"-------------------------------Drop down list
TYPE-Pools: vrm.

SELECTION-SCREEN: begin of block b5 WITH FRAME title text-005.

  PARAMETERS: t_land1 type t005t-land1 As LISTBOX VISIBLE LENGTH 50.

  SELECTION-SCREEN: END OF block b5.