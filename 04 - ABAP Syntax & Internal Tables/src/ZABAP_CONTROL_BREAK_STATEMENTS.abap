*&---------------------------------------------------------------------*
*& Report ZABAP_CONTROL_BREAK_STATEMENTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_CONTROL_BREAK_STATEMENTS.

"DECLARING INTERNAL TABLE.
Data: gt_ekpo TYPE STANDARD TABLE OF EKPO,
      gs_ekpo TYPE EKPO.

"dEFINING VARIABLE FOR SELECTION SCREEN
DATA: gv_ebeln TYPE ekpo-EBELN.

"CREATING SELECTION SCREEN
SELECT-OPTIONS: s_ebeln for gv_ebeln.


"EVENTS
START-OF-SELECTION.

SELECT * FROM EKPO INTO TABLE gt_ekpo WHERE EBELN IN S_EBELN.

  SORT GT_EKPO BY EBELN EBELP.

  LOOP AT GT_EKPO INTO GS_EKPO.

    AT FIRST. "Triggers exactly once, on the very first loop iteration. Printing main table headers.

      WRite : /2 'PO NUMBER', 25 'ITEM NUMBER', 45 'MATERIAL NUMBER', 65 'MATERIAL DESCRIPTION', 95 'NET VALUE'.

      ENDAT.


   AT NEW ebeln. "Triggers when the specified field changes its value. Printing group headers or resetting subtotals.

     ULINE.
     Write: /2 'NEW PO NUMBER' COlor 5.

     ENDAT.

     WRite : /2 gs_ekpo-ebeln, 25 gs_ekpo-ebelp, 45 gs_ekpo-matnr, 65 gs_ekpo-txz01, 95 gs_ekpo-NETWR LEFT-JUSTIFIED.


   AT END OF ebeln. "sUM OF INDIVIDUAL PURCHARE ORDER.

     ULINE.

     SUM.
     wRITE: /65 'TOTAL VALUE OF PO: ' COLOR 7 , gs_ekpo-NETWR.

     ENDAT.

   AT LAST. "SUM OF ALL PURCHASE ORDERS.

     ULINE.
     SKIP 2.

     SUM.
     wRITE: /65 'TOTAL VALUE OF ALL PO: ' COLOR 6, gs_ekpo-NETWR.

     ENDAT.

    CLEAR GS_EKPO.
    ENDLOOP.

END-OF-SELECTION.