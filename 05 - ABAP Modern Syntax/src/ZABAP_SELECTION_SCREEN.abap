*&---------------------------------------------------------------------*
*& Report ZABAP_SELECTION_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_selection_screen.

TABLES: bsad.

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_kunnr FOR bsad-kunnr,
                  s_bukrs FOR bsad-bukrs NO INTERVALS NO-EXTENSION,
                  s_cpudt FOR bsad-cpudt OBLIGATORY.

SELECTION-SCREEN: END OF BLOCK b1.

INITIALIZATION.

S_CPUDT-SIGN = 'I'.
S_CPUDT-OPTION = 'BT'.
S_CPUDT-HIGH = SY-DATUM.
S_CPUDT-LOW = SY-DATUM - 30.
APPEND S_CPUDT.

START-OF-SELECTION.

*BREAK-POINT.

END-OF-SELECTION.